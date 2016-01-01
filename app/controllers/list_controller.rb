class ListController < ApplicationController
  get '/oh_hai' do
    erb :"hello/oh_hai"
  end

  post '/list' do
    params.each {|user_id, name| @user_id = user_id, @name = name }
    @list = List.create(name: @name)
    UserList.create(list_id: @list.id, user_id: @user_id[0])
    erb :'list/new'
  end

  post '/list/new' do
    @list_id = params[:id]
    @list = List.find_by(id: @list_id)
    @items = JSON.parse(params[:items_in_list])
    @items.each {|item| Item.create(name: item, list_id: @list_id)}
    redirect to "/list/#{@list.slug}"
  end

  get '/list/:slug' do
    @list = List.find_by_slug(params[:slug])
    @list_id = @list.id
    @items = Item.all.where(list_id: @list_id)
    binding.pry
    erb :'list/show'
  end




end
