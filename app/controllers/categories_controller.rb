class CategoriesController < ApplicationController
    def show
        @category = Category.find(params[:id]) 
        @notes =Note.where(category_id: params[:id])
        
    end    
end
