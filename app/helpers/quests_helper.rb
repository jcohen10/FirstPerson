module QuestsHelper


	def user_checkpoint_check(user, checkin)
		
		user.checkpoints.each do |checkpoint|
			if checkpoint.location.foursquare_id == checkin.foursquare_id
				checkpoint.user_checkpoints.find_by(user_id: user.id).complete!
				user_quest_check(user, checkpoint)
				Notification.create(user_id: user.id, title: "Check Point Completed!", content: "You've completed a checkpoint for #{checkpoint.quest.title.titleize} Keep up the good work!")
			end
		end
	end

	def user_quest_check(user, checkpoint)
		quest = Quest.find(checkpoint.quest_id)
		if quest.user_checkpoints.where(user_id: user.id).all?{|record| record.completed == true}
			quest.user_quests.find_by(user_id: user.id).complete!
			Notification.create(user_id: user.id, title: "QUEST COMPLETE!", content: "You've Completed #{quest.title.titleize} As a reward you get #{quest.xp} XP.")
		end
	end

	def quest_info
		[@quest.title, @quest.xp, @quest.userstatus, @quest.timestatus, @quest.end_date, @quest.category, @quest.description]
	end


end
