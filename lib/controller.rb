#require 'bundler'
#Bundler.require
require 'gossip'

class ApplicationController < Sinatra::Base

	 # Affiche la homepage et tous les potins, passe les objets Gossip de tous les potins
	get '/' do
	  erb :index, locals: {gossips: Gossip.all}
	end

	 # url qui permet de créer un ragot
  	get '/gossips/new/' do
   	 erb :new_gossip
 	end
	 
	 # url qui permet de récupérer un ragot
	post '/gossips/new/' do
		 Gossip.new(params["gossip_author"], params["gossip_content"]).save
		redirect '/'
	end

	  # affiche un potin de manière unique via son id
  	  get '/gossips/:id' do
        id = params['id']
		Gossip.find(id)
	erb :show, locals: {gossip: Gossip.all}
  end 

	
end
