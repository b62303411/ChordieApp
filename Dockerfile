FROM nginx:alpine

# Download and extract ChordieApp
RUN apk add --no-cache curl unzip && \
    curl -L https://github.com/boggydigital/chordieapp/releases/latest/download/chordieapp.zip -o chordieapp.zip && \
    unzip chordieapp.zip -d /usr/share/nginx/html && \
    rm chordieapp.zip && \
    apk del curl unzip

# Remove default nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Add minimal Nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf
