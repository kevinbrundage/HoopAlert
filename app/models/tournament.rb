class Tournament < ActiveRecord::Base
  validates :name, presence: true
end
