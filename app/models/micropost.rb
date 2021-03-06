class Micropost < ApplicationRecord
  belongs_to :user
  belongs_to :team
  
  validates :content, presence: true, length: { maximum: 255 }
end
