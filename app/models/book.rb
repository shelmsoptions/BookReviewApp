class Book < ApplicationRecord
  belongs_to :user
  belongs_to :author
  has_many :reviews
  
  default_scope { order('created_at ASC') }
  
  accepts_nested_attributes_for :author
  accepts_nested_attributes_for :user
end