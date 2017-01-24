#calabashXTC.sh
#TODO script here

function fail {
echo "$*" >&2
exit 1
}

function section_print {
echo "\n=== $* ==="
}

echo "installing bundler"

gem install bundler

echo "finished installing bundler"

echo "installing gems"

bundle install

echo "finished installing gems"

echo "initiate upload to xamarin test cloud"

test-cloud submit $XTC_APK_FILE $XTC_API_KEY --devices $XTC_DEVICE_KEY --series $XTC_SERIES --locale $XTC_LOCALE --user $XTC_USER

echo "finshed uploading to xamarin test cloud"
