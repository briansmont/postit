module TopicsHelper
  
  # TOPICS
  def make_topics?
    current_user.premium? || current_user.admin?
  end
  
  def edit_delete_topics?(topic)
    (current_user == topic.user) || current_user.admin?
  end
  
  def make_posts?
    current_user
  end
  
end
