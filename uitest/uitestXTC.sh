function section_print {
    echo "\n=== $* ==="
}

# Parameter passed from the upstream job that built the iOS app
cd "$UPSTREAM_WORKSPACE"

# Upload Command
"$MONO_PATH/bin/mono" $XTC_UPLOADER_PATH submit $XTC_APP_FILE $XTC_API_KEY --devices $XTC_DEVICE_KEY --series $XTC_SERIES --locale $XTC_LOCALE --app-name $XTC_APP_NAME --user $XTC_USER --assembly-dir $XTC_TEST_DIRECTORY --async
