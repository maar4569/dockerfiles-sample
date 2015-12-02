export TAGNAME=ml
docker build -t $TAGNAME:1.0 .
docker run -h mlsvr -i -t $TAGNAME:1.0
