# Create a single bash (.sh) script  

## To run  

**Add *jnoland* user**  


    $ adduser jnoland    
    $ gpasswd -a jnoland wheel
    $ vi /etc/sudoers # Uncomment NOPASSWD for wheel group save with w!
    $ sudo su - jnoland

**Secure copy the files `helloapp.ini`, `helloapp.nginx.conf`, `install_web_server.sh`, `uwsgi.service`, `wsgi.py` to */home/jnoland/*.**  

**Edit `helloapp.nginx.conf` with host server ip address**  

**Run script**  


    $ sudo chown jnoland:jnoland helloapp.ini helloapp.nginx.conf install_web_server.sh uwsgi.service wsgi.py
    $ ./install_web_server.sh
    
**Visit web page at http://whatever-ip-address**

Example: http://138.68.255.234
