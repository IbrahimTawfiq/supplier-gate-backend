<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/
    

Route::group(['domain'=>'www.'.env('DOMAIN')],function(){
    Route::get('',function(){
        return redirect()->away('http://'. env('DOMAIN'));
    });
});

Route::group(['domain'=>'backend.'.env('DOMAIN')],function(){
    Route::post('api/v2/{requestedAPI}', 'ApiController@InternalDispatcher');

});
