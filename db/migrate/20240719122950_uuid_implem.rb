class UuidImplem < ActiveRecord::Migration[7.1]
  def up
    enable_extension 'pgcrypto'
    remove_column :items, :uuid
    add_column :items, :uuid, :uuid, default: 'gen_random_uuid()', null: false
    rename_column :items, :id, :integer_id
    rename_column :items, :uuid, :id
    execute 'ALTER TABLE items drop constraint items_pkey;'
    execute 'ALTER TABLE items ADD PRIMARY KEY (id);'

    execute 'ALTER TABLE ONLY items ALTER COLUMN integer_id DROP DEFAULT;'
    change_column_null :items, :integer_id, true
    execute 'DROP SEQUENCE IF EXISTS items_id_seq'
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
