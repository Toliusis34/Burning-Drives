class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.integer :article_id
      t.timestamps
    end

    add_index :photos, [:article_id]
    add_index :photos, :article_id
  end
end
