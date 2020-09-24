class User < ApplicationRecord
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    
    has_many :microposts
    has_many :favorites
    has_many :likes, through: :favorites, source: :team
    
    def favorite(team)
       self.favorites.find_or_create_by(team_id: team.id) 
    end
    
    def unfavorite(team)
        favorite = self.favorites.find_by(team_id: team.id)
        favorite.destroy if favorite
    end

    def favorite?(team)
      self.likes.include?(team)
    end
    
    def feed_microposts
      Micropost.where(team_id: self.like_ids )
    end
  
end
