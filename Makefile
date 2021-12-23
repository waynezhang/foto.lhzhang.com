clean:
	@rm -rf docs

purge:
	@rm -rf .moul

download_all:
	@rm -rf photos/collection
	@rm -rf photos/section
	@instaloader +args.txt

download:
	@instaloader +args.txt
	@instaloader --login=o_lll o_lll --post-filter "'お疲れ様' in caption_hashtags" --no-captions --no-metadata-json --no-profile-pic --filename-pattern={date_utc} --dirname-pattern=photos/section/1

export: clean
	@moul export --o docs
