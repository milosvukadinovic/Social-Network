class Friendship < ApplicationRecord
    enum status: [:sended, :accepted, :declined,:blocked]
    
    belongs_to :user1, class_name: "User"
    belongs_to :user2, class_name: "User"

    validates :user1, presence: true
    validates :user2, presence: true
  
  end