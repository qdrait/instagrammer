class User < ApplicationRecord
    validates :name,presence: true,length: { maximum: 255 }
    validates :email,presence: true,length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },uniqueness: true
    validates :tel_no,presence: true,length: { maximum: 20 }
    validates :gender,presence: true,length: { maximum: 1 }
    validates :website,length: { maximum: 1000 }
    validates :profile,length: { maximum: 255 }
    
    before_validation { email.downcase! }
    
    has_secure_password
    validates :password,presence: true,length: {minimum: 6}
    
    has_many :posts
    has_many :favorites
    has_many :favorite_posts, through: :favorites, source: :post
    has_many :comments

    
end
