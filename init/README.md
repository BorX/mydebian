```bash
git clone https://github.com/BorX/mydebian.git
cd mydebian/init
ansible-playbook -K init-localhost.yml \
-e install_pkg_devops=false            \
-e install_pkg_dev=false               \
-e install_pkg_dev_android=false       \
-e install_pkg_desktop=false           \
-e install_pkg_games=false             \
-e install_pkg_system=false
```
