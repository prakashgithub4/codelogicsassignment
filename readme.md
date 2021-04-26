The process of se environment 
Step 1:-
Install xampp server from https://www.apachefriends.org/download.html given web site 
Step 2:
Install composer https://getcomposer.org/ from given web site then install it and choose php.exe file at time of installation of composer it.
Setp 3: install and configure postman
Step: 4 setup passport using the following command composer require laravel/passport
Step 5:  add    Laravel\Passport\PassportServiceProvider::class this line to config/app.php then run php artisan migrate 

Step:6 install passport by given command php artisan passport:install
Step 7 :add hash api trait like use Laravel\Passport\HasApiTokens;  this in user model and use this by the following this use HasApiTokens;
Step 8 : App\Providers\AuthServiceProvider.php open this page and add on the top use Laravel\Passport\Passport;
Step 9 :- open config/auth.php and go to the section 
'api' => [
       'driver' => token,
       'provider' => 'users',
],

And changed it to like this

'api' => [
       'driver' => 'passport',
       'provider' => 'users',
],
