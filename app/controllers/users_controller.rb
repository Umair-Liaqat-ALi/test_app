class UsersController < ApplicationController
  before_action :set_article, only: [:edit, :update, :destroy, :show]


   def new
  	 @user = User.new
  	
   end

   def create
	 @user = User.new(user_params)
	 if @user.save
	   flash[:notice] = "Article was successfully created"
	   redirect_to user_path(@user)
	 else
	   render 'new'
	 end	
   end

  def show

  end

  def edit
  	
  end

  def update
  	if @user.update(user_params)
  	  flash[:notice] = "user was successfully updated"
	  redirect_to user_path(@user)
	else
		render 'edit'
	end
  	
  end

  def destroy
  	if @user.destroy
  	  flash[:notice] = "user was successfully updated"
	  redirect_to users_path
	else
		render 'index'
	end
  	
  end

  def index
  	@users = User.all  	
  end

  private
    def set_article
	  	@user = User.find(params[:id])
	end
    def user_params
      params.require(:user).permit(:name, :field)
      #params.require(:article).permit(:name, :field)
    end

end
