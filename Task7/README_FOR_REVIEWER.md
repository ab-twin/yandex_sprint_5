
## Инструкция по запуску

1. Запустить
```sh
minikube start --extra-config=apiserver.enable-admission-plugins="PodSecurity"
```

2. Создать namespace:
```bash
kubectl apply -f 01-create-namespace.yaml
```

3. Установить Gatekeeper:

``` bash
kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/release-3.7/deploy/gatekeeper.yaml
```

4. Применить политики:

```bash
kubectl apply -f gatekeeper/constraint-templates/
kubectl apply -f gatekeeper/constraints/
```

5. Проверить блокировку небезопасных конфигураций:

```bash
./verify/verify-admission.sh
```

6. Проверить создание безопасных подов:

```bash
./verify/validate-security.sh
```