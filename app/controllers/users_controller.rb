class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user_profile = @user.user_profile
    @microposts = @user.microposts
  end

  def new
    @user = User.new
    @user_profile = UserProfile.new
  end

  def create
    @user = User.new(user_params)
    @user.save

    @user_profile = UserProfile.new(user_id: @user.id)
    @user_profile.save

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcom to the Sample Ami's app! "
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(id:session[:user_id])
    @user_profile = @user.user_profile
  end

  def update
    @user = User.find_by(id:session[:user_id])
    @user_profile = @user.user_profile

    @user.attributes = user_params
    @user_profile.attributes = user_profile_params

    if @user.save && @user_profile.save
      redirect_to current_user
    else
      render :action => 'edit'
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def user_profile_params
    params.require(:user_profile).permit(:area, :bio)
  end
end
