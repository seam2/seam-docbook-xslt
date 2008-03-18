<?xml version='1.0'?>
 
<!--
	Copyright 2007 Red Hat, Inc.
	License: GPL
	Author: Pete Muir
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version='1.0'
		xmlns="http://www.w3.org/TR/xhtml1/transitional"
		xmlns:fo="http://www.w3.org/1999/XSL/Format"
		exclude-result-prefixes="#default">

   <xsl:import href="main-html.xsl"/>
    
    <!-- Placement of titles -->
    <xsl:param name="formal.title.placement">
        figure after
        example before
        equation before
        table before
        procedure before
    </xsl:param>
    <xsl:param name="use.extensions">1</xsl:param>
    <!-- Callouts -->
    
    <xsl:param name="callout.extensions">1</xsl:param>
    <!-- Don't use graphics, use a simple number style -->
    <xsl:param name="callout.graphics">0</xsl:param>

    <!-- Place callout marks at this column in annotated areas -->
    

</xsl:stylesheet>
