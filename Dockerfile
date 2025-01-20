# 基础镜像
FROM eclipse-temurin:8-jre-alpine

# 维护者信息
LABEL maintainer="jason.wang@aiyax.com"

RUN apk add --no-cache fontconfig ttf-dejavu

# 设置工作目录
WORKDIR /app

COPY ruoyi-admin/target/ruoyi-admin.jar /app

EXPOSE 80

CMD ["java", "-jar", "ruoyi-admin.jar", "--spring.profiles.active=prod"]