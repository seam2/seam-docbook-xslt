<?xml version='1.0'?>

<!--
   Copyright 2007 Red Hat, Inc.
   License: GPL
   Author: Pete Muir
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'
   xmlns="http://www.w3.org/TR/xhtml1/transitional"
   xmlns:fo="http://www.w3.org/1999/XSL/Format"
   exclude-result-prefixes="#default">

   <xsl:template name="person.name.list">
      <xsl:param name="person.list"
         select="author|corpauthor|othercredit|editor" />
      <xsl:param name="person.count" select="count($person.list)" />
      <xsl:param name="count" select="1" />

      <xsl:choose>
         <xsl:when test="$count &gt; $person.count"></xsl:when>
         <xsl:otherwise>
            <xsl:call-template name="person.name">
               <xsl:with-param name="node"
                  select="$person.list[position()=$count]" />
            </xsl:call-template>

            <xsl:choose>
               <xsl:when
                  test="$person.list[position()=$count]/affiliation/shortaffil">
                  <xsl:call-template name="gentext.space" />
                  <xsl:text>(</xsl:text>
                  <xsl:value-of
                     select="$person.list[position()=$count]/affiliation/shortaffil" />
                  <xsl:text>)</xsl:text>
               </xsl:when>
            </xsl:choose>


            <xsl:choose>
               <xsl:when test="$person.count = 2 and $count = 1">
                  <xsl:call-template name="gentext.template">
                     <xsl:with-param name="context" select="'authorgroup'" />
                     <xsl:with-param name="name" select="'sep2'" />
                  </xsl:call-template>
               </xsl:when>
               <xsl:when
                  test="$person.count &gt; 2 and $count+1 = $person.count">
                  <xsl:call-template name="gentext.template">
                     <xsl:with-param name="context" select="'authorgroup'" />
                     <xsl:with-param name="name" select="'seplast'" />
                  </xsl:call-template>
               </xsl:when>
               <xsl:when test="$count &lt; $person.count">
                  <xsl:call-template name="gentext.template">
                     <xsl:with-param name="context" select="'authorgroup'" />
                     <xsl:with-param name="name" select="'sep'" />
                  </xsl:call-template>
               </xsl:when>
            </xsl:choose>

            <xsl:call-template name="person.name.list">
               <xsl:with-param name="person.list" select="$person.list" />
               <xsl:with-param name="person.count" select="$person.count" />
               <xsl:with-param name="count" select="$count+1" />
            </xsl:call-template>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>


   <xsl:template name="gentext.editors">
      <xsl:text>edited by</xsl:text>
   </xsl:template>

   <xsl:template name="gentext.others">
      <xsl:text>and thanks to</xsl:text>
   </xsl:template>


</xsl:stylesheet>