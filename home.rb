require 'net/http'
require 'json'
require 'pp'
require 'sinatra'
get('/weather') do
    erb :weather 
end 

get ('/food') do
	uri = URI("https://developers.zomato.com/api/v2.1/categories")
	req = Net::HTTP::Get.new(uri)
	req['user-key'] = "22eb257439a64baf66e324e287db18de"

	res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) {|http|
		http.request(req)
	}

	response = JSON.load(res.body)

	#pp response[0]

	@restaurant = response['categories']
	erb :food
end 
