#ruby 24
#tinkertownstandard module
#original development by Tinkering-Townsperson:water warrior
#github: https://github.com/Tinkering-Townsperson/
$original_developer = :water_warrior
module TTStandard
	class FileEditor
		attr_reader :file
		attr_reader :filename
    	def initialize(filename, path="")
    		@filename = path + filename
    		@file = File.open(@filename, "a+")
    		return @file
		end
		def self.edit_file()
			puts("path\\to\\file\\:")
			path = gets.chomp()
			puts("filename.extension:")
			filename = gets.chomp()
			theFilename = path + filename
			if File.exists?(theFilename)
				text = File.read(theFilename).to_s
				lineNum = text.split("\n").length() + 1
			else
				lineNum = 1
			end
			file = File.open(theFilename, "a+")
			while true
				prompt = "|*#{lineNum}*|: "
				print(prompt)
				lineVal = gets
				if lineVal.chomp == "QUIT"
					exit
					break
				elsif lineVal.chomp == "SAVE"
					file.close()
					break
				else
					file.write(lineVal)
					lineNum += 1
				end
			end
		end
	end
end
trap("INT"){exit}