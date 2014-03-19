#!/usr/bin/env python
# cmd format wsend_gmail.sh send_from passwd sendto message
#./wsend_gmail.py sendfrom passwd sendto message

import smtplib
import sys
from email.mime.text import MIMEText


ARG=sys.argv[1]

from datetime import datetime
now = datetime.now()
MARK  = str(now.hour) + ":" + str(now.minute)
 
if len(sys.argv) <> 5  :
   print "Needs send_from, password, send_to , and message,...exist "
   sys.exit()
USERNAME = sys.argv[1]
PASSWORD = sys.argv[2]
MAILTO  = sys.argv[3]
MESS = sys.argv[4]

msg = MIMEText('This is the body of the email')
msg = MIMEText(MESS)
msg['Subject'] = MARK + MESS 
msg['From'] = USERNAME
msg['To'] = MAILTO

server = smtplib.SMTP('smtp.gmail.com:587')
server.ehlo_or_helo_if_needed()

server.starttls()
server.ehlo_or_helo_if_needed()
server.login(USERNAME,PASSWORD)
server.sendmail(USERNAME, MAILTO, msg.as_string())
server.quit()

