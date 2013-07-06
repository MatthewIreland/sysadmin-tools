#!/bin/sh
# See documentation for preserve_entropy_startup

$poolsize_file=/proc/sys/kernel/random/poolsize    # /proc interface offers both entropy_avail, poolsize, read_wakeup_threshold, uuid and boot_id
[ -r $poolsize_file ] && bytes=`cat $poolsize_file` || bytes=512

dd if=/dev/urandom of=/var/run/startup_random_seed count=1 bs=$bytes