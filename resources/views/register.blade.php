@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Register') }}</div>

                <div class="card-body">
                    <form method="POST" id="myform">
                        @csrf
                        <span class="errors">
                        
                        </span>
                        <div class="form-group row">
                            <label for="name" class="col-md-4 col-form-label text-md-right">{{ __('Name') }}</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ old('name') }}" required autocomplete="name" autofocus>

                                @error('name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="email" class="col-md-4 col-form-label text-md-right">{{ __('E-Mail Address') }}</label>
                         
                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email">

                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="phone" class="col-md-4 col-form-label text-md-right">{{ __('Phone') }}</label>

                            <div class="col-md-6">
                                <input id="phone" type="text" class="form-control @error('email') is-invalid @enderror" name="phone" value="{{ old('phone') }}" required >
                              
                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password" class="col-md-4 col-form-label text-md-right">{{ __('Password') }}</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="new-password">

                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password-confirm" class="col-md-4 col-form-label text-md-right">{{ __('Confirm Password') }}</label>

                            <div class="col-md-6">
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password">
                            </div>
                        </div>

                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="button" class="btn btn-primary" onclick="submituser()">
                                    {{ __('Register') }}
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
<script>

function  submituser(){
    let formdata = $('#myform').serializeArray();
    //console.log(formdata);
    let obj = {name:$("#name").val(),email:$("#email").val(),password:$("#password").val(),phone:$("#phone").val(),password_confirmation:$("#password-confirm").val()}
    let obj2 = JSON.stringify(obj);
    let errors = [];
    console.log(obj2);
    $.ajax({
            url: "http://localhost:8000/api/v1/signup",
            type: 'post',
            headers: { 
                // 'Authorization':'Basic xxxxxxxxxxxxx', 
                // 'X_CSRF_TOKEN':'xxxxxxxxxxxxxxxxxxxx', 
                 'Content-Type':'application/json' 
            }, 
            data:obj2,
            datatype: 'json'
        })
        .done(function (data) { 
       if(data.status == true){
           alert(data.message)
           $("#myform")[0].reset();
       }else if(data.status == false){
      
       errors.push([data.error.name[0],data.error.email[0],data.error.password[0],data.error.phone[0]]);
       $.each(errors, function( key, value ) {
          // alert( key + ": " + value );
           $(".errors").html("<span>"+value+"</span><br/>");
        })
        $(':input[type="button"]').prop('disabled', true);
       }
        
           
         })
        .fail(function (jqXHR, textStatus, errorThrown) { 
         console.log('error');
         });
  }

</script>
