# == Schema Information
#
# Table name: profile_menus
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  menu_id    :bigint           not null
#  profile_id :bigint           not null
#
# Indexes
#
#  index_profile_menus_on_menu_id     (menu_id)
#  index_profile_menus_on_profile_id  (profile_id)
#
# Foreign Keys
#
#  fk_rails_...  (menu_id => menus.id)
#  fk_rails_...  (profile_id => profiles.id)
#
class ProfileMenu < ApplicationRecord
  belongs_to :menu
  belongs_to :profile
end
