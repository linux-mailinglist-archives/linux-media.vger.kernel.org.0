Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60790183D8B
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 00:47:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727002AbgCLXri (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 19:47:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34486 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbgCLXri (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 19:47:38 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02915197A;
        Fri, 13 Mar 2020 00:47:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584056855;
        bh=TcCLwvkkwoLwisAl5af9ELpy4KNCzf2TdM0fFz/I/es=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RzjVak7vFy9RpD5tJYuLc9tHgL3wgYEVjNfJyDfX/qVZwhrd6M7PqDqppu4D1jDrp
         cAsWDVoZEZpwBYqDAaBwA8Srdp4DjQfc+GKO3aOQaVZsy/AP9T6HF2cOC4dHElSE+L
         JsOLGVlOkU9UIlliVloaKUHMgWsAF+R3em4TBq1w=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 07/14] media: imx: imx7-mipi-csis: Rename data_alignment field to width
Date:   Fri, 13 Mar 2020 01:47:15 +0200
Message-Id: <20200312234722.23483-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200312234722.23483-1-laurent.pinchart@ideasonboard.com>
References: <20200312234722.23483-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The csis_pix_format data_alignment field stores the bus width. Rename it
accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 46 +++++++++++-----------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index d8521e2b8a4f..c664895fb780 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -261,7 +261,7 @@ struct csis_pix_format {
 	unsigned int pix_width_alignment;
 	u32 code;
 	u32 fmt_reg;
-	u8 data_alignment;
+	u8 width;
 };
 
 static const struct csis_pix_format mipi_csis_formats[] = {
@@ -269,89 +269,89 @@ static const struct csis_pix_format mipi_csis_formats[] = {
 	{
 		.code = MEDIA_BUS_FMT_UYVY8_2X8,
 		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_YCBCR422_8BIT,
-		.data_alignment = 8,
+		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_UYVY10_2X10,
 		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_YCBCR422_8BIT,
-		.data_alignment = 10,
+		.width = 10,
 	},
 	/* RAW (Bayer and greyscale) formats. */
 	{
 		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
 		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW8,
-		.data_alignment = 8,
+		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
 		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW8,
-		.data_alignment = 8,
+		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
 		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW8,
-		.data_alignment = 8,
+		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
 		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW8,
-		.data_alignment = 8,
+		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_Y8_1X8,
 		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW8,
-		.data_alignment = 8,
+		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
 		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW10,
-		.data_alignment = 10,
+		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
 		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW10,
-		.data_alignment = 10,
+		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
 		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW10,
-		.data_alignment = 10,
+		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
 		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW10,
-		.data_alignment = 10,
+		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_Y10_1X10,
 		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW10,
-		.data_alignment = 10,
+		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
 		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW12,
-		.data_alignment = 12,
+		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
 		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW12,
-		.data_alignment = 12,
+		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
 		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW12,
-		.data_alignment = 12,
+		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
 		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW12,
-		.data_alignment = 12,
+		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_Y12_1X12,
 		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW12,
-		.data_alignment = 12,
+		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
 		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW14,
-		.data_alignment = 14,
+		.width = 14,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
 		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW14,
-		.data_alignment = 14,
+		.width = 14,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
 		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW14,
-		.data_alignment = 14,
+		.width = 14,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
 		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_RAW14,
-		.data_alignment = 14,
+		.width = 14,
 	}
 };
 
@@ -498,7 +498,7 @@ static void mipi_csis_set_params(struct csi_state *state)
 	mipi_csis_set_hsync_settle(state, state->hs_settle);
 
 	val = mipi_csis_read(state, MIPI_CSIS_ISPCONFIG_CH0);
-	if (state->csis_fmt->data_alignment == 32)
+	if (state->csis_fmt->width == 32)
 		val |= MIPI_CSIS_ISPCFG_ALIGN_32BIT;
 	else
 		val &= ~MIPI_CSIS_ISPCFG_ALIGN_32BIT;
-- 
Regards,

Laurent Pinchart

