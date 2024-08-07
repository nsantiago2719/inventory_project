class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update!(item_params)
      redirect_to @item
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id]).destroy

    respond_to do |format|
      format.turbo_stream { flash.now[:notice] = "#{@item.name} successfully deleted!"}
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :total_item)
  end
end
