class Certificats < ActiveRecord::Migration
  def change
    create_table(:certificats) do |t|
        ## Database authenticatable
        t.string :file_name, null: false
        t.string :btc_transaction, null: false
        t.string :file_hash
        t.integer :user_id
    end
  end
end
