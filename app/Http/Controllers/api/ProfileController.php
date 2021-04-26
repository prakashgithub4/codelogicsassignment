<?php

namespace App\Http\Controllers\api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ProfileController extends Controller
{
    public function userDetails(){
        $profile = \App\User::find(\Auth::user()->id);
        $profile->image='https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg';
      
        return response()->json(['status' => true, 'code' => 200, 'error' => "", 'message' => 'Profile deatils fetch successfully', 'data' => $profile], 201);

    }
}
