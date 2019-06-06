<?php

use Illuminate\Http\Request;

Route::get('/clients', 'ClientsController@all');
Route::get('/clients/{id}', 'ClientsController@one');
Route::post('/clients', 'ClientsController@store');
Route::put('/clients/{id}', 'ClientsController@change');
Route::delete('/clients/{id}', 'ClientsController@delete');

Route::get('/services', 'ServicesController@all');
Route::get('/services/{id}', 'ServicesController@one');
Route::post('/services', 'ServicesController@store');
Route::put('/services/{id}', 'ServicesController@change');
Route::delete('/services/{id}', 'ServicesController@delete');

Route::get('/orders', 'OrdersController@all');
Route::get('/orders/{id}', 'OrdersController@one');
Route::post('/orders', 'OrdersController@store');
Route::put('/orders/{id}', 'OrdersController@change');
Route::delete('/orders/{id}', 'OrdersController@delete');