class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book
  
  default_scope { order('created_at ASC') }

  accepts_nested_attributes_for :book
end