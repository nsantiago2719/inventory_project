class Item < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :total_item, presence: true
end
