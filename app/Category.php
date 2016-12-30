<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    //the name of the table doesn't follow the convention of the plural (categories is diffrent in spelling from categorys)
    protected $table = 'categories';

    public function posts() 
    {
    	return $this->hasMany('App\Post');
    }

}
