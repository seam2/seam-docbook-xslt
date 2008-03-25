<?xml version='1.0'?>

<!--
   Copyright 2008 JBoss, a division of Red Hat
   License: LGPL
   Author: Pete Muir
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'
   xmlns="http://www.w3.org/TR/xhtml1/transitional"
   xmlns:fo="http://www.w3.org/1999/XSL/Format"
   exclude-result-prefixes="#default">

   <!-- Needs MPJDOCBOOK-8 -->
   <!-- <xsl:import href="classpath:/xslt/org/jboss/main-html.xsl"/>-->
   <xsl:import href="../main-html.xsl" />
   <xsl:import href="common-xhtml.xsl" />

   <xsl:param name="html.stylesheet" select="'css/seamframework.css'" />

   <!--
      Replace the navigation header with our banner and link
   -->
   <xsl:template name="header.navigation">
      <xsl:param name="prev" select="/foo" />
      <xsl:param name="next" select="/foo" />
      <xsl:param name="nav.context" />
      <xsl:variable name="home" select="/*[1]" />
      <xsl:variable name="up" select="parent::*" />
      <xsl:variable name="row1" select="$navig.showtitles != 0" />
      <xsl:variable name="row2"
         select="count($prev) &gt; 0 or (count($up) &gt; 0 and generate-id($up) != generate-id($home) and $navig.showtitles != 0) or count($next) &gt; 0" />
      <xsl:if
         test="$suppress.navigation = '0' and $suppress.header.navigation = '0'">
         <xsl:if test="$row1 or $row2">
            <xsl:if test="$row1">
               <p xmlns="http://www.w3.org/1999/xhtml">
                  <xsl:attribute name="id">
                  <xsl:text>title</xsl:text>
               </xsl:attribute>
                  <a>
                     <xsl:attribute name="href">
                     <xsl:text>http://www.seamframework.org</xsl:text>
                  </xsl:attribute>
                     <xsl:attribute name="class">
                     <xsl:text>seamFrameworkOrg_href</xsl:text>
                  </xsl:attribute>
                     <strong>SeamFramework.org</strong>
                  </a>
               </p>
            </xsl:if>
            <xsl:if test="$row2">
               <ul class="docnav" xmlns="http://www.w3.org/1999/xhtml">
                  <li class="previous">
                     <xsl:if test="count($prev)&gt;0">
                        <a accesskey="p">
                           <xsl:attribute name="href">
                           <xsl:call-template name="href.target">
                              <xsl:with-param name="object" select="$prev" />
                           </xsl:call-template>
                        </xsl:attribute>
                           <strong>
                              <xsl:call-template name="navig.content">
                                 <xsl:with-param name="direction"
                                    select="'prev'" />
                              </xsl:call-template>
                           </strong>
                        </a>
                     </xsl:if>
                  </li>
                  <li class="next">
                     <xsl:if test="count($next)&gt;0">
                        <a accesskey="n">
                           <xsl:attribute name="href">
                           <xsl:call-template name="href.target">
                              <xsl:with-param name="object" select="$next" />
                           </xsl:call-template>
                        </xsl:attribute>
                           <strong>
                              <xsl:call-template name="navig.content">
                                 <xsl:with-param name="direction"
                                    select="'next'" />
                              </xsl:call-template>
                           </strong>
                        </a>
                     </xsl:if>
                  </li>
               </ul>
            </xsl:if>
         </xsl:if>
         <xsl:if test="$header.rule != 0">
            <hr />
         </xsl:if>
      </xsl:if>
   </xsl:template>



</xsl:stylesheet>
