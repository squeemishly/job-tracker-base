class Tag < ActiveRecord::Base
  validates :name, presence: true
  has_many :job_tags
  has_many :jobs, through: :job_tags
end
