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

mailboxes +INBOX

macro index,pager ge "<save-message>=archive<enter><enter>" "Archive"
macro index gi "<change-folder>=INBOX<enter>" "Go to inbox"
macro index ga "<change-folder>=archive<enter>" "Go to archive"
macro index gd "<change-folder>=drafts<enter>" "Go to drafts"
macro index O "<shell-escape>offlineimap<enter>"           "run offlineimap to sync all mail"
macro index o "<shell-escape>offlineimap -qf INBOX<enter>" "run offlineimap to sync inbox"

bind compose p postpone-message

auto_view text/html

unset move           # gmail does that
set delete           # don't ask, just do
unset confirmappend  # don't ask, just do!
set quit             # don't ask, just do!!
unset mark_old       # read/new is good enough for me

# Index view options
set date_format = "!%Y-%m-%d %H:%M %Z"
set index_format = "%Z  %D  %-20.20F  (%4c)  %s"

set editor='vim + -c "set nocp" -c "set textwidth=72" -c "set wrap" -c "silent /^$" -c "noh" -c "vmap <leader>s c[... snip ...]<ESC>"
# sort/threading
set sort     = threads
set sort_aux = reverse-last-date-received
set sort_re

