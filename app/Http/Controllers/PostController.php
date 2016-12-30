<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
use App\Category;
use App\Tag;
use Session;
use Purifier;
use Image;
use Storage;

class PostController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //create a variable and store all the blog posts in it from the database
        $posts = Post::orderBy('id','desc')->paginate(10);
        //return a view and pass in the above variable
        return view('posts.index')->with('posts', $posts);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::all();
        $tags = Tag::all();
        return view('posts.create')->with('categories',$categories)->with('tags', $tags);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
       //dd($request); test and see the sent data
        //validate the data
       $this->validate($request, array(
                'title'        => 'required|max:255',
                'slug'         => 'required|alpha_dash|min:5|max:255|unique:posts,slug',
                'category_id'  => 'required|integer',
                'body'         => 'required',
                'featured_img' => 'sometimes|image'
            ));
       //store in the database
        $post = new post;

        $post->title = $request->title;
        $post->slug = $request->slug;
        $post->category_id = $request->category_id;
        $post->body = Purifier::clean($request->body);
        //save the image
        if ($request->hasFile('featured_img')) {
          $image = $request->file('featured_img');
          $filename = time() . '.' . $image->getClientOriginalExtension();
          $location = public_path('images/' . $filename);
          Image::make($image)->resize(500, 200)->save($location);
          $post->image = $filename;
        }

        $post->save();

        $post->tags()->sync($request->tags, false);

        //session message 
        Session::flash('success','The blog post was successfully saved !');

       //redirect to another page
        return redirect()->route('posts.show', $post->id);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $post = Post::find($id);
        return view('posts.show')->with('post', $post);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //find the post in the database and save as a variable
        $post = Post::find($id);
        $categories = Category::all();
        $cats = array();
            foreach ($categories as $category ) {
                $cats[$category->id] = $category->name;
            }

        $tags = Tag::all();
        $tags2 = array();
            foreach ($tags as $tag) {
                $tags2[$tag->id] = $tag->name;
            }
        //return the view and pass in the variable we previously created
        return view('posts.edit')->with('post', $post)->with('categories', $cats)->with('tags', $tags2);
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
        //validate the data
        $post = Post::find($id);
        
        $this->validate($request, array(
                'title' => 'required|max:255',
                'slug' => "required|alpha_dash|min:5|max:255|unique:posts,slug,$id",
                'category_id' => 'required|integer',
                'body' => 'required',
                'featured_img' => 'image'
            ));
         
        //save the data to the database
        $post = Post::find($id);

        $post->title = $request->input('title');
        $post->slug = $request->input('slug');
        $post->category_id = $request->input('category_id');
        $post->body = Purifier::clean($request->body);

        if ($request->hasFile('featured_img')) {
            //Add the new photo
                  $image = $request->file('featured_img');
                  $filename = time() . '.' . $image->getClientOriginalExtension();
                  $location = public_path('images/' . $filename);
                  Image::make($image)->resize(500, 200)->save($location);
                  
                  $oldFileName = $post->image;
            //Update the old photo
                  $post->image = $filename;
            //Delete the old photo 
                  storage::delete($oldFileName);

            $post->tags()->sync($request->tags);
        } else {
            $post->tags()->sync(array());
        }

        $post->save();

        if (isset($request->tags)) {
            $post->tags()->sync($request->tags);
        } else {
            $post->tags()->sync(array());
        }

        //set flash data with success message
        Session::flash('success','This post was successfully saved !');

        //rediredct with flash data to posts.show
        return redirect()->route('posts.show', $post->id);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //find the item which will be deleted
        $post = Post::find($id);

        //detach relational manytomany
        $post->tags()->detach();

        //delete the image
        storage::delete($post->image);

        //detete the item
        $post->delete();

        //create a session flash
        Session::flash('success','This post was successfully deleted !');


        //redirect to the index page
        return redirect()->route('posts.index');
    }

}
