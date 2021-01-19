<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class favori extends Model
{
    //
	
		protected $fillable = ['kursiyerid', 'kursid'];
		public $timestamps = false;
}

?>