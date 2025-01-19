# 基础镜像
FROM openjdk:8-jre-slim

# 维护者信息
LABEL maintainer="jason.wang@aiyax.com"

# 设置工作目录
WORKDIR /app

COPY ruoyi-admin/target/ruoyi-admin.jar /app

EXPOSE 80

CMD ["java", "-jar", "ruoyi-admin.jar"]