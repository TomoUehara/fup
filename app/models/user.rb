class User < ApplicationRecord
    validates :name, {presence: true}
    validates :email, {presence: true, uniqueness: true}
    validates :password, {presence: true}

    has_many :posts,dependent: :destroy
  has_many :laugh, dependent: :destroy
  has_many :laughed_posts, through: :laugh, source: :post
end
