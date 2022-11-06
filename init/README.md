```bash
git clone https://github.com/BorX/mydebian.git
cd mydebian/init
ansible-playbook -K init-localhost.yml \
-e install_pkg_devops=no               \
-e install_pkg_dev=no                  \
-e install_pkg_dev_android=no          \
-e install_pkg_desktop=no              \
-e install_pkg_games=no                \
-e install_pkg_system=no
```
