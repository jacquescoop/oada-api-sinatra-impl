require "sinatra/json"
require "sinatra/base"
require "fileutils"

class Files < Sinatra::Base

   rootDir = "data"

   before do
     # Placeholder for auth filter
   end

   after do
   end

   get '/files/*' do
      fileFormat = params[:file_format]
      filePath = params[:splat][0]

      attachment File.basename(filePath)

      printf "{File Format: %s}{File Path: %s}\n", fileFormat, filePath 
  
      send_file "#{rootDir}/#{filePath}"
   end

   put '/files/*' do
      content_type 'multipart/form-data'
      fileFormat = params[:file_format]
      filePath = params[:splat][0]
      fileData = params

      printf "{File Format: %s}{File Path: %s}{File Data: %s}\n", fileFormat, filePath, fileData

      FileUtils.mkdir_p(File.dirname("#{rootDir}/#{filePath}"))
      File.open("data/" + filePath, 'w+') do |file|
         file.write(request.body.read)
      end

      filePath
   end

   delete '/files/*' do
      filePath = params[:splat][0]
      printf "{File Path: %s}\n", filePath 
      File.delete("#{rootDir}/#{filePath}")
      response.status = 200
   end

   # start the server if ruby file executed directly
   run! if app_file == $0

end 
