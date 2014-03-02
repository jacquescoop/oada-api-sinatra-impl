require "sinatra/json"
require "sinatra/base"

class Metadata < Sinatra::Base

   get '/metadata' do
      "Metadata Endpoint"
   end

   # start the server if ruby file executed directly
   run! if app_file == $0

end 

