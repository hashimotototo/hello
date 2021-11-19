class AddCustom2ToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :custom2, :string
  end
end
