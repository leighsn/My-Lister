class ItemController < ApplicationController

  post '/item/new' do
    @list_id = params[:list_id]
    @item = Item.create(name: params[:name], list_id: @list_id)
    content_type :json
     {id: @item.id}.to_json
  end

  post '/item/delete' do
     Item.destroy(params[:item_id])
     content_type :json
      {id: params[:item_id]}.to_json
  end

end
