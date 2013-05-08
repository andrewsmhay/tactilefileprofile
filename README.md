# Tactile File Profiler (tfp.rb)

The Tactile File Profiler (tfp) script is used to quickly analyze a file system to help identify file locations, permissions, and ownership.

The script currently takes two inputs:
- A text file that has the file and directory structure of the application (easily generated using your package manager of choice), and
- A text file that performs a recursive find of the application's installation directory (to ensure you catch everything)

The script outputs to STDOUT in pipe "|" delimited format, making it easy to pull into your spreadsheet program of choice.

The tfp script is launched as follows:
`# ruby tfp <file1> <file1>`

Where `<file1>` is the package manager output file and `<file2>` is the application installation directory output file.

e.g.
<pre><code># ruby tfp wordpress.out wordpress.post
Element|Element Type|Description|File Presence|File ACL|File User Ownership|File Group Ownership|File setuid|File setgid|Directory ACL|Directory User Ownership|Directory Group Ownership|World-Writable Directories Have Sticky Bit Set|Process Presence|Process User Ownership|Process Group Ownership|Group Members|Network Service Accessibility|Network Service Processes|
/etc/wordpress/htaccess|File|Y|644|0|0|N|N|NULL|NULL|NULL|NULL|NULL|NULL|NULLNULL|NULL|NULL
/etc/wordpress/wp-config.php|File|Y|644|0|0|N|N|NULL|NULL|NULL|NULL|NULL|NULL|NULLNULL|NULL|NULL
/usr/share/doc/wordpress/changelog.Debian.gz|File|Y|644|0|0|N|N|NULL|NULL|NULL|NULL|NULL|NULL|NULLNULL|NULL|NULL
/usr/share/doc/wordpress/copyright|File|Y|644|0|0|N|N|NULL|NULL|NULL|NULL|NULL|NULL|NULLNULL|NULL|NULL
/usr/share/doc/wordpress/examples/apache.conf|File|Y|644|0|0|N|N|NULL|NULL|NULL|NULL|NULL|NULL|NULLNULL|NULL|NULL
/usr/share/doc/wordpress/examples/setup-mysql|File|Y|644|0|0|N|N|NULL|NULL|NULL|NULL|NULL|NULL|NULLNULL|NULL|NULL
...
/usr/share/wordpress/wp-includes/Text/Diff|Directory|N|NULL|NULL|NULL|NULL|NULL|755|N|N|N|NULL|NULL|NULL|NULL|NULL|NULL
/usr/share/wordpress/wp-includes/Text/Diff/Engine|Directory|N|NULL|NULL|NULL|NULL|NULL|755|N|N|N|NULL|NULL|NULL|NULL|NULL|NULL
/usr/share/wordpress/wp-includes/Text/Diff/Renderer|Directory|N|NULL|NULL|NULL|NULL|NULL|755|N|N|N|NULL|NULL|NULL|NULL|NULL|NULL
</pre></code>

Tested On:
- Ubuntu 12.04.1 LTS
- Ubuntu 12.10
- Amazon AMI
