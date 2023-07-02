<?php

namespace App\Http\Controllers\Api;


use App\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\models\PasswordReset;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use GuzzleHttp\Psr7\Uri;
use Illuminate\Support\Facades\Validator;
use PharIo\Manifest\Url as ManifestUrl;

class UserController extends Controller
{
    public function register(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'name' => 'required|string',
            'phone' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|min:10',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|string|min:6|confirmed',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $user = User::create([
            'name' => $request->name,
            'phone' => $request->phone,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        return response()->json([
            'succeed' => true,
            'message' => 'registration completed',
        ], 201);
    }

    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required',
            'password' => 'required|string|min:6',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        if (!$token = Auth::guard('api')->attempt($validator->validated())) {
            return response()->json(['succeed' => false, 'message' => 'email or password incorrect',], 401);
        } else {
            return response()->json(['succeed' => true, 'token' => $token], 201);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        try {

            Auth::guard('api')->logout();
            return response()->json(['success' => true, 'message' => 'Logged out successfully']);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function profile()
    {
        try {

            $user = Auth::guard('api')->user();
            return response()->json(['success' => true, 'data' => $user]);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()]);
        }
    }

    public function profile_update(Request $request)
    {
        if (Auth::guard('api')->user()) {

            $validator = Validator::make($request->all(), [
                'name' => 'required',
                'phone' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|min:10',
                'email' => 'required|email',
            ]);

            if ($validator->fails()) {
                return response()->json(['errors' => $validator->errors()]);
            }

            $id = Auth::guard('api')->user()->id;
            $update_user = User::find($id);
            $update_user->name  = $request->name;
            $update_user->phone = $request->phone;
            $update_user->email = $request->email;
            $update_user->save();

            return response()->json(['success' => true, 'message' => 'profile updated successfully']);
        } else {
            return response()->json(['success' => false, 'message' => 'internal server error'], 500);
        }
    }

    public function email_varification($email){

        if (Auth::guard('api')->user()) {

            $user = User::where('email', $email)->get();
            if(count($user) > 0){

                $random_str = Str::random(40);
                $domain = URL::to('/');
                $url = $domain.'/varify-mail/'.$random_str;

                $data['url'] = $url;
                $data['email'] = $email;
                $data['title'] = "Email Varification";
                $data['body'] = "We may need to send you critical information about our service and it is important that we have an accurate email address.";

                Mail::send('backend.email.varify_email',['data' => $data],function($message) use ($data){
                    $message->to($data['email'])->subject($data['title']);
                });

                $update_user = User::find($user[0]['id']);
                $update_user->remember_token =$random_str;
                $update_user->save();

                return response()->json(['success' => true, 'message' => 'email send successfully']);


            }else{
                return response()->json(['success' => false, 'message' => 'user not found'], 404);

            }

            // return response()->json(['success' => true, 'message' => 'email send successfully']);
        } else {
            return response()->json(['success' => false, 'message' => 'internal server error'], 500);
        }

    }

    public function varification_mail($token){

       $user =  User::where('remember_token', $token)->get();
       if (count($user)>0){
       $user = User::find($user[0]['id']);
        $data_time = Carbon::now()->format('Y-m-d H:i:s');
        $user->remember_token = '';
        $user->email_verified_at = $data_time;
        $user->is_varified = 1;
        $user->save();
        return "<h1> email verified</h1>";
       }else{
        return view('backend.email.404');
       }
    }


    // forget password api
    public function forget_password(Request $request){

        try{
           $user = User::where('email','=',$request->email)->get();
           if(count($user) > 0){
            $token = Str::random(40);
            $domain = URL::to('/');
            // $url = $domain.'/reset-password/?token='.$token.'/?email='.$request->email;

            $url = $domain.'/reset-password/?token='.urlencode($token).'&email='.urlencode($request->email);
            // dd($url);

            $data['url'] = $url;
            $data['email'] = $request->email;
            $data['title'] = "Reset Password";
            $data['body'] = "Please click on below link to reset your password";

            Mail::send('backend.email.reset_password',['data' => $data],function($message) use ($data){
                $message->to($data['email'])->subject($data['title']);
            });

            $date_time = Carbon::now()->format('Y-m-d H:i:s');
            PasswordReset::updateOrcreate(
                ['email' => $request->email],

                [
                    'email' => $request->email,
                    'token' => $token, 
                    'created_at' => $date_time
                ]
            );
            return response()->json(['success' => true, 'message' => 'please check you mail to reset you password'], 200);


           }else{
            return response()->json(['success' => false, 'message' => 'user not found'], 404);

           }

        }catch(\Exception $e){
            return response()->json(['success' => false, 'message' => $e->getMessage()]);

        }

    }


    //reset password view
    public function reset_password_view(Request $request){
       
        $reset_pass = PasswordReset::where('token', $request->token)
        ->where('email', $request->email)
        ->get();

        if((isset($request->token) && (count($reset_pass) >0))){

           $user =  User::where('email', $request->email)->get();
           
           return view('backend.email.change_password',compact('user'));

        }else{
            return view('backend.email.404');
        }
    }

    public function reselt_password_update(Request $request){

        $validator = Validator::make($request->all(), [
            'password' => 'required|string|min:6|confirmed',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $user = User::find($request->id);
        $user->password = Hash::make($request->password);
        $user->save();

        PasswordReset::where($request->email)->delete();

        return "<h2>You password reset successfully</h2>";

    }
}
