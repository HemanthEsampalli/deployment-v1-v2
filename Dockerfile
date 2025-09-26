FROM nginx:latest
COPY templatemo_598_sleeky_pro /usr/share/nginx/html
EXPOSE 80

FROM nginx:latest
COPY templatemo_596_electric_xtra /usr/share/nginx/html
EXPOSE 80