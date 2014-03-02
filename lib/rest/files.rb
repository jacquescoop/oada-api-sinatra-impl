require "sinatra/json"
require "sinatra/base"

class Files < Sinatra::Base

   get '/files' do
      "Files Endpoint"
   end

   # start the server if ruby file executed directly
   run! if app_file == $0

end 

