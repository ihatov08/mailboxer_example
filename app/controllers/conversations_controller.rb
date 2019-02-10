class ConversationsController < ApplicationController
  before_action :set_user
  def index
    @conversations = @user.mailbox.conversations
  end

  def show
    @conversation = @user.mailbox.conversations.find(params[:id])
    @conversation
      .receipts
      .where(is_read: false, receiver: @user)
      .each{|m| m.update(is_read: true)}
  end

  def new
  end

  def create
    recipient  = User.find(params[:recipient_id])
    # TODO: validation
    if @user.send_message(recipient, *conversation_params.values_at(:body, :subject))
      redirect_to user_conversations_path(user_id: @user.id)
    end
  end

  def reply_to_conversation
    conversation = @user.mailbox.conversations.find(params[:conversation_id])
    if @user.reply_to_conversation(conversation, conversation_params[:body])
      redirect_to user_conversation_path(id: conversation.id, user_id: @user.id)
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def conversation_params
    params.permit(:body, :subject, :recipient_id)
  end
end
