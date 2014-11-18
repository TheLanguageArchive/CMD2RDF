<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:vlo="http://www.clarin.eu/vlo/"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:param name="VLO-orgs"/>
    
    <!-- identity copy -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
	<xsl:template match="vlo:hasFacetOrganisationElementValue" priority="1">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
        <xsl:if test="normalize-space()!=''">
            <!-- found an organisation name -->
            <!-- see if there is a CLAVAS concept with a matching label -->
            <xsl:variable name="cc" select="document($VLO-orgs)//*[(skos:prefLabel|skos:altLabel)/normalize-space()=normalize-space(current())]"/>
        	<xsl:if test="exists($cc)">
        		<vlo:hasFacetOrganisationElementEntity rdf:resource="{$cc/@rdf:about}"/>
        	</xsl:if>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>