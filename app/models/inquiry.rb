class Inquiry < ActiveRecord::Base
  validates :question, presence: true
end
