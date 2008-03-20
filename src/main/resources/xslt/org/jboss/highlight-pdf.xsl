<?xml version='1.0'?>

<!--
        Copyright 2007 Red Hat, Inc.
        License: GPL
        Author: Mark Newton <mark.newton@jboss.org>
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version="1.0"
                xmlns:jbh="java:org.jboss.highlight.renderer.FORenderer" 
                exclude-result-prefixes="jbh">

  <xsl:template match="programlisting|programlisting[@role='XML']|programlisting[@role='JAVA']|programlisting[@role='XHTML']|programlisting[@role='JSP']|programlisting[@role='CSS']">
		
    <xsl:variable name="role">
      <xsl:value-of select="s:toUpperCase(string(@role))" xmlns:s="java:java.lang.String"/>
    </xsl:variable>

    <xsl:variable name="child.content">
      <xsl:apply-templates/>
    </xsl:variable>

    <fo:block background-color="#F5F5F5"
              border-style="solid"
              border-width=".3mm"
              border-color="#CCCCCC"
              font-family="{$programlisting.font}"
              font-size="{$programlisting.font.size}"
              space-before="12pt"
              space-after="12pt"
              linefeed-treatment="preserve"
              white-space-collapse="false"
              white-space-treatment="preserve"
              padding-bottom="12pt"
              padding-top="12pt"
              padding-right="12pt"
              padding-left="12pt">

    <xsl:variable name="hilighter" select="jbh:new()"/>
    <xsl:variable name="parsable" select="jbh:isParsable($role)"/>
    
    <xsl:choose>
      <xsl:when test="$parsable = 'true'">
        <xsl:variable name="caller" select="jbh:parseText($hilighter, $role, string($child.content), 'UTF-8')"/>
        <xsl:variable name="noOfTokens" select="jbh:getNoOfTokens($caller)"/>

        <xsl:call-template name="iterator">
          <xsl:with-param name="caller" select="$caller"/>
          <xsl:with-param name="noOfTokens" select="$noOfTokens"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$child.content"/>
      </xsl:otherwise>
    </xsl:choose>

    </fo:block>
  </xsl:template>


  <xsl:template name="iterator">
    <xsl:param name="caller"/>
    <xsl:param name="noOfTokens"/>
    <xsl:param name="i" select="0"/>

    <xsl:variable name="style" select="jbh:getStyle($caller, $i)"/>
    <xsl:variable name="token" select="jbh:getToken($caller, $i)"/>

    <xsl:choose>
      <xsl:when test="$style = 'java_keyword'"> <fo:inline color="#7F1B55" font-weight="bold"> <xsl:value-of select="$token"/> </fo:inline></xsl:when>
      <xsl:when test="$style = 'java_plain'"> <fo:inline color="#000000"> <xsl:value-of select="$token"/> </fo:inline></xsl:when>
      <xsl:when test="$style = 'java_type'"> <fo:inline color="#000000"> <xsl:value-of select="$token"/> </fo:inline></xsl:when>
      <xsl:when test="$style = 'java_separator'"> <fo:inline color="#000000"> <xsl:value-of select="$token"/> </fo:inline></xsl:when>
      <xsl:when test="$style = 'java_literal'"> <fo:inline color="#2A00FF"> <xsl:value-of select="$token"/> </fo:inline></xsl:when>
      <xsl:when test="$style = 'java_comment'"> <fo:inline color="#3F7F5F"> <xsl:value-of select="$token"/> </fo:inline></xsl:when>
      <xsl:when test="$style = 'java_javadoc_comment'"> <fo:inline color="#3F5FBF" font-style="italic"> <xsl:value-of select="$token"/> </fo:inline></xsl:when>
      <xsl:when test="$style = 'java_operator'"> <fo:inline color="#000000"> <xsl:value-of select="$token"/> </fo:inline></xsl:when>
      <xsl:when test="$style = 'java_javadoc_tag'"> <fo:inline color="#7F9FBF" font-weight="bold" font-style="italic"> <xsl:value-of select="$token"/> </fo:inline></xsl:when>
      <xsl:when test="$style = 'xml_plain'"> <fo:inline color="#000000"> <xsl:value-of select="$token"/> </fo:inline></xsl:when>
      <xsl:when test="$style = 'xml_char_data'"> <fo:inline color="#000000"> <xsl:value-of select="$token"/> </fo:inline></xsl:when>
      <xsl:when test="$style = 'xml_tag_symbols'"> <fo:inline color="#008080"> <xsl:value-of select="$token"/> </fo:inline></xsl:when>
      <xsl:when test="$style = 'xml_comment'"> <fo:inline color="#3F5FBF"> <xsl:value-of select="$token"/> </fo:inline></xsl:when>
      <xsl:when test="$style = 'xml_attribute_value'"> <fo:inline color="#2A00FF"> <xsl:value-of select="$token"/> </fo:inline></xsl:when>
      <xsl:when test="$style = 'xml_attribute_name'"> <fo:inline color="#7F007F" font-weight="bold"> <xsl:value-of select="$token"/> </fo:inline></xsl:when>
      <xsl:when test="$style = 'xml_processing_instruction'"> <fo:inline color="#000000" font-weight="bold" font-style="italic"> <xsl:value-of select="$token"/> </fo:inline></xsl:when>
      <xsl:when test="$style = 'xml_tag_name'"> <fo:inline color="#3F7F7F"> <xsl:value-of select="$token"/> </fo:inline></xsl:when>
      <xsl:when test="$style = 'xml_rife_tag'"> <fo:inline color="#000000"> <xsl:value-of select="$token"/> </fo:inline></xsl:when>
      <xsl:when test="$style = 'xml_rife_name'"> <fo:inline color="#008CCA"> <xsl:value-of select="$token"/> </fo:inline></xsl:when>
      <xsl:otherwise> <fo:inline color="black"> <xsl:value-of select="$token"/> </fo:inline></xsl:otherwise>
    </xsl:choose>

    <xsl:if test="$i &lt; $noOfTokens - 1">
      <xsl:call-template name="iterator">
        <xsl:with-param name="caller" select="$caller"/>
        <xsl:with-param name="noOfTokens" select="$noOfTokens"/>
        <xsl:with-param name="i" select="$i + 1"/>
      </xsl:call-template>  
    </xsl:if>
  </xsl:template>
                
</xsl:stylesheet>
