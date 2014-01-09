class Visa < ActiveRecord::Base
  attr_accessible :expiry_date, :issue_date, :visa_type
  has_one :immigration
  belongs_to :passport
  has_one :visa_type
end
