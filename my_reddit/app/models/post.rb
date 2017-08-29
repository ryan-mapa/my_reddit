# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  sub_id     :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, :author, :sub, presence: true #validate associations

  belongs_to :author,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :sub,
    primary_key: :id,
    foreign_key: :sub_id,
    class_name: :Sub


end
