# Use the Odoo image as a base
FROM odoo:latest

# Copy over the addons and config files
COPY ./addons-extra /mnt/extra-addons
COPY ./config /etc/odoo
COPY ./config/odoo.conf /etc/odoo-server.conf

USER root
RUN rm /usr/lib/python3/dist-packages/odoo/addons/web/static/img/favicon.ico
COPY ./favicon/favicon.ico /usr/lib/python3/dist-packages/odoo/addons/web/static/img
RUN sed -i 's/71639e/CA3446/g' /usr/lib/python3/dist-packages/odoo/addons/web/static/src/scss/primary_variables.scss
RUN sed -i 's/714B67/CA3446/g' /usr/lib/python3/dist-packages/odoo/addons/web/static/src/scss/primary_variables.scss
RUN sed -i 's/zopenerp: "Odoo"/zopenerp: "Fakebrands"/g' /usr/lib/python3/dist-packages/odoo/addons/web/static/src/webclient/webclient.js
