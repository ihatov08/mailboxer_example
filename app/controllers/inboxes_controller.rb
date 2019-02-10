class InboxesController < ApplicationController
  before_action :set_user

  def index
    @inbox = @user.mailbox.inbox
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
