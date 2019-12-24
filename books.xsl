<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
exclude-result-prefixes="xs" version="2.0">
<xsl:output method="html"/>
<xsl:template match="books">
<html>
<head>
<title>Recommended Books</title>
<link rel="stylesheet" type="text/css" href="exampleStyle.css"/>
</head>
<body>
<h1>Recommended Books for The Digital Age HTML + XML Labs</h1>
<xsl:for-each select="book">
<p>
<xsl:for-each select="author">
<xsl:value-of select="firstName"/>&#160;<xsl:value-of
select="lastName"/>,
</xsl:for-each>
<i><xsl:value-of select="title"/></i>
</p>
</xsl:for-each>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
