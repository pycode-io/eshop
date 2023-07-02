<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\UserController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::post('/forget-password',[UserController::class,'forget_password']);

Route::middleware('api')->group(function(){
    
    // Your protected API routes here
    Route::post('/login',[UserController::class,'login']);
    Route::post('/logout',[UserController::class,'destroy']);
    Route::post('/register',[UserController::class,'register']);
    Route::get('/profile',[UserController::class,'profile']);
    Route::post('/profile-update',[UserController::class,'profile_update']);
    Route::get('/send-varification-mail/{email}',[UserController::class,'email_varification']);
   
});
