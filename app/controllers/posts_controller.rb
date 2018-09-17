class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate


  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order("created_at desc")
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @favorites = @post.favorites.all
    @comment = Comment.new
    @comments = @post.comments.all
  end

  # GET /posts/new
  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        PostMailer.post_mail(@post).deliver
        format.html { redirect_to @post, success: '投稿が正しく登録できました！' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, success: '投稿を更新しました。' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, success: '投稿を削除しました' }
      format.json { head :no_content }
    end
  end

  def confirm
    @post = Post.new(post_params)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:content, :image, :image_cache, :user_id)
  end
  
  def authenticate
     redirect_to new_session_path if !logged_in?
  end
end
