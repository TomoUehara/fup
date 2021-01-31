class Post < ApplicationRecord
    validates :content, {presence: true, length:{maximum:100}}

    belongs_to :user
    has_many :laugh, dependent: :destroy
    has_many :laughed_users, through: :laugh, source: :user
end
