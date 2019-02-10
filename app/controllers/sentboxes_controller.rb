class SentboxesController < ApplicationController
  before_action :set_user

  def index
    @sentbox = @user.mailbox.sentbox
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
