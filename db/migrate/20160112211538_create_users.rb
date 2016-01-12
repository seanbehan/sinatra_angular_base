class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, force: true do |t|
      t.string :uuid
      t.string :name
      t.timestamps null: false
    end
  end
end
