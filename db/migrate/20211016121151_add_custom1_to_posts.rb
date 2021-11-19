class AddCustom1ToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :custom1, :string
  end
end
