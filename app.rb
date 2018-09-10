require 'sinatra'
require 'googlebooks'
require 'httparty'


#http://localhost:4567

#Learn Ruby the Hard Way

get "/" do

  erb(:form)
end

post "/" do 
 response = HTTParty.get("https://www.googleapis.com/books/v1/volumes?q=[#{params[:book]}]")

@title = response["items"][0]["volumeInfo"]["title"]
@author = response["items"][0]["volumeInfo"]["authors"][0]
@description = response["items"][0]["volumeInfo"]["description"]
@book_link = response["items"][0]["volumeInfo"]["previewLink"]
@image = response["items"][0]["volumeInfo"]["imageLinks"]["smallThumbnail"]
  erb(:form)
end
