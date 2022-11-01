### Домашнее задание №14 (PAM)
#### 1. Настроил виртуальну машину с Centos 7. Hostname: server. Создал пару rsa ключей, виртуальная машина доступна по public ключу. Vagrantfile прилагается.
```console
[kita@devops OTUS]$ ssh vagrant@192.168.2.71
Last login: Mon Oct 31 17:31:57 2022 from 192.168.2.130
[vagrant@server ~]$ sudo useradd day
```
#### 2. Создал 3 новых пользователей: day, night, friday.
```console
[vagrant@server ~]$ sudo useradd day
[vagrant@server ~]$ sudo useradd night
[vagrant@server ~]$ sudo useradd friday
```
#### 3. Добавил пароли для 3 новых пользователей:
```console
[vagrant@server ~]$ echo "Otus2019"|sudo passwd --stdin day &&\
> echo "Otus2019" | sudo passwd --stdin night &&\
> echo "Otus2019" | sudo passwd --stdin friday
Changing password for user day.
passwd: all authentication tokens updated successfully.
Changing password for user night.
passwd: all authentication tokens updated successfully.
Changing password for user friday.
passwd: all authentication tokens updated successfully.
```
#### 4. Проверил возможность регистрации под пользователем day:
```console
[vagrant@server ~]$ su day
Password:
[day@server vagrant]$
```
#### 5. Добавил изменения в конфигурационный файл /etc/security/time.conf
#### 6. Настроил PAM, добавив следующе строчки в кофигурационный файл /etc/pam.d/sshd:
```console
account required pam_nologin.so
account required pam_time.so
```
#### 7. Проверил доступность виртуальной машины по протоколу ssh для пользователя day:
```console
[kita@devops ~]$ ssh day@192.168.2.71
day@192.168.2.71's password:
Last login: Tue Nov  1 09:04:30 2022
[day@server ~]$
```
#### 8. 