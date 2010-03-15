class Revision < ActiveRecord::Base
  has_one :file_type
  belongs_to :block

  validates_presence_of :snippet, :revision_number
end
