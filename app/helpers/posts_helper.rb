module PostsHelper
  
  #POSTS
  def make_posts?
    current_user
  end
  
  def edit_delete_posts?(post)
    (current_user == post.user) || current_user.admin?
  end
  
end
