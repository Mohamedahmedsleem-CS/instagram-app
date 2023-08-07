class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.index [:user_id , :post_id], unique: true
      # this will make sure that our like models is unique (only one like from one user on the post )
      t.timestamps
    end
  end
end
