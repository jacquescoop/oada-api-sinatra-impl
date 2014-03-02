require "sinatra/json"
require "sinatra/base"
require 'data_mapper'
require 'dm-sqlite-adapter'


class FileFormat 
  include DataMapper::Resource

  property :short_name, Text, :key => true
  property :long_name, String
  property :description, Text
end

class Features < Sinatra::Base

   DataMapper.setup(:default, "sqlite://#{Dir.pwd}/development.sqlite")
   # Finalize the DataMapper models.
   DataMapper.finalize
   DataMapper.auto_upgrade!
   if FileFormat.count == 0
     FileFormat.create(:short_name=> "csv", :long_name=> "Comma Separated Values", :description => "Description.")
     FileFormat.create(:short_name=> "jd-gs-2", :long_name=> "John Deere GreenStar 2")
     FileFormat.create(:short_name=> "jd-gs-3", :long_name=> "John Deere GreenStar 3")
     FileFormat.create(:short_name=> "tsv", :long_name=> "Tab Seperated Values")
   end

   get '/features/file_formats' do
     content_type :json
     @fileFormats = FileFormat.all()
   
     @fileFormats.to_json
   end

   get '/features/transforms' do
     "Features Transforms Endpoint"
   end

   get '/features/transforms/list' do
     "Features Transforms List Endpoint"
   end

   # start the server if ruby file executed directly
   run! if app_file == $0

end 

