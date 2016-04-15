class Topic < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :title, presence: true, length: {minimum: 5}
  #validates :author, presence: true, length: {minimum: 3}
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  default_scope -> {order(created_at: :desc)} 
end
