class Team < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50 }
    validates :image_file, presence: true
end
