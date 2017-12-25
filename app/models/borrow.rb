class Borrow < ApplicationRecord
  has_many :borrow_item
  has_many :books, through: :borrow_items, source: :book
end
