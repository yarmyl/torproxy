# torproxy

## Install
```
git clone https://github.com/yarmyl/torproxy.git
cd torproxy
sudo ./install.sh
```
that's **enough**

## BUILD

docker build -t tor .

## RUN

docker run --name tor --net host -d tor

## iptables add rules

./iptables_rules.sh

## crond
<code>
echo "0  */1  *  *  *  root ipset flush black_list && /[git dir]/fill_ipset.sh"
</code>
