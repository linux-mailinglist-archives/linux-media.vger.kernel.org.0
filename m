Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA7231B4DC
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:41:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhBOEk4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:40:56 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46076 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbhBOEky (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:40:54 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F09122D33;
        Mon, 15 Feb 2021 05:29:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363350;
        bh=AUX0OIWg4GCE74zdPOg9KPVURjmHUg5TA1tnvQhe8R0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jlc3Zl2XmxC3DlAoDXd497Zk/fPBajJCoJsdH/Wr+O5iZToD/SFLBEXIzzlmBLmQO
         YK7ZdmSPBI7DFE2aM80LjIwSFb/QHxxXD1uwKPA7pXDX2Fmycl7nfHo7hq8+GO+Zk4
         t63c9HWnVIdoRZJrJxDg0S3GSOqGw5MBGqbhaKJs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 76/77] media: imx: imx7_mipi_csis: Use register macros in mipi_csis_dump_regs()
Date:   Mon, 15 Feb 2021 06:27:40 +0200
Message-Id: <20210215042741.28850-77-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace hardcoded register addresses in the MIPI_CSIS_DBG_CTRL()
function with macros. While at it, update the printed name of the
registers to match the datasheet, and short them by address.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
Changes since v1:

- Define MIPI_CSIS_DBG_CTRL
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 25 ++++++++++++----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index aaf66ec630eb..6bf8f0daae94 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -188,6 +188,9 @@
 #define MIPI_CSIS_ISP_SYNC_VSYNC_SINTV_OFFSET	12
 #define MIPI_CSIS_ISP_SYNC_VSYNC_EINTV_OFFSET	0
 
+/* Debug control register */
+#define MIPI_CSIS_DBG_CTRL			0xc0
+
 /* Non-image packet data buffers */
 #define MIPI_CSIS_PKTDATA_ODD			0x2000
 #define MIPI_CSIS_PKTDATA_EVEN			0x3000
@@ -399,23 +402,23 @@ static int mipi_csis_dump_regs(struct csi_state *state)
 		u32 offset;
 		const char * const name;
 	} registers[] = {
-		{ 0x04, "CTRL" },
-		{ 0x24, "DPHYCTRL" },
-		{ 0x08, "CLKCTRL" },
-		{ 0x20, "DPHYSTS" },
-		{ 0x10, "INTMSK" },
-		{ 0x40, "CONFIG_CH0" },
-		{ 0x44, "RESOL_CH0" },
-		{ 0xC0, "DBG_CONFIG" },
-		{ 0x38, "DPHYSLAVE_L" },
-		{ 0x3C, "DPHYSLAVE_H" },
+		{ MIPI_CSIS_CMN_CTRL, "CMN_CTRL" },
+		{ MIPI_CSIS_CLK_CTRL, "CLK_CTRL" },
+		{ MIPI_CSIS_INT_MSK, "INT_MSK" },
+		{ MIPI_CSIS_DPHY_STATUS, "DPHY_STATUS" },
+		{ MIPI_CSIS_DPHY_CMN_CTRL, "DPHY_CMN_CTRL" },
+		{ MIPI_CSIS_DPHY_SCTRL_L, "DPHY_SCTRL_L" },
+		{ MIPI_CSIS_DPHY_SCTRL_H, "DPHY_SCTRL_H" },
+		{ MIPI_CSIS_ISP_CONFIG_CH(0), "ISP_CONFIG_CH0" },
+		{ MIPI_CSIS_ISP_RESOL_CH(0), "ISP_RESOL_CH0" },
+		{ MIPI_CSIS_DBG_CTRL, "DBG_CTRL" },
 	};
 
 	dev_info(dev, "--- REGISTERS ---\n");
 
 	for (i = 0; i < ARRAY_SIZE(registers); i++) {
 		cfg = mipi_csis_read(state, registers[i].offset);
-		dev_info(dev, "%12s: 0x%08x\n", registers[i].name, cfg);
+		dev_info(dev, "%14s: 0x%08x\n", registers[i].name, cfg);
 	}
 
 	return 0;
-- 
Regards,

Laurent Pinchart

