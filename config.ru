require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'controller'
run ApplicationController

#ous allons créer un fichier config.ru qui contient les informations nécessaires au lancement de notre serveur.
#Promis, son extension russe ne cache rien de louche : un fichier .ru est juste un fichier rack up, qui est un fichier Ruby. Crée donc un fichier config.ru et mets-y les lignes suivantes :

