class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    enable_extension 'pgcrypto'
    create_table :users, primary_key: [:id] do |t|
      t.string :fullname
      t.string :email,           null: false, index: { unique: true }
      t.string :password_digest, null: false
      t.uuid   :id, default: 'gen_random_uuid()', index: { unique: true}, null: false

      t.boolean :verified, null: false, default: false

      t.timestamps
    end
  end
end
