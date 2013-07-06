#!/bin/sh
# To preserve the entropy pool over shutdown, this script needs to be run on startup
# (the corresponding script to run on shutdown is preserve_entropy_shutdown.sh)
# This prevents possible attacks relating to lack of entropy on startup
# All major distributions have done this as standard since about 2000, so this is only needed on a rubbish and/or developing one (but see TODO at end)

# Get size of entropy pool (probably 512 but stored in /proc/sys/kernel/random/poolsize)
$poolsize_file=/proc/sys/kernel/random/poolsize    # /proc interface offers both entropy_avail, poolsize, read_wakeup_threshold, uuid and boot_id
[ -r $poolsize_file ] && bytes=`cat $poolsize_file` || bytes=512

# preserve_entropy_shutdown.sh saves 512 bytes from /dev/urandom into /var/startup_random_seed
# If the script was run on last shutdown, copy the seed back in
if [ -f /var/run/startup_random_seed ]; then
    cat /var/startup_random_seed >/dev/urandom
fi
rm -f /var/run/startup_random_seed


# TODO: this method is really rather insecure, although sufficient for current requirements. Add some high precision timing of network packets, hash with the startup time or something.
# Also see http://manpages.ubuntu.com/manpages/oneiric/man4/random.4.html