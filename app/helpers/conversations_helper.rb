module ConversationsHelper

  def notifications
    i = 0
    my_conversations = Conversation.where('sender_id = ? OR recipient_id = ?', current_user.id, current_user.id)
    my_conversations.each do |inbox|
      i = i + inbox.messages.where(:recipient_id => current_user.id, :read => false).count
    end
    i
  end
end
# Join the message and conversations table so you can query from both tables
# Find me all the messages that are in conversations that I either started, or I was as recipient of.
# Find all the unread messages and count them.
