require "sinatra/json"
require "sinatra/base"

class Search < Sinatra::Base

   before do
     # Placeholder for auth filter
   end

   after do
     content_type :json
   end

   get '/search' do
      "Get Search Endpoint"
   end

   # start the server if ruby file executed directly
   run! if app_file == $0

end 

