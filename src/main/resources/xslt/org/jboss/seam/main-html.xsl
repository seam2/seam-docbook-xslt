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
   
   <xsl:param name="jbossOrgHref" select="'http://www.seamframework.org'" />
   <xsl:param name="commDocHref" select="'http://www.seamframework.org/Documentation'" />

</xsl:stylesheet>
