1. Files under archetype-resources are generated with 
	mvn archetype:create-from-project
	
2. Even if you create a demo project to Create/Generate an Archetype you can later copy these files and then run 
	mvn clean install //Run the command from target/generated-sources/archetype which is generated from step 1 with <packaging>maven-archetype</packaging>
	The above command will install the archetype in local maven directory and it will also create .m2/repository/archetype-catalog.xml
	later based on the groupId you can reverify the maven install at the particular location.

3. Final Stage will be to generate your projects using the locally installed archetype project
	mvn archetype:generate 
	-DarchetypeGroupId="com.mycompany"  // archetypeGroupId should match what is present in the archetype-catalog.xml
	-DarchetypeArtifactId="ams-sys-archetype-template-archetype"  // archetypeArtifactId should match what is present in the archetype-catalog.xml
	-DarchetypeVersion="1.0.0"  // archetypeVersion should match what is present in the archetype-catalog.xml