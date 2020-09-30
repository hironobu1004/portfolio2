class UsersController < ApplicationController

    before_action :authenticate_user,{only:[:index,:show,:edit,:update]}
    before_action :forbid_login_user, {only:[:new,:create,:login_form,:login]}
    before_action :ensure_correct_user, {only: [:edit, :update]}
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
      @user = User.new(user_params)
        if @user.save
          log_in @user
          flash[:success] = "Welcome to the Sample App!"
          redirect_to @user
        else
          render "new"
        end

    end

    def edit
        @user = User.find(params[:id])
    end
    def update
       @user = User.find(params[:id])
       @user.name = params[:user][:name]
       @user.email = params[:user][:email]
       @user.password = params[:user][:password_digest]
       if @user.save
       flash[:notice] = "ユーザー情報を編集しました"
        redirect_to @user
       else
           render "edit"
       end
    end
    def destroy
        user = User.find(params["id"]).destroy
        flash[:destroy] = "ユーザ情報を削除しました"
        redirect_to users_url
    end
    def login_form

    end
    def login
      @user = User.find_by(email: params[:email],password: params[:password])
      if @user
        session[:user_id] = @user.id
        flash[:notice] = "ログインしました"
        redirect_to("/users")
      else
        @error_message = "メールアドレスまたはパスワードが間違っています"
        @email = params[:email]
        @password = params[:password]
      render("users/login_form")
      end
    end
    def logout
        session[:user_id] = nil
        flash[:notice] = "ログアウトしました"
        redirect_to("/login")
    end
    def ensure_correct_user
      if @current_user.id != params[:id].to_i
        flash[:notice] = "権限がありません"
        redirect_to("/users")
      end
    end
    private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
