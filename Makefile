INSTALOADER_COMMON_ARGS = --login=o_lll \
													--no-captions \
													--no-metadata-json \
													--no-profile-pic \
													--filename-pattern={date_utc}

clean:
	@find docs -depth 1 -not -name "CNAME" -exec rm -rf {} +

purge:
	@rm -rf .moul

download_all: 
	@rm -rf photos/collection
	@rm -rf photos/section
	$(MAKE) download

download: monochrome tired_ones color

export: clean
	@moul export --o docs
	@cp CNAME docs

monochrome: 
	@instaloader $(INSTALOADER_COMMON_ARGS) \
		--post-filter "not 'color' in caption_hashtags" \
		:saved \
		--dirname-pattern=photos/collection

tired_ones: 
	@instaloader $(INSTALOADER_COMMON_ARGS) \
		o_lll \
		--post-filter "'お疲れ様' in caption_hashtags" \
		--dirname-pattern=photos/section/1

color:
	@instaloader $(INSTALOADER_COMMON_ARGS) \
		--post-filter "'color' in caption_hashtags" \
		:saved \
		--dirname-pattern=photos/section/2
