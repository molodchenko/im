class UserItemsController < ApplicationController
  before_filter :authenticate_user!
#  after_action :verify_authorized, except: [:show]

  def update
  	@item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_columns user_id: params[:item][:user_id]
      	 @item.update_columns location: params[:item][:user_id]
#      if @item.update_attributes(params[:item])
        format.html { redirect_to items_path(category: @item.category), notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        respond_with(@items)
      end
    end
  end
end
