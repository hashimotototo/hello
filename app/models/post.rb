class Post < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    validates :name, presence: true
    validates :custom1, presence: true
    validates :about, length: { maximum: 200 }
end
