cd ~
export REACT_APP_SERVER_URL=http://100.24.201.251:3001/api
sudo apt-get update
sudo apt install npm
git clone https://github.com/sdileepkumarreddy/uber-bus.git
sudo apt-get install nginx -y
sudo npm install pm2 -g
npm install --save-dev dotenv
cd uber-bus/frontend/
npm install
npm run build
cd ~
sudo rm /etc/nginx/sites-enabled/default
cd uber-bus/
sudo cp uberbus.nginx /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/uberbus.nginx /etc/nginx/sites-enabled/uberbus.nginx
sudo systemctl reload nginx
cd backend/
npm install
pm2 start app_server.js