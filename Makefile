INSTALOADER_COMMON_ARGS = --login=o_lll \
													--no-captions \
													--no-metadata-json \
													--no-profile-pic \
													--filename-pattern={date_utc}

clean:
	@rm -rf docs || true

download_all: 
	@rm -rf photos/collection
	@rm -rf photos/section
	$(MAKE) download

download: monochrome tired_ones color

export:
	@foto export --output docs

monochrome: 
	@instaloader $(INSTALOADER_COMMON_ARGS) \
		--post-filter "not 'color' in caption_hashtags" \
		:saved \
		--dirname-pattern=photos/rusty-ones

tired_ones: 
	@instaloader $(INSTALOADER_COMMON_ARGS) \
		o_lll \
		--post-filter "'お疲れ様' in caption_hashtags" \
		--dirname-pattern=photos/tired-ones

color:
	@instaloader $(INSTALOADER_COMMON_ARGS) \
		--post-filter "'color' in caption_hashtags" \
		:saved \
		--dirname-pattern=photos/colorful-ones
