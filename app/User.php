<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Passport\HasApiTokens;
use App\Http\Controllers\api\FriendsController;


class User extends Authenticatable
{
    use Notifiable;
    use HasApiTokens;


    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

    protected $appends =['isown'];
    public function getIsownAttribute(){
      $check =FriendsController::checkfriendrequest($this->id);
      return $check;
    }
   
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];


}
