<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Trainer extends Model
{
    //
	protected $fillable = ['egitmeid','kullaniciadi', 'sifre', 'email', 'telefon'];
	protected $primaryKey = 'egitmenid';
	public $timestamps = false;
}
