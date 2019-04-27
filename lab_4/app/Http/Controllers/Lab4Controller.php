<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class Lab4Controller extends Controller
{
    public function strings()
	{
		$client = new \GuzzleHttp\Client();
		$response = $client->request('GET', 'www.mocky.io/v2/5c7db5e13100005a00375fda');
		$json = $response->getBody();
		$json = json_decode($json, true);

		return response()->json([
		    'data' => str_replace(' ', '_', $json['result'])
		], 200);
	}
}
