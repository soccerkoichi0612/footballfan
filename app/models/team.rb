class Team < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50 }
    validates :image_file, presence: true
    
    has_many :microposts, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :fans, through: :favorites, source: :user
    
    mount_uploader :image_file, ImageUploader
    
end
