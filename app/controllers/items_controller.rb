class ItemsController < ApplicationController

  def index
    if params[:user_id]
      return render json: User.find(params[:user_id]).items
    else
      items = Item.all
    end
    render json: items, include: :user
  end

end
