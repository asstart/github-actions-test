FROM eclipse-temurin:17-jdk-alpine as builder
ADD . /src
WORKDIR /src
RUN ./mvnw --batch-mode package -DskipTests

FROM alpine:3.15.0 as packager
RUN apk --no-cache add openjdk17-jdk openjdk17-jmods
ENV CUSTOM_JRE="/opt/java-minimal"
RUN /usr/lib/jvm/java-17-openjdk/bin/jlink \
    --verbose \
    --module-path "$CUSTOM_JRE/bin/jmods" \
    --add-modules \
        java.base,java.management,java.naming,java.xml,java.desktop,java.instrument,java.logging,java.security.jgss \
    --compress 2 --strip-java-debug-attributes --no-header-files --no-man-pages \
    --output "$CUSTOM_JRE"

FROM alpine:3.15.0
LABEL maintainer="Artem Astashov asst.artem@gmail.com"
LABEL org.opencontainers.image.source="https://github.com/asstart/github-actions-test"
ENV PATH="$PATH:$JAVA_HOME/bin"
ENV APP_USER=app
ENV APP_UID=1001
RUN \
    mkdir -p /home/${APP_USER} && \
    adduser -D ${APP_USER} && chown -R ${APP_USER}:${APP_USER} /home/${APP_USER}
COPY --from=packager "$JAVA_HOME" "$JAVA_HOME"
COPY --from=builder /src/target/github-actions-test-*.jar /home/${APP_USER}/app.jar
RUN \
    chmod 755 ${JAVA_HOME} && \
    chmod 755 /home/${APP_USER}/app.jar
USER ${APP_USER}
ENTRYPOINT ["java","-jar","/home/app/app.jar"]