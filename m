Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D04CE31B4DA
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:40:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbhBOEkj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:40:39 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46076 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbhBOEkh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:40:37 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6AD9A2CE5;
        Mon, 15 Feb 2021 05:29:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363348;
        bh=zX6ecdThu2iAenlC9F/L46AaO7fBsbCwbPMzexUmNTU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y7R+ukU+G8OnyyJBLdpOuUTJyRIhR2rpFRWBJMPEu6lrWAtY0PaI6A0eKyz16TMhf
         X+6g/usba5QkMdSyprN550gLzCH8FZSz3EKy0J1xW7iumQS0M6l5FsxdaeMqRfnpA8
         OdUWy16+MYJ2f9AX2pZ4Qa5wIof0DjO9hFHTWOOo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 74/77] media: imx: imx7_mipi_csis: Make ISP registers macros take channel ID
Date:   Mon, 15 Feb 2021 06:27:38 +0200
Message-Id: <20210215042741.28850-75-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace the per-channel ISP registers macros with a single one that take
the channel as a parameter. Only channel 0 is supported for now, but
this will make support for multiple channels easier.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 26 ++++++----------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index f7dcadb4fab4..b93a176aa007 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -163,11 +163,7 @@
 #define MIPI_CSIS_DPHY_SCTRL_H			0x3c
 
 /* ISP Configuration register */
-#define MIPI_CSIS_ISPCONFIG_CH0			0x40
-#define MIPI_CSIS_ISPCONFIG_CH1			0x50
-#define MIPI_CSIS_ISPCONFIG_CH2			0x60
-#define MIPI_CSIS_ISPCONFIG_CH3			0x70
-
+#define MIPI_CSIS_ISPCONFIG_CH(n)		(0x40 + (n) * 0x10)
 #define MIPI_CSIS_ISPCFG_MEM_FULL_GAP_MSK	(0xff << 24)
 #define MIPI_CSIS_ISPCFG_MEM_FULL_GAP(x)	((x) << 24)
 #define MIPI_CSIS_ISPCFG_DOUBLE_CMPNT		BIT(12)
@@ -177,25 +173,17 @@
 #define MIPI_CSIS_ISPCFG_FMT_RAW10		(0x2b << 2)
 #define MIPI_CSIS_ISPCFG_FMT_RAW12		(0x2c << 2)
 #define MIPI_CSIS_ISPCFG_FMT_RAW14		(0x2d << 2)
-
 /* User defined formats, x = 1...4 */
 #define MIPI_CSIS_ISPCFG_FMT_USER(x)		((0x30 + (x) - 1) << 2)
 #define MIPI_CSIS_ISPCFG_FMT_MASK		(0x3f << 2)
 
 /* ISP Image Resolution register */
-#define MIPI_CSIS_ISPRESOL_CH0			0x44
-#define MIPI_CSIS_ISPRESOL_CH1			0x54
-#define MIPI_CSIS_ISPRESOL_CH2			0x64
-#define MIPI_CSIS_ISPRESOL_CH3			0x74
+#define MIPI_CSIS_ISPRESOL_CH(n)		(0x44 + (n) * 0x10)
 #define CSIS_MAX_PIX_WIDTH			0xffff
 #define CSIS_MAX_PIX_HEIGHT			0xffff
 
 /* ISP SYNC register */
-#define MIPI_CSIS_ISPSYNC_CH0			0x48
-#define MIPI_CSIS_ISPSYNC_CH1			0x58
-#define MIPI_CSIS_ISPSYNC_CH2			0x68
-#define MIPI_CSIS_ISPSYNC_CH3			0x78
-
+#define MIPI_CSIS_ISPSYNC_CH(n)			(0x48 + (n) * 0x10)
 #define MIPI_CSIS_ISPSYNC_HSYNC_LINTV_OFFSET	18
 #define MIPI_CSIS_ISPSYNC_VSYNC_SINTV_OFFSET	12
 #define MIPI_CSIS_ISPSYNC_VSYNC_EINTV_OFFSET	0
@@ -514,14 +502,14 @@ static void __mipi_csis_set_format(struct csi_state *state)
 	u32 val;
 
 	/* Color format */
-	val = mipi_csis_read(state, MIPI_CSIS_ISPCONFIG_CH0);
+	val = mipi_csis_read(state, MIPI_CSIS_ISPCONFIG_CH(0));
 	val &= ~(MIPI_CSIS_ISPCFG_ALIGN_32BIT | MIPI_CSIS_ISPCFG_FMT_MASK);
 	val |= state->csis_fmt->fmt_reg;
-	mipi_csis_write(state, MIPI_CSIS_ISPCONFIG_CH0, val);
+	mipi_csis_write(state, MIPI_CSIS_ISPCONFIG_CH(0), val);
 
 	/* Pixel resolution */
 	val = mf->width | (mf->height << 16);
-	mipi_csis_write(state, MIPI_CSIS_ISPRESOL_CH0, val);
+	mipi_csis_write(state, MIPI_CSIS_ISPRESOL_CH(0), val);
 }
 
 static int mipi_csis_calculate_params(struct csi_state *state)
@@ -576,7 +564,7 @@ static void mipi_csis_set_params(struct csi_state *state)
 	val = (0 << MIPI_CSIS_ISPSYNC_HSYNC_LINTV_OFFSET) |
 		(0 << MIPI_CSIS_ISPSYNC_VSYNC_SINTV_OFFSET) |
 		(0 << MIPI_CSIS_ISPSYNC_VSYNC_EINTV_OFFSET);
-	mipi_csis_write(state, MIPI_CSIS_ISPSYNC_CH0, val);
+	mipi_csis_write(state, MIPI_CSIS_ISPSYNC_CH(0), val);
 
 	val = mipi_csis_read(state, MIPI_CSIS_CLK_CTRL);
 	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC;
-- 
Regards,

Laurent Pinchart

