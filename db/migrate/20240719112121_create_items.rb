class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :uuid
      t.string :name
      t.string :description
      t.integer :total_item
      t.timestamps
    end
  end
end
