class CalendarsController < ApplicationController

  def show
    if params[:person_id]
      @person = Person.find(params[:person_id])
      if @logged_in == @person
        @cal_url = @person.my_calendar(params[:family])
      else
        render :text => t('not_authorized'), :layout => true, :status => 401
      end
    elsif params[:group_id]
      @group = Group.find(params[:group_id])
      if @logged_in.can_see?(@group)
        @cal_url = @group.gcal_url
      else
        render :text => t('not_authorized'), :layout => true, :status => 401
      end
    end
  end

end
