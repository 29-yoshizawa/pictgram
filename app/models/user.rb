class User < ApplicationRecord
    validates :name, presence: true, length: { maximum: 15 }
    validates :email, presence: true, format: { with: /[A-Za-z0-9._+]+@[A-Za-z]+.[A-Za-z]/ }
    VALID_PASSWORD_REGIX = /\A(?=.*?[a-zA-Z])(?=.*?[\d])[a-z\d]{8,32}\z/i
    validates :password, presence: true, format: { with: VALID_PASSWORD_REGIX }
    
    has_secure_password

    has_many :topics
    has_many :favorites
    has_many :favorite_topics, through: :favorites, source: 'topic'
    has_many :comments
    has_many :comment_topics, through: :comments, source: 'topic'
end
