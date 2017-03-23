class Payment < ActiveRecord::Base
  belongs_to :student

  validates :student, :payment_deadline, presence: true
end
