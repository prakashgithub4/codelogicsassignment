<?php

namespace App\Http\Controllers\api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use App\Friend;
use App\User;
use Illuminate\Support\Facades\DB;

class FriendsController extends Controller
{
    public $pageSize = 5;
    //
    public function addfriend(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'friend_id' => ['required', 'string'],
        ]);

        if ($validation->fails()) {
            return response()->json(['status' => false, "code" => 400, 'error' => $validation->errors(), 'data' => [], 'message' => 'error'], 400);
        } else {
            $user = \App\User::find($request->friend_id);
            $friend = \App\Friend::where('friends_id', $request->friend_id)->first();
            if ($request->friend_id != \Auth::user()->id) {


                if (empty($friend)) {

                    if (!empty($user)) {

                        $friend = new Friend();
                        $friend->user_id = \Auth::user()->id;
                        $friend->friends_id = $request->friend_id;
                        $friend->status = 'waiting';
                        $friend->save();
                        return response()->json(['status' => true, 'code' => 200, 'error' => "error", 'message' => 'Friend request has been send Successfully', 'data' => $friend], 201);
                    } else {
                        return response()->json(['status' => false, 'code' => 400, 'error' => "error", 'message' => 'user doesnot exsists', 'data' => (object)[]], 400);
                    }
                } else {
                    return response()->json(['status' => false, 'code' => 400, 'error' => "error", 'message' => 'Already add your friend list', 'data' => (object)[]], 400);
                }
            } else {
                return response()->json(['status' => false, 'code' => 400, 'error' => "error", 'message' => 'operation is not possible', 'data' => (object)[]], 400);
            }
        }
    }
    public function approvefriendlist(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'friend_id' => ['required', 'string'],
        ]);

        if ($validation->fails()) {
            return response()->json(['status' => false, "code" => 400, 'error' => $validation->errors(), 'data' => [], 'message' => 'error'], 400);
        } else {
            $user = \App\User::find($request->friend_id);
            $friend = \App\Friend::where('user_id', $request->friend_id)->first();
         
            if (!empty($user)) {
                $friend->user_id = \Auth::user()->id;
                $friend->friends_id = $request->friend_id;
                $friend->status = 'approve';
                $friend->save();
                return response()->json(['status' => true, 'code' => 200, 'error' => "error", 'message' => 'Friend request approved Successfully', 'data' => $friend], 201);
            } else {
                return response()->json(['status' => false, 'code' => 400, 'error' => "error", 'message' => 'user doesnot exsists', 'data' => (object)[]], 400);
            }

            //  }else{
            return response()->json(['status' => false, 'code' => 400, 'error' => "error", 'message' => 'operation is not possible', 'data' => (object)[]], 400);
            // }
        }
    }
    public function friendlist(Request $request)
    {

        $friendlist =  User::query()
            ->select('friends.id','friends.user_id','users.name', 'users.email', 'friends.status')
            ->join('friends', 'friends.friends_id', '=', 'users.id')
            ->where('friends.user_id', \Auth::user()->id)
            ->where('friends.status', 'approve');
           
        //   //  ->Orwhere('friends.status', 'pending');
       
       
        $friendlist = $friendlist->get();

        

        return response()->json(['status' => true, 'code' => 200, 'error' => "error", 'message' => 'Friend list fetch successfully', 'data' => $friendlist], 201);
    }
   

    public function allusers(Request $request)
    {

        $friendlist =  User::query()
            ->select('users.id','users.name', 'users.email', 'friends.status')
            ->leftjoin('friends', 'friends.friends_id', '=', 'users.id')
           
            ->where('users.id','!=',\Auth::user()->id);
           
        if(!empty($request->name)) {
            $friendlist = $friendlist->where('name','LIKE', "%{$request->name}%");
                
        }
       
        $friendlist = $friendlist->get();

        

        return response()->json(['status' => true, 'code' => 200, 'error' => "error", 'message' => 'Friend list fetch successfully', 'data' => $friendlist], 201);
    }
    public static function checkfriendrequest($id){
        $friends  = \App\Friend::where('user_id',$id)->first();
         if(!empty($friends->user_id)){
            return true;
         }else{
            return false;
         }
       
     
    }
}
