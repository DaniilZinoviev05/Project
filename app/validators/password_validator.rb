class PasswordValidator < ActiveModel::EachValidator
	def validate_each record, attribute, value 
		unless value =~ /\d/ && value =~ /[!@#\$%\^&\*]/ && value =~ /[a-zA-Z]/
			record.errors.add(attribute, 'Должна содержаться хотя бы одна цифра, буква 
				и один специальный символ: !, @, #, $, %, ^, &, *')
		end 
	end 
end 
