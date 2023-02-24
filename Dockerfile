FROM public.ecr.aws/lambda/java:11

# Copy function code and runtime dependencies from Maven layout
#RUN chmod -R 755

RUN yum clean all && yum -y update && yum -y install bzip2 \cups-libs \ dbus-glib \gtk3-devel \libXinerama.x86_64 \lsb \
wget \xorg-x11-server-Xvfb \yum-utils \    git \    maven
RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN yum  install ./google-chrome-stable_current_amd64.deb -y --version


COPY target/classes ${LAMBDA_TASK_ROOT}
COPY target/ShadedJar.jar ${LAMBDA_TASK_ROOT}/lib/
COPY target/dependency/* ${LAMBDA_TASK_ROOT}/lib/

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "org.example.LambdaHandler::handleRequest"]
#CMD [ "com.example.LambdaHandler::handleRequest" ]
#CMD [ "com.gemini.generic.utils.GemJarLambda::handleRequest"