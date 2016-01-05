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

  get '/list/:slug' do
    @list = List.find_by_slug(params[:slug])
    @list_id = @list.id
    @items = Item.all.where(list_id: @list_id)
    erb :'list/show'
  end

  post '/list/add_user' do
    @user = User.find_or_create_by(name: params[:user])
    @list = List.find_by(id: params[:list_id])
    @items = Item.all.where(list_id: @list.id)
    @userlist = UserList.create(list_id: @list.id, user_id: @user.id)
    erb :'user/show'
  end




end
