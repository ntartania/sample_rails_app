class Comment < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :votes, dependent: :destroy
  #validates :author, presence: true, length: {minimum: 3}
  validates :text, presence: true, length: {minimum: 10}
  validates :user_id, presence: true
  validates :topic_id, presence: true
  default_scope -> {order(created_at: :desc)}
end
