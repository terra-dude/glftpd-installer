#################################################################
#                                                               #
# Mediainfo by Teqno                                            #
#                                                               #
# It extracts info from *.rar file for related releases to      #
# give the user ability to compare quality.                     #
#                                                               #
#################################################################

bind pub o !mediainfo pub:mediainfo

## Public chan.
proc pub:mediainfo {nick output binary chan text} {
  set binary {/glftpd/bin/mediainfo.sh}
  global channel
    putquick "PRIVMSG $chan :Getting info, please wait..."
    foreach line [split [exec $binary $nick $text] "\n"] {
       putquick "PRIVMSG $chan :$line"
    }
}

putlog "Mediainfo.tcl 1.0 by Teqno loaded"
