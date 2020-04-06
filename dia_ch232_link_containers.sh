#!/bin/bash

MAILER_CID=$(docker run -d dockerinaction/ch2_mailer)
WEB_CID=$(docker create nginx:latest)

AGENT_CID=$(docker create --link $WEB_CID:insideweb --link $MAILER_CID:insidemailer dockerinaction/ch2_agent)

# won't work - wrong order
# docker start $AGENT_CID WEB_CID

docker start $WEB_CID $AGENT_CID
