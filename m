Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EDDA285B09
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728092AbgJGIql (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:46:41 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57044 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728027AbgJGIqO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:14 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 71A26634C99
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:21 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 079/106] ccs-pll: Split off VT subtree calculation
Date:   Wed,  7 Oct 2020 11:45:30 +0300
Message-Id: <20201007084557.25843-70-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Split off the VT sub clock tree calculation from the rest, into its own
function. Also call the op_pll_fr argument pll_fr, since soon these may
not be OP tree values.

This paves way for additional features in the future such as dual PLL
support.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 255 ++++++++++++++++++------------------
 1 file changed, 131 insertions(+), 124 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 0fa7c6f67195..3d43e737155f 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -149,130 +149,18 @@ static int check_all_bounds(struct device *dev,
 #define DPHY_CONST		16
 #define PHY_CONST_DIV		16
 
-/*
- * Heuristically guess the PLL tree for a given common multiplier and
- * divisor. Begin with the operational timing and continue to video
- * timing once operational timing has been verified.
- *
- * @mul is the PLL multiplier and @div is the common divisor
- * (pre_pll_clk_div and op_sys_clk_div combined). The final PLL
- * multiplier will be a multiple of @mul.
- *
- * @return Zero on success, error code on error.
- */
-static int
-__ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
-		    const struct ccs_pll_branch_limits_fr *op_lim_fr,
-		    const struct ccs_pll_branch_limits_bk *op_lim_bk,
-		    struct ccs_pll *pll, struct ccs_pll_branch_fr *op_pll_fr,
-		    struct ccs_pll_branch_bk *op_pll_bk, uint32_t mul,
-		    uint32_t div, uint32_t l, bool cphy, uint32_t phy_const)
+static void
+__ccs_pll_calculate_vt(struct device *dev, const struct ccs_pll_limits *lim,
+		       const struct ccs_pll_branch_limits_bk *op_lim_bk,
+		       struct ccs_pll *pll, struct ccs_pll_branch_fr *pll_fr,
+		       struct ccs_pll_branch_bk *op_pll_bk, bool cphy,
+		       uint32_t phy_const)
 {
 	uint32_t sys_div;
 	uint32_t best_pix_div = INT_MAX >> 1;
 	uint32_t vt_op_binning_div;
-	/*
-	 * Higher multipliers (and divisors) are often required than
-	 * necessitated by the external clock and the output clocks.
-	 * There are limits for all values in the clock tree. These
-	 * are the minimum and maximum multiplier for mul.
-	 */
-	uint32_t more_mul_min, more_mul_max;
-	uint32_t more_mul_factor;
 	uint32_t min_vt_div, max_vt_div, vt_div;
 	uint32_t min_sys_div, max_sys_div;
-	uint32_t i;
-
-	/*
-	 * Get pre_pll_clk_div so that our pll_op_clk_freq_hz won't be
-	 * too high.
-	 */
-	dev_dbg(dev, "op_pre_pll_clk_div %u\n", op_pll_fr->pre_pll_clk_div);
-
-	/* Don't go above max pll multiplier. */
-	more_mul_max = op_lim_fr->max_pll_multiplier / mul;
-	dev_dbg(dev, "more_mul_max: max_op_pll_multiplier check: %u\n",
-		more_mul_max);
-	/* Don't go above max pll op frequency. */
-	more_mul_max =
-		min_t(uint32_t,
-		      more_mul_max,
-		      op_lim_fr->max_pll_op_clk_freq_hz
-		      / (pll->ext_clk_freq_hz /
-			 op_pll_fr->pre_pll_clk_div * mul));
-	dev_dbg(dev, "more_mul_max: max_pll_op_clk_freq_hz check: %u\n",
-		more_mul_max);
-	/* Don't go above the division capability of op sys clock divider. */
-	more_mul_max = min(more_mul_max,
-			   op_lim_bk->max_sys_clk_div * op_pll_fr->pre_pll_clk_div
-			   / div);
-	dev_dbg(dev, "more_mul_max: max_op_sys_clk_div check: %u\n",
-		more_mul_max);
-	/* Ensure we won't go above max_pll_multiplier. */
-	more_mul_max = min(more_mul_max, op_lim_fr->max_pll_multiplier / mul);
-	dev_dbg(dev, "more_mul_max: min_pll_multiplier check: %u\n",
-		more_mul_max);
-
-	/* Ensure we won't go below min_pll_op_clk_freq_hz. */
-	more_mul_min = DIV_ROUND_UP(op_lim_fr->min_pll_op_clk_freq_hz,
-				    pll->ext_clk_freq_hz /
-				    op_pll_fr->pre_pll_clk_div * mul);
-	dev_dbg(dev, "more_mul_min: min_op_pll_op_clk_freq_hz check: %u\n",
-		more_mul_min);
-	/* Ensure we won't go below min_pll_multiplier. */
-	more_mul_min = max(more_mul_min,
-			   DIV_ROUND_UP(op_lim_fr->min_pll_multiplier, mul));
-	dev_dbg(dev, "more_mul_min: min_op_pll_multiplier check: %u\n",
-		more_mul_min);
-
-	if (more_mul_min > more_mul_max) {
-		dev_dbg(dev,
-			"unable to compute more_mul_min and more_mul_max\n");
-		return -EINVAL;
-	}
-
-	more_mul_factor = lcm(div, op_pll_fr->pre_pll_clk_div) / div;
-	dev_dbg(dev, "more_mul_factor: %u\n", more_mul_factor);
-	more_mul_factor = lcm(more_mul_factor, op_lim_bk->min_sys_clk_div);
-	dev_dbg(dev, "more_mul_factor: min_op_sys_clk_div: %d\n",
-		more_mul_factor);
-	i = roundup(more_mul_min, more_mul_factor);
-	if (!is_one_or_even(i))
-		i <<= 1;
-
-	dev_dbg(dev, "final more_mul: %u\n", i);
-	if (i > more_mul_max) {
-		dev_dbg(dev, "final more_mul is bad, max %u\n", more_mul_max);
-		return -EINVAL;
-	}
-
-	op_pll_fr->pll_multiplier = mul * i;
-	op_pll_bk->sys_clk_div = div * i / op_pll_fr->pre_pll_clk_div;
-	dev_dbg(dev, "op_sys_clk_div: %u\n", op_pll_bk->sys_clk_div);
-
-	op_pll_fr->pll_ip_clk_freq_hz = pll->ext_clk_freq_hz
-		/ op_pll_fr->pre_pll_clk_div;
-
-	op_pll_fr->pll_op_clk_freq_hz = op_pll_fr->pll_ip_clk_freq_hz
-		* op_pll_fr->pll_multiplier;
-
-	if (pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL)
-		op_pll_bk->pix_clk_div = pll->bits_per_pixel
-			* pll->op_lanes * phy_const
-			/ PHY_CONST_DIV / pll->csi2.lanes / l;
-	else
-		op_pll_bk->pix_clk_div =
-			pll->bits_per_pixel * phy_const / PHY_CONST_DIV / l;
-
-	op_pll_bk->pix_clk_freq_hz =
-		op_pll_bk->sys_clk_freq_hz / op_pll_bk->pix_clk_div;
-
-	dev_dbg(dev, "op_pix_clk_div: %u\n", op_pll_bk->pix_clk_div);
-
-	if (pll->flags & CCS_PLL_FLAG_NO_OP_CLOCKS) {
-		/* No OP clocks --- VT clocks are used instead. */
-		goto out_skip_vt_calc;
-	}
 
 	/*
 	 * Some sensors perform analogue binning and some do this
@@ -310,7 +198,7 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	/* Find smallest and biggest allowed vt divisor. */
 	dev_dbg(dev, "min_vt_div: %u\n", min_vt_div);
 	min_vt_div = max(min_vt_div,
-			 DIV_ROUND_UP(op_pll_fr->pll_op_clk_freq_hz,
+			 DIV_ROUND_UP(pll_fr->pll_op_clk_freq_hz,
 				      lim->vt_bk.max_pix_clk_freq_hz));
 	dev_dbg(dev, "min_vt_div: max_vt_pix_clk_freq_hz: %u\n",
 		min_vt_div);
@@ -322,7 +210,7 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	max_vt_div = lim->vt_bk.max_sys_clk_div * lim->vt_bk.max_pix_clk_div;
 	dev_dbg(dev, "max_vt_div: %u\n", max_vt_div);
 	max_vt_div = min(max_vt_div,
-			 DIV_ROUND_UP(op_pll_fr->pll_op_clk_freq_hz,
+			 DIV_ROUND_UP(pll_fr->pll_op_clk_freq_hz,
 				      lim->vt_bk.min_pix_clk_freq_hz));
 	dev_dbg(dev, "max_vt_div: min_vt_pix_clk_freq_hz: %u\n",
 		max_vt_div);
@@ -338,7 +226,7 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 				       lim->vt_bk.max_pix_clk_div));
 	dev_dbg(dev, "min_sys_div: max_vt_pix_clk_div: %u\n", min_sys_div);
 	min_sys_div = max(min_sys_div,
-			  op_pll_fr->pll_op_clk_freq_hz
+			  pll_fr->pll_op_clk_freq_hz
 			  / lim->vt_bk.max_sys_clk_freq_hz);
 	dev_dbg(dev, "min_sys_div: max_pll_op_clk_freq_hz: %u\n", min_sys_div);
 	min_sys_div = clk_div_even_up(min_sys_div);
@@ -351,7 +239,7 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 				       lim->vt_bk.min_pix_clk_div));
 	dev_dbg(dev, "max_sys_div: min_vt_pix_clk_div: %u\n", max_sys_div);
 	max_sys_div = min(max_sys_div,
-			  DIV_ROUND_UP(op_pll_fr->pll_op_clk_freq_hz,
+			  DIV_ROUND_UP(pll_fr->pll_op_clk_freq_hz,
 				       lim->vt_bk.min_pix_clk_freq_hz));
 	dev_dbg(dev, "max_sys_div: min_vt_pix_clk_freq_hz: %u\n", max_sys_div);
 
@@ -396,11 +284,130 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	pll->vt_bk.pix_clk_div = best_pix_div;
 
 	pll->vt_bk.sys_clk_freq_hz =
-		op_pll_fr->pll_op_clk_freq_hz / pll->vt_bk.sys_clk_div;
+		pll_fr->pll_op_clk_freq_hz / pll->vt_bk.sys_clk_div;
 	pll->vt_bk.pix_clk_freq_hz =
 		pll->vt_bk.sys_clk_freq_hz / pll->vt_bk.pix_clk_div;
+}
+
+/*
+ * Heuristically guess the PLL tree for a given common multiplier and
+ * divisor. Begin with the operational timing and continue to video
+ * timing once operational timing has been verified.
+ *
+ * @mul is the PLL multiplier and @div is the common divisor
+ * (pre_pll_clk_div and op_sys_clk_div combined). The final PLL
+ * multiplier will be a multiple of @mul.
+ *
+ * @return Zero on success, error code on error.
+ */
+static int
+__ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
+		    const struct ccs_pll_branch_limits_fr *op_lim_fr,
+		    const struct ccs_pll_branch_limits_bk *op_lim_bk,
+		    struct ccs_pll *pll, struct ccs_pll_branch_fr *op_pll_fr,
+		    struct ccs_pll_branch_bk *op_pll_bk, uint32_t mul,
+		    uint32_t div, uint32_t l, bool cphy, uint32_t phy_const)
+{
+	/*
+	 * Higher multipliers (and divisors) are often required than
+	 * necessitated by the external clock and the output clocks.
+	 * There are limits for all values in the clock tree. These
+	 * are the minimum and maximum multiplier for mul.
+	 */
+	uint32_t more_mul_min, more_mul_max;
+	uint32_t more_mul_factor;
+	uint32_t i;
+
+	/*
+	 * Get pre_pll_clk_div so that our pll_op_clk_freq_hz won't be
+	 * too high.
+	 */
+	dev_dbg(dev, "op_pre_pll_clk_div %u\n", op_pll_fr->pre_pll_clk_div);
+
+	/* Don't go above max pll multiplier. */
+	more_mul_max = op_lim_fr->max_pll_multiplier / mul;
+	dev_dbg(dev, "more_mul_max: max_op_pll_multiplier check: %u\n",
+		more_mul_max);
+	/* Don't go above max pll op frequency. */
+	more_mul_max =
+		min_t(uint32_t,
+		      more_mul_max,
+		      op_lim_fr->max_pll_op_clk_freq_hz
+		      / (pll->ext_clk_freq_hz /
+			 op_pll_fr->pre_pll_clk_div * mul));
+	dev_dbg(dev, "more_mul_max: max_pll_op_clk_freq_hz check: %u\n",
+		more_mul_max);
+	/* Don't go above the division capability of op sys clock divider. */
+	more_mul_max = min(more_mul_max,
+			   op_lim_bk->max_sys_clk_div * op_pll_fr->pre_pll_clk_div
+			   / div);
+	dev_dbg(dev, "more_mul_max: max_op_sys_clk_div check: %u\n",
+		more_mul_max);
+	/* Ensure we won't go above max_pll_multiplier. */
+	more_mul_max = min(more_mul_max, op_lim_fr->max_pll_multiplier / mul);
+	dev_dbg(dev, "more_mul_max: min_pll_multiplier check: %u\n",
+		more_mul_max);
+
+	/* Ensure we won't go below min_pll_op_clk_freq_hz. */
+	more_mul_min = DIV_ROUND_UP(op_lim_fr->min_pll_op_clk_freq_hz,
+				    pll->ext_clk_freq_hz /
+				    op_pll_fr->pre_pll_clk_div * mul);
+	dev_dbg(dev, "more_mul_min: min_op_pll_op_clk_freq_hz check: %u\n",
+		more_mul_min);
+	/* Ensure we won't go below min_pll_multiplier. */
+	more_mul_min = max(more_mul_min,
+			   DIV_ROUND_UP(op_lim_fr->min_pll_multiplier, mul));
+	dev_dbg(dev, "more_mul_min: min_op_pll_multiplier check: %u\n",
+		more_mul_min);
+
+	if (more_mul_min > more_mul_max) {
+		dev_dbg(dev,
+			"unable to compute more_mul_min and more_mul_max\n");
+		return -EINVAL;
+	}
+
+	more_mul_factor = lcm(div, op_pll_fr->pre_pll_clk_div) / div;
+	dev_dbg(dev, "more_mul_factor: %u\n", more_mul_factor);
+	more_mul_factor = lcm(more_mul_factor, op_lim_bk->min_sys_clk_div);
+	dev_dbg(dev, "more_mul_factor: min_op_sys_clk_div: %d\n",
+		more_mul_factor);
+	i = roundup(more_mul_min, more_mul_factor);
+	if (!is_one_or_even(i))
+		i <<= 1;
+
+	dev_dbg(dev, "final more_mul: %u\n", i);
+	if (i > more_mul_max) {
+		dev_dbg(dev, "final more_mul is bad, max %u\n", more_mul_max);
+		return -EINVAL;
+	}
+
+	op_pll_fr->pll_multiplier = mul * i;
+	op_pll_bk->sys_clk_div = div * i / op_pll_fr->pre_pll_clk_div;
+	dev_dbg(dev, "op_sys_clk_div: %u\n", op_pll_bk->sys_clk_div);
+
+	op_pll_fr->pll_ip_clk_freq_hz = pll->ext_clk_freq_hz
+		/ op_pll_fr->pre_pll_clk_div;
+
+	op_pll_fr->pll_op_clk_freq_hz = op_pll_fr->pll_ip_clk_freq_hz
+		* op_pll_fr->pll_multiplier;
+
+	if (pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL)
+		op_pll_bk->pix_clk_div = pll->bits_per_pixel
+			* pll->op_lanes * phy_const
+			/ PHY_CONST_DIV / pll->csi2.lanes / l;
+	else
+		op_pll_bk->pix_clk_div =
+			pll->bits_per_pixel * phy_const / PHY_CONST_DIV / l;
+
+	op_pll_bk->pix_clk_freq_hz =
+		op_pll_bk->sys_clk_freq_hz / op_pll_bk->pix_clk_div;
+
+	dev_dbg(dev, "op_pix_clk_div: %u\n", op_pll_bk->pix_clk_div);
+
+	if (!(pll->flags & CCS_PLL_FLAG_NO_OP_CLOCKS))
+		__ccs_pll_calculate_vt(dev, lim, op_lim_bk, pll, op_pll_fr,
+				       op_pll_bk, cphy, phy_const);
 
-out_skip_vt_calc:
 	pll->pixel_rate_pixel_array =
 		pll->vt_bk.pix_clk_freq_hz * pll->vt_lanes;
 
-- 
2.27.0

