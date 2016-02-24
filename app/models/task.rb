class Task < ActiveRecord::Base
  belongs_to :project
  acts_as_list scope: :project
  validates :project_id, presence: true
  validates :name, presence: true
end
