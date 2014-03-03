require "sinatra/json"
require "sinatra/base"
require "fileutils"

class Files < Sinatra::Base

   before do
     # Placeholder for auth filter
   end

   after do
   end

   get '/files/*' do
      "Get Files Endpoint"
   end

   put '/files/*' do
      content_type 'multipart/form-data'
      fileFormat = params[:file_format]
      filePath = params[:splat][0]
      fileData = params

      printf "File Format: %s\n", fileFormat
      printf "File Path: %s\n", filePath 
      printf "File Data: %s\n", fileData

      FileUtils.mkdir_p(File.dirname("data/" + filePath))
      File.open("data/" + filePath, 'w+') do |file|
         file.write(request.body.read)
      end

      filePath
   end

   delete '/files/*' do
      "Delete Files Endpoint"
   end

   # start the server if ruby file executed directly
   run! if app_file == $0

end 
