class FileType < ActiveRecord::Base
  validates_presence_of :extension
end
