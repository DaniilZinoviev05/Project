module ApplicationHelper
	def check_title(page_title)
		base_title = 'For this pages no title defined...'
		if !page_title.empty?
			"#{page_title}"
		else
			"#{base_title}"
		end
	end 
end
