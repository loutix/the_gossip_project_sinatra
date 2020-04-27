require 'pry'
require 'csv'

class Gossip

	attr_accessor :author, :content

  	def initialize(author, content)
      @author = author
      @content = content
    end

	def save
	 	CSV.open("./db/gossip.csv", "ab") do |csv|
	  	  csv << [@author, @content]              	#Inserer une ligne avec deux colonne
	  	end
	end

		
		# def self.all
		#     all_gossips = [] #initialise un array vide

		#     CSV.read("./db/gossip.csv").each do |row| # lecture du csv, ligne par ligne pour créer un array à afficher
		# 	    gossip_temp = Gossip.new(row[0],row[1])  # concatener les 2 lignes
		# 	    all_gossips << gossip_temp # pousser le gossip créé dans l'array all_gossips
		#     end
		#     return all_gossips # retourne l'array vers le controller pour l'afficher dans l'index.erb
		# end


	def self.all
  		all_gossips = []

  		CSV.read("./db/gossip.csv").each do |csv_line| # lecture du csv, ligne par ligne pour créer un array à afficher
    		all_gossips << Gossip.new(csv_line[0], csv_line[1])
  		end
 	 	return all_gossips # retourne l'array vers le controller pour l'afficher dans l'index.erb
	end

	def self.find(id)
		#Associe à author l'auteur du potin à l'id fixé dans l'url
		@author = self.all[id.to_i].author
		@content = self.all[id.to_i].content
		return [@author, @content]
		#En une seule ligne : 
		#return [self.all[id.to_i].author,  self.all[id.to_i].content].join(" à écrit : ")
	end
  	


end

# Gossip.new.save
#binding.pry

