class AddSoftDeleteToTournaments < ActiveRecord::Migration
  def change
    add_column :tournaments, :soft_delete, :boolean
  end
end
