require 'net/http'
require 'json'
require 'pp'
require 'sinatra'
require 'date'


get('/') do
  erb :index
end
get('/weather') do
    erb :weather
end
get ('/index') do
  erb :index
end

# current_time = DateTime.now
#
# current_time.strftime "%d/%m/%Y %H:%M"

#see action=/signup in the .erb file
post('/weatheroutput') do
  @city = params[:city] || "You didn't give any location!"
  if @city.downcase == "london"
    @weather = "rainy"
  else
    @weather = "unknown"
  end
  erb :weatheroutput
end

get ('/events') do
  erb :events
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





#get ('/food') do
 #  uri = URI("https://developers.zomato.com/api/v2.1/categories")
  ##req['user-key'] = "22eb257439a64baf66e324e287db18de"

#   res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) {|http|
 #      http.request(req)
  # }

   #response = JSON.load(res.body)

   #pp response[0]
   #@listOfCategories = []

   #@restaurant = response['categories']

   #@restaurant.each { |x|
    #   @listOfCategories.push(x['categories']['name'])
   #}

   #@test1 = @restaurant[2]['categories']['id']
   #@test2 = @restaurant[2]['categories']['name']


   #erb :food
#end
