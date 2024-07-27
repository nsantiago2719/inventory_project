class SessionsController < ApplicationController
  skip_before_action :authenticate, only: %i[ new create ]

  before_action :set_session, only: :destroy

  def index
    @sessions = Current.user.sessions.order(created_at: :desc)
  end

  def new
  end

  def create
    user = User.authenticate_by(email: params[:email], password: params[:password])
    if user && user.verified 
      @session = user.sessions.create!
      cookies.signed.permanent[:session_token] = { value: @session.id, httponly: true }

      respond_to do |format|
        format.html { redirect_to root_path, notice: "User logged in" }
      end
    else
      redirect_to sign_in_path(email_hint: params[:email]), alert:  "You entered a wrong credential or it is not verified"
    end
  end

  def destroy
    @session.destroy
    redirect_to(root_path, notice: "User logged out") 
  end

  private
    def set_session
      @session = Session.find_by_id(cookies.signed[:session_token])
    end
end
