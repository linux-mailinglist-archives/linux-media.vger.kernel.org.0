Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D51EF381C03
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 04:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232289AbhEPCQ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 22:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232155AbhEPCOd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 22:14:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91348C06138D
        for <linux-media@vger.kernel.org>; Sat, 15 May 2021 19:00:06 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BBB61224;
        Sun, 16 May 2021 03:45:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621129505;
        bh=Cu7hk4ch9Lp2NhzSxedGvT0rC5Cipsl9CAku5CQ4Zqk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LccSOOUgNR4We5pAWCAN+klEhUliiPIGWfI5XwTwSEs0r/HFjUcP+cHPJDKr+s35U
         gpj9+LoT9L9BfXZFHzmZHpv6N+uZU4RLvCAetAkYsKMMbcyFE5NOSYEd7nv5tttHmQ
         5niixegafRyzaOAVIvSzmLsoUhQ8rfuMyF8Sg6go=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH v2 10/25] media: imx: imx7_mipi_csis: Store CSI-2 data type in format structure
Date:   Sun, 16 May 2021 04:44:26 +0300
Message-Id: <20210516014441.5508-11-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
References: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace the register value stored in the csis_pix_format structure with
the CSI-2 data type. The register value is simply computed from the data
type using a shift. This prepares for i.MX8MP support that needs the
same data type in a different hardware register.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 71 +++++++++++++---------
 1 file changed, 42 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 695cb8aebcab..94afb103f951 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -170,13 +170,7 @@
 #define MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL	(1 << 12)
 #define MIPI_CSIS_ISPCFG_PIXEL_MODE_QUAD	(2 << 12)	/* i.MX8M[MNP] only */
 #define MIPI_CSIS_ISPCFG_ALIGN_32BIT		BIT(11)
-#define MIPI_CSIS_ISPCFG_FMT_YCBCR422_8BIT	(0x1e << 2)
-#define MIPI_CSIS_ISPCFG_FMT_RAW8		(0x2a << 2)
-#define MIPI_CSIS_ISPCFG_FMT_RAW10		(0x2b << 2)
-#define MIPI_CSIS_ISPCFG_FMT_RAW12		(0x2c << 2)
-#define MIPI_CSIS_ISPCFG_FMT_RAW14		(0x2d << 2)
-/* User defined formats, x = 1...4 */
-#define MIPI_CSIS_ISPCFG_FMT_USER(x)		((0x30 + (x) - 1) << 2)
+#define MIPI_CSIS_ISPCFG_FMT(fmt)		((fmt) << 2)
 #define MIPI_CSIS_ISPCFG_FMT_MASK		(0x3f << 2)
 
 /* ISP Image Resolution register */
@@ -223,6 +217,25 @@
 
 #define DEFAULT_SCLK_CSIS_FREQ			166000000UL
 
+/* MIPI CSI-2 Data Types */
+#define MIPI_CSI2_DATA_TYPE_YUV420_8		0x18
+#define MIPI_CSI2_DATA_TYPE_YUV420_10		0x19
+#define MIPI_CSI2_DATA_TYPE_LE_YUV420_8		0x1a
+#define MIPI_CSI2_DATA_TYPE_CS_YUV420_8		0x1c
+#define MIPI_CSI2_DATA_TYPE_CS_YUV420_10	0x1d
+#define MIPI_CSI2_DATA_TYPE_YUV422_8		0x1e
+#define MIPI_CSI2_DATA_TYPE_YUV422_10		0x1f
+#define MIPI_CSI2_DATA_TYPE_RGB565		0x22
+#define MIPI_CSI2_DATA_TYPE_RGB666		0x23
+#define MIPI_CSI2_DATA_TYPE_RGB888		0x24
+#define MIPI_CSI2_DATA_TYPE_RAW6		0x28
+#define MIPI_CSI2_DATA_TYPE_RAW7		0x29
+#define MIPI_CSI2_DATA_TYPE_RAW8		0x2a
+#define MIPI_CSI2_DATA_TYPE_RAW10		0x2b
+#define MIPI_CSI2_DATA_TYPE_RAW12		0x2c
+#define MIPI_CSI2_DATA_TYPE_RAW14		0x2d
+#define MIPI_CSI2_DATA_TYPE_USER(x)		(0x30 + (x))
+
 enum {
 	ST_POWERED	= 1,
 	ST_STREAMING	= 2,
@@ -324,7 +337,7 @@ struct csi_state {
 
 struct csis_pix_format {
 	u32 code;
-	u32 fmt_reg;
+	u32 data_type;
 	u8 width;
 };
 
@@ -332,85 +345,85 @@ static const struct csis_pix_format mipi_csis_formats[] = {
 	/* YUV formats. */
 	{
 		.code = MEDIA_BUS_FMT_UYVY8_1X16,
-		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_YCBCR422_8BIT,
+		.data_type = MIPI_CSI2_DATA_TYPE_YUV422_8,
 		.width = 16,
 	},
 	/* RAW (Bayer and greyscale) formats. */
 	{
 		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
-		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW8,
+		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
 		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
-		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW8,
+		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
 		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
-		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW8,
+		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
 		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
-		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW8,
+		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
 		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_Y8_1X8,
-		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW8,
+		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
 		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
-		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW10,
+		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
 		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
-		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW10,
+		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
 		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
-		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW10,
+		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
 		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
-		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW10,
+		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
 		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_Y10_1X10,
-		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW10,
+		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
 		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
-		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW12,
+		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
 		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
-		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW12,
+		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
 		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
-		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW12,
+		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
 		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
-		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW12,
+		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
 		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_Y12_1X12,
-		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW12,
+		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
 		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
-		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW14,
+		.data_type = MIPI_CSI2_DATA_TYPE_RAW14,
 		.width = 14,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
-		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW14,
+		.data_type = MIPI_CSI2_DATA_TYPE_RAW14,
 		.width = 14,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
-		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW14,
+		.data_type = MIPI_CSI2_DATA_TYPE_RAW14,
 		.width = 14,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
-		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW14,
+		.data_type = MIPI_CSI2_DATA_TYPE_RAW14,
 		.width = 14,
 	}
 };
@@ -502,7 +515,7 @@ static void __mipi_csis_set_format(struct csi_state *state)
 	/* Color format */
 	val = mipi_csis_read(state, MIPI_CSIS_ISP_CONFIG_CH(0));
 	val &= ~(MIPI_CSIS_ISPCFG_ALIGN_32BIT | MIPI_CSIS_ISPCFG_FMT_MASK);
-	val |= state->csis_fmt->fmt_reg;
+	val |= MIPI_CSIS_ISPCFG_FMT(state->csis_fmt->data_type);
 	mipi_csis_write(state, MIPI_CSIS_ISP_CONFIG_CH(0), val);
 
 	/* Pixel resolution */
-- 
Regards,

Laurent Pinchart

