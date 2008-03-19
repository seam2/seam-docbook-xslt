<?xml version='1.0'?>

<!--
        Copyright 2007 JBoss, a division of Red Hat
        License: LGPL 
        Author: Pete Muir <pete.muir@jboss.org>
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0"
                exclude-result-prefixes="#default">

	<xsl:template match="currentversion">
      <xsl:value-of select="system-property('fooversion')" />
    </xsl:template>
		
		
                
</xsl:stylesheet>
