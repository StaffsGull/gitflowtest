<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:can="http://au.com.raa.poc.customer.canon"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:sy="http://ws.apache.org/ns/synapse" xmlns:fn="http://www.w3.org/2005/xpath-functions"
	exclude-result-prefixes="fn sy can">
	<xsl:output omit-xml-declaration="no" indent="yes" />
	<xsl:strip-space elements="*" />

	<xsl:template match="/customer">
	  <can:GetCustomerRequest>
		<can:customerObject>
			<xsl:if test="./customerid!=''">
				<can:id>
					<xsl:value-of select="./customerid" />
				</can:id>
			</xsl:if>
			<xsl:if
				test="./fname!=''">
				<can:firstname>
					<xsl:value-of
						select="./fname" />
				</can:firstname>
			</xsl:if>
			<xsl:if test="./lname!=''">
				<can:lastname>
					<xsl:value-of select="./lname" />
				</can:lastname>
			</xsl:if>

			<can:policies>
			<xsl:for-each select="./pols/policy">
    			<can:policy>
    				<can:policyid>
    			    	<xsl:value-of select="./id"/>
    				</can:policyid>
    				<can:policyname>
    			    	<xsl:value-of select="./name"/>
    				</can:policyname>
    			</can:policy>
			</xsl:for-each>
			</can:policies>
		</can:customerObject>
	  </can:GetCustomerRequest>
	</xsl:template>
</xsl:stylesheet>