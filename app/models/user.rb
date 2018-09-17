class User < ApplicationRecord
    mount_uploader :image, ImageUploader

    validates :name,presence: true,length: { maximum: 255 }
    validates :email,presence: true,length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },uniqueness: true
    
    before_validation { email.downcase! }
    
    has_secure_password
    validates :password,presence: true,length: {minimum: 6}
    
    has_many :posts
    has_many :favorites
    has_many :favorite_posts, through: :favorites, source: :post
    has_many :comments

    
end
