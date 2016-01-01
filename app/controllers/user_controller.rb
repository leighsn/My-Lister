class UserController < ApplicationController

  post '/user' do
    @user = User.find_or_create_by(:name => params[:name])
    redirect to "/user/#{@user.slug}"
  end

  get '/user/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'user/show'
  end

end
