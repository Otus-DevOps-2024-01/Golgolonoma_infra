1) Для подключения по хостнейму (алиасу) необходимо настроить ~/.ssh/config на своей локальной машине, пример настройки ниже
```
Host someinternalhost
    HostName 10.128.0.30
    User paradise
    IdentityFile ~/.ssh/paradise
    ProxyJump paradise@178.154.203.84

Host bastion
	Hostname 178.154.203.84
	User paradise
	IdentityFile ~/.ssh/paradise
```
Далее просто вводим команды для подключения на своей локальной машине:
```angular2html
ssh someinternalhost

ssh bastion
```

bastion_IP = 158.160.97.167
someinternalhost_IP = 10.128.0.8
