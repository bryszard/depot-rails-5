class ChangePayTypeToPayTypeId < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :pay_type, :pay_type_id

    add_index :orders, :pay_type_id
  end
end
