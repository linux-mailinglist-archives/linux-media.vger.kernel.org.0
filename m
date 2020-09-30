Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0616C27EC9E
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731026AbgI3P3M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:12 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44680 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730993AbgI3P3L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:11 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id DF77E634CDC
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:50 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 051/100] ccs-pll: Split limits and PLL configuration into front and back parts
Date:   Wed, 30 Sep 2020 18:28:09 +0300
Message-Id: <20200930152858.8471-52-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CCS spec supports a lot of variation in the PLL. Split the PLL in
front and back parts to better prepare for supporting it.

Also use CCS compliant naming for IP and OP PLL frequencies (i.e. include
"clk" in the name).

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c      | 282 ++++++++++++++++---------------
 drivers/media/i2c/ccs-pll.h      |  44 +++--
 drivers/media/i2c/ccs/ccs-core.c |  71 ++++----
 3 files changed, 209 insertions(+), 188 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index ccd850a44ae4..dd30949efb6b 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -53,65 +53,68 @@ static int bounds_check(struct device *dev, uint32_t val,
 
 static void print_pll(struct device *dev, struct ccs_pll *pll)
 {
-	dev_dbg(dev, "pre_pll_clk_div\t%u\n",  pll->pre_pll_clk_div);
-	dev_dbg(dev, "pll_multiplier \t%u\n",  pll->pll_multiplier);
+	dev_dbg(dev, "pre_pll_clk_div\t%u\n",  pll->vt_fr.pre_pll_clk_div);
+	dev_dbg(dev, "pll_multiplier \t%u\n",  pll->vt_fr.pll_multiplier);
 	if (!(pll->flags & CCS_PLL_FLAG_NO_OP_CLOCKS)) {
-		dev_dbg(dev, "op_sys_clk_div \t%u\n", pll->op.sys_clk_div);
-		dev_dbg(dev, "op_pix_clk_div \t%u\n", pll->op.pix_clk_div);
+		dev_dbg(dev, "op_sys_clk_div \t%u\n", pll->op_bk.sys_clk_div);
+		dev_dbg(dev, "op_pix_clk_div \t%u\n", pll->op_bk.pix_clk_div);
 	}
-	dev_dbg(dev, "vt_sys_clk_div \t%u\n",  pll->vt.sys_clk_div);
-	dev_dbg(dev, "vt_pix_clk_div \t%u\n",  pll->vt.pix_clk_div);
+	dev_dbg(dev, "vt_sys_clk_div \t%u\n",  pll->vt_bk.sys_clk_div);
+	dev_dbg(dev, "vt_pix_clk_div \t%u\n",  pll->vt_bk.pix_clk_div);
 
 	dev_dbg(dev, "ext_clk_freq_hz \t%u\n", pll->ext_clk_freq_hz);
-	dev_dbg(dev, "pll_ip_clk_freq_hz \t%u\n", pll->pll_ip_clk_freq_hz);
-	dev_dbg(dev, "pll_op_clk_freq_hz \t%u\n", pll->pll_op_clk_freq_hz);
+	dev_dbg(dev, "pll_ip_clk_freq_hz \t%u\n", pll->vt_fr.pll_ip_clk_freq_hz);
+	dev_dbg(dev, "pll_op_clk_freq_hz \t%u\n", pll->vt_fr.pll_op_clk_freq_hz);
 	if (!(pll->flags & CCS_PLL_FLAG_NO_OP_CLOCKS)) {
 		dev_dbg(dev, "op_sys_clk_freq_hz \t%u\n",
-			pll->op.sys_clk_freq_hz);
+			pll->op_bk.sys_clk_freq_hz);
 		dev_dbg(dev, "op_pix_clk_freq_hz \t%u\n",
-			pll->op.pix_clk_freq_hz);
+			pll->op_bk.pix_clk_freq_hz);
 	}
-	dev_dbg(dev, "vt_sys_clk_freq_hz \t%u\n", pll->vt.sys_clk_freq_hz);
-	dev_dbg(dev, "vt_pix_clk_freq_hz \t%u\n", pll->vt.pix_clk_freq_hz);
+	dev_dbg(dev, "vt_sys_clk_freq_hz \t%u\n", pll->vt_bk.sys_clk_freq_hz);
+	dev_dbg(dev, "vt_pix_clk_freq_hz \t%u\n", pll->vt_bk.pix_clk_freq_hz);
 }
 
 static int check_all_bounds(struct device *dev,
-			    const struct ccs_pll_limits *limits,
-			    const struct ccs_pll_branch_limits *op_limits,
-			    struct ccs_pll *pll, struct ccs_pll_branch *op_pll)
+			    const struct ccs_pll_limits *lim,
+			    const struct ccs_pll_branch_limits_fr *op_lim_fr,
+			    const struct ccs_pll_branch_limits_bk *op_lim_bk,
+			    struct ccs_pll *pll,
+			    struct ccs_pll_branch_fr *op_pll_fr,
+			    struct ccs_pll_branch_bk *op_pll_bk)
 {
 	int rval;
 
-	rval = bounds_check(dev, pll->pll_ip_clk_freq_hz,
-			    limits->min_pll_ip_freq_hz,
-			    limits->max_pll_ip_freq_hz,
+	rval = bounds_check(dev, op_pll_fr->pll_ip_clk_freq_hz,
+			    op_lim_fr->min_pll_ip_clk_freq_hz,
+			    op_lim_fr->max_pll_ip_clk_freq_hz,
 			    "pll_ip_clk_freq_hz");
 	if (!rval)
 		rval = bounds_check(
-			dev, pll->pll_multiplier,
-			limits->min_pll_multiplier, limits->max_pll_multiplier,
-			"pll_multiplier");
+			dev, op_pll_fr->pll_multiplier,
+			op_lim_fr->min_pll_multiplier,
+			op_lim_fr->max_pll_multiplier, "pll_multiplier");
 	if (!rval)
 		rval = bounds_check(
-			dev, pll->pll_op_clk_freq_hz,
-			limits->min_pll_op_freq_hz, limits->max_pll_op_freq_hz,
-			"pll_op_clk_freq_hz");
+			dev, op_pll_fr->pll_op_clk_freq_hz,
+			op_lim_fr->min_pll_op_clk_freq_hz,
+			op_lim_fr->max_pll_op_clk_freq_hz, "pll_op_clk_freq_hz");
 	if (!rval)
 		rval = bounds_check(
-			dev, op_pll->sys_clk_div,
-			op_limits->min_sys_clk_div, op_limits->max_sys_clk_div,
+			dev, op_pll_bk->sys_clk_div,
+			op_lim_bk->min_sys_clk_div, op_lim_bk->max_sys_clk_div,
 			"op_sys_clk_div");
 	if (!rval)
 		rval = bounds_check(
-			dev, op_pll->sys_clk_freq_hz,
-			op_limits->min_sys_clk_freq_hz,
-			op_limits->max_sys_clk_freq_hz,
+			dev, op_pll_bk->sys_clk_freq_hz,
+			op_lim_bk->min_sys_clk_freq_hz,
+			op_lim_bk->max_sys_clk_freq_hz,
 			"op_sys_clk_freq_hz");
 	if (!rval)
 		rval = bounds_check(
-			dev, op_pll->pix_clk_freq_hz,
-			op_limits->min_pix_clk_freq_hz,
-			op_limits->max_pix_clk_freq_hz,
+			dev, op_pll_bk->pix_clk_freq_hz,
+			op_lim_bk->min_pix_clk_freq_hz,
+			op_lim_bk->max_pix_clk_freq_hz,
 			"op_pix_clk_freq_hz");
 
 	/*
@@ -123,15 +126,15 @@ static int check_all_bounds(struct device *dev,
 
 	if (!rval)
 		rval = bounds_check(
-			dev, pll->vt.sys_clk_freq_hz,
-			limits->vt.min_sys_clk_freq_hz,
-			limits->vt.max_sys_clk_freq_hz,
+			dev, pll->vt_bk.sys_clk_freq_hz,
+			lim->vt_bk.min_sys_clk_freq_hz,
+			lim->vt_bk.max_sys_clk_freq_hz,
 			"vt_sys_clk_freq_hz");
 	if (!rval)
 		rval = bounds_check(
-			dev, pll->vt.pix_clk_freq_hz,
-			limits->vt.min_pix_clk_freq_hz,
-			limits->vt.max_pix_clk_freq_hz,
+			dev, pll->vt_bk.pix_clk_freq_hz,
+			lim->vt_bk.min_pix_clk_freq_hz,
+			lim->vt_bk.max_pix_clk_freq_hz,
 			"vt_pix_clk_freq_hz");
 
 	return rval;
@@ -149,10 +152,12 @@ static int check_all_bounds(struct device *dev,
  * @return Zero on success, error code on error.
  */
 static int
-__ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *limits,
-		    const struct ccs_pll_branch_limits *op_limits,
-		    struct ccs_pll *pll, struct ccs_pll_branch *op_pll,
-		    uint32_t mul, uint32_t div, uint32_t lane_op_clock_ratio)
+__ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
+		    const struct ccs_pll_branch_limits_fr *op_lim_fr,
+		    const struct ccs_pll_branch_limits_bk *op_lim_bk,
+		    struct ccs_pll *pll, struct ccs_pll_branch_fr *op_pll_fr,
+		    struct ccs_pll_branch_bk *op_pll_bk, uint32_t mul,
+		    uint32_t div, uint32_t lane_op_clock_ratio)
 {
 	uint32_t sys_div;
 	uint32_t best_pix_div = INT_MAX >> 1;
@@ -173,42 +178,42 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *limits,
 	 * Get pre_pll_clk_div so that our pll_op_clk_freq_hz won't be
 	 * too high.
 	 */
-	dev_dbg(dev, "pre_pll_clk_div %u\n", pll->pre_pll_clk_div);
+	dev_dbg(dev, "op_pre_pll_clk_div %u\n", op_pll_fr->pre_pll_clk_div);
 
 	/* Don't go above max pll multiplier. */
-	more_mul_max = limits->max_pll_multiplier / mul;
-	dev_dbg(dev, "more_mul_max: max_pll_multiplier check: %u\n",
+	more_mul_max = op_lim_fr->max_pll_multiplier / mul;
+	dev_dbg(dev, "more_mul_max: max_op_pll_multiplier check: %u\n",
 		more_mul_max);
 	/* Don't go above max pll op frequency. */
 	more_mul_max =
 		min_t(uint32_t,
 		      more_mul_max,
-		      limits->max_pll_op_freq_hz
-		      / (pll->ext_clk_freq_hz / pll->pre_pll_clk_div * mul));
-	dev_dbg(dev, "more_mul_max: max_pll_op_freq_hz check: %u\n",
+		      op_lim_fr->max_pll_op_clk_freq_hz
+		      / (pll->ext_clk_freq_hz / op_pll_fr->pre_pll_clk_div * mul));
+	dev_dbg(dev, "more_mul_max: max_pll_op_clk_freq_hz check: %u\n",
 		more_mul_max);
 	/* Don't go above the division capability of op sys clock divider. */
 	more_mul_max = min(more_mul_max,
-			   op_limits->max_sys_clk_div * pll->pre_pll_clk_div
+			   op_lim_bk->max_sys_clk_div * op_pll_fr->pre_pll_clk_div
 			   / div);
 	dev_dbg(dev, "more_mul_max: max_op_sys_clk_div check: %u\n",
 		more_mul_max);
 	/* Ensure we won't go above min_pll_multiplier. */
 	more_mul_max = min(more_mul_max,
-			   DIV_ROUND_UP(limits->max_pll_multiplier, mul));
+			   DIV_ROUND_UP(op_lim_fr->max_pll_multiplier, mul));
 	dev_dbg(dev, "more_mul_max: min_pll_multiplier check: %u\n",
 		more_mul_max);
 
-	/* Ensure we won't go below min_pll_op_freq_hz. */
-	more_mul_min = DIV_ROUND_UP(limits->min_pll_op_freq_hz,
-				    pll->ext_clk_freq_hz / pll->pre_pll_clk_div
-				    * mul);
-	dev_dbg(dev, "more_mul_min: min_pll_op_freq_hz check: %u\n",
+	/* Ensure we won't go below min_pll_op_clk_freq_hz. */
+	more_mul_min = DIV_ROUND_UP(op_lim_fr->min_pll_op_clk_freq_hz,
+				    pll->ext_clk_freq_hz /
+				    op_pll_fr->pre_pll_clk_div * mul);
+	dev_dbg(dev, "more_mul_min: min_op_pll_op_clk_freq_hz check: %u\n",
 		more_mul_min);
 	/* Ensure we won't go below min_pll_multiplier. */
 	more_mul_min = max(more_mul_min,
-			   DIV_ROUND_UP(limits->min_pll_multiplier, mul));
-	dev_dbg(dev, "more_mul_min: min_pll_multiplier check: %u\n",
+			   DIV_ROUND_UP(op_lim_fr->min_pll_multiplier, mul));
+	dev_dbg(dev, "more_mul_min: min_op_pll_multiplier check: %u\n",
 		more_mul_min);
 
 	if (more_mul_min > more_mul_max) {
@@ -217,9 +222,9 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *limits,
 		return -EINVAL;
 	}
 
-	more_mul_factor = lcm(div, pll->pre_pll_clk_div) / div;
+	more_mul_factor = lcm(div, op_pll_fr->pre_pll_clk_div) / div;
 	dev_dbg(dev, "more_mul_factor: %u\n", more_mul_factor);
-	more_mul_factor = lcm(more_mul_factor, op_limits->min_sys_clk_div);
+	more_mul_factor = lcm(more_mul_factor, op_lim_bk->min_sys_clk_div);
 	dev_dbg(dev, "more_mul_factor: min_op_sys_clk_div: %d\n",
 		more_mul_factor);
 	i = roundup(more_mul_min, more_mul_factor);
@@ -232,25 +237,25 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *limits,
 		return -EINVAL;
 	}
 
-	pll->pll_multiplier = mul * i;
-	op_pll->sys_clk_div = div * i / pll->pre_pll_clk_div;
-	dev_dbg(dev, "op_sys_clk_div: %u\n", op_pll->sys_clk_div);
+	op_pll_fr->pll_multiplier = mul * i;
+	op_pll_bk->sys_clk_div = div * i / op_pll_fr->pre_pll_clk_div;
+	dev_dbg(dev, "op_sys_clk_div: %u\n", op_pll_bk->sys_clk_div);
 
-	pll->pll_ip_clk_freq_hz = pll->ext_clk_freq_hz
-		/ pll->pre_pll_clk_div;
+	op_pll_fr->pll_ip_clk_freq_hz = pll->ext_clk_freq_hz
+		/ op_pll_fr->pre_pll_clk_div;
 
-	pll->pll_op_clk_freq_hz = pll->pll_ip_clk_freq_hz
-		* pll->pll_multiplier;
+	op_pll_fr->pll_op_clk_freq_hz = op_pll_fr->pll_ip_clk_freq_hz
+		* op_pll_fr->pll_multiplier;
 
 	/* Derive pll_op_clk_freq_hz. */
-	op_pll->sys_clk_freq_hz =
-		pll->pll_op_clk_freq_hz / op_pll->sys_clk_div;
+	op_pll_bk->sys_clk_freq_hz =
+		op_pll_fr->pll_op_clk_freq_hz / op_pll_bk->sys_clk_div;
 
-	op_pll->pix_clk_div = pll->bits_per_pixel;
-	dev_dbg(dev, "op_pix_clk_div: %u\n", op_pll->pix_clk_div);
+	op_pll_bk->pix_clk_div = pll->bits_per_pixel;
+	dev_dbg(dev, "op_pix_clk_div: %u\n", op_pll_bk->pix_clk_div);
 
-	op_pll->pix_clk_freq_hz =
-		op_pll->sys_clk_freq_hz / op_pll->pix_clk_div;
+	op_pll_bk->pix_clk_freq_hz =
+		op_pll_bk->sys_clk_freq_hz / op_pll_bk->pix_clk_div;
 
 	if (pll->flags & CCS_PLL_FLAG_NO_OP_CLOCKS) {
 		/* No OP clocks --- VT clocks are used instead. */
@@ -264,7 +269,7 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *limits,
 	 * should run at higher clock rate, so smaller divisor is used
 	 * on video timing side.
 	 */
-	if (limits->min_line_length_pck_bin > limits->min_line_length_pck
+	if (lim->min_line_length_pck_bin > lim->min_line_length_pck
 	    / pll->binning_horizontal)
 		vt_op_binning_div = pll->binning_horizontal;
 	else
@@ -283,28 +288,28 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *limits,
 	 * Find absolute limits for the factor of vt divider.
 	 */
 	dev_dbg(dev, "scale_m: %u\n", pll->scale_m);
-	min_vt_div = DIV_ROUND_UP(op_pll->pix_clk_div * op_pll->sys_clk_div
-				  * pll->scale_n,
+	min_vt_div = DIV_ROUND_UP(op_pll_bk->pix_clk_div
+				  * op_pll_bk->sys_clk_div * pll->scale_n,
 				  lane_op_clock_ratio * vt_op_binning_div
 				  * pll->scale_m);
 
 	/* Find smallest and biggest allowed vt divisor. */
 	dev_dbg(dev, "min_vt_div: %u\n", min_vt_div);
 	min_vt_div = max(min_vt_div,
-			 DIV_ROUND_UP(pll->pll_op_clk_freq_hz,
-				      limits->vt.max_pix_clk_freq_hz));
+			 DIV_ROUND_UP(op_pll_fr->pll_op_clk_freq_hz,
+				      lim->vt_bk.max_pix_clk_freq_hz));
 	dev_dbg(dev, "min_vt_div: max_vt_pix_clk_freq_hz: %u\n",
 		min_vt_div);
 	min_vt_div = max_t(uint32_t, min_vt_div,
-			   limits->vt.min_pix_clk_div
-			   * limits->vt.min_sys_clk_div);
+			   lim->vt_bk.min_pix_clk_div
+			   * lim->vt_bk.min_sys_clk_div);
 	dev_dbg(dev, "min_vt_div: min_vt_clk_div: %u\n", min_vt_div);
 
-	max_vt_div = limits->vt.max_sys_clk_div * limits->vt.max_pix_clk_div;
+	max_vt_div = lim->vt_bk.max_sys_clk_div * lim->vt_bk.max_pix_clk_div;
 	dev_dbg(dev, "max_vt_div: %u\n", max_vt_div);
 	max_vt_div = min(max_vt_div,
-			 DIV_ROUND_UP(pll->pll_op_clk_freq_hz,
-				      limits->vt.min_pix_clk_freq_hz));
+			 DIV_ROUND_UP(op_pll_fr->pll_op_clk_freq_hz,
+				      lim->vt_bk.min_pix_clk_freq_hz));
 	dev_dbg(dev, "max_vt_div: min_vt_pix_clk_freq_hz: %u\n",
 		max_vt_div);
 
@@ -312,28 +317,28 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *limits,
 	 * Find limitsits for sys_clk_div. Not all values are possible
 	 * with all values of pix_clk_div.
 	 */
-	min_sys_div = limits->vt.min_sys_clk_div;
+	min_sys_div = lim->vt_bk.min_sys_clk_div;
 	dev_dbg(dev, "min_sys_div: %u\n", min_sys_div);
 	min_sys_div = max(min_sys_div,
 			  DIV_ROUND_UP(min_vt_div,
-				       limits->vt.max_pix_clk_div));
+				       lim->vt_bk.max_pix_clk_div));
 	dev_dbg(dev, "min_sys_div: max_vt_pix_clk_div: %u\n", min_sys_div);
 	min_sys_div = max(min_sys_div,
-			  pll->pll_op_clk_freq_hz
-			  / limits->vt.max_sys_clk_freq_hz);
+			  op_pll_fr->pll_op_clk_freq_hz
+			  / lim->vt_bk.max_sys_clk_freq_hz);
 	dev_dbg(dev, "min_sys_div: max_pll_op_clk_freq_hz: %u\n", min_sys_div);
 	min_sys_div = clk_div_even_up(min_sys_div);
 	dev_dbg(dev, "min_sys_div: one or even: %u\n", min_sys_div);
 
-	max_sys_div = limits->vt.max_sys_clk_div;
+	max_sys_div = lim->vt_bk.max_sys_clk_div;
 	dev_dbg(dev, "max_sys_div: %u\n", max_sys_div);
 	max_sys_div = min(max_sys_div,
 			  DIV_ROUND_UP(max_vt_div,
-				       limits->vt.min_pix_clk_div));
+				       lim->vt_bk.min_pix_clk_div));
 	dev_dbg(dev, "max_sys_div: min_vt_pix_clk_div: %u\n", max_sys_div);
 	max_sys_div = min(max_sys_div,
-			  DIV_ROUND_UP(pll->pll_op_clk_freq_hz,
-				       limits->vt.min_pix_clk_freq_hz));
+			  DIV_ROUND_UP(op_pll_fr->pll_op_clk_freq_hz,
+				       lim->vt_bk.min_pix_clk_freq_hz));
 	dev_dbg(dev, "max_sys_div: min_vt_pix_clk_freq_hz: %u\n", max_sys_div);
 
 	/*
@@ -348,13 +353,13 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *limits,
 		     sys_div += 2 - (sys_div & 1)) {
 			uint16_t pix_div = DIV_ROUND_UP(vt_div, sys_div);
 
-			if (pix_div < limits->vt.min_pix_clk_div
-			    || pix_div > limits->vt.max_pix_clk_div) {
+			if (pix_div < lim->vt_bk.min_pix_clk_div
+			    || pix_div > lim->vt_bk.max_pix_clk_div) {
 				dev_dbg(dev,
 					"pix_div %u too small or too big (%u--%u)\n",
 					pix_div,
-					limits->vt.min_pix_clk_div,
-					limits->vt.max_pix_clk_div);
+					lim->vt_bk.min_pix_clk_div,
+					lim->vt_bk.max_pix_clk_div);
 				continue;
 			}
 
@@ -367,29 +372,32 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *limits,
 			break;
 	}
 
-	pll->vt.sys_clk_div = DIV_ROUND_UP(min_vt_div, best_pix_div);
-	pll->vt.pix_clk_div = best_pix_div;
+	pll->vt_bk.sys_clk_div = DIV_ROUND_UP(min_vt_div, best_pix_div);
+	pll->vt_bk.pix_clk_div = best_pix_div;
 
-	pll->vt.sys_clk_freq_hz =
-		pll->pll_op_clk_freq_hz / pll->vt.sys_clk_div;
-	pll->vt.pix_clk_freq_hz =
-		pll->vt.sys_clk_freq_hz / pll->vt.pix_clk_div;
+	pll->vt_bk.sys_clk_freq_hz =
+		op_pll_fr->pll_op_clk_freq_hz / pll->vt_bk.sys_clk_div;
+	pll->vt_bk.pix_clk_freq_hz =
+		pll->vt_bk.sys_clk_freq_hz / pll->vt_bk.pix_clk_div;
 
 out_skip_vt_calc:
 	pll->pixel_rate_csi =
-		op_pll->pix_clk_freq_hz * lane_op_clock_ratio;
-	pll->pixel_rate_pixel_array = pll->vt.pix_clk_freq_hz;
+		op_pll_bk->pix_clk_freq_hz * lane_op_clock_ratio;
+	pll->pixel_rate_pixel_array = pll->vt_bk.pix_clk_freq_hz;
 
-	return check_all_bounds(dev, limits, op_limits, pll, op_pll);
+	return check_all_bounds(dev, lim, op_lim_fr, op_lim_bk, pll, op_pll_fr,
+				op_pll_bk);
 }
 
-int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *limits,
+int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 		      struct ccs_pll *pll)
 {
-	const struct ccs_pll_branch_limits *op_limits = &limits->op;
-	struct ccs_pll_branch *op_pll = &pll->op;
-	uint16_t min_pre_pll_clk_div;
-	uint16_t max_pre_pll_clk_div;
+	const struct ccs_pll_branch_limits_fr *op_lim_fr = &lim->vt_fr;
+	const struct ccs_pll_branch_limits_bk *op_lim_bk = &lim->op_bk;
+	struct ccs_pll_branch_fr *op_pll_fr = &pll->vt_fr;
+	struct ccs_pll_branch_bk *op_pll_bk = &pll->op_bk;
+	uint16_t min_op_pre_pll_clk_div;
+	uint16_t max_op_pre_pll_clk_div;
 	uint32_t lane_op_clock_ratio;
 	uint32_t mul, div;
 	unsigned int i;
@@ -401,8 +409,9 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *limits,
 		 * instead. The OP values are ignored for the rest of
 		 * the PLL calculation.
 		 */
-		op_limits = &limits->vt;
-		op_pll = &pll->vt;
+		op_lim_fr = &lim->vt_fr;
+		op_lim_bk = &lim->vt_bk;
+		op_pll_bk = &pll->vt_bk;
 	}
 
 	if (pll->flags & CCS_PLL_FLAG_OP_PIX_CLOCK_PER_LANE)
@@ -417,11 +426,11 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *limits,
 	switch (pll->bus_type) {
 	case CCS_PLL_BUS_TYPE_CSI2:
 		/* CSI transfers 2 bits per clock per lane; thus times 2 */
-		pll->pll_op_clk_freq_hz = pll->link_freq * 2
+		op_pll_fr->pll_op_clk_freq_hz = pll->link_freq * 2
 			* (pll->csi2.lanes / lane_op_clock_ratio);
 		break;
 	case CCS_PLL_BUS_TYPE_PARALLEL:
-		pll->pll_op_clk_freq_hz = pll->link_freq * pll->bits_per_pixel
+		op_pll_fr->pll_op_clk_freq_hz = pll->link_freq * pll->bits_per_pixel
 			/ DIV_ROUND_UP(pll->bits_per_pixel,
 				       pll->parallel.bus_width);
 		break;
@@ -429,39 +438,40 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *limits,
 		return -EINVAL;
 	}
 
-	/* Figure out limits for pre-pll divider based on extclk */
-	dev_dbg(dev, "min / max pre_pll_clk_div: %u / %u\n",
-		limits->min_pre_pll_clk_div, limits->max_pre_pll_clk_div);
-	max_pre_pll_clk_div =
-		min_t(uint16_t, limits->max_pre_pll_clk_div,
+	/* Figure out limits for OP pre-pll divider based on extclk */
+	dev_dbg(dev, "min / max op_pre_pll_clk_div: %u / %u\n",
+		op_lim_fr->min_pre_pll_clk_div, op_lim_fr->max_pre_pll_clk_div);
+	max_op_pre_pll_clk_div =
+		min_t(uint16_t, op_lim_fr->max_pre_pll_clk_div,
 		      clk_div_even(pll->ext_clk_freq_hz /
-				   limits->min_pll_ip_freq_hz));
-	min_pre_pll_clk_div =
-		max_t(uint16_t, limits->min_pre_pll_clk_div,
+				   op_lim_fr->min_pll_ip_clk_freq_hz));
+	min_op_pre_pll_clk_div =
+		max_t(uint16_t, op_lim_fr->min_pre_pll_clk_div,
 		      clk_div_even_up(
 			      DIV_ROUND_UP(pll->ext_clk_freq_hz,
-					   limits->max_pll_ip_freq_hz)));
-	dev_dbg(dev, "pre-pll check: min / max pre_pll_clk_div: %u / %u\n",
-		min_pre_pll_clk_div, max_pre_pll_clk_div);
+					   op_lim_fr->max_pll_ip_clk_freq_hz)));
+	dev_dbg(dev, "pre-pll check: min / max op_pre_pll_clk_div: %u / %u\n",
+		min_op_pre_pll_clk_div, max_op_pre_pll_clk_div);
 
-	i = gcd(pll->pll_op_clk_freq_hz, pll->ext_clk_freq_hz);
-	mul = pll->pll_op_clk_freq_hz / i;
+	i = gcd(op_pll_fr->pll_op_clk_freq_hz, pll->ext_clk_freq_hz);
+	mul = op_pll_fr->pll_op_clk_freq_hz / i;
 	div = pll->ext_clk_freq_hz / i;
 	dev_dbg(dev, "mul %u / div %u\n", mul, div);
 
-	min_pre_pll_clk_div =
-		max_t(uint16_t, min_pre_pll_clk_div,
+	min_op_pre_pll_clk_div =
+		max_t(uint16_t, min_op_pre_pll_clk_div,
 		      clk_div_even_up(
 			      DIV_ROUND_UP(mul * pll->ext_clk_freq_hz,
-					   limits->max_pll_op_freq_hz)));
-	dev_dbg(dev, "pll_op check: min / max pre_pll_clk_div: %u / %u\n",
-		min_pre_pll_clk_div, max_pre_pll_clk_div);
-
-	for (pll->pre_pll_clk_div = min_pre_pll_clk_div;
-	     pll->pre_pll_clk_div <= max_pre_pll_clk_div;
-	     pll->pre_pll_clk_div += 2 - (pll->pre_pll_clk_div & 1)) {
-		rval = __ccs_pll_calculate(dev, limits, op_limits, pll, op_pll,
-					   mul, div, lane_op_clock_ratio);
+					   op_lim_fr->max_pll_op_clk_freq_hz)));
+	dev_dbg(dev, "pll_op check: min / max op_pre_pll_clk_div: %u / %u\n",
+		min_op_pre_pll_clk_div, max_op_pre_pll_clk_div);
+
+	for (op_pll_fr->pre_pll_clk_div = min_op_pre_pll_clk_div;
+	     op_pll_fr->pre_pll_clk_div <= max_op_pre_pll_clk_div;
+	     op_pll_fr->pre_pll_clk_div += 2 - (op_pll_fr->pre_pll_clk_div & 1)) {
+		rval = __ccs_pll_calculate(dev, lim, op_lim_fr, op_lim_bk, pll,
+					   op_pll_fr, op_pll_bk, mul, div,
+					   lane_op_clock_ratio);
 		if (rval)
 			continue;
 
diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
index 07f7f9e8a1cc..03b1d8d11423 100644
--- a/drivers/media/i2c/ccs-pll.h
+++ b/drivers/media/i2c/ccs-pll.h
@@ -20,7 +20,14 @@
 #define CCS_PLL_FLAG_OP_PIX_CLOCK_PER_LANE			(1 << 0)
 #define CCS_PLL_FLAG_NO_OP_CLOCKS				(1 << 1)
 
-struct ccs_pll_branch {
+struct ccs_pll_branch_fr {
+	uint16_t pre_pll_clk_div;
+	uint16_t pll_multiplier;
+	uint32_t pll_ip_clk_freq_hz;
+	uint32_t pll_op_clk_freq_hz;
+};
+
+struct ccs_pll_branch_bk {
 	uint16_t sys_clk_div;
 	uint16_t pix_clk_div;
 	uint32_t sys_clk_freq_hz;
@@ -48,18 +55,26 @@ struct ccs_pll {
 	uint32_t ext_clk_freq_hz;
 
 	/* output values */
-	uint16_t pre_pll_clk_div;
-	uint16_t pll_multiplier;
-	uint32_t pll_ip_clk_freq_hz;
-	uint32_t pll_op_clk_freq_hz;
-	struct ccs_pll_branch vt;
-	struct ccs_pll_branch op;
+	struct ccs_pll_branch_fr vt_fr;
+	struct ccs_pll_branch_bk vt_bk;
+	struct ccs_pll_branch_bk op_bk;
 
 	uint32_t pixel_rate_csi;
 	uint32_t pixel_rate_pixel_array;
 };
 
-struct ccs_pll_branch_limits {
+struct ccs_pll_branch_limits_fr {
+	uint16_t min_pre_pll_clk_div;
+	uint16_t max_pre_pll_clk_div;
+	uint32_t min_pll_ip_clk_freq_hz;
+	uint32_t max_pll_ip_clk_freq_hz;
+	uint16_t min_pll_multiplier;
+	uint16_t max_pll_multiplier;
+	uint32_t min_pll_op_clk_freq_hz;
+	uint32_t max_pll_op_clk_freq_hz;
+};
+
+struct ccs_pll_branch_limits_bk {
 	uint16_t min_sys_clk_div;
 	uint16_t max_sys_clk_div;
 	uint32_t min_sys_clk_freq_hz;
@@ -74,17 +89,10 @@ struct ccs_pll_limits {
 	/* Strict PLL limits */
 	uint32_t min_ext_clk_freq_hz;
 	uint32_t max_ext_clk_freq_hz;
-	uint16_t min_pre_pll_clk_div;
-	uint16_t max_pre_pll_clk_div;
-	uint32_t min_pll_ip_freq_hz;
-	uint32_t max_pll_ip_freq_hz;
-	uint16_t min_pll_multiplier;
-	uint16_t max_pll_multiplier;
-	uint32_t min_pll_op_freq_hz;
-	uint32_t max_pll_op_freq_hz;
 
-	struct ccs_pll_branch_limits vt;
-	struct ccs_pll_branch_limits op;
+	struct ccs_pll_branch_limits_fr vt_fr;
+	struct ccs_pll_branch_limits_bk vt_bk;
+	struct ccs_pll_branch_limits_bk op_bk;
 
 	/* Other relevant limits */
 	uint32_t min_line_length_pck_bin;
diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index a99022e8de25..0dc1c0e05c34 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -366,67 +366,70 @@ static int ccs_pll_configure(struct ccs_sensor *sensor)
 	struct ccs_pll *pll = &sensor->pll;
 	int rval;
 
-	rval = ccs_write(sensor, VT_PIX_CLK_DIV, pll->vt.pix_clk_div);
+	rval = ccs_write(sensor, VT_PIX_CLK_DIV, pll->vt_bk.pix_clk_div);
 	if (rval < 0)
 		return rval;
 
-	rval = ccs_write(sensor, VT_SYS_CLK_DIV, pll->vt.sys_clk_div);
+	rval = ccs_write(sensor, VT_SYS_CLK_DIV, pll->vt_bk.sys_clk_div);
 	if (rval < 0)
 		return rval;
 
-	rval = ccs_write(sensor, PRE_PLL_CLK_DIV, pll->pre_pll_clk_div);
+	rval = ccs_write(sensor, PRE_PLL_CLK_DIV, pll->vt_fr.pre_pll_clk_div);
 	if (rval < 0)
 		return rval;
 
-	rval = ccs_write(sensor, PLL_MULTIPLIER, pll->pll_multiplier);
+	rval = ccs_write(sensor, PLL_MULTIPLIER, pll->vt_fr.pll_multiplier);
 	if (rval < 0)
 		return rval;
 
 	/* Lane op clock ratio does not apply here. */
 	rval = ccs_write(sensor, REQUESTED_LINK_RATE,
-			 DIV_ROUND_UP(pll->op.sys_clk_freq_hz,
+			 DIV_ROUND_UP(pll->op_bk.sys_clk_freq_hz,
 				      1000000 / 256 / 256));
 	if (rval < 0 || sensor->pll.flags & CCS_PLL_FLAG_NO_OP_CLOCKS)
 		return rval;
 
-	rval = ccs_write(sensor, OP_PIX_CLK_DIV, pll->op.pix_clk_div);
+	rval = ccs_write(sensor, OP_PIX_CLK_DIV, pll->op_bk.pix_clk_div);
 	if (rval < 0)
 		return rval;
 
-	return ccs_write(sensor, OP_SYS_CLK_DIV, pll->op.sys_clk_div);
+	return ccs_write(sensor, OP_SYS_CLK_DIV, pll->op_bk.sys_clk_div);
 }
 
 static int ccs_pll_try(struct ccs_sensor *sensor, struct ccs_pll *pll)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	struct ccs_pll_limits lim = {
-		.min_pre_pll_clk_div = CCS_LIM(sensor, MIN_PRE_PLL_CLK_DIV),
-		.max_pre_pll_clk_div = CCS_LIM(sensor, MAX_PRE_PLL_CLK_DIV),
-		.min_pll_ip_freq_hz = CCS_LIM(sensor, MIN_PLL_IP_CLK_FREQ_MHZ),
-		.max_pll_ip_freq_hz = CCS_LIM(sensor, MAX_PLL_IP_CLK_FREQ_MHZ),
-		.min_pll_multiplier = CCS_LIM(sensor, MIN_PLL_MULTIPLIER),
-		.max_pll_multiplier = CCS_LIM(sensor, MAX_PLL_MULTIPLIER),
-		.min_pll_op_freq_hz = CCS_LIM(sensor, MIN_PLL_OP_CLK_FREQ_MHZ),
-		.max_pll_op_freq_hz = CCS_LIM(sensor, MAX_PLL_OP_CLK_FREQ_MHZ),
-
-		.op.min_sys_clk_div = CCS_LIM(sensor, MIN_OP_SYS_CLK_DIV),
-		.op.max_sys_clk_div = CCS_LIM(sensor, MAX_OP_SYS_CLK_DIV),
-		.op.min_pix_clk_div = CCS_LIM(sensor, MIN_OP_PIX_CLK_DIV),
-		.op.max_pix_clk_div = CCS_LIM(sensor, MAX_OP_PIX_CLK_DIV),
-		.op.min_sys_clk_freq_hz = CCS_LIM(sensor, MIN_OP_SYS_CLK_FREQ_MHZ),
-		.op.max_sys_clk_freq_hz = CCS_LIM(sensor, MAX_OP_SYS_CLK_FREQ_MHZ),
-		.op.min_pix_clk_freq_hz = CCS_LIM(sensor, MIN_OP_PIX_CLK_FREQ_MHZ),
-		.op.max_pix_clk_freq_hz = CCS_LIM(sensor, MAX_OP_PIX_CLK_FREQ_MHZ),
-
-		.vt.min_sys_clk_div = CCS_LIM(sensor, MIN_VT_SYS_CLK_DIV),
-		.vt.max_sys_clk_div = CCS_LIM(sensor, MAX_VT_SYS_CLK_DIV),
-		.vt.min_pix_clk_div = CCS_LIM(sensor, MIN_VT_PIX_CLK_DIV),
-		.vt.max_pix_clk_div = CCS_LIM(sensor, MAX_VT_PIX_CLK_DIV),
-		.vt.min_sys_clk_freq_hz = CCS_LIM(sensor, MIN_VT_SYS_CLK_FREQ_MHZ),
-		.vt.max_sys_clk_freq_hz = CCS_LIM(sensor, MAX_VT_SYS_CLK_FREQ_MHZ),
-		.vt.min_pix_clk_freq_hz = CCS_LIM(sensor, MIN_VT_PIX_CLK_FREQ_MHZ),
-		.vt.max_pix_clk_freq_hz = CCS_LIM(sensor, MAX_VT_PIX_CLK_FREQ_MHZ),
-
+		.vt_fr = {
+			.min_pre_pll_clk_div = CCS_LIM(sensor, MIN_PRE_PLL_CLK_DIV),
+			.max_pre_pll_clk_div = CCS_LIM(sensor, MAX_PRE_PLL_CLK_DIV),
+			.min_pll_ip_clk_freq_hz = CCS_LIM(sensor, MIN_PLL_IP_CLK_FREQ_MHZ),
+			.max_pll_ip_clk_freq_hz = CCS_LIM(sensor, MAX_PLL_IP_CLK_FREQ_MHZ),
+			.min_pll_multiplier = CCS_LIM(sensor, MIN_PLL_MULTIPLIER),
+			.max_pll_multiplier = CCS_LIM(sensor, MAX_PLL_MULTIPLIER),
+			.min_pll_op_clk_freq_hz = CCS_LIM(sensor, MIN_PLL_OP_CLK_FREQ_MHZ),
+			.max_pll_op_clk_freq_hz = CCS_LIM(sensor, MAX_PLL_OP_CLK_FREQ_MHZ),
+		},
+		.op_bk = {
+			 .min_sys_clk_div = CCS_LIM(sensor, MIN_OP_SYS_CLK_DIV),
+			 .max_sys_clk_div = CCS_LIM(sensor, MAX_OP_SYS_CLK_DIV),
+			 .min_pix_clk_div = CCS_LIM(sensor, MIN_OP_PIX_CLK_DIV),
+			 .max_pix_clk_div = CCS_LIM(sensor, MAX_OP_PIX_CLK_DIV),
+			 .min_sys_clk_freq_hz = CCS_LIM(sensor, MIN_OP_SYS_CLK_FREQ_MHZ),
+			 .max_sys_clk_freq_hz = CCS_LIM(sensor, MAX_OP_SYS_CLK_FREQ_MHZ),
+			 .min_pix_clk_freq_hz = CCS_LIM(sensor, MIN_OP_PIX_CLK_FREQ_MHZ),
+			 .max_pix_clk_freq_hz = CCS_LIM(sensor, MAX_OP_PIX_CLK_FREQ_MHZ),
+		 },
+		.vt_bk = {
+			 .min_sys_clk_div = CCS_LIM(sensor, MIN_VT_SYS_CLK_DIV),
+			 .max_sys_clk_div = CCS_LIM(sensor, MAX_VT_SYS_CLK_DIV),
+			 .min_pix_clk_div = CCS_LIM(sensor, MIN_VT_PIX_CLK_DIV),
+			 .max_pix_clk_div = CCS_LIM(sensor, MAX_VT_PIX_CLK_DIV),
+			 .min_sys_clk_freq_hz = CCS_LIM(sensor, MIN_VT_SYS_CLK_FREQ_MHZ),
+			 .max_sys_clk_freq_hz = CCS_LIM(sensor, MAX_VT_SYS_CLK_FREQ_MHZ),
+			 .min_pix_clk_freq_hz = CCS_LIM(sensor, MIN_VT_PIX_CLK_FREQ_MHZ),
+			 .max_pix_clk_freq_hz = CCS_LIM(sensor, MAX_VT_PIX_CLK_FREQ_MHZ),
+		 },
 		.min_line_length_pck_bin = CCS_LIM(sensor, MIN_LINE_LENGTH_PCK_BIN),
 		.min_line_length_pck = CCS_LIM(sensor, MIN_LINE_LENGTH_PCK),
 	};
-- 
2.27.0

