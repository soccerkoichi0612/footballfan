class Team < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50 }
    validates :image_file, presence: true
    
    has_many :microposts
    has_many :favorites
    has_many :fans, through: :favorites, source: :user
    
end
