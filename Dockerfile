#Multi step docker file 
#Build phase, temp container 

FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . . 
RUN npm run build 

#Run Phase, copying the bare minimum what is needed to run

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
