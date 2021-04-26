<?php

namespace App\Http\Controllers\api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use App\User;
class AuthController extends Controller
{
    public function signup(Request $request){
        $validation = Validator::make($request->all(),[
            'name'=>['required','string'],
            'email' => ['required', 'string', 'email','unique:users'],
            'password' => ['required','min:8','confirmed'],
            'phone'=>['required','string','unique:users']
 
         ]);
       try{
        if ($validation->fails()) {
            return response()->json(['status'=>false,"code"=>400,'error'=>$validation->errors(),'data'=>[],'message'=>'error'],200);
        }
        else{
            $adduser = new User();
            $adduser->name = $request->name;
            $adduser->email =$request->email;
            $adduser->password =Hash::make($request->password);
            $adduser->phone = $request->phone;
            $adduser->city = $request->city;
            $adduser->save();
            return response()->json(['status'=>true,'code'=>201,'error'=>"error",'message'=>'user successfully registered','data'=>$adduser],201);

        }
       }
       catch(\Exception $ex) {
        return response()->json(['status'=>false,'code'=>400,'message'=>$ex->getMessage(),'data'=>(object)[]],400);
       } 
    }
    public function login(Request $request){
        $validation = Validator::make($request->all(),[
            'email' => ['required', 'string', 'email'],
            'password' => ['required','min:8']
         ]);
         if ($validation->fails()) {
            return response()->json(['status'=>false,"code"=>400,'error'=>$validation->errors(),'data'=>[],'message'=>'error'],200);
        }else{
            
            $credentials = $request->only('email', 'password');
            if (Auth::attempt($credentials)) {
                
                $user = User::where('email',$credentials['email'])->first();
                $accessToken = $user->createToken('myApp')->accessToken;
                $user->token = "Bearer ".$accessToken;

                return response()->json(['status'=>true,"code"=>200,"data"=>$user,'message'=>"user has been login successfully",'error'=>''],200);
            }else{
                return response()->json(['status'=>false,"code"=>200,"data"=>(object)[],'message'=>"user has been login not successfully",'error'=>''],200);
            }
        }
    }
}
