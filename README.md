Docker build for Amazon Dash
https://github.com/Nekmo/amazon-dash

Documents from the origanl source:
http://docs.nekmo.org/amazon-dash/index.html

Docker Run:
'''
docker run -d name="amazon-dash" --restart unless-stopped -v <your directory structure>:/config --net=host --privileged strangedesign13/amazon-dash
'''

Docker Compose:

amazon-dash:
    image: strangedesign13/amazon-dash
    container_name: "amazon-dash"
    restart: always
    privileged: true
    volumes:
      - <your directory structure>:/root/amazon-dash
    network_mode: "host"


More Info Coming Soon...
