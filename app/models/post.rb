class Post < ApplicationRecord
    mount_uploader :image, ImageUploader
    
    belongs_to :user
    has_many :favorites
    has_many :favorite_users, through: :favorites, source: :user
    has_many :comments
    has_many :comment_users, through: :comments, source: :user
end
