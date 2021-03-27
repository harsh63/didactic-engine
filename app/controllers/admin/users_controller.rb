class Admin::UsersController < ApplicationController
  before_action :check_permission
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_reset_password_instructions
      redirect_to admin_users_path, notice: 'User account successfully created. A password reset email has been sent to the user.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params.except(:password))
      redirect_to admin_user_path(@user), notice: 'User was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: 'User was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(%i[email password role full_name phone_number company_name company_address])
  end

  # Only allow admin users to perform actions
  def check_permission
    redirect_to dashboard_path, notice: 'You are not authorised to perform this action.' unless current_user&.admin?
  end
end
