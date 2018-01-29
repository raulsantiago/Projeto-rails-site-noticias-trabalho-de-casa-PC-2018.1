class RemovePasswordDigestFromUsuarios < ActiveRecord::Migration[5.1]
  def change
    remove_column :usuarios, :password_digest, :string
  end
end
