import pexpect, sys

child = pexpect.spawn ('urbit -F zod')
child.logfile = sys.stdout
child.expect("activated app home/dojo", timeout=3600)
child.expect("~zod:dojo>", timeout=1800)
child.sendline("(mul 249 367)\r")
child.expect("91.383", timeout=300)
child.sendline("|exit\r")
child.expect(pexpect.EOF, timeout=300)
