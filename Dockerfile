FROM adoptopenjdk/openjdk8

MAINTAINER Konstantin Aksenov

LABEL "com.github.actions.name"="Danger Kotlin"
LABEL "com.github.actions.description"="Runs Kotlin Dangerfiles"
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="blue"

ARG KOTLINC_VERSION="1.7.0"
ARG DANGER_KOTLIN_VERSION="1.3.0"

# Install dependencies
RUN apt-get update
RUN apt-get install -y npm nodejs wget unzip git

# Install Kotlin compiler
RUN wget -q "https://github.com/JetBrains/kotlin/releases/download/v$KOTLINC_VERSION/kotlin-compiler-$KOTLINC_VERSION.zip" && \
    unzip "kotlin-compiler-$KOTLINC_VERSION.zip" -d /usr/lib && \
    rm "kotlin-compiler-$KOTLINC_VERSION.zip"
ENV PATH $PATH:/usr/lib/kotlinc/bin

# Install Danger-JS
RUN npm install -g danger

# Install Danger-Kotlin
RUN wget -q "https://github.com/vacxe/kotlin/releases/download/$DANGER_KOTLIN_VERSION/danger-kotlin-linuxX64.tar" && \
    tar -xvf "danger-kotlin-linuxX64.tar" -C /usr/local &&  \
    rm "danger-kotlin-linuxX64.tar"
