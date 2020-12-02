Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CFA12CC4BD
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 19:15:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729054AbgLBSMv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 13:12:51 -0500
Received: from retiisi.eu ([95.216.213.190]:33490 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727454AbgLBSMu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 13:12:50 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 8AC80634CAA;
        Wed,  2 Dec 2020 20:08:32 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 21/38] ccs-pll: Add support flexible OP PLL pixel clock divider
Date:   Wed,  2 Dec 2020 20:06:24 +0200
Message-Id: <20201202180641.17401-22-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
References: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Flexible OP PLL pixel clock divider allows a higher OP pixel clock than
what the bus can transfer. This generally makes it easier to select pixel
clock dividers.

This changes how the pixel rate on the bus and minimum VT divisor are
calculated, as the pixel rate is no longer directly determined by the
OP pixel clock and the number of the lanes.

Also add a sanity check for sensors that do not support flexible OP PLL
pixel clock divider. This could have caused the PLL calculator to come up
with an invalid configuration for those devices.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c      | 26 +++++++++++++++++++-------
 drivers/media/i2c/ccs-pll.h      |  1 +
 drivers/media/i2c/ccs/ccs-core.c |  4 +++-
 3 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 60ab0c043c7a..e3a6493fd601 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -294,11 +294,11 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	 * Find absolute limits for the factor of vt divider.
 	 */
 	dev_dbg(dev, "scale_m: %u\n", pll->scale_m);
-	min_vt_div = DIV_ROUND_UP(op_pll_bk->pix_clk_div
-				  * op_pll_bk->sys_clk_div * pll->scale_n
-				  * pll->vt_lanes * l,
-				  pll->op_lanes * vt_op_binning_div
-				  * pll->scale_m);
+	min_vt_div = DIV_ROUND_UP(pll->bits_per_pixel * op_pll_bk->sys_clk_div
+				  * pll->scale_n * pll->vt_lanes,
+				  (pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL ?
+				   pll->csi2.lanes : 1)
+				  * vt_op_binning_div * pll->scale_m);
 
 	/* Find smallest and biggest allowed vt divisor. */
 	dev_dbg(dev, "min_vt_div: %u\n", min_vt_div);
@@ -420,6 +420,18 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 		pll->op_lanes = 1;
 		pll->vt_lanes = 1;
 	}
+
+	/*
+	 * Make sure op_pix_clk_div will be integer --- unless flexible
+	 * op_pix_clk_div is supported
+	 */
+	if (!(pll->flags & CCS_PLL_FLAG_FLEXIBLE_OP_PIX_CLK_DIV) &&
+	    (pll->bits_per_pixel * pll->op_lanes) % (pll->csi2.lanes * l)) {
+		dev_dbg(dev, "op_pix_clk_div not an integer (bpp %u, op lanes %u, lanes %u, l %u)\n",
+			pll->bits_per_pixel, pll->op_lanes, pll->csi2.lanes, l);
+		return -EINVAL;
+	}
+
 	dev_dbg(dev, "vt_lanes: %u\n", pll->vt_lanes);
 	dev_dbg(dev, "op_lanes: %u\n", pll->op_lanes);
 
@@ -449,9 +461,9 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	}
 
 	pll->pixel_rate_csi =
-		op_pll_bk->pix_clk_freq_hz
+		op_pll_bk->sys_clk_freq_hz
 		* (pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL ?
-		   pll->csi2.lanes : 1) / l;
+		   pll->csi2.lanes : 1) / pll->bits_per_pixel / l;
 
 	/* Figure out limits for OP pre-pll divider based on extclk */
 	dev_dbg(dev, "min / max op_pre_pll_clk_div: %u / %u\n",
diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
index 207822cf2324..1b5c20736fe8 100644
--- a/drivers/media/i2c/ccs-pll.h
+++ b/drivers/media/i2c/ccs-pll.h
@@ -26,6 +26,7 @@
 #define CCS_PLL_FLAG_LANE_SPEED_MODEL				BIT(2)
 #define CCS_PLL_FLAG_LINK_DECOUPLED				BIT(3)
 #define CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER				BIT(4)
+#define CCS_PLL_FLAG_FLEXIBLE_OP_PIX_CLK_DIV			BIT(5)
 
 /**
  * struct ccs_pll_branch_fr - CCS PLL configuration (front)
diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 83de43fa1880..95d274834f0e 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -30,7 +30,6 @@
 #include <media/v4l2-device.h>
 
 #include "ccs.h"
-#include "ccs-limits.h"
 
 #define CCS_ALIGN_DIM(dim, flags)	\
 	((flags) & V4L2_SEL_FLAG_GE	\
@@ -3223,6 +3222,9 @@ static int ccs_probe(struct i2c_client *client)
 	if (CCS_LIM(sensor, CLOCK_TREE_PLL_CAPABILITY) &
 	    CCS_CLOCK_TREE_PLL_CAPABILITY_EXT_DIVIDER)
 		sensor->pll.flags |= CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER;
+	if (CCS_LIM(sensor, CLOCK_TREE_PLL_CAPABILITY) &
+	    CCS_CLOCK_TREE_PLL_CAPABILITY_FLEXIBLE_OP_PIX_CLK_DIV)
+		sensor->pll.flags |= CCS_PLL_FLAG_FLEXIBLE_OP_PIX_CLK_DIV;
 	sensor->pll.op_bits_per_lane = CCS_LIM(sensor, OP_BITS_PER_LANE);
 	sensor->pll.ext_clk_freq_hz = sensor->hwcfg.ext_clk;
 	sensor->pll.scale_n = CCS_LIM(sensor, SCALER_N_MIN);
-- 
2.27.0

