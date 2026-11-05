.PHONY: publish

# Copies the site to the department server (phdspotlight.di.unipi.it).
# Requires a local rclone SFTP remote named exactly PHDSPOTLIGHT.
# rclone copy never deletes remote files.
publish:
	rclone copy -v . PHDSPOTLIGHT:/web --include '/index.html' --include '/style.css' --include '/assets/**' --include '/first-edition/**'
