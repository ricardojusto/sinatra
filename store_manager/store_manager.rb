require 'sinatra'

class Product
  attr_reader :id, :name, :price, :brand

  def initialize(hash)
    @id = hash[:id]
    @name = hash[:name]
    @price = hash[:price]
    @brand = hash[:brand]
  end
end

products = [
  Product.new({ id: 0, name: "Samsung Galaxy S6 Edge", price: 829.90, brand: "Samsung" }),
  Product.new({ id: 1, name: "Lg G Flex", price: 689.90, brand: "Lg" }),
  Product.new({ id: 2, name: "Apple iPhone 6 Plus", price: 779.90, brand: "Apple" }),
  Product.new({ id: 3, name: "samsung galaxy alpha", price: 589.90, brand: "samsung" }),
  Product.new({ id: 4, name: "nokia lumia 930", price: 489.90, brand: "nokia" }),
  Product.new({ id: 5, name: "sony xperia z3 compact", price: 389.90, brand: "sony" }),
  Product.new({ id: 6, name: "apple iphone 6", price: 779.90, brand: "apple" }),
  Product.new({ id: 7, name: "huawei ascend g7", price: 259.90, brand: "huawei" }),
  Product.new({ id: 8, name: "sony xperia t2 ultra", price: 359.90, brand: "sony" }),
  Product.new({ id: 9, name: "lg g4", price: 589.90, brand: "lg" }),
  Product.new({ id: 10, name: "samsung galaxy note 4", price: 689.90, brand: "samsung" }),
  Product.new({ id: 11, name: "htc one m9", price: 674.90, brand: "htc" }),
  Product.new({ id: 12, name: "apple iphone 5s", price: 589.90, brand: "apple" })
]

get '/' do
  erb :index
end

get '/list' do 
  @products = products
  erb :list
end

get '/form' do
  erb :form
end

post '/new' do
  products << Product.new({:id => params[:id].to_i, :name => params[:name], :price => params[:price], :brand => params[:brand]})
  @products = products
  erb :new
end

get '/remove' do
  products.delete_if{|product| product.id == params[:id].to_i}
  @products = products
  erb :remove
end

get '/product/:id' do
    @products = products.find do |product|
      product.id == params[:id].to_i
    end
  erb :product
end

get '/edit_form/:id' do
    @products = products.find do |product|
    product.id == params[:id].to_i
    end
  erb :edit_form
end

post '/update/:id' do
  products.delete_at(params[:id].to_i)
  products << Product.new({:id => params[:id].to_i, :name => params[:name], :price => params[:price], :brand => params[:brand]})
 redirect "/product/#{params[:id]}"
end

