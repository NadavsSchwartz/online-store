class ItemsController < ApplicationController
	def index
		if params[:category_id]
			@category = Category.find(params[:category_id])
      @items = @category.items
    else
      @items = Item.all
    end
	end

	def new
		@item = Item.new
		authorize @item
	end

	def create
		@item = Item.create(item_params)
		authorize @item
		redirect_to item_path(item)
	end

	def show
		@item = Item.find(params[:id])
	end

	def edit
		@item = Item.find(params[:id])
		authorize @item
	end

	def update
		@item = Item.find(params[:id])
		authorize @item
		@item.update(item_params)
		redirect_to item_path(@item)
	end

	def destroy
		@item = Item.find(params[:id])
		authorize @item
		redirect_to items_path
	end

	private

	def item_params
		params.require(:item).permit(:name, :description, :image_url, :price, :inventory, :category_id, categories_attributes: [:name])
	end

end
