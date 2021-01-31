class PostsController < ApplicationController

  def sign
  end

  def time
    @posts = Post.all
    @posts = Post.all.order(created_at: :desc)
    @post = Post.find_by(id: params[:id])
  end

  def index
    @posts = Post.all
    @posts = Post.includes(:laughed_users).sort {|a,b| b.laughed_users.size <=> a.laughed_users.size}
    @post = Post.find_by(id: params[:id])
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def post_create
   
    @post = Post.new(content:params[:content], 
    user_id: @current_user.id ,
    )
    @post.save
    redirect_to("/")
   
  end


#USER

  def new
    @user = User.new
  end
 
  def user_create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
    redirect_to("/")
    end
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to("/")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      render("login")
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to("/")
    
  end
  
#LAUGH


def laugh_create
@like = Laugh.new(
user_id: @current_user.id,
post_id: params[:post_id]
)
@like.save

redirect_to("/")
end

def destroy
  @like = Laugh.find_by(
      user_id: @current_user.id,
      post_id: params[:post_id]
      )
      @like.destroy
      redirect_to("/")
end







end


