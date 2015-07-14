require "sinatra"
require "sinatra/activerecord"

set :database, {adapter: "sqlite3", database: "example.sqlite3"}

class User < ActiveRecord::Base #AS CLASSES HERDAM ESTA CLASSE
end

get "/" do
  @users = User.all #VAI BUSCAR TODOS OS REGISTOS DESTA TABELA DE BASE DE DADOS E VAI MANDAR PARA A NOSSA VIEW
  erb :index
end

post "/users/create" do
  user = User.new name: params[:name], email: params[:email] #INSTANCIAMOS UM NOVO OBJECTO DA CLASSE. AS COLUNAS SÃO PROPRIEDADES DA BASE DE DADOS
  user.save #METODO SAVE QUE JA EXISTE NO ACTIVE RECORD - VER AS COISAS QUE SE PODE FAZER COM O ACTIVE RECORD. VE O ESTADO DO OBJECTO E MANDA-OS PRA BASE DE DADOS
  redirect "/"
end