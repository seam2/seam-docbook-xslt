<?xml version='1.0'?>

<!--
   Copyright 2007 Red Hat, Inc.
   License: LGPL
   Author: Pete Muir
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'
   xmlns="http://www.w3.org/TR/xhtml1/transitional"
   xmlns:fo="http://www.w3.org/1999/XSL/Format"
   exclude-result-prefixes="#default">

   <!-- Needs MPJDOCBOOK-8 -->
   <!-- <xsl:import href="classpath:/xslt/org/jboss/main-pdf.xsl"/>-->
   <xsl:import href="../main-pdf.xsl" />

   <xsl:param name="use.extensions">1</xsl:param>

   <!-- Place callout marks at this column in annotated areas -->

   <!--###################################################
      Callouts
      ################################################### -->

   <!-- We want to use callouts... -->
   <xsl:param name="callout.extensions">1</xsl:param>

   <!-- Place callout bullets at this column in programmlisting.-->
   <xsl:param name="callout.defaultcolumn">80</xsl:param>

   <!--
      No, don't use crappy graphics for the callout bullets. This setting
      enables some weird Unicode rendering for some fancy bullet points
      in callouts. By default, this can only count to 10 and produces
      strange results if you ever have more than 10 callouts for one
      programlisting. We will fix that next.
   -->
   <xsl:param name="callout.graphics">0</xsl:param>

   <!--
      Again, fun with DocBook XSL: The callout bullets are rendered in
      two places: In the programlisting itself and in the list below
      the listing, with the actual callout text. The rendering in the
      programlisting is some XSL transformer extension (e.g. a Saxon
      extension), so we can't change that without messing with the
      extensions. We only can turn it off by setting this limit to
      zero, then, a simple bracket style like "(3)" and "(4)" will
      be used in the programlisting.
   -->
   <xsl:param name="callout.unicode.number.limit" select="'0'"></xsl:param>

   <!--
      The callout bullets in the actual callout list will be rendered
      with an XSL FO template. The default template is broken: limited to 10
      nice looking Unicode bullet points and then it doesn't print anything,
      the fallback doesn't work. We implement our own template, which is not
      as complicated, more ugly, but works. As always, function is more
      important than form.
   -->
   <xsl:template name="callout-bug">
      <xsl:param name="conum" select='1' />
      <fo:inline color="black" padding-top="0.1em" padding-bottom="0.1em"
         padding-start="0.2em" padding-end="0.2em" baseline-shift="0.1em"
         font-family="{$monospace.font.family}" font-weight="bold"
         font-size="75%">
         <xsl:text>(</xsl:text>
         <xsl:value-of select="$conum" />
         <xsl:text>)</xsl:text>
      </fo:inline>

   </xsl:template>

   <!-- Correct placement of titles for figures and examples. -->
   <xsl:param name="formal.title.placement">
      figure after example before equation before table before procedure before
   </xsl:param>

   <!-- Prevent blank pages in output -->
   <xsl:template name="book.titlepage.before.verso"></xsl:template>
   <xsl:template name="book.titlepage.verso"></xsl:template>
   <xsl:template name="book.titlepage.separator"></xsl:template>

   <xsl:template name="book.titlepage.recto">
      <xsl:choose>
         <xsl:when test="bookinfo/title">
            <xsl:apply-templates mode="book.titlepage.recto.auto.mode"
               select="bookinfo/title" />
         </xsl:when>
         <xsl:when test="info/title">
            <xsl:apply-templates mode="book.titlepage.recto.auto.mode"
               select="info/title" />
         </xsl:when>
         <xsl:when test="title">
            <xsl:apply-templates mode="book.titlepage.recto.auto.mode"
               select="title" />
         </xsl:when>
      </xsl:choose>

      <xsl:apply-templates mode="book.titlepage.recto.auto.mode"
         select="bookinfo/issuenum" />
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode"
         select="info/issuenum" />
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode"
         select="issuenum" />



      <xsl:choose>
         <xsl:when test="bookinfo/subtitle">
            <xsl:apply-templates mode="book.titlepage.recto.auto.mode"
               select="bookinfo/subtitle" />
         </xsl:when>
         <xsl:when test="info/subtitle">
            <xsl:apply-templates mode="book.titlepage.recto.auto.mode"
               select="info/subtitle" />
         </xsl:when>
         <xsl:when test="subtitle">
            <xsl:apply-templates mode="book.titlepage.recto.auto.mode"
               select="subtitle" />
         </xsl:when>
      </xsl:choose>

      <fo:block xsl:use-attribute-sets="book.titlepage.recto.style"
         font-size="14pt" space-before="15.552pt">
         <xsl:apply-templates mode="book.titlepage.recto.auto.mode"
            select="bookinfo/releaseinfo" />
      </fo:block>

   </xsl:template>

   <xsl:template name="book.titlepage3.recto">

      <xsl:apply-templates mode="book.titlepage.verso.auto.mode"
         select="bookinfo/authorgroup" />
      <xsl:apply-templates mode="book.titlepage.verso.auto.mode"
         select="info/authorgroup" />
      <xsl:apply-templates mode="book.titlepage.verso.auto.mode"
         select="bookinfo/author" />
      <xsl:apply-templates mode="book.titlepage.verso.auto.mode"
         select="info/author" />
      <xsl:apply-templates mode="book.titlepage.verso.auto.mode"
         select="bookinfo/othercredit" />
      <xsl:apply-templates mode="book.titlepage.verso.auto.mode"
         select="info/othercredit" />
      <xsl:apply-templates mode="book.titlepage.verso.auto.mode"
         select="bookinfo/copyright" />
      <xsl:apply-templates mode="book.titlepage.verso.auto.mode"
         select="info/copyright" />
      <xsl:apply-templates mode="book.titlepage.verso.auto.mode"
         select="bookinfo/legalnotice" />
      <xsl:apply-templates mode="book.titlepage.verso.auto.mode"
         select="info/legalnotice" />
      <xsl:apply-templates mode="book.titlepage.verso.auto.mode"
         select="bookinfo/publisher" />
      <xsl:apply-templates mode="book.titlepage.verso.auto.mode"
         select="info/publisher" />
   </xsl:template>

   <xsl:param name="title.color">#576C74</xsl:param>

   <xsl:param name="programlisting.font" select="$monospace.font.family" />
   <xsl:param name="programlisting.font.size" select="'75%'" />
   <xsl:param name="graphicsize.extension" select="'1'" />

   <xsl:param name="default.image.width">17.4cm</xsl:param>

   <!-- Style tables -->

   <xsl:param name="table.cell.border.color">#D3D2D1</xsl:param>
   <xsl:param name="table.frame.border.color">#D3D2D1</xsl:param>
   <xsl:param name="table.cell.border.thickness">0.6pt</xsl:param>
   
<xsl:param name="table.frame.border.thickness">0.6pt</xsl:param>
<xsl:param name="table.cell.border.right.color">white</xsl:param>
<xsl:param name="table.cell.border.left.color">#D3D2D1</xsl:param>
<xsl:param name="table.frame.border.right.color">white</xsl:param>
<xsl:param name="table.frame.border.left.color">white</xsl:param>

   <xsl:template name="table.cell.block.properties">
      <!-- highlight this entry? -->
      <xsl:if test="ancestor::thead or ancestor::tfoot">
         <xsl:attribute name="font-weight">bold</xsl:attribute>
         <xsl:attribute name="background-color">#EDE8DB</xsl:attribute>
         <xsl:attribute name="color">black</xsl:attribute>
      </xsl:if>
   </xsl:template>

   <!--
      From: fo/table.xsl
      Reason: Table Header format
      Version:1.72
   -->
   <!-- customize this template to add row properties -->
   <xsl:template name="table.row.properties">
      <xsl:variable name="bgcolor">
         <xsl:call-template name="dbfo-attribute">
            <xsl:with-param name="pis" select="processing-instruction('dbfo')" />
            <xsl:with-param name="attribute" select="'bgcolor'" />
         </xsl:call-template>
      </xsl:variable>
      <xsl:if test="$bgcolor != ''">
         <xsl:attribute name="background-color">
      <xsl:value-of select="$bgcolor" />
    </xsl:attribute>
      </xsl:if>
      <xsl:if test="ancestor::thead or ancestor::tfoot">
         <xsl:attribute name="background-color">#EDE8DB</xsl:attribute>
      </xsl:if>
   </xsl:template>

</xsl:stylesheet>
