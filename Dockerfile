# Environemnt to install flutter and build web
FROM debian:latest AS build-env

# Install all needed stuff
RUN apt-get update
RUN apt-get install -y curl git unzip

# Define variables
ARG FLUTTER_SDK=/usr/local/flutter
ARG APP=/app/

# Clone Flutter
RUN git clone https://github.com/flutter/flutter.git $FLUTTER_SDK
# Change directory to the current Flutter folder and make a checkout to the specific version
RUN cd $FLUTTER_SDK && git checkout efbf63d9c66b9f6ec30e9ad4611189aa80003d31

# Setup the Flutter path as an environmental variable
ENV PATH="$FLUTTER_SDK/bin:$FLUTTER_SDK/bin/cache/dart-sdk/bin:${PATH}"

# Start to run Flutter commands
# Doctor to see if all was installed OK
RUN flutter doctor -v

# Create a folder to copy source code
RUN mkdir $APP
# Copy source code to the folder
COPY . $APP
# Setup a new folder as the working directory
WORKDIR $APP

# Installez une version compatible du Dart SDK
# RUN flutter --version
# RUN flutter --no-version-check upgrade


# Run build: 1 - clean, 2 - pub get, 3 - build web
RUN flutter clean
RUN flutter pub get  # Change this line to run as a non-root user
RUN flutter build web

# Once here, the app will be compiled and ready to deploy

# Use Nginx to deploy
FROM nginx:1.25.2-alpine

# Copy the info of the built web app to Nginx
COPY --from=build-env /app/build/web /usr/share/nginx/html

# Expose and run Nginx
EXPOSE 80

# Specify a non-root user to run the following command
USER $NON_ROOT_USER

# Command to run your application (e.g., your server or web app)
CMD ["nginx", "-g", "daemon off;"]

RUN echo "Exécutez l'image Docker avec la commande :"
RUN echo "docker run -d -p 1200:80 --name matching nb-matching-teams"
RUN echo "Une fois la commande ci-dessus lancée, veuillez cliquer sur le lien : http://localhost:1200/"
