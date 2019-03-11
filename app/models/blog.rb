class Blog < ApplicationRecord
  belongs_to :user
  validates :title,presence: true,length:{maximum: 50}
  validates :content,length:{minimum:1,maximum:140}
end
