# 使用 Node.js 映像作為基礎
FROM node:14

# 設定工作目錄
WORKDIR /app

# 複製 package.json 和 package-lock.json 並安裝相依套件
COPY package*.json ./
RUN npm install

# 複製整個專案到容器內
COPY . .

# 建立 React 應用
RUN npm run build

# 使用 Nginx 映像作為基礎
FROM nginx:alpine

# 將 React 應用的 build 資料夾複製到 Nginx 的預設網站目錄
COPY --from=0 /app/build /usr/share/nginx/html

# 暴露 Nginx 的預設網站端口
EXPOSE 80

# 預設的執行指令
CMD ["nginx", "-g", "daemon off;"]