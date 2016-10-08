class PostsController < ApplicationController
  def show
    @post = Post.find_by_id(params[:post_id])
  end
  def new
    @post = Post.new
    @city = City.find_by_id(params[:city_id])
  end
  def create
    city = City.find_by_id(params[:city_id])
    new_post = Post.new
    if new_post.save
      city.posts << new_post
      redirect_to city_path
    else
      redirect_to root_path
    end
    #save user_id
    #save city_id
    #need to turn author into logged in user
  end

  private
  def post_params
    params.require(:post).permit(:title, :author, :content)
  end
end
