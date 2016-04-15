class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      #t.string :author
      t.text :text
      t.references :topic, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
    add_index :comments, [:topic_id, :user_id, :created_at]
  end
end
