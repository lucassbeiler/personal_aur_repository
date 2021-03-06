#!/usr/bin/env bash
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Allow users to override command-line options
USER_FLAGS_FILE="$XDG_CONFIG_HOME/brave-flags.conf"
if [[ -f $USER_FLAGS_FILE ]]; then
   USER_FLAGS="$(cat $USER_FLAGS_FILE | sed 's/#.*//')"
fi

## Now Brave supports Chromium's SUID sandbox, so we don't depend on User Namespaces for sandboxing.
# if [[ -f /proc/sys/kernel/unprivileged_userns_clone && $(< /proc/sys/kernel/unprivileged_userns_clone) == 0 ]]; then
#     >&2 echo "User namespaces are detected as disabled on your system, Brave will run with the sandbox disabled"
#     SANDBOX_FLAG="--no-sandbox"
# fi

export CHROME_VERSION_EXTRA="stable"

exec /usr/lib/brave-bin/brave-browser "$@" $USER_FLAGS