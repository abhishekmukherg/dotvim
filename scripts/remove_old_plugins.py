from commands import getoutput as get_output
import sys

# things installed manually, don't delete plox
EXCEPTIONS = ['mpage', 'vundle']

DRY_RUN = False
if len(sys.argv) > 1 :
    if sys.argv[1] == "-n":
        DRY_RUN = True

vimrc_bundles = get_output("""cat vimrc | grep Bundle | sed '/^"/d' | \
                awk '{print $2}' | sed "s/'//g" """).split('\n')

dir_bundles = get_output("""find bundle/ -maxdepth 1 -type d | sed "s:^bundle/::g" """).split('\n')

if DRY_RUN :
    print "On dry run"

for directory in dir_bundles:
    directory = directory.lower()

    # if the directory (bundle) isn't in vimrc or our exceptions, remove it
    if not any(directory in bundle.lower() for bundle in vimrc_bundles) \
            and not any(directory in exception for exception in EXCEPTIONS):
        command = "rm -rf bundle/%s" % directory
        print command
        if not DRY_RUN:
            get_output(command)


