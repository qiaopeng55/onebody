# == Schema Information
#
# Table name: attendance_records
#
#  id          :integer       not null, primary key
#  site_id     :integer       
#  person_id   :integer       
#  group_id    :integer       
#  attended_at :datetime      
#  created_at  :datetime      
#  updated_at  :datetime      
#

class AttendanceRecord < ActiveRecord::Base
  belongs_to :person
  belongs_to :group
  belongs_to :site
  scope_by_site_id
  
  validates_presence_of :person_id
  validates_presence_of :group_id
  validates_presence_of :attended_at
  
  self.skip_time_zone_conversion_for_attributes = [:attended_at]
end
