<?xml-stylesheet type="text/xsl"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="no" encoding="utf-8" />
	<xsl:template match="/">
		<html>
			<head>
				<script>
				function toggle(o, fid) {
					if (o.innerHTML.indexOf('+') > 0) {
						o.innerHTML = '&#160;-&#160;' + o.innerHTML.substring(13);
						document.getElementById(fid).style.display = '';
					} else {
						o.innerHTML = '&#160;+&#160;' + o.innerHTML.substring(13);
						document.getElementById(fid).style.display = 'none';
					}
				}
				</script>
				<style type="text/css">
					body {direction: <xsl:value-of select="/bookmarks/info/dir" />}
					fieldset {-moz-border-radius: 10px; border: 1px solid silver; padding: 10px}
					legend {font-size: 12pt; padding: 5px; color: blue}
					div.desc {font: 10pt Tahoma}
					div.ayas {direction: ltr; float: <xsl:call-template name="trailing" />; padding: 6px; margin: 4px; width: 30%; border: 1px dashed green; overflow: auto}
					div.item {padding: 5px}
					div.folder {margin-top: 10px; border-<xsl:call-template name="leading" />: 4px solid #aabbff; border-bottom: 4px solid #aabbff; padding-<xsl:call-template name="leading" />: 10px; padding-bottom: 10px}
					.toggle {font: 12pt Tahoma; cursor: hand; cursor: pointer; color: red; font-weight: bold}
				</style>
				<meta name="creator" content="Zekr - Open Quranic Project" />
				<meta name="keywords" content="Zekr, Open Source, Quran, Qur'an, Bookmark, Bookmark set, zekr.org" />
				<title>
					<xsl:value-of select="/bookmarks/info/name" />
				</title>
			</head>
			<body>
				<div>
					<xsl:apply-templates />
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="/bookmarks/info">
		<!-- do nothing -->
	</xsl:template>

	<xsl:template match="//folder">
		<xsl:variable name="pos">
			<xsl:number level="any" />
		</xsl:variable>
		<xsl:variable name="fid" select="concat('f_', $pos)" />
		<div class="folder">
			<div>
				<div class="toggle" onclick="toggle(this, '{$fid}')" type="button">&#160;-&#160;<xsl:value-of select="@name" />
				</div><xsl:value-of select="@desc" />
			</div><div id="{$fid}">
				<xsl:apply-templates />
			</div>
		</div>
	</xsl:template>

	<xsl:template match="//item">
		<div class="item">
			<fieldset>
				<legend>
					<xsl:value-of select="./@name" />
				</legend>
				<div class="ayas">
					<xsl:value-of select="./@data" />
				</div>
				<div class="desc">
					<xsl:call-template name="break">
						<xsl:with-param name="text" select="./@desc" />
					</xsl:call-template>
				</div>
			</fieldset>
		</div>
	</xsl:template>

	<xsl:template name="trailing">
		<xsl:choose>
			<xsl:when test="/bookmarks/info/dir='rtl'">
				<xsl:text>left</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>right</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="leading">
		<xsl:choose>
			<xsl:when test="/bookmarks/info/dir='rtl'">
				<xsl:text>right</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>left</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="break">
		<xsl:param name="text" select="." />
		<xsl:choose>
			<xsl:when test="contains($text, '&#xa;')">
				<xsl:value-of select="substring-before($text, '&#13;&#10;')" />
				<br />
				<xsl:call-template name="break">
					<xsl:with-param name="text" select="substring-after($text, '&#13;&#10;')" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$text" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
