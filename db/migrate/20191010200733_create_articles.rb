class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :article_name
      t.string :tagline
      t.text :article
      t.timestamps
    end
  end
end
