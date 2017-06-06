class JobTag < ActiveRecord::Base
  has_many :tags
  has_many :jobs
end
