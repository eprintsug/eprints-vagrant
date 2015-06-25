
# troubleshooting

## Permissions

The permissions may need to be adjusted for directories under /usr/share/eprints.
by default the directories are owner/group *eprints.eprints*.  The default
directory permission is 750 (read, write, execute for owner and read, execute for
group). This prevents *httpd* daemon from writing to most directories even after
running the recommended *chcon*.  The solution on my development deployment
was to make the following directory list have read, write, executable access
for the owner and group (i.e. 770).

+ /usr/share/eprints/lib
+ /usr/share/eprints/var
