require 'sinatra'
require "sinatra/json"
require 'data_mapper'
require 'dm-sqlite-adapter'

DataMapper.setup(:default, "sqlite://#{Dir.pwd}/development.sqlite")

class FileFormat 
  include DataMapper::Resource

  property :short_name, String, :key => true
  property :long_name, String
  property :description, Text
end

# Finalize the DataMapper models.
DataMapper.finalize
DataMapper.auto_upgrade!

get '/features/file_formats' do
  content_type :json
  @fileFormats = FileFormat.all()

  @fileFormats.to_json
end

FileFormat.create(:short_name=> "csv", :long_name=> "Comma Separated Values", :description => "Description.")
FileFormat.create(:short_name=> "jd-gs-2", :long_name=> "John Deere GreenStar 2")
