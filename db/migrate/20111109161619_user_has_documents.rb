class UserHasDocuments < ActiveRecord::Migration
  def up
    remove_column :documents, :uploaded_by
    add_column :documents, :user_id, :integer
  end

  def down
  end
end
