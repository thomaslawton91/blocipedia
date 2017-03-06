def new
  @collaborator = Collaborator.new
def create(
  @collaborator = Collaborator.new
  
  if favorite.save
    flash[:notice] = "Collaborator selected."
  else
    flash[:alert] = "Collaborator failed."
  end
end

def destroy
  post = Post.find(params[:post_id])
  favorite = current_user.favorites.find(params[:id])

  if favorite.destroy
    flash[:notice] = "Post unfavorited."
  else
    flash[:alert] = "Unfavoriting failed."
  end

  redirect_to [post.topic, post]
end
end
