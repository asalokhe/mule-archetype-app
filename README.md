# Mule-Archetype-App 
### (App Folder)
An archetype project which could be installed to package registry or local maven repository for creation of a mule template project.

## Generate Template
-	Create project template based on the current project: The below command will create a archetype template based on your current project in the location:
    **target\generated-sources\archetype\src\main\resources\archetype-resources**
	
```sh
    mvn archetype:create-from-project
```

**target/generated-sources/archetype** 
- The root structure is
    - pom.xml
    - src/
    - target/

**target\generated-sources\archetype\src\main\resources** has two folders:
- **archetype-resources** – This is the project template and what will be generated when the archetype is run
- **META-INF/maven** – This contains the archetype-metadata.xml file which has the settings and options when generating a new project

- [**Optional**] Copy the archetype-resources from : **Files2Copy2Target** to **target\generated-sources\archetype\src\main\resources**
	Files2Copy2Target Folder has files with custom mapping, additional comments and also archetype-metadata.xml file to include few additional files like .gitignore.
	

## Install Template Locally 
> Run the install command from **target/generated-sources/archetype**

The below command will install the archetype in the local maven directory and it will also create .m2/repository/archetype-catalog.xml later based on the groupId you can reverify the maven install at the particular location.
    
```sh    
    mvn clean install
```
    
>  Folder which is generated during the "Generate Template" command with this modification in pom.xml which resides in the location **<packaging>maven-archetype</packaging>**

## Install Template to Artifactory 
> Run the install command from **target/generated-sources/archetype**

To install the archetype to remote location update the distributionManagement > url before running the mvn clean install

```sh	
    <distributionManagement>
        <repository>
        	<id>ams.Java</id>
         	<url>https://pkgs.dev.azure.com/ams-com/Mulesoft/_packaging/ams.Java/maven/v1</url>
        </repository>
    </distributionManagement> 
```
Run the install command

```sh
	mvn clean install
```

## Create a new project based on the Archetype/Template Project: 
> Run this command from the location where you want to create your new project

Final Stage will be to generate your projects using the locally installed archetype project

```sh
    mvn archetype:generate 
    -DarchetypeGroupId="com.mycompany"  // archetypeGroupId should match what is present in the archetype-catalog.xml
    -DarchetypeArtifactId="mule-archetype-app-archetype"  // archetypeArtifactId should match what is present in the archetype-catalog.xml
    -DarchetypeVersion="1.0.0-SNAPSHOT"  // archetypeVersion should match what is present in the archetype-catalog.xml
```

> **-DarchetypeCatalog=local** Local tells maven to look to the local repo for all archetypes and present with a list to pick one.


## References:
- https://maven.apache.org/archetype/maven-archetype-plugin/integration-test-mojo.html