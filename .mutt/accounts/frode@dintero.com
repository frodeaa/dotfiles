set header_cache='~/.mutt/.cache/com.dintero.frode/headercache'
set message_cachedir='~/.mutt/.cache/com.dintero.frode/messagecache'
set certificate_file='~/.mutt/.cache/com.dintero.frode/certificates'

set mbox_type   = Maildir
set sendmail    = "/usr/local/bin/msmtp -a dintero"
set realname    = "Frode Aannevik"
set from        = "frode@dintero.com"

set copy        = no
set move        = no
set folder      = ~/mail/dintero
set spoolfile   = "+INBOX"
set mbox        = "+archive"
set postponed   = "+drafts"
unset record
color status cyan default

mailboxes +INBOX
