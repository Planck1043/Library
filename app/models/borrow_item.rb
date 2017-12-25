class BorrowItem < ApplicationRecord
  belongs_to :borrow
  belongs_to :book
end
