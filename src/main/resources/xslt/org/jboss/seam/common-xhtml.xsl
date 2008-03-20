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

   <!-- Simple list of authors -->
   <xsl:template match="author" mode="titlepage.mode">
      <div class="{name(.)}">
         <xsl:call-template name="person.name" />
         <xsl:apply-templates mode="titlepage.mode" select="./contrib" />
         <xsl:apply-templates mode="titlepage.mode" select="./affiliation" />
         <xsl:apply-templates mode="titlepage.mode" select="./email" />
      </div>
   </xsl:template>

   <!-- Simple affiliation (put it in brackets) -->
   <xsl:template match="affiliation" mode="titlepage.mode">
      (
      <xsl:apply-templates mode="titlepage.mode" />
      )
   </xsl:template>

   <!-- And put don't put <br /> everywhere -->
   <xsl:template match="orgname" mode="titlepage.mode">
      <span class="{name(.)}">
         <xsl:apply-templates mode="titlepage.mode" />
      </span>
   </xsl:template>

   <xsl:template match="jobtitle" mode="titlepage.mode">
      <span class="{name(.)}">
         <xsl:apply-templates mode="titlepage.mode" />
      </span>
   </xsl:template>

</xsl:stylesheet>
