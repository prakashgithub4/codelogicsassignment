<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['prefix'=>'v1','namespace'=>'api'],function(){
   Route::post('signup/','AuthController@signup');
   Route::post('login/','AuthController@login');
   Route::post('addfriend','FriendsController@addfriend')->middleware('auth:api');
   Route::post('approvefriend','FriendsController@approvefriendlist')->middleware('auth:api');
   Route::post('friendlist','FriendsController@friendlist')->middleware('auth:api');
   Route::post('allusers','FriendsController@allusers')->middleware('auth:api');
   Route::get('profile/','ProfileController@userDetails')->middleware('auth:api');

});