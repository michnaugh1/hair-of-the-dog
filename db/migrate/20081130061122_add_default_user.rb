class AddDefaultUser < ActiveRecord::Migration
  def self.up
    if !User.find_by_login('admin')
        User.create(:login => 'administrator', :email => 'meaghan@hairofthedoggroomin.biz',
                  :password => '0zzi3', :password_confirmation => '0zzi3')
  end

end
  def self.down
  end
end
