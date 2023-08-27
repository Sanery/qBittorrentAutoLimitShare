# Specifies a parent image
FROM golang:1.21.0
 
# Creates an app directory to hold your app’s source code
ENV WORKDIR /app
WORKDIR /app
 
# Copies everything from your root directory into /app
COPY . .
COPY ./conf/demo.app.yaml $WORKDIR/conf/app.yaml
 
# Installs Go dependencies
RUN go mod download
 
# Builds your app with optional configuration
RUN go build -o $WORKDIR/qBittorrentAutoLimitShare
RUN chmod +x $WORKDIR/qBittorrentAutoLimitShare
 
# Tells Docker which network port your container listens on
# EXPOSE 8080
 
# Specifies the executable command that runs when the container starts
CMD [ "./qBittorrentAutoLimitShare" ]