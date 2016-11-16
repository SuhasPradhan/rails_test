class EventsController < ApplicationController

	before_filter :find_user_id,:find_users

	def index
		@users= User.all
		@events= Event.all
	end

	def new
		@event= Event.new
		@users= User.all
	end

	def create
		# binding.pry
		@event= Event.new(event_params)
		@event.owner_id = current_user.id
		@event.save
		params['invitee_ids'].each do |t|
			@invitation=Invitation.new
			@invitation.invitee_id = t
			@invitation.inviter_id = @event.owner_id	
			@invitation.event_id = Event.last.id
			@invitation.save
		end
		redirect_to user_event_path
	end

	def edit
		@event = Event.find_by_id(params[:id])
		# @user = User.find_by_id(params[:id])
		# @users = User.all
	end

	def update
		# binding.pry
		@event = Event.find_by_id(params[:id])
		@event.update_attributes(event_params)
		params['invitee_ids'].each do |t|
			@invitation=Invitation.new
			@invitation.invitee_id = t
			@invitation.inviter_id = @event.owner_id	
			@invitation.event_id = @event.id
			@invitation.save
		end
		redirect_to user_event_path
	end

	private
		def event_params
			params.require(:event).permit(:eventname,:venue,:date,:time,:invitees,:description,:status)
		end

		def find_user_id
			@user = User.find_by_id(params[:id])
		end
		def find_users
			@users = User.all
		end


end
