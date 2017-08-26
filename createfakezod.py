import pexpect, sys

child = pexpect.spawn ('urbit -F -I zod -A arvo -c fakezod')
child.logfile = sys.stdout
child.expect("activated app home/dojo", timeout=120)
child.expect("~zod:dojo>", timeout=120)
child.sendline("(mul 249 367)\r")
child.expect("91.383")
child.sendline("|exit\r")
child.expect(pexpect.EOF)
