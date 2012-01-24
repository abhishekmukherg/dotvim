from commands import getoutput as get_output
import sys

# things installed manually, don't delete plox
EXCEPTIONS = ['mpage', 'vundle']

DRY_RUN = False
if len(sys.argv) > 1 :
    if sys.argv[1] == "-n":
        DRY_RUN = True

vimrc_bundles = get_output("""cat vimrc | grep Bundle | sed '/^"/d' | \
                awk '{print $2}' | sed "s/'//g" """).lower().split('\n')

dir_bundles = get_output("""find bundle/ -maxdepth 1 -type d | sed "s:^bundle/::g" """).lower().split('\n')

allowed_bundles = set()
allowed_bundles.update(EXCEPTIONS)
allowed_bundles.update(vimrc_bundles)

if DRY_RUN :
    print "On dry run"

for directory in dir_bundles:
    if directory in allowed_bundles:
        continue
    command = "rm -rf bundle/%s" % directory
    print command
    if not DRY_RUN:
        get_output(command)


