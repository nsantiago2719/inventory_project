class Item < ApplicationRecord
  has_rich_text :description

  validates :name, presence: true, length: { minimum: 3 }
  validates :total_item, presence: true
end
