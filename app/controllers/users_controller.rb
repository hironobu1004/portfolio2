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
      @user = User.new(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password])
        if @user.save
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
    
    def edit
        @user = User.find(params[:user][:id])
    end 
    def update            
       @user = User.find_by(id: params[:id])            
       @user.name = params[:name]            
       @user.email = params[:email] 
       @user.password = params[:email]           
       if @user.save            
       flash[:notice] = "ユーザー情報を編集しました"            
        redirect_to("/users/#{@user.id}")            
       else            
           render("users/edit")            
       end  
    end    
end
