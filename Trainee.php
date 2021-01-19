<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Trainee extends Model
{
    //
	protected $fillable = ['kursiyerid','kullaniciadi', 'sifre', 'email', 'telefon'];
	protected $primaryKey = 'kursiyerid';
	public $timestamps = false;
}
