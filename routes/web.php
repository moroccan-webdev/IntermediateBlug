<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of the routes that are handled
| by your application. Just tell Laravel the URIs it should respond
| to using a Closure or controller method. Build something great!
|
*/

Route::group(['middleware' => ['web']], function (){

		// Authentication Routes
		Route::get('auth/login', ['as' => 'login', 'uses' => 'Auth\LoginController@showLoginForm']);
		Route::post('auth/login', 'Auth\LoginController@login');
		Route::get('auth/logout', ['as' => 'logout', 'uses' => 'Auth\LoginController@logout']);


		// Registration Routes
		Route::get('auth/register', 'Auth\RegisterController@showRegistrationForm');
		Route::post('auth/register', 'Auth\RegisterController@register');

		//password reset routes
		Route::post('password/email',  ['as' => 'sendResetLinkEmail', 'uses' => 'Auth\ForgotPasswordController@sendResetLinkEmail']);
		Route::get('password/reset', ['as' => 'showLinkRequestForm', 'uses' => 'Auth\ForgotPasswordController@showLinkRequestForm']);
		Route::post('password/reset',  ['as' => 'reset', 'uses' => 'Auth\ResetPasswordController@reset']);
		Route::get('password/reset/{token?}', ['as' => 'showResetForm', 'uses' => 'Auth\ResetPasswordController@showResetForm']);
		
		//categories
		Route::resource('categories','CategoryController',['except'=> ['create']]);

		//comments
		Route::post('comments/{post_id}',  ['as' => 'comments.store', 'uses' => 'CommentController@store']);
		Route::get('comments/{id}/edit',  ['as' => 'comments.edit', 'uses' => 'CommentController@edit']);
		Route::put('comments/{id}',  ['as' => 'comments.update', 'uses' => 'CommentController@update']);
		Route::get('comments/{id}/delete', ['uses' => 'CommentController@delete', 'as' => 'comments.delete']);
		Route::delete('comments/{id}', ['uses' => 'CommentController@destroy', 'as' => 'comments.destroy']);
		

		//tags
		Route::resource('tags','TagController',['except'=> ['create']]);
		
		Route::get('blog/{slug}', ['as' => 'blog.single', 'uses' => 'BlogController@getSingle'])->where('slug', '[\w\d\-\_]+');

		Route::get('blog', ['uses' => 'BlogController@getIndex', 'as' => 'blog.index']);

		Route::get('contact', 'PagesController@getContact');
		
		Route::post('contact', 'PagesController@postContact');
		
		Route::get('about', 'PagesController@getAbout');

		Route::get('/', 'PagesController@getIndex');

		Route::resource('posts', 'PostController');

	});


