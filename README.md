# torproxy

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
