node{
    stage ('Git Checkout'){
  git'https://github.com/tejasrik/cicd-k8s-demo.git'
  
    }
     stage('Compile-Package'){
      // Get maven home path
     //def mvnHome =  tool name: 'maven3.6.3', type: 'maven' 
     //batlabel "${mvnHome}/bin/mvn package"
  // bat "${mvnHome}/bin/mvn clean package"
 // bat label: '', script: "${mvnHome}/bin/mvn clean package"
         def mavenHome = tool name:"Maven-3.6.3",type: "maven"
         
         def mavenCMD= "${mavenHome}/bin/mvn"
         sh "${mavenCMD} clean package"
    }
    
   
    stage('publish docker'){
       sh  'docker build -t tejasrik/jenkinspipeline .'
       sh 'docker login -u tejasrik -p Tejasri@6523'
       sh'docker push tejasrik/jenkinspipeline'
       sh'docker run -d tejasrik/jenkinspipeline'
    }
    stage('deploy application in k8s cluster'){
        
    
        
    // kubernetesDeploy(
      //  configs: 'deployment.yml',
        // kubeconfigId: 'KUBERNETES_CLUSTER_CONFIG',
         //enableConfigSubstitution: true
         //)
        sh 'kubectl apply -f deployment.yml'
        
    }
           
    
        
   }
