class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, -> { order(position: :asc) }, dependent: :destroy
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 255 }
end
