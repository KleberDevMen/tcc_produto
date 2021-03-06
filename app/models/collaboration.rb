# == Schema Information
#
# Table name: collaborations
#
#  id                 :bigint           not null, primary key
#  collaboration_date :datetime
#  quit               :boolean
#  reason             :string
#  type_collaboration :string
#  withdrawal_date    :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  idea_id            :bigint           not null
#  user_id            :bigint           not null
#
# Indexes
#
#  index_collaborations_on_idea_id  (idea_id)
#  index_collaborations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (idea_id => ideas.id)
#  fk_rails_...  (user_id => users.id)
#
class Collaboration < ApplicationRecord
  belongs_to :user
  belongs_to :idea

  extend Enumerize
  enumerize :type_collaboration, in: [:developer, :facilitator], predicates: true, default: :developer
end
