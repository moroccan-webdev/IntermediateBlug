@extends('main')

@section('title','| All posts')

@section('content')

<div class="row">

	<div class="col-md-10">
		<h1>All posts</h1>
	</div>

	<div class="col-md-2">
		<a href="{{ Route('posts.create') }}" class="btn btn-lg btn-primary btn-h1-spacing">Create new post</a>
	</div>

	<div class="col-md-12">
		<hr>
	</div>

</div>

<div class="row">
	<div class="col-md-12">
		<table class="table">
			<thead>
				 <th>#</th>
				 <th>Title</th>
				 <th>Body</th>
				 <th>Created At</th>
				 <th></th>
			</thead>
			<tbody>
				@foreach($posts as $post)
					<tr>
						<th>{{ $post->id }}</th>
						<td>{{ substr($post->title , 0, 50)}} {{ strlen($post->title) > 50 ? "...": ""}}</td>
						<td>{{ substr(strip_tags($post->body) , 0, 60)}} {{ strlen(strip_tags($post->body)) > 60 ? "...": ""}}</td>
						<td>{{ date('M j; Y', strtotime($post->created_at)) }}</td>
						<td><a href="{{Route('posts.show',$post->id)}}" class="btn btn-primary btn-xs">View</a>
						    <a href="{{Route('posts.edit',$post->id)}}" class="btn btn-success btn-xs">Edit</a>
						    <div class="btn-xs" style="display:inline-block">

						    {!! Form::open(['route' => ['posts.destroy', $post->id], 'method' => 'DELETE']) !!}
						    {!! Form::submit('Delete', ['class' => 'btn btn-danger btn-xs']) !!}
						    {!! Form::close() !!}
						
					</div></td>
				    </tr>
				@endforeach
			</tbody>
		</table>
		<div class="text-center">
			{{ $posts->links() }}
		</div>
	</div>
</div>
	
@endsection

