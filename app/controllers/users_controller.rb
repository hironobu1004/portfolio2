class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        @user = User.find_by(id: params[:id])

    end


    def new
        @user = User.new
    end
    def create
      @user = User.new(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password])
        if @user.save
        flash[:success] = "ユーザー登録が完了しました"
        redirect_to @user
    else
        render("/signup")
        end

    end

    def edit
        @user = User.find(params[:id])
    end
    def update
       @user = User.find(params[:id])
       @user.name = params[:user][:name]
       @user.email = params[:user][:email]
       @user.password = params[:user][:password]
       if @user.save
       flash[:notice] = "ユーザー情報を編集しました"
        redirect_to @user
       else
           render("users/:id/edit")
       end
    end
    def destroy
        @user = User.find(params["id"])
        @user.destroy
        flash[:destroy] = "ユーザ情報を削除しました"
        redirect_to @user
    end
end
