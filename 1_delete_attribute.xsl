<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <!--  This stylesheet removes the attributes "xml:id" and "xmlns" from the TEI-element. -->
        <xsl:for-each select="collection('[path_to_files]=*.xml')"> 
            <!-- The collection is the folder with all the TEIs, the ending .xml specifies which files are selected for the operation.  -->
            <xsl:for-each select="child::node()">
                <xsl:element name="{local-name()}">
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="*">
        <!-- remove element prefix: just the element's name is selected -->                                                                                                          <!-- ??? -->
        <xsl:element name="{local-name()}">
            <!-- process attributes: selects the attributes of the first element -->                                                                                                         <!-- ??? -->
            <xsl:for-each select="@*">
                <!-- remove attribute prefix: just the element's content is selected, not its attribute -->                                                                                                <!-- ??? -->
                <xsl:attribute name="{local-name()}">
                    <xsl:value-of select="."/>
                </xsl:attribute>
            </xsl:for-each>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>