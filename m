Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC7982CC4CB
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 19:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389149AbgLBSOJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 13:14:09 -0500
Received: from retiisi.eu ([95.216.213.190]:33496 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387739AbgLBSOI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 13:14:08 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id D100E634CC0;
        Wed,  2 Dec 2020 20:08:32 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 25/38] ccs-pll: Check for derating and overrating, support non-derating sensors
Date:   Wed,  2 Dec 2020 20:06:28 +0200
Message-Id: <20201202180641.17401-26-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
References: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some sensors support derating (VT domain speed faster than OP) or
overrating (VT domain speed slower than OP). While this was supported for
the driver, the hardware support for the feature was never verified. Do
that now, and for those devices without that support, VT and OP speeds
have to match.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c      | 84 +++++++++++++++++++++-----------
 drivers/media/i2c/ccs-pll.h      |  2 +
 drivers/media/i2c/ccs/ccs-core.c |  7 +++
 3 files changed, 64 insertions(+), 29 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 3d43e737155f..96eb71f16c81 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -142,6 +142,18 @@ static int check_all_bounds(struct device *dev,
 			lim->vt_bk.max_pix_clk_freq_hz,
 			"vt_pix_clk_freq_hz");
 
+	if (!(pll->flags & CCS_PLL_FLAG_FIFO_DERATING) &&
+	    pll->pixel_rate_pixel_array > pll->pixel_rate_csi) {
+		dev_dbg(dev, "device does not support derating\n");
+		return -EINVAL;
+	}
+
+	if (!(pll->flags & CCS_PLL_FLAG_FIFO_OVERRATING) &&
+	    pll->pixel_rate_pixel_array < pll->pixel_rate_csi) {
+		dev_dbg(dev, "device does not support overrating\n");
+		return -EINVAL;
+	}
+
 	return rval;
 }
 
@@ -163,37 +175,51 @@ __ccs_pll_calculate_vt(struct device *dev, const struct ccs_pll_limits *lim,
 	uint32_t min_sys_div, max_sys_div;
 
 	/*
-	 * Some sensors perform analogue binning and some do this
-	 * digitally. The ones doing this digitally can be roughly be
-	 * found out using this formula. The ones doing this digitally
-	 * should run at higher clock rate, so smaller divisor is used
-	 * on video timing side.
+	 * Find out whether a sensor supports derating. If it does not, VT and
+	 * OP domains are required to run at the same pixel rate.
 	 */
-	if (lim->min_line_length_pck_bin > lim->min_line_length_pck
-	    / pll->binning_horizontal)
-		vt_op_binning_div = pll->binning_horizontal;
-	else
-		vt_op_binning_div = 1;
-	dev_dbg(dev, "vt_op_binning_div: %u\n", vt_op_binning_div);
+	if (!(pll->flags & CCS_PLL_FLAG_FIFO_DERATING)) {
+		min_vt_div =
+			op_pll_bk->sys_clk_div * op_pll_bk->pix_clk_div
+			* pll->vt_lanes * phy_const
+			/ pll->op_lanes / PHY_CONST_DIV;
+	} else {
+		/*
+		 * Some sensors perform analogue binning and some do this
+		 * digitally. The ones doing this digitally can be roughly be
+		 * found out using this formula. The ones doing this digitally
+		 * should run at higher clock rate, so smaller divisor is used
+		 * on video timing side.
+		 */
+		if (lim->min_line_length_pck_bin > lim->min_line_length_pck
+		    / pll->binning_horizontal)
+			vt_op_binning_div = pll->binning_horizontal;
+		else
+			vt_op_binning_div = 1;
+		dev_dbg(dev, "vt_op_binning_div: %u\n", vt_op_binning_div);
 
-	/*
-	 * Profile 2 supports vt_pix_clk_div E [4, 10]
-	 *
-	 * Horizontal binning can be used as a base for difference in
-	 * divisors. One must make sure that horizontal blanking is
-	 * enough to accommodate the CSI-2 sync codes.
-	 *
-	 * Take scaling factor and number of VT lanes into account as well.
-	 *
-	 * Find absolute limits for the factor of vt divider.
-	 */
-	dev_dbg(dev, "scale_m: %u\n", pll->scale_m);
-	min_vt_div = DIV_ROUND_UP(pll->bits_per_pixel * op_pll_bk->sys_clk_div
-				  * pll->scale_n * pll->vt_lanes * phy_const,
-				  (pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL ?
-				   pll->csi2.lanes : 1)
-				  * vt_op_binning_div * pll->scale_m
-				  * PHY_CONST_DIV);
+		/*
+		 * Profile 2 supports vt_pix_clk_div E [4, 10]
+		 *
+		 * Horizontal binning can be used as a base for difference in
+		 * divisors. One must make sure that horizontal blanking is
+		 * enough to accommodate the CSI-2 sync codes.
+		 *
+		 * Take scaling factor and number of VT lanes into account as well.
+		 *
+		 * Find absolute limits for the factor of vt divider.
+		 */
+		dev_dbg(dev, "scale_m: %u\n", pll->scale_m);
+		min_vt_div =
+			DIV_ROUND_UP(pll->bits_per_pixel
+				     * op_pll_bk->sys_clk_div * pll->scale_n
+				     * pll->vt_lanes * phy_const,
+				     (pll->flags &
+				      CCS_PLL_FLAG_LANE_SPEED_MODEL ?
+				      pll->csi2.lanes : 1)
+				     * vt_op_binning_div * pll->scale_m
+				     * PHY_CONST_DIV);
+	}
 
 	/* Find smallest and biggest allowed vt divisor. */
 	dev_dbg(dev, "min_vt_div: %u\n", min_vt_div);
diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
index 1b5c20736fe8..03c2428c76cd 100644
--- a/drivers/media/i2c/ccs-pll.h
+++ b/drivers/media/i2c/ccs-pll.h
@@ -27,6 +27,8 @@
 #define CCS_PLL_FLAG_LINK_DECOUPLED				BIT(3)
 #define CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER				BIT(4)
 #define CCS_PLL_FLAG_FLEXIBLE_OP_PIX_CLK_DIV			BIT(5)
+#define CCS_PLL_FLAG_FIFO_DERATING				BIT(6)
+#define CCS_PLL_FLAG_FIFO_OVERRATING				BIT(7)
 
 /**
  * struct ccs_pll_branch_fr - CCS PLL configuration (front)
diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 95d274834f0e..849c1001e3cc 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3225,6 +3225,13 @@ static int ccs_probe(struct i2c_client *client)
 	if (CCS_LIM(sensor, CLOCK_TREE_PLL_CAPABILITY) &
 	    CCS_CLOCK_TREE_PLL_CAPABILITY_FLEXIBLE_OP_PIX_CLK_DIV)
 		sensor->pll.flags |= CCS_PLL_FLAG_FLEXIBLE_OP_PIX_CLK_DIV;
+	if (CCS_LIM(sensor, FIFO_SUPPORT_CAPABILITY) &
+	    CCS_FIFO_SUPPORT_CAPABILITY_DERATING)
+		sensor->pll.flags |= CCS_PLL_FLAG_FIFO_DERATING;
+	if (CCS_LIM(sensor, FIFO_SUPPORT_CAPABILITY) &
+	    CCS_FIFO_SUPPORT_CAPABILITY_DERATING_OVERRATING)
+		sensor->pll.flags |= CCS_PLL_FLAG_FIFO_DERATING |
+				     CCS_PLL_FLAG_FIFO_OVERRATING;
 	sensor->pll.op_bits_per_lane = CCS_LIM(sensor, OP_BITS_PER_LANE);
 	sensor->pll.ext_clk_freq_hz = sensor->hwcfg.ext_clk;
 	sensor->pll.scale_n = CCS_LIM(sensor, SCALER_N_MIN);
-- 
2.27.0

