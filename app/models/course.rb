class Course < ActiveRecord::Base
  validates :class_id, uniqueness: true
end
