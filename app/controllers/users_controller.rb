class UsersController < ApplicationController
    def index
        @user = User.all
    end

    def show
        @user = User.find_by(id: params[:id])
        
    end  
    
    
    def signup
        @user = User.new
    end
    def make
    if@user = User.new(name: params[:name], email: params[:email], password: params[:password])
        @user.save
        flash[:notice] = "ユーザー登録が完了しました"            
        redirect_to("/users/#{@user.id}")  
    else            
        render("/signup")            
        end
        
    end
    private

    def user_params
      params.permit(:name, :email, :password)
    end    
end
