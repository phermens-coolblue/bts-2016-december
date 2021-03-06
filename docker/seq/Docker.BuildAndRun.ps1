# BUILD THE IMAGE YOURSELF USING THE DOCKERFILE: 
docker build . -t pheonix25/servercore-seq:latest
# OR YOU CAN USE MY IMAGE ON DOCKERHUB:
# docker pull pheonix25/servercore-seq

# Run an instance of the image in the background, opening port 5341 as well
$hostport = 5341
$container = docker run -d -t -p 5341:$hostport pheonix25/servercore-seq
Write-Host "Docker container started:" $container

# Find the IP of the running container
$ip = docker inspect --format="{{.NetworkSettings.Networks.nat.IPAddress}}" $container
Write-Host "Docker container IP:" $ip

# Launch the browser so that we can check our work
$seq_url = 'http://'+ $ip + ':' + $hostport + '/'
Start-Process $seq_url
Write-Host "Browser launched, pointing at" $seq_url

# Attach to the running container (for debug purposes)
#docker attach $container