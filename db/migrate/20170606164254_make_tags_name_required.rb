class MakeTagsNameRequired < ActiveRecord::Migration[5.0]
  def change
    change_column :tags, :name, :string, null: false
  end
end