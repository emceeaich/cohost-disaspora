---
layout: null
permalink: ./opml.xslt
---
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />

  <xsl:template match="opml">
    <xsl:text disable-output-escaping="yes"><![CDATA[<!DOCTYPE html>]]></xsl:text>
    <html>
      <head>
        <meta charset="utf-8" />
        <xsl:apply-templates select="head/title" />
        <style type="text/css">
          html, body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
          }
        </style>
      </head>
      <xsl:apply-templates select="body" />
    </html>
  </xsl:template>

  <xsl:template match="title">
    <title><xsl:value-of select="." /></title>
  </xsl:template>

  <xsl:template match="body">
    <body>
      <xsl:apply-templates select="outline" />
    </body>
  </xsl:template>

  <xsl:template match="outline">
    <ul>
      <li><xsl:value-of select="@text" /></li>
      <xsl:apply-templates select="outline" />
    </ul>
  </xsl:template>

</xsl:stylesheet>