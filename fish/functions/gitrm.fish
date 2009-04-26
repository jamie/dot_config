function gitrm
	gst | grep deleted: | col 3 | xargs git rm

end
