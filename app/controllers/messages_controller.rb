class MessagesController < ApplicationController

  before_action do
   @conversation = Conversation.find(params[:conversation_id])
  end
######################################
def index
 @messages = @conversation.messages
  if @messages.size > 0
    @messages.each do |msg|
      if msg.recipient_id == current_user.id
        msg.update(:read =>true)
      end
    end
  end

  if @messages.length > 10
   @over_ten = true
   @messages = @messages[-10..-1]
  end

  if params[:m]
   @over_ten = false
   @messages = @conversation.messages
  end

  @m_del = params[:message_id]
  @message = @conversation.messages.new

 end
######################################################

def new
 @message = @conversation.messages.new
end
######################################################

def create
 @message = @conversation.messages.new(message_params)
   if @message.save
    redirect_to conversation_messages_path(@conversation)
   else
    redirect_to conversations_path
   end
end
######################################################

def destroy
  @message = message.id
  @message.destroy
end

#####################################################

private

 def message_params
  params.require(:message).permit(:body, :user_id, :recipient_id, :sender_id)
 end


end
