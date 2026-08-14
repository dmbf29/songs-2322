class AddCategoryToSongs < ActiveRecord::Migration[8.1]
  def change
    add_column :songs, :category, :string
  end
end
