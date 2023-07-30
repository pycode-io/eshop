<?php

namespace App\Http\Controllers;

use Auth;
use App\Models\Product;
use App\Models\Wishlist;
use Illuminate\Http\Request;

class WishlistController extends Controller
{
    protected $product = null;
    public function __construct(Product $product)
    {
        $this->product = $product;
    }

    public function wishlist(Request $request)
    {
        // dd($request->all());
        if (empty($request->slug)) {
            session()->flash('error', 'Invalid Products');
            return back();
        }
        $product = Product::where('slug', $request->slug)->first();
        // return $product;
        if (empty($product)) {
            session()->flash('error', 'Invalid Products');
            return back();
        }

        $already_wishlist = Wishlist::where('user_id', auth()->user()->id)->where('cart_id', null)->where('product_id', $product->id)->first();
        // return $already_wishlist;
        if ($already_wishlist) {
            session()->flash('error', 'You already placed in wishlist');
            return back();
        } else {

            $wishlist = new Wishlist;
            $wishlist->user_id = auth()->user()->id;
            $wishlist->product_id = $product->id;
            $wishlist->price = ($product->price - ($product->price * $product->discount) / 100);
            $wishlist->quantity = 1;
            $wishlist->amount = $wishlist->price * $wishlist->quantity;
            if ($wishlist->product->stock < $wishlist->quantity || $wishlist->product->stock <= 0) return back()->with('error', 'Stock not sufficient!.');
            $wishlist->save();
        }
        session()->flash('success', 'Product successfully added to wishlist');
        return back();
    }

    public function wishlistDelete(Request $request)
    {
        $wishlist = Wishlist::find($request->id);
        if ($wishlist) {
            $wishlist->delete();
            session()->flash('success', 'Wishlist successfully removed');
            return back();
        }
        session()->flash('error', 'Error please try again');
        return back();
    }
}
