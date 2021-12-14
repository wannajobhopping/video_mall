class ChangeEncryptedPasswordToPassword < ActiveRecord::Migration[6.1]
  def change
    remove_column(:users, :encrypted_password)
    add_column(:users, :password, :string)
  end
end
