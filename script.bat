echo "Criando as imagens........"

docker build -t joaoavelin/projeto-backend:1.0 backend/.
docker build -t joaoavelin/projeto-database:1.0 database/.

echo "Realizando o push das imagens.... "

docker push joaoavelin/projeto-backend:1.0
docker push joaoavelin/projeto-database:1.0

echo "Criando Servicos no cluster Kubernetes..."

kubectl apply -f ./services.yml 

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml 

