set mbox_type   = Maildir
set sendmail    = "/usr/local/bin/msmtp -a frodeaa"
set realname    = "Frode Aannevik"
set from        = "frode.aa@gmail.com"

set copy        = no
set move        = no
set folder      = ~/mail/frodeaa
set spoolfile   = "+INBOX"
set mbox        = "+archive"
set postponed   = "+drafts"
unset record
color status green default

mailboxes +INBOX
