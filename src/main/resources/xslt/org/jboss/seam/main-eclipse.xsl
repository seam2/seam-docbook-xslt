<?xml version='1.0'?>

<!--
  Copyright 2007 Red Hat, Inc.
  License: GPL
  Author: Mark Newton <mark.newton@jboss.org>
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exsl="http://exslt.org/common"
                version="1.0"
                exclude-result-prefixes="exsl">

  <xsl:import href="classpath:/xslt/org/jboss/main-eclipse.xsl" />

  <xsl:param name="use.simplified.author.group" select="1"/>
  <xsl:param name="html.stylesheet" select="'css/seamframework-eclipse.css'" />
  <xsl:param name="callout.graphics.path">images/seamframework/docbook/callouts/</xsl:param>
  <xsl:param name="callout.icon.size">17px</xsl:param>

</xsl:stylesheet>
