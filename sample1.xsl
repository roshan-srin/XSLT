<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0"
    xsi:schemaLocation="http://www.isotc211.org/2005/gmi http://ngdc.noaa.gov/metadata/published/xsd/schema.xsd"
    xmlns:gmi="http://www.isotc211.org/2005/gmi" 
    xmlns:gco="http://www.isotc211.org/2005/gco" 
    xmlns:gmd="http://www.isotc211.org/2005/gmd" 
    xmlns:gml="http://www.opengis.net/gml/3.2" 
    xmlns:gmx="http://www.isotc211.org/2005/gmx" 
    xmlns:gsr="http://www.isotc211.org/2005/gsr" 
    xmlns:gss="http://www.isotc211.org/2005/gss" 
    xmlns:gts="http://www.isotc211.org/2005/gts" 
    xmlns:srv="http://www.isotc211.org/2005/srv" 
    xmlns:xlink="http://www.w3.org/1999/xlink" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    
    <xsl:template match="/">
        <html>
            <body>
             <xsl:apply-templates  />
            </body>
        </html>
        
    </xsl:template>

    <xsl:template match='gmi:MI_Metadata'>
        <xsl:variable name="identifier" select="gmd:fileIdentifier/gco:CharacterString"/>
        <xsl:variable name="cleanedidentifier" select="translate(translate($identifier, '/', '__'), '.', '_')"/>
    <!--    <xsl:result-document method="html"  indent="yes"  href="gmd_html/{$cleanedidentifier}.xml"> -->
<!-- scheam.org namespaces? -->
        <div class='dataset'>
            
            <div class="identifier">
                <span>
                    <!-- <xsl:value-of select="$cleanedidentifier"/> -->
                </span>
            </div>
            <div class='language'>
                <!--en-->
            </div>
            <xsl:apply-templates></xsl:apply-templates>
            
                            <gmd:MD_Keywords>
                                
                                
                                    
                                    
                                    
                                <!--</xsl:for-each>-->
                                
                            </gmd:MD_Keywords>
                        <!--</gmd:descriptiveKeywords>-->
                    <!--</xsl:for-each-group>-->
               </div>
                    <!--<xsl:if test="./:descriptions/:description[@descriptionType='Other']">-->
                        <gmd:descriptiveKeywords>
                            <gmd:MD_Keywords> 
                                <!--<xsl:for-each select="./:descriptions/:description[@descriptionType='Other']">-->
                                    <xsl:variable name="tokens" select="tokenize(.,',')"/>
                                    <xsl:for-each select="$tokens">
                                        <gmd:keyword>
                                            <gmx:Anchor><xsl:value-of select="normalize-space(.)"></xsl:value-of></gmx:Anchor>
                                        </gmd:keyword>
                                    </xsl:for-each> 
                                <!--</xsl:for-each>-->
                                
                            </gmd:MD_Keywords>
                        </gmd:descriptiveKeywords>
                    <!--</xsl:if>-->
                    
                    
                    <xsl:if test="false()" >
                        <gmd:descriptiveKeywords>
                            <gmd:MD_Keywords>
                                
                                
                                
                                
                            </gmd:MD_Keywords>
                        </gmd:descriptiveKeywords>
                    </xsl:if>
                    <xsl:apply-templates></xsl:apply-templates>
                    <!--<xsl:if test="./:formats/:format">-->
                        <gmd:descriptiveKeywords>
                            <gmd:MD_Keywords>
                                
                                <!--<xsl:for-each select="./:formats/:format">-->
                                    
                                    <gmd:keyword>
                                        <gco:CharacterString><xsl:value-of select="."/></gco:CharacterString>
                                    </gmd:keyword>
                                    
                                    
                                <!--</xsl:for-each>-->
                                
                                
                               
                            </gmd:MD_Keywords>
                        </gmd:descriptiveKeywords>
                    <!--</xsl:if>-->
                    
                 
                    
                
                    
            
            
            <!--<xsl:if test="./:alternateIdentifiers/:alternateIdentifier[@alternateIdentifierType='URL']">-->              
                
                <gmd:distributionInfo>
                    <gmd:MD_Distribution>
                        
                        <!--<xsl:for-each select="./:alternateIdentifiers/:alternateIdentifier[@alternateIdentifierType='URL']">--> 
                            <gmd:transferOptions>
                                <gmd:MD_DigitalTransferOptions>
                                    <gmd:onLine>
                                        <gmd:CI_OnlineResource>
                                            <gmd:linkage>
                                                <gmd:URL><xsl:value-of select="."/></gmd:URL>
                                            </gmd:linkage>
                                            
                                            
                                        </gmd:CI_OnlineResource>
                                    </gmd:onLine>
                                    
                                </gmd:MD_DigitalTransferOptions>
                            </gmd:transferOptions>
                        <!--</xsl:for-each>-->
                    </gmd:MD_Distribution>
                </gmd:distributionInfo>
                
            <!--</xsl:if>-->
        
        <xsl:apply-templates></xsl:apply-templates>
 <!--   </xsl:result-document>   -->
    
</xsl:template>
    <xsl:template match="gmd:identificationInfo">
        <!-- title, abstract, purpose keywords, -->
        <xsl:text> ident</xsl:text>
        <div class='title'>
            <xsl:value-of select="gmd:MD_DataIdentification/gmd:citation/gmd:CI_Citation/gmd:title/gco:CharacterString"/>           
            
        </div>
        <div>
            <xsl:value-of select="gmd:MD_DataIdentification/gmd:abstract/gco:CharacterString"/>           
            
        </div>
        <xsl:if test="gmd:MD_DataIdentification/gmd:purpose/gco:CharacterString"></xsl:if>  <div>
            <xsl:value-of select="gmd:MD_DataIdentification/gmd:purpose/gco:CharacterString"/>           
            
        </div>
        <xsl:apply-templates></xsl:apply-templates>
    </xsl:template>
        <xsl:template match="gmd:descriptiveKeywords">
          
        </xsl:template>
    <xsl:template match='gmd:distributionInfo'>
        <xsl:text>distribution info</xsl:text>
    </xsl:template>
<xsl:template name="dataseturi">
    <xsl:param name="urls"></xsl:param>
</xsl:template>
</xsl:stylesheet>