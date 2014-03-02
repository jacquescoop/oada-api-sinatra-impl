require "sinatra/json"
require "sinatra/base"

class Search < Sinatra::Base

   get '/search' do
      "Search Endpoint"
   end

   # start the server if ruby file executed directly
   run! if app_file == $0

end 

