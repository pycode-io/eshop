<?php

namespace App\Http\Controllers;

use App\Models\PostTag;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

class PostTagController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $postTag = PostTag::orderBy('id', 'DESC')->simplePaginate(10);
        return view('backend.posttag.index')->with('postTags', $postTag);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.posttag.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'title' => 'string|required',
            'status' => 'required|in:active,inactive'
        ]);
        $data = $request->all();
        $slug = Str::slug($request->title);
        $count = PostTag::where('slug', $slug)->count();
        if ($count > 0) {
            $slug = $slug . '-' . date('ymdis') . '-' . rand(0, 999);
        }
        $data['slug'] = $slug;
        $status = PostTag::create($data);
        if ($status) {
            request()->session()->flash('success', 'Post Tag Successfully added');
        } else {
            request()->session()->flash('error', 'Please try again!!');
        }
        return redirect()->route('post-tag.index');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $postTag = PostTag::findOrFail($id);
        return view('backend.posttag.edit')->with('postTag', $postTag);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $postTag = PostTag::findOrFail($id);
        // return $request->all();
        $this->validate($request, [
            'title' => 'string|required',
            'status' => 'required|in:active,inactive'
        ]);
        $data = $request->all();
        $status = $postTag->fill($data)->save();
        if ($status) {
            request()->session()->flash('success', 'Post Tag Successfully updated');
        } else {
            request()->session()->flash('error', 'Please try again!!');
        }
        return redirect()->route('post-tag.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $postTag = PostTag::findOrFail($id);

        $status = $postTag->delete();

        if ($status) {
            request()->session()->flash('success', 'Post Tag successfully deleted');
        } else {
            request()->session()->flash('error', 'Error while deleting post tag');
        }
        return redirect()->route('post-tag.index');
    }
}
