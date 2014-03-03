require "sinatra/json"
require "sinatra/base"

class Metadata < Sinatra::Base

   before do
     # Placeholder for auth filter
   end

   after do
     content_type :json
   end

   get '/metadata' do
      "Get Metadata Endpoint"
   end

   put '/metadata' do
      "Put Metadata Endpoint"
   end

   # start the server if ruby file executed directly
   run! if app_file == $0

end 

