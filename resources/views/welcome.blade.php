@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Dashboard</div>

                <div class="card-body">
                    @if (session('status'))
                    <div class="alert alert-success" role="alert">
                        {{ session('status') }}
                    </div>
                    @endif

                    You are logged in!
                </div>
                <div>
                    User details
                    <table align="center" border="1">
                        <tr>
                            <td>photo</td>
                            <td>Name</td>
                            <td>email</td>
                            <td>city</td>
                            <td>phone</td>
                        </tr>
                        <tr id="profiledata">

                        </tr>
                    </table>
                </div>
                <div>
                    Friendlist Details
                    <table align="center">
                        <tr id="firends">

                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div>
            <label>Search :<input type="text" onkeyup="searchfriend(this.value)"></label>
            <table id="allusers">
               
               
            </table>
        </div>
    </div>
</div>
@endsection
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
    $(document).ready(function() {
        /*profile info*/
        let token = sessionStorage.getItem('token');
        $.ajax({
                url: "http://localhost:8000/api/v1/profile/",
                type: 'get',
                headers: {
                    'Authorization': '' + token + '',
                    // 'X_CSRF_TOKEN':'xxxxxxxxxxxxxxxxxxxx', 
                    'Content-Type': 'application/json'
                },
                // data:obj2,
                datatype: 'json'
            })
            .done(function(data) {
                console.log(data.data.name);
                $("#profiledata").html("<td><img src=" + data.data.image + "height='40' width='40'></td><td>" + data.data.name + "</td><td>" + data.data.email + "</td><td>" + data.data.city + "</td><td>" + data.data.phone + "</td>")

            })
            .fail(function(jqXHR, textStatus, errorThrown) {
                console.log('error');
            });

        /** get friend list */
        $.ajax({
                url: "http://localhost:8000/api/v1/friendlist/",
                type: 'post',
                headers: {
                    'Authorization': '' + token + '',
                    // 'X_CSRF_TOKEN':'xxxxxxxxxxxxxxxxxxxx', 
                    'Content-Type': 'application/json'
                },
                // data:obj2,
                datatype: 'json'
            })
            .done(function(data) {
                console.log(data.data[0].name);
                $.each(data.data, function(index, value) {
                    let status = (value.status == null)?"Add friend":(value.status == "waiting")?"waiting":(value.status == "approve")?"Friend":""
                    $("#firends").append("<tr><td><img src='https://ichef.bbci.co.uk/news/976/cpsprodpb/4B45/production/_117796291_gettyimages-962098266.jpg' height='50' width='50'/></td></tr><tr><td>" + value.name + "</td></tr><tr><td>" + value.email + "</td></tr><tr><td><button class='btn btn-primary'>" + status + "</button></td></tr>");
                });
                //$("#profiledata").html("<td><img src="+data.data.image+"height='40' width='40'></td><td>"+data.data.name+"</td><td>"+data.data.email+"</td><td>"+data.data.city+"</td><td>"+data.data.phone+"</td>")
                //$("#firends").html();
            })
            .fail(function(jqXHR, textStatus, errorThrown) {
                console.log('error');
            });
            searchfriend();

    })
    function searchfriend(val=null){
        let token = sessionStorage.getItem('token');
        let list = [];
      $.ajax({
                url: "http://localhost:8000/api/v1/allusers/",
                type: 'post',
                headers: {
                    'Authorization': '' + token + '',
                    // 'X_CSRF_TOKEN':'xxxxxxxxxxxxxxxxxxxx', 
                    'Content-Type': 'application/json'
                },
                 data:JSON.stringify({name:val}),
                datatype: 'json'
            })
            .done(function(data) {
                $.map(data.data, function( value, index ) {
                  // Do something
                  let status = ((value.status == 'pending')||(value.status == null)) ? "Add Friend" : (value.status == 'approve')?"Friend":"Waiting";
                    if(value.isown == true){
                        list[index]="<tr><td><img src='https://ichef.bbci.co.uk/news/976/cpsprodpb/4B45/production/_117796291_gettyimages-962098266.jpg' height='50' width='50'/></td></tr><tr><td>"+value.name+"</td></tr><tr><td>"+value.email+"</td></tr><tr><td><button type='button' class='btn btn-primary' onclick='approverequest("+value.id+")'>"+status+"</button></td></tr></tr>";
                    }else{
                        list[index]="<tr><td><img src='https://ichef.bbci.co.uk/news/976/cpsprodpb/4B45/production/_117796291_gettyimages-962098266.jpg' height='50' width='50'/></td></tr><tr><td>"+value.name+"</td></tr><tr><td>"+value.email+"</td></tr><tr><td><button type='button' class='btn btn-primary' onclick='sendrequest("+value.id+")'>"+status+"</button></td></tr></tr>";
                    }
                 
                    });
                    $("#allusers").html(list);
                    
            })
            .fail(function(jqXHR, textStatus, errorThrown) {
                console.log('error');
            });
    }
    function sendrequest(sender_id){
        let token = sessionStorage.getItem('token');
        $.ajax({
                url: "http://localhost:8000/api/v1/addfriend/",
                type: 'post',
                headers: {
                    'Authorization': '' + token + '',
                    // 'X_CSRF_TOKEN':'xxxxxxxxxxxxxxxxxxxx', 
                    'Content-Type': 'application/json'
                },
                 data:JSON.stringify({friend_id:""+sender_id+""}),
                datatype: 'json'
            })
            .done(function(data) {
                location.reload();

                  console.log(data);
                    
            })
            .fail(function(jqXHR, textStatus, errorThrown) {
                console.log('error');
            });
    }

    function approverequest(friend_id){
        //alert(friend_id)
        let token = sessionStorage.getItem('token');
        let obj = JSON.stringify({friend_id:friend_id});
        console.log(obj);
        $.ajax({
                url: "http://localhost:8000/api/v1/approvefriend/",
                type: 'post',
                headers: {
                    'Authorization': '' + token + '',
                    // 'X_CSRF_TOKEN':'xxxxxxxxxxxxxxxxxxxx', 
                    'Content-Type': 'application/json'
                },
                 data:JSON.stringify({friend_id:""+friend_id+""}),
                datatype: 'json'
            })
            .done(function(data) {
                location.reload();

                  console.log(data);
                    
            })
            .fail(function(jqXHR, textStatus, errorThrown) {
                console.log('error');
            });
    }
</script>