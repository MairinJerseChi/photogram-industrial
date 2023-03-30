class Photo < ApplicationRecord
  belongs_to :owner, class_name: "User", counter_cache:true 
  has_many :comments
  has_many :likes 
  has_many :fans, through: :likes 

  validates :captions, presence: true 
  validates :image, presence: true 

end
