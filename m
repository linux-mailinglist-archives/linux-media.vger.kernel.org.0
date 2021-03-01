Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53C673284FC
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 17:50:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235203AbhCAQrD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 11:47:03 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:44452 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234802AbhCAQmi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 11:42:38 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C725332;
        Mon,  1 Mar 2021 17:41:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1614616915;
        bh=NRxUQysokQ0kdDveb2reU8gNfxsXXdN2xmScRovTJqA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wpbmcGIBTAX3TdMNvZHfrfQqiWg/Gl/h11TllxrquD2fhOc6cm3qEqMmB6EkWHE/h
         iQnZTcT10FGSjntQx95pkkcuos+OmSjWuO1YUlH3cZ609N78odltUpx9r10Eiu9HKq
         mbqlDn7m1YHG3w2FO/4bHpiis+ghxbGs6OKA6Juo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2.1 75/77] media: imx: imx7_mipi_csis: Rename register macros to match datasheet
Date:   Mon,  1 Mar 2021 18:41:23 +0200
Message-Id: <20210301164123.13146-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-76-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-76-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename several register macros to match the names from the
documentation.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
Changes since v2:

- Fix indentation
- Address SCLKS_MASK and SCLKS_OFFSET
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 172 ++++++++++-----------
 1 file changed, 86 insertions(+), 86 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index de1bc0146e59..f57268fad99c 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -63,61 +63,61 @@
 #define MIPI_CSIS_CLK_CTRL_WCLK_SRC		BIT(0)
 
 /* CSIS Interrupt mask */
-#define MIPI_CSIS_INTMSK			0x10
-#define MIPI_CSIS_INTMSK_EVEN_BEFORE		BIT(31)
-#define MIPI_CSIS_INTMSK_EVEN_AFTER		BIT(30)
-#define MIPI_CSIS_INTMSK_ODD_BEFORE		BIT(29)
-#define MIPI_CSIS_INTMSK_ODD_AFTER		BIT(28)
-#define MIPI_CSIS_INTMSK_FRAME_START		BIT(24)
-#define MIPI_CSIS_INTMSK_FRAME_END		BIT(20)
-#define MIPI_CSIS_INTMSK_ERR_SOT_HS		BIT(16)
-#define MIPI_CSIS_INTMSK_ERR_LOST_FS		BIT(12)
-#define MIPI_CSIS_INTMSK_ERR_LOST_FE		BIT(8)
-#define MIPI_CSIS_INTMSK_ERR_OVER		BIT(4)
-#define MIPI_CSIS_INTMSK_ERR_WRONG_CFG		BIT(3)
-#define MIPI_CSIS_INTMSK_ERR_ECC		BIT(2)
-#define MIPI_CSIS_INTMSK_ERR_CRC		BIT(1)
-#define MIPI_CSIS_INTMSK_ERR_UNKNOWN		BIT(0)
+#define MIPI_CSIS_INT_MSK			0x10
+#define MIPI_CSIS_INT_MSK_EVEN_BEFORE		BIT(31)
+#define MIPI_CSIS_INT_MSK_EVEN_AFTER		BIT(30)
+#define MIPI_CSIS_INT_MSK_ODD_BEFORE		BIT(29)
+#define MIPI_CSIS_INT_MSK_ODD_AFTER		BIT(28)
+#define MIPI_CSIS_INT_MSK_FRAME_START		BIT(24)
+#define MIPI_CSIS_INT_MSK_FRAME_END		BIT(20)
+#define MIPI_CSIS_INT_MSK_ERR_SOT_HS		BIT(16)
+#define MIPI_CSIS_INT_MSK_ERR_LOST_FS		BIT(12)
+#define MIPI_CSIS_INT_MSK_ERR_LOST_FE		BIT(8)
+#define MIPI_CSIS_INT_MSK_ERR_OVER		BIT(4)
+#define MIPI_CSIS_INT_MSK_ERR_WRONG_CFG		BIT(3)
+#define MIPI_CSIS_INT_MSK_ERR_ECC		BIT(2)
+#define MIPI_CSIS_INT_MSK_ERR_CRC		BIT(1)
+#define MIPI_CSIS_INT_MSK_ERR_UNKNOWN		BIT(0)
 
 /* CSIS Interrupt source */
-#define MIPI_CSIS_INTSRC			0x14
-#define MIPI_CSIS_INTSRC_EVEN_BEFORE		BIT(31)
-#define MIPI_CSIS_INTSRC_EVEN_AFTER		BIT(30)
-#define MIPI_CSIS_INTSRC_EVEN			BIT(30)
-#define MIPI_CSIS_INTSRC_ODD_BEFORE		BIT(29)
-#define MIPI_CSIS_INTSRC_ODD_AFTER		BIT(28)
-#define MIPI_CSIS_INTSRC_ODD			(0x3 << 28)
-#define MIPI_CSIS_INTSRC_NON_IMAGE_DATA		(0xf << 28)
-#define MIPI_CSIS_INTSRC_FRAME_START		BIT(24)
-#define MIPI_CSIS_INTSRC_FRAME_END		BIT(20)
-#define MIPI_CSIS_INTSRC_ERR_SOT_HS		BIT(16)
-#define MIPI_CSIS_INTSRC_ERR_LOST_FS		BIT(12)
-#define MIPI_CSIS_INTSRC_ERR_LOST_FE		BIT(8)
-#define MIPI_CSIS_INTSRC_ERR_OVER		BIT(4)
-#define MIPI_CSIS_INTSRC_ERR_WRONG_CFG		BIT(3)
-#define MIPI_CSIS_INTSRC_ERR_ECC		BIT(2)
-#define MIPI_CSIS_INTSRC_ERR_CRC		BIT(1)
-#define MIPI_CSIS_INTSRC_ERR_UNKNOWN		BIT(0)
-#define MIPI_CSIS_INTSRC_ERRORS			0xfffff
+#define MIPI_CSIS_INT_SRC			0x14
+#define MIPI_CSIS_INT_SRC_EVEN_BEFORE		BIT(31)
+#define MIPI_CSIS_INT_SRC_EVEN_AFTER		BIT(30)
+#define MIPI_CSIS_INT_SRC_EVEN			BIT(30)
+#define MIPI_CSIS_INT_SRC_ODD_BEFORE		BIT(29)
+#define MIPI_CSIS_INT_SRC_ODD_AFTER		BIT(28)
+#define MIPI_CSIS_INT_SRC_ODD			(0x3 << 28)
+#define MIPI_CSIS_INT_SRC_NON_IMAGE_DATA	(0xf << 28)
+#define MIPI_CSIS_INT_SRC_FRAME_START		BIT(24)
+#define MIPI_CSIS_INT_SRC_FRAME_END		BIT(20)
+#define MIPI_CSIS_INT_SRC_ERR_SOT_HS		BIT(16)
+#define MIPI_CSIS_INT_SRC_ERR_LOST_FS		BIT(12)
+#define MIPI_CSIS_INT_SRC_ERR_LOST_FE		BIT(8)
+#define MIPI_CSIS_INT_SRC_ERR_OVER		BIT(4)
+#define MIPI_CSIS_INT_SRC_ERR_WRONG_CFG		BIT(3)
+#define MIPI_CSIS_INT_SRC_ERR_ECC		BIT(2)
+#define MIPI_CSIS_INT_SRC_ERR_CRC		BIT(1)
+#define MIPI_CSIS_INT_SRC_ERR_UNKNOWN		BIT(0)
+#define MIPI_CSIS_INT_SRC_ERRORS		0xfffff
 
 /* D-PHY status control */
-#define MIPI_CSIS_DPHYSTATUS			0x20
-#define MIPI_CSIS_DPHYSTATUS_ULPS_DAT		BIT(8)
-#define MIPI_CSIS_DPHYSTATUS_STOPSTATE_DAT	BIT(4)
-#define MIPI_CSIS_DPHYSTATUS_ULPS_CLK		BIT(1)
-#define MIPI_CSIS_DPHYSTATUS_STOPSTATE_CLK	BIT(0)
+#define MIPI_CSIS_DPHY_STATUS			0x20
+#define MIPI_CSIS_DPHY_STATUS_ULPS_DAT		BIT(8)
+#define MIPI_CSIS_DPHY_STATUS_STOPSTATE_DAT	BIT(4)
+#define MIPI_CSIS_DPHY_STATUS_ULPS_CLK		BIT(1)
+#define MIPI_CSIS_DPHY_STATUS_STOPSTATE_CLK	BIT(0)
 
 /* D-PHY common control */
-#define MIPI_CSIS_DPHYCTRL			0x24
-#define MIPI_CSIS_DPHYCTRL_HSSETTLE(n)		((n) << 24)
-#define MIPI_CSIS_DPHYCTRL_HSSETTLE_MASK	GENMASK(31, 24)
-#define MIPI_CSIS_DPHYCTRL_SCLKS_MASK		(0x3 << 22)
-#define MIPI_CSIS_DPHYCTRL_SCLKS_OFFSET		22
-#define MIPI_CSIS_DPHYCTRL_DPDN_SWAP_CLK	BIT(6)
-#define MIPI_CSIS_DPHYCTRL_DPDN_SWAP_DAT	BIT(5)
-#define MIPI_CSIS_DPHYCTRL_ENABLE_DAT		BIT(1)
-#define MIPI_CSIS_DPHYCTRL_ENABLE_CLK		BIT(0)
-#define MIPI_CSIS_DPHYCTRL_ENABLE		(0x1f << 0)
+#define MIPI_CSIS_DPHY_CMN_CTRL			0x24
+#define MIPI_CSIS_DPHY_CMN_CTRL_HSSETTLE(n)	((n) << 24)
+#define MIPI_CSIS_DPHY_CMN_CTRL_HSSETTLE_MASK	GENMASK(31, 24)
+#define MIPI_CSIS_DPHY_CMN_CTRL_CLKSETTLE(n)	((n) << 22)
+#define MIPI_CSIS_DPHY_CMN_CTRL_CLKSETTLE_MASK	GENMASK(23, 22)
+#define MIPI_CSIS_DPHY_CMN_CTRL_DPDN_SWAP_CLK	BIT(6)
+#define MIPI_CSIS_DPHY_CMN_CTRL_DPDN_SWAP_DAT	BIT(5)
+#define MIPI_CSIS_DPHY_CMN_CTRL_ENABLE_DAT	BIT(1)
+#define MIPI_CSIS_DPHY_CMN_CTRL_ENABLE_CLK	BIT(0)
+#define MIPI_CSIS_DPHY_CMN_CTRL_ENABLE		(0x1f << 0)
 
 /* D-PHY Master and Slave Control register Low */
 #define MIPI_CSIS_DPHY_BCTRL_L			0x30
@@ -163,7 +163,7 @@
 #define MIPI_CSIS_DPHY_SCTRL_H			0x3c
 
 /* ISP Configuration register */
-#define MIPI_CSIS_ISPCONFIG_CH(n)		(0x40 + (n) * 0x10)
+#define MIPI_CSIS_ISP_CONFIG_CH(n)		(0x40 + (n) * 0x10)
 #define MIPI_CSIS_ISPCFG_MEM_FULL_GAP_MSK	(0xff << 24)
 #define MIPI_CSIS_ISPCFG_MEM_FULL_GAP(x)	((x) << 24)
 #define MIPI_CSIS_ISPCFG_DOUBLE_CMPNT		BIT(12)
@@ -178,15 +178,15 @@
 #define MIPI_CSIS_ISPCFG_FMT_MASK		(0x3f << 2)
 
 /* ISP Image Resolution register */
-#define MIPI_CSIS_ISPRESOL_CH(n)		(0x44 + (n) * 0x10)
+#define MIPI_CSIS_ISP_RESOL_CH(n)		(0x44 + (n) * 0x10)
 #define CSIS_MAX_PIX_WIDTH			0xffff
 #define CSIS_MAX_PIX_HEIGHT			0xffff
 
 /* ISP SYNC register */
-#define MIPI_CSIS_ISPSYNC_CH(n)			(0x48 + (n) * 0x10)
-#define MIPI_CSIS_ISPSYNC_HSYNC_LINTV_OFFSET	18
-#define MIPI_CSIS_ISPSYNC_VSYNC_SINTV_OFFSET	12
-#define MIPI_CSIS_ISPSYNC_VSYNC_EINTV_OFFSET	0
+#define MIPI_CSIS_ISP_SYNC_CH(n)		(0x48 + (n) * 0x10)
+#define MIPI_CSIS_ISP_SYNC_HSYNC_LINTV_OFFSET	18
+#define MIPI_CSIS_ISP_SYNC_VSYNC_SINTV_OFFSET	12
+#define MIPI_CSIS_ISP_SYNC_VSYNC_EINTV_OFFSET	0
 
 /* Non-image packet data buffers */
 #define MIPI_CSIS_PKTDATA_ODD			0x2000
@@ -209,22 +209,22 @@ struct mipi_csis_event {
 
 static const struct mipi_csis_event mipi_csis_events[] = {
 	/* Errors */
-	{ MIPI_CSIS_INTSRC_ERR_SOT_HS,	"SOT Error" },
-	{ MIPI_CSIS_INTSRC_ERR_LOST_FS,	"Lost Frame Start Error" },
-	{ MIPI_CSIS_INTSRC_ERR_LOST_FE,	"Lost Frame End Error" },
-	{ MIPI_CSIS_INTSRC_ERR_OVER,	"FIFO Overflow Error" },
-	{ MIPI_CSIS_INTSRC_ERR_WRONG_CFG, "Wrong Configuration Error" },
-	{ MIPI_CSIS_INTSRC_ERR_ECC,	"ECC Error" },
-	{ MIPI_CSIS_INTSRC_ERR_CRC,	"CRC Error" },
-	{ MIPI_CSIS_INTSRC_ERR_UNKNOWN,	"Unknown Error" },
+	{ MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT Error" },
+	{ MIPI_CSIS_INT_SRC_ERR_LOST_FS,	"Lost Frame Start Error" },
+	{ MIPI_CSIS_INT_SRC_ERR_LOST_FE,	"Lost Frame End Error" },
+	{ MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error" },
+	{ MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,	"Wrong Configuration Error" },
+	{ MIPI_CSIS_INT_SRC_ERR_ECC,		"ECC Error" },
+	{ MIPI_CSIS_INT_SRC_ERR_CRC,		"CRC Error" },
+	{ MIPI_CSIS_INT_SRC_ERR_UNKNOWN,	"Unknown Error" },
 	/* Non-image data receive events */
-	{ MIPI_CSIS_INTSRC_EVEN_BEFORE,	"Non-image data before even frame" },
-	{ MIPI_CSIS_INTSRC_EVEN_AFTER,	"Non-image data after even frame" },
-	{ MIPI_CSIS_INTSRC_ODD_BEFORE,	"Non-image data before odd frame" },
-	{ MIPI_CSIS_INTSRC_ODD_AFTER,	"Non-image data after odd frame" },
+	{ MIPI_CSIS_INT_SRC_EVEN_BEFORE,	"Non-image data before even frame" },
+	{ MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image data after even frame" },
+	{ MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image data before odd frame" },
+	{ MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image data after odd frame" },
 	/* Frame start/end */
-	{ MIPI_CSIS_INTSRC_FRAME_START,	"Frame Start" },
-	{ MIPI_CSIS_INTSRC_FRAME_END,	"Frame End" },
+	{ MIPI_CSIS_INT_SRC_FRAME_START,	"Frame Start" },
+	{ MIPI_CSIS_INT_SRC_FRAME_END,		"Frame End" },
 };
 
 #define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
@@ -444,7 +444,7 @@ static const struct csis_pix_format *find_csis_format(u32 code)
 
 static void mipi_csis_enable_interrupts(struct csi_state *state, bool on)
 {
-	mipi_csis_write(state, MIPI_CSIS_INTMSK, on ? 0xffffffff : 0);
+	mipi_csis_write(state, MIPI_CSIS_INT_MSK, on ? 0xffffffff : 0);
 }
 
 static void mipi_csis_sw_reset(struct csi_state *state)
@@ -486,13 +486,13 @@ static void mipi_csis_system_enable(struct csi_state *state, int on)
 		val &= ~MIPI_CSIS_CMN_CTRL_ENABLE;
 	mipi_csis_write(state, MIPI_CSIS_CMN_CTRL, val);
 
-	val = mipi_csis_read(state, MIPI_CSIS_DPHYCTRL);
-	val &= ~MIPI_CSIS_DPHYCTRL_ENABLE;
+	val = mipi_csis_read(state, MIPI_CSIS_DPHY_CMN_CTRL);
+	val &= ~MIPI_CSIS_DPHY_CMN_CTRL_ENABLE;
 	if (on) {
 		mask = (1 << (state->bus.num_data_lanes + 1)) - 1;
-		val |= (mask & MIPI_CSIS_DPHYCTRL_ENABLE);
+		val |= (mask & MIPI_CSIS_DPHY_CMN_CTRL_ENABLE);
 	}
-	mipi_csis_write(state, MIPI_CSIS_DPHYCTRL, val);
+	mipi_csis_write(state, MIPI_CSIS_DPHY_CMN_CTRL, val);
 }
 
 /* Called with the state.lock mutex held */
@@ -502,14 +502,14 @@ static void __mipi_csis_set_format(struct csi_state *state)
 	u32 val;
 
 	/* Color format */
-	val = mipi_csis_read(state, MIPI_CSIS_ISPCONFIG_CH(0));
+	val = mipi_csis_read(state, MIPI_CSIS_ISP_CONFIG_CH(0));
 	val &= ~(MIPI_CSIS_ISPCFG_ALIGN_32BIT | MIPI_CSIS_ISPCFG_FMT_MASK);
 	val |= state->csis_fmt->fmt_reg;
-	mipi_csis_write(state, MIPI_CSIS_ISPCONFIG_CH(0), val);
+	mipi_csis_write(state, MIPI_CSIS_ISP_CONFIG_CH(0), val);
 
 	/* Pixel resolution */
 	val = mf->width | (mf->height << 16);
-	mipi_csis_write(state, MIPI_CSIS_ISPRESOL_CH(0), val);
+	mipi_csis_write(state, MIPI_CSIS_ISP_RESOL_CH(0), val);
 }
 
 static int mipi_csis_calculate_params(struct csi_state *state)
@@ -558,13 +558,13 @@ static void mipi_csis_set_params(struct csi_state *state)
 
 	__mipi_csis_set_format(state);
 
-	mipi_csis_write(state, MIPI_CSIS_DPHYCTRL,
-			MIPI_CSIS_DPHYCTRL_HSSETTLE(state->hs_settle));
+	mipi_csis_write(state, MIPI_CSIS_DPHY_CMN_CTRL,
+			MIPI_CSIS_DPHY_CMN_CTRL_HSSETTLE(state->hs_settle));
 
-	val = (0 << MIPI_CSIS_ISPSYNC_HSYNC_LINTV_OFFSET) |
-		(0 << MIPI_CSIS_ISPSYNC_VSYNC_SINTV_OFFSET) |
-		(0 << MIPI_CSIS_ISPSYNC_VSYNC_EINTV_OFFSET);
-	mipi_csis_write(state, MIPI_CSIS_ISPSYNC_CH(0), val);
+	val = (0 << MIPI_CSIS_ISP_SYNC_HSYNC_LINTV_OFFSET)
+	    | (0 << MIPI_CSIS_ISP_SYNC_VSYNC_SINTV_OFFSET)
+	    | (0 << MIPI_CSIS_ISP_SYNC_VSYNC_EINTV_OFFSET);
+	mipi_csis_write(state, MIPI_CSIS_ISP_SYNC_CH(0), val);
 
 	val = mipi_csis_read(state, MIPI_CSIS_CLK_CTRL);
 	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC;
@@ -955,12 +955,12 @@ static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
 	unsigned int i;
 	u32 status;
 
-	status = mipi_csis_read(state, MIPI_CSIS_INTSRC);
+	status = mipi_csis_read(state, MIPI_CSIS_INT_SRC);
 
 	spin_lock_irqsave(&state->slock, flags);
 
 	/* Update the event/error counters */
-	if ((status & MIPI_CSIS_INTSRC_ERRORS) || state->debug) {
+	if ((status & MIPI_CSIS_INT_SRC_ERRORS) || state->debug) {
 		for (i = 0; i < MIPI_CSIS_NUM_EVENTS; i++) {
 			if (!(status & state->events[i].mask))
 				continue;
@@ -969,7 +969,7 @@ static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
 	}
 	spin_unlock_irqrestore(&state->slock, flags);
 
-	mipi_csis_write(state, MIPI_CSIS_INTSRC, status);
+	mipi_csis_write(state, MIPI_CSIS_INT_SRC, status);
 
 	return IRQ_HANDLED;
 }
-- 
Regards,

Laurent Pinchart

