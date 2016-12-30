@extends('main')

@section('title', '|Homepage')

@section('content')
       <div class="row">
           <div class="col-md-12">
                <div class="jumbotron">
                      <h1>Welcome Abdennour's Blog!</h1>
                      <p class="lead">Thank you so much for visiting.This is my test website built with laravel
                      frameworkk. Please read my latest posts !!!</p>
                      <p><a class="btn btn-primary btn-lg" href="#" role="button">Popular Post</a></p>
                </div> 
           </div>       
       </div> <!--end of header .row-->

       <div class="row">
           <div class="col-md-8">

            @foreach($posts as $post)

               <div class="post">
                    <h3>{{ substr($post->title , 0, 350)}} {{ strlen($post->title) > 100 ? "...": ""}}</h3>
                    <p>{{ substr(strip_tags($post->body) , 0, 350)}} {{ strlen(strip_tags($post->body) )> 350 ? "...": ""}}</p> 
                    <a href="{{ url('blog/'.$post->slug)}}" class="btn btn-primary">Read More</a>
               </div>

               <hr>

               @endforeach

           </div>

           <div class="col-md-3 col-md-offset-1">
             <h2>Sidebar</h2>  
           </div>
       </div>
@endsection

