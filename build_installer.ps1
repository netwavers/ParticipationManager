# Build script for Participation Manager
# Workaround for unicode path issues and symlink errors

# Use local cache on C drive to avoid unicode path issues and support symlinks (via manual fix)
$env:ELECTRON_BUILDER_CACHE="C:\eb_temp"

# Disable code signing verification to avoid tool download issues
$env:CSC_IDENTITY_AUTO_DISCOVERY="false"

# Run the build
npm run dist -- --win
