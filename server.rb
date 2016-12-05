require 'sinatra'
require 'csv'
require 'pry'

set :bind, '0.0.0.0'

get '/' do
  redirect '/grocery-list'
end

get '/grocery-list' do
  erb :grocery_list
end

post '/grocery-list' do
  @item = params[:add_item]

  if @item == ''
    redirect '/grocery-list'
  else
    CSV.open('grocery_list.csv', 'a', headers: true) do |csv|
        csv << [@item]

    erb :add_grocery_item

    end
  end

  redirect '/grocery-list'
end
