class ItemsController < ApplicationController

  def index
    if params[:user_id]
      return render json: User.find(params[:user_id]).items
    else
      items = Item.all
    end
    render json: items, include: :user
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
    user = User.find(params[:user_id])
    user.items.create(item_params)
    render json: user.items.last, except: [:created_at, :updated_at]
  end

  private

  def item_params
    params.permit(:name, :description, :price)
  end

end
