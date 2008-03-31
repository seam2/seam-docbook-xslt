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

   <!--  Enable extensions (needed for callouts) -->
   <xsl:param name="use.extensions">1</xsl:param>

   <!-- Enable callouts -->
   <xsl:param name="callout.extensions">1</xsl:param>

   <!-- And disable these extensions -->
   <xsl:param name="tablecolumns.extension">0</xsl:param>
   <xsl:param name="graphicsize.extension">0</xsl:param>

   <!-- Placement of titles (Seam specific) -->
   <xsl:param name="formal.title.placement">
      figure after example before equation before table before procedure before
   </xsl:param>


   <!-- Callouts -->

   <!-- Don't use graphics, use a simple number style -->
   <xsl:param name="callout.graphics">0</xsl:param>

   <!-- Place callout marks at this column in annotated areas -->
   <xsl:param name="callout.defaultcolumn">90</xsl:param>

      <xsl:template match="authorgroup" mode="titlepage.mode">
      <div class="authorgroup">
         <div class="authors">
            <xsl:call-template name="gentext.by" />
            <xsl:call-template name="gentext.space" />
            <xsl:call-template name="person.name.list">
               <xsl:with-param name="person.list" select="./author" />
            </xsl:call-template>
         </div>

         <div class="editors">
            <xsl:call-template name="gentext.editors" />
            <xsl:call-template name="gentext.space" />
            <xsl:call-template name="person.name.list">
               <xsl:with-param name="person.list" select="./editor" />
            </xsl:call-template>
         </div>

         <div class="others">
            <xsl:call-template name="gentext.others" />
            <xsl:call-template name="gentext.space" />
            <xsl:call-template name="person.name.list">
               <xsl:with-param name="person.list" select="./othercredit" />
            </xsl:call-template>
         </div>
      </div>
   </xsl:template>
   
</xsl:stylesheet>
