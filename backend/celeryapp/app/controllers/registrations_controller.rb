class RegistrationsController < ApplicationController
  skip_before_action :authenticate

  def create
    @user = User.new(user_params)

    if @user.save
      # send_email_verification
      render json: @user, status: :created
    else
      render json: { error: @user.errors_to_s }, status: :unprocessable_content
    end
  end

  private

  def user_params
    params.permit(:username, :name, :email, :password, :password_confirmation)
  end

  def send_email_verification
    UserMailer.with(user: @user).email_verification.deliver_later
  end
end
