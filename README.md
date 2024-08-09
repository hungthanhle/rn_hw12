Commands:  
```
./docker_container/container.sh mysql up
./chrome_postman/chrome_postman.sh
```
  
Change file:  
```
sed -i 's|image: \$IMAGE_TAG|image: my-app:latest|' deployment.yaml

awk -v new_tag="my-app:latest" '{gsub(/image: \$IMAGE_TAG/, "image: " new_tag)}1' deployment.yaml > temp.yaml && mv temp.yaml deployment.yaml
```
  
Config:  
```
cd docker_container/
chmod +x container.sh

cd chrome_postman/
chmod +x chrome_postman.sh
```
