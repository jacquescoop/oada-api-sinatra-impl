require "sinatra/json"
require "sinatra/base"
#require "sinatra/config_file"
require 'data_mapper'
require 'dm-sqlite-adapter'

require "rubygems"
require "json"
require "net/http"
require "uri"

class FileFormat 
  include DataMapper::Resource

  property :short_name, String, :key => true
  property :long_name, String
  property :description, Text
end

class Transforms 
  include DataMapper::Resource

  property :from_short_name, String, :key => true
  property :to_short_name, String, :key => true
end

def getSeedData(url)
   uri = URI.parse(url)
   http = Net::HTTP.new(uri.host, uri.port)
   http.use_ssl = true
   http.verify_mode = OpenSSL::SSL::VERIFY_NONE
   request = Net::HTTP::Get.new(uri.request_uri)
   response = http.request(request)

   json = JSON.parse(response.body)
   return json
end

class Features < Sinatra::Base

   configure do
      #register Sinatra::ConfigFile
      #config_file '#{Dir.pwd}/config/config.yml'

      DataMapper.setup(:default, "sqlite://#{Dir.pwd}/development.sqlite")
      # Finalize the DataMapper models.
      DataMapper.finalize
      DataMapper.auto_upgrade!

      if FileFormat.count == 0
        json = getSeedData("https://raw.github.com/OADA/oada-api-spec/master/examples/supported-file-formats.json")
        json.each do |a|
           FileFormat.create(a)
        end
      end

      if Transforms.count == 0
        json = getSeedData("https://raw.github.com/OADA/oada-api-spec/master/examples/supported-transforms.json")
        json.each do |a|
           Transforms.create(a)
        end
      end
   end 

   before do
      #Placeholder for auth filter
   end

   after do
      content_type :json
   end

   get '/features/file_formats' do
      isSupported = false
      if FileFormat.get(params[:file_format]) != nil
         isSupported = true
      end
      { :is_supported => isSupported }.to_json
   end

   get '/features/file_formats/list' do
      @fileFormats = FileFormat.all()
      @fileFormats.to_json
   end

   get '/features/transforms' do
      isSupported = false
      if Transforms.get(params[:from_file_format], params[:to_file_format]) != nil
         isSupported = true
      end

      { :is_supported => isSupported }.to_json
   end

   get '/features/transforms/list' do
      @transforms = Transforms.all()
      @transforms.to_json
   end

   # start the server if ruby file executed directly
   run! if app_file == $0

end 

