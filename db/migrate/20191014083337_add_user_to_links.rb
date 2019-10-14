class AddUserToLinks < ActiveRecord::Migration[5.2]
  def change
    add_reference(:links, :user)
  end
end
