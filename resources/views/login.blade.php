@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Login') }}</div>

                <div class="card-body">
                    <form method="POST"id="myform">
                        @csrf

                        <span class="errors">
                        
                        </span>

                        <div class="form-group row">
                            <label for="email" class="col-md-4 col-form-label text-md-right">{{ __('E-Mail Address') }}</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>

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
                                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="current-password">

                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <!-- <div class="form-group row">
                            <div class="col-md-6 offset-md-4">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>

                                    <label class="form-check-label" for="remember">
                                        {{ __('Remember Me') }}
                                    </label>
                                </div>
                            </div>
                        </div> -->

                        <div class="form-group row mb-0">
                            <div class="col-md-8 offset-md-4">
                                <button type="button" class="btn btn-primary" onclick="login()">
                                    {{ __('Login') }}
                                </button>

                                <!-- @if (Route::has('password.request'))
                                    <a class="btn btn-link" href="{{ route('password.request') }}">
                                        {{ __('Forgot Your Password?') }}
                                    </a>
                                @endif -->
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
    </script>
</div>
@endsection
<script>

function login(){
    let email =$("#email").val();
    let password =$("#password").val();
    let obj = {email:email,password:password}
    let obj2 = JSON.stringify(obj);
    
    let errors = [];
    $.ajax({
            url: "http://localhost:8000/api/v1/login",
            type: 'post',
            headers: { 
              
                 'Content-Type':'application/json' 
            }, 
            data:obj2,
            datatype: 'json'
        })
        .done(function (data) { 
           // console.log(data.data.token);
            sessionStorage.setItem('token', data.data.token);
           // let data2 = sessionStorage.getItem('token');
            
           
       if(data.status == true){
           alert(data.message)
           location.replace("{{url('dashbord/')}}")
           $("#myform")[0].reset();
       }else 
       if(data.status == false){
        alert(data.message)
        if(errors.length != 0){
            errors.push([data.error.email[0],data.error.password[0]]);

        }else{
            alert("invalid login")
            //errors.push([data.error.email[0],data.error.password[0]]);
        }
       
      
           
       }
        
           
         })
        .fail(function (jqXHR, textStatus, errorThrown) { 
         console.log('error');
         });
        
}





</script>
