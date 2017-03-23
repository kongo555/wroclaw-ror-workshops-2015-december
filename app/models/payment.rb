class Payment < ActiveRecord::Base
  belongs_to :student
  belongs_to :subject_item

  validates :student, :payment_deadline, presence: true
end
