<?xml version="1.0" encoding="UTF-8"?>

<!-- New document created with EditiX at Fri Jun 26 17:18:01 CEST 2015 -->

<xsl:stylesheet version="2.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:xdt="http://www.w3.org/2005/xpath-datatypes"
	xmlns:err="http://www.w3.org/2005/xqt-errors"
	exclude-result-prefixes="xs xdt err fn">


	<xsl:output method="xml" indent="yes"/>
	
	<xsl:template match="/">
	<html>
			<head>
				<title>Output</title>
				<link rel="stylesheet" type="text/css" href="stile.css" />
				<meta charset="UTF-8"/>
			</head>
		<body>
				<h1>
 				         <xsl:value-of select="div/table/thead/th"/>
 				</h1>
				<svg width="1200" height="700">
				<line x1="10" y1="450" x2="1150" y2="450" style="stroke:rgb(0,0,0);stroke-width:2" />
				<polygon points="1150,445 1150,455  1175,450 "
/>
				<line x1="10" y1="450" x2="10" y2="-200" style="stroke:rgb(0,0,0);stroke-width:2" />
				<polygon points="5,25 15,25  10,0 "/>
				<text  class="int_int" x= "1150"  y="495" style="fill:violet;" font-weight = "900"> <xsl:value-of select="div/table/riga_intestazione/intestazione_intestazione"/></text>
				
<text  class="int_dati" x="20" y="25" style="fill:violet;" font-weight = "900"> <xsl:value-of select="div/table/riga_dati/intestazione_dato"/></text>
				
				<xsl:for-each select="div/table/riga_intestazione/intestazione">
							<xsl:variable name="name" select="." />
							<xsl:variable name="scostamento" select="@pos_i"/>
							<text class = "intestazione" x= "{100*$scostamento+10}"  y="485" style="fill:violet;" 
font-weight = "900"> <xsl:value-of select="$name"/></text>
				</xsl:for-each>
				
				<xsl:for-each select="div/table/riga_dati/dato">
							<xsl:variable name="name" select="." />
							<xsl:variable name="scostamento" select="@pos_d"/>
							<circle cx="{$scostamento*100+10}" cy="{250 - ($name div 50000)}" r='3' stroke='violet' stroke-width='3' fill='red' />
							<text  x="{$scostamento*100+10}" y="{250 - ($name div 50000)-15}" style="fill:violet;"
							font-weight = "900"> <xsl:value-of select="$name"/></text>
				</xsl:for-each>
					
					 <polyline>
						<xsl:attribute name="style">
							<xsl:text>fill:none; stroke:red; stroke-width:1</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="points">
						<xsl:for-each select="div/table/riga_dati/dato">
							<xsl:value-of select="@pos_d*100+10"/>
							<xsl:text>,</xsl:text>
							<xsl:value-of select="250 -(. div 50000)"/>
							<xsl:text> </xsl:text>
						</xsl:for-each>
						</xsl:attribute>
					</polyline>
				</svg>
		</body>
	</html>
	</xsl:template>

</xsl:stylesheet>


