<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:can="http://au.com.raa.poc.customer.canon"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:sy="http://ws.apache.org/ns/synapse" xmlns:fn="http://www.w3.org/2005/xpath-functions"
	exclude-result-prefixes="fn sy can">
	<xsl:output omit-xml-declaration="no" indent="yes" />
	<xsl:strip-space elements="*" />

	<xsl:template match="//can:customerObject">
	  	<customer>
			<xsl:if test="./can:id!=''">
				<customerid>
					<xsl:value-of select="./can:id" />
				</customerid>
			</xsl:if>
			<xsl:if
				test="./can:firstname!=''">
				<fname>
					<xsl:value-of
						select="./can:firstname" />
				</fname>
			</xsl:if>
			<xsl:if test="./can:lastname!=''">
				<lname>
					<xsl:value-of select="./can:lastname" />
				</lname>
			</xsl:if>

			<pols>
				<xsl:for-each select="./can:policies/can:policy">
	    			<policy>
	    				<id>
	    			    	<xsl:value-of select="./can:policyid"/>
	    				</id>
	    				<name>
	    			    	<xsl:value-of select="./can:policyname"/>
	    				</name>
	    			</policy>
				</xsl:for-each>
			</pols>
		</customer>
	</xsl:template>
</xsl:stylesheet>