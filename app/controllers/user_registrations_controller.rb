class UserRegistrationsController < ApplicationController
  skip_before_action :require_login

  def show
    @user = UserRegistration.find(params[:id])
  end

  def new
    @user = UserRegistration.new
  end

  def create
  	@user = UserRegistration.find_by(phone: user_registration_params[:phone])
    if @user.present?
      @user.send_passcode
    	redirect_to @user
    else
	    @user = UserRegistration.new(user_registration_params)

	    if @user.save && @user.send_passcode
	      redirect_to @user
	    else
        flash.now.alert = "Something went wrong!"
	      render :new
	    end
	  end
  end

  def verify_otp
  	@user = UserRegistration.find(params[:id])
  	if @user && @user.verify_passcode(user_registration_params[:otp])
  		session[:user_id] = @user.id
      redirect_to root_url
    else
    	flash.now.alert = "Incorrect OTP!" if user_registration_params[:otp].present?
      render :show
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

  private
    def user_registration_params
      params.require(:user).permit(:phone, :otp, :otp_status, :secret_key)
    end

end
