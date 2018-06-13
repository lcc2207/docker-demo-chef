# docker-demo

This is a demo cookbook that will deploy Docker application and pull down a given Docker images.

To use this cookbook you will need to add the following to the run list of your node.
recipe[docker-demo::default]

# Attributes used in this cookbook:
<table>
  <tr>
    <th>Attribute</th>
    <th>Default Value</th> 
  </tr>
  <tr>
    <td>['docker-demo']['version']</td>
    <td>18.03.1-ce</td> 
  </tr>
  <tr>
    <td>['docker-demo']['logfile']</td>
    <td>/var/log/dockerservice.log</td> 
  </tr>
  <tr>
    <td>['docker-demo']['imgname']</td>
    <td>httpd</td> 
  </tr>
  <tr>
    <td>['docker-demo']['containername']</td>
    <td>demo1</td> 
  </tr>
  <tr>
    <td>['docker-demo']['ports']</td>
    <td>80:80</td> 
  </tr>
  <tr>
    <td>['docker-demo']['regversion']</td>
    <td>latest</td> 
  </tr>
  <tr>
    <td>['docker-demo']['binds']</td>
    <td>[]</td> 
  </tr>
  <tr>
    <td>['docker-demo']['env']</td>
    <td>''</td> 
  </tr>
</table>

# Example Attributes to deploy Jenkins
```json
  {
	"docker-demo": {
		"containername": "jenkins",
		"imgname": "jenkins",
		"ports": "80:8080",
                "env":  "JAVA_OPTS=-Dhudson.Main.development=true -Djenkins.install.runSetupWizard=false"
	}
}
  ```
  

