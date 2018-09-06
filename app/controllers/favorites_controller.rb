class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(post_id: params[:post_id])
    redirect_to post_url(params[:post_id]), success: "#{favorite.post.user.name}さんの投稿をお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to posts_url, success: "#{favorite.post.user.name}さんの投稿をお気に入り解除しました"

  end
end
