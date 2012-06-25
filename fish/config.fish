# $PATH expansion

function bin_expand
	if test -d $argv
		set PATH $PATH $argv
	end
end

bin_expand ~/bin
bin_expand ~/.local/bin
