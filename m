Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFE0027ECA3
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731043AbgI3P3O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:14 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44644 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731014AbgI3P3N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:13 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 0C340634CEC
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:52 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 067/100] ccs-pll: Add support for decoupled OP domain calculation
Date:   Wed, 30 Sep 2020 18:28:25 +0300
Message-Id: <20200930152858.8471-68-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for decoupled OP domain clock calculation. This means that the
number of VT and OP domain clocks are no longer dependent on the number of
CSI-2 lanes in the lane speed mode.

The support also replaces the existing quirk flag to calculate OP domain
clocks per lane.

Also support decoupled OP domain calculation in the CCS driver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c       | 22 +++++++---------------
 drivers/media/i2c/ccs-pll.h       |  1 +
 drivers/media/i2c/ccs/ccs-core.c  | 14 +++++++++++---
 drivers/media/i2c/ccs/ccs-quirk.c |  5 ++++-
 4 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index c8222ee29421..c95a03ffce59 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -162,7 +162,7 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 		    const struct ccs_pll_branch_limits_bk *op_lim_bk,
 		    struct ccs_pll *pll, struct ccs_pll_branch_fr *op_pll_fr,
 		    struct ccs_pll_branch_bk *op_pll_bk, uint32_t mul,
-		    uint32_t div, uint32_t lane_op_clock_ratio)
+		    uint32_t div)
 {
 	uint32_t sys_div;
 	uint32_t best_pix_div = INT_MAX >> 1;
@@ -194,7 +194,8 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 		min_t(uint32_t,
 		      more_mul_max,
 		      op_lim_fr->max_pll_op_clk_freq_hz
-		      / (pll->ext_clk_freq_hz / op_pll_fr->pre_pll_clk_div * mul));
+		      / (pll->ext_clk_freq_hz /
+			 op_pll_fr->pre_pll_clk_div * mul));
 	dev_dbg(dev, "more_mul_max: max_pll_op_clk_freq_hz check: %u\n",
 		more_mul_max);
 	/* Don't go above the division capability of op sys clock divider. */
@@ -257,7 +258,6 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 		op_pll_bk->sys_clk_freq_hz / op_pll_bk->pix_clk_div;
 	dev_dbg(dev, "op_pix_clk_div: %u\n", op_pll_bk->pix_clk_div);
 
-
 	if (pll->flags & CCS_PLL_FLAG_NO_OP_CLOCKS) {
 		/* No OP clocks --- VT clocks are used instead. */
 		goto out_skip_vt_calc;
@@ -293,7 +293,7 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 				  * op_pll_bk->sys_clk_div * pll->scale_n
 				  * pll->vt_lanes,
 				  pll->op_lanes * vt_op_binning_div
-				  * pll->scale_m * lane_op_clock_ratio);
+				  * pll->scale_m);
 
 	/* Find smallest and biggest allowed vt divisor. */
 	dev_dbg(dev, "min_vt_div: %u\n", min_vt_div);
@@ -405,7 +405,6 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	struct ccs_pll_branch_bk *op_pll_bk = &pll->op_bk;
 	uint16_t min_op_pre_pll_clk_div;
 	uint16_t max_op_pre_pll_clk_div;
-	uint32_t lane_op_clock_ratio;
 	uint32_t mul, div;
 	uint32_t i;
 	int rval = -EINVAL;
@@ -428,12 +427,6 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 		op_pll_bk = &pll->vt_bk;
 	}
 
-	if (pll->flags & CCS_PLL_FLAG_OP_PIX_CLOCK_PER_LANE)
-		lane_op_clock_ratio = pll->csi2.lanes;
-	else
-		lane_op_clock_ratio = 1;
-	dev_dbg(dev, "lane_op_clock_ratio: %u\n", lane_op_clock_ratio);
-
 	dev_dbg(dev, "binning: %ux%u\n", pll->binning_horizontal,
 		pll->binning_vertical);
 
@@ -442,7 +435,7 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 		/* CSI transfers 2 bits per clock per lane; thus times 2 */
 		op_pll_bk->sys_clk_freq_hz = pll->link_freq * 2
 			* (pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL ?
-			   1 : pll->csi2.lanes) / lane_op_clock_ratio;
+			   1 : pll->csi2.lanes);
 		break;
 	default:
 		return -EINVAL;
@@ -451,7 +444,7 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	pll->pixel_rate_csi =
 		op_pll_bk->pix_clk_freq_hz
 		* (pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL ?
-		   pll->csi2.lanes : 1) * lane_op_clock_ratio;
+		   pll->csi2.lanes : 1);
 
 	/* Figure out limits for OP pre-pll divider based on extclk */
 	dev_dbg(dev, "min / max op_pre_pll_clk_div: %u / %u\n",
@@ -487,8 +480,7 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	     op_pll_fr->pre_pll_clk_div <= max_op_pre_pll_clk_div;
 	     op_pll_fr->pre_pll_clk_div += 2 - (op_pll_fr->pre_pll_clk_div & 1)) {
 		rval = __ccs_pll_calculate(dev, lim, op_lim_fr, op_lim_bk, pll,
-					   op_pll_fr, op_pll_bk, mul, div,
-					   lane_op_clock_ratio);
+					   op_pll_fr, op_pll_bk, mul, div);
 		if (rval)
 			continue;
 
diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
index 57308b8f3a8a..165de20af079 100644
--- a/drivers/media/i2c/ccs-pll.h
+++ b/drivers/media/i2c/ccs-pll.h
@@ -24,6 +24,7 @@
 #define CCS_PLL_FLAG_NO_OP_CLOCKS				BIT(1)
 /* CCS PLL flags */
 #define CCS_PLL_FLAG_LANE_SPEED_MODEL				BIT(2)
+#define CCS_PLL_FLAG_LINK_DECOUPLED				BIT(3)
 
 /**
  * struct ccs_pll_branch_fr - CCS PLL configuration (front)
diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 3250cca45a90..8b328ade055c 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3185,10 +3185,18 @@ static int ccs_probe(struct i2c_client *client)
 	sensor->pll.csi2.lanes = sensor->hwcfg.lanes;
 	if (CCS_LIM(sensor, CLOCK_CALCULATION) &
 	    CCS_CLOCK_CALCULATION_LANE_SPEED) {
-		sensor->pll.vt_lanes =
-			CCS_LIM(sensor, NUM_OF_VT_LANES) + 1;
-		sensor->pll.op_lanes = sensor->pll.vt_lanes;
 		sensor->pll.flags |= CCS_PLL_FLAG_LANE_SPEED_MODEL;
+		if (CCS_LIM(sensor, CLOCK_CALCULATION) &
+		    CCS_CLOCK_CALCULATION_LINK_DECOUPLED) {
+			sensor->pll.vt_lanes =
+				CCS_LIM(sensor, NUM_OF_VT_LANES) + 1;
+			sensor->pll.op_lanes =
+				CCS_LIM(sensor, NUM_OF_OP_LANES) + 1;
+			sensor->pll.flags |= CCS_PLL_FLAG_LINK_DECOUPLED;
+		} else {
+			sensor->pll.vt_lanes = sensor->pll.csi2.lanes;
+			sensor->pll.op_lanes = sensor->pll.csi2.lanes;
+		}
 	}
 	sensor->pll.ext_clk_freq_hz = sensor->hwcfg.ext_clk;
 	sensor->pll.scale_n = CCS_LIM(sensor, SCALER_N_MIN);
diff --git a/drivers/media/i2c/ccs/ccs-quirk.c b/drivers/media/i2c/ccs/ccs-quirk.c
index 4fe8c6f70579..e3d4c7a275bc 100644
--- a/drivers/media/i2c/ccs/ccs-quirk.c
+++ b/drivers/media/i2c/ccs/ccs-quirk.c
@@ -190,7 +190,10 @@ static int jt8ev1_post_streamoff(struct ccs_sensor *sensor)
 
 static int jt8ev1_init(struct ccs_sensor *sensor)
 {
-	sensor->pll.flags |= CCS_PLL_FLAG_OP_PIX_CLOCK_PER_LANE;
+	sensor->pll.flags |= CCS_PLL_FLAG_LANE_SPEED_MODEL |
+		CCS_PLL_FLAG_LINK_DECOUPLED;
+	sensor->pll.vt_lanes = 1;
+	sensor->pll.op_lanes = sensor->pll.csi2.lanes;
 
 	return 0;
 }
-- 
2.27.0

