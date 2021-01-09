require 'sinatra'
require './models.rb'

superman = Superhero.new("Superman", "flying").to_json
batman = Superhero.new("Batman", "supercars").to_json

superheros = [superman, batman]


get '/' do
"Hello World"
end

get '/superhero' do
    content_type :json
    superheros.to_json
end

post '/superhero' do
    content_type :json
    body = JSON.parse request.body.read
    puts body
    superheros.push(Superhero.new(body['name'], body['power']).to_json)
    superheros.to_json

end

put '/superhero/:index' do
    content_type :json
    body = JSON.parse request.body.read
    puts params["index"]
    superheros[params["index"].to_i] = Superhero.new(body['name'], body['power']).to_json
    superheros.to_json  
end

delete '/superhero/:index' do
    content_type :json
    puts params["index"]
    superheros.delete_at(params["index"].to_i)   
    superheros.to_json  
end