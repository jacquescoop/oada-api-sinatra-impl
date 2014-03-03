require "sinatra/json"
require "sinatra/base"

class Files < Sinatra::Base

   before do
     # Placeholder for auth filter
   end

   after do
     content_type :json
   end

   get '/files' do
      "Get Files Endpoint"
   end

   put '/files' do

      #File.open(params[:id].to_s, 'w+') do |file|
      #   file.write(request.body.read)
      #end

      #File.open('uploads/' + params['myfile'][:filename], "w") do |f|
      #  f.write(params['myfile'][:tempfile].read)
      #end

   end

   delete '/files' do
      "Delete Files Endpoint"
   end

   # start the server if ruby file executed directly
   run! if app_file == $0

end 
