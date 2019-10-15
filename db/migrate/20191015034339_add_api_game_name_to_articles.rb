class AddApiGameNameToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :api_game_name, :string
  end
end
