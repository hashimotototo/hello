class AddCustom5ToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :custom5, :string
  end
end
