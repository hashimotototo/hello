class AddCustom4ToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :custom4, :string
  end
end
