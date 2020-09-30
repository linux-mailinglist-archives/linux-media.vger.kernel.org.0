Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7B3F27ECA5
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731072AbgI3P3R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:17 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44670 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731048AbgI3P3Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:16 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 342AD634CF4
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:53 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 081/100] ccs-pll: Add trivial dual PLL support
Date:   Wed, 30 Sep 2020 18:28:39 +0300
Message-Id: <20200930152858.8471-82-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for sensors that have separate VT and OP domain PLLs.

This support is trivial in the sense that it aims for the same VT pixel
rate than that on the CSI-2 bus. The vast majority of sensors is better
supported by higher frequencies in VT domain in binned and possibly scaled
configurations.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 228 +++++++++++++++++++++++++++++++-----
 drivers/media/i2c/ccs-pll.h |   1 +
 2 files changed, 201 insertions(+), 28 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index d7805e61a7c0..62ce38efb118 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -92,7 +92,8 @@ static void print_pll(struct device *dev, struct ccs_pll *pll)
 	for (i = 0, br = branches; i < ARRAY_SIZE(branches); i++, br++) {
 		const char *s = pll_string(br->which);
 
-		if (br->which == PLL_VT) {
+		if (pll->flags & CCS_PLL_FLAG_DUAL_PLL ||
+		    br->which == PLL_VT) {
 			dev_dbg(dev, "%s_pre_pll_clk_div\t\t%u\n",  s,
 				br->fr->pre_pll_clk_div);
 			dev_dbg(dev, "%s_pll_multiplier\t\t%u\n",  s,
@@ -118,7 +119,7 @@ static void print_pll(struct device *dev, struct ccs_pll *pll)
 		}
 	}
 
-	dev_dbg(dev, "flags%s%s%s%s%s%s\n",
+	dev_dbg(dev, "flags%s%s%s%s%s%s%s\n",
 		pll->flags & PLL_FL(LANE_SPEED_MODEL) ? " lane-speed" : "",
 		pll->flags & PLL_FL(LINK_DECOUPLED) ? " link-decoupled" : "",
 		pll->flags & PLL_FL(EXT_IP_PLL_DIVIDER) ?
@@ -126,7 +127,8 @@ static void print_pll(struct device *dev, struct ccs_pll *pll)
 		pll->flags & PLL_FL(FLEXIBLE_OP_PIX_CLK_DIV) ?
 		" flexible-op-pix-div" : "",
 		pll->flags & PLL_FL(FIFO_DERATING) ? " fifo-derating" : "",
-		pll->flags & PLL_FL(FIFO_OVERRATING) ? " fifo-overrating" : "");
+		pll->flags & PLL_FL(FIFO_OVERRATING) ? " fifo-overrating" : "",
+		pll->flags & PLL_FL(DUAL_PLL) ? " dual-pll" : "");
 }
 
 static int check_fr_bounds(struct device *dev,
@@ -267,12 +269,157 @@ ccs_pll_find_vt_sys_div(struct device *dev, const struct ccs_pll_limits *lim,
 #define DPHY_CONST		16
 #define PHY_CONST_DIV		16
 
-static void
-ccs_pll_calculate_vt(struct device *dev, const struct ccs_pll_limits *lim,
-		     const struct ccs_pll_branch_limits_bk *op_lim_bk,
-		     struct ccs_pll *pll, struct ccs_pll_branch_fr *pll_fr,
-		     struct ccs_pll_branch_bk *op_pll_bk, bool cphy,
-		     uint32_t phy_const)
+static inline int
+__ccs_pll_calculate_vt_tree(struct device *dev,
+			    const struct ccs_pll_limits *lim,
+			    struct ccs_pll *pll, uint32_t mul, uint32_t div)
+{
+	const struct ccs_pll_branch_limits_fr *lim_fr = &lim->vt_fr;
+	const struct ccs_pll_branch_limits_bk *lim_bk = &lim->vt_bk;
+	struct ccs_pll_branch_fr *pll_fr = &pll->vt_fr;
+	struct ccs_pll_branch_bk *pll_bk = &pll->vt_bk;
+	uint32_t more_mul;
+	uint16_t best_pix_div = SHRT_MAX >> 1, best_div;
+	uint16_t vt_div, min_sys_div, max_sys_div, sys_div;
+
+	pll_fr->pll_ip_clk_freq_hz =
+		pll->ext_clk_freq_hz / pll_fr->pre_pll_clk_div;
+
+	dev_dbg(dev, "vt_pll_ip_clk_freq_hz %u\n", pll_fr->pll_ip_clk_freq_hz);
+
+	more_mul = one_or_more(DIV_ROUND_UP(lim_fr->min_pll_op_clk_freq_hz,
+					    pll_fr->pll_ip_clk_freq_hz * mul));
+
+	dev_dbg(dev, "more_mul: %u\n", more_mul);
+	more_mul *= DIV_ROUND_UP(lim_fr->min_pll_multiplier, mul * more_mul);
+	dev_dbg(dev, "more_mul2: %u\n", more_mul);
+
+	pll_fr->pll_multiplier = mul * more_mul;
+
+	if (pll_fr->pll_multiplier * pll_fr->pll_ip_clk_freq_hz >
+	    lim_fr->max_pll_op_clk_freq_hz)
+		return -EINVAL;
+
+	pll_fr->pll_op_clk_freq_hz =
+		pll_fr->pll_ip_clk_freq_hz * pll_fr->pll_multiplier;
+
+	vt_div = div * more_mul;
+
+	ccs_pll_find_vt_sys_div(dev, lim, pll, pll_fr, vt_div, vt_div,
+				&min_sys_div, &max_sys_div);
+
+	max_sys_div = (vt_div & 1) ? 1 : max_sys_div;
+
+	dev_dbg(dev, "vt min/max_sys_div: %u,%u\n", min_sys_div, max_sys_div);
+
+	for (sys_div = min_sys_div; sys_div <= max_sys_div;
+	     sys_div += 2 - (sys_div & 1)) {
+		uint16_t pix_div;
+
+		if (vt_div % sys_div)
+			continue;
+
+		pix_div = vt_div / sys_div;
+
+		if (pix_div < lim_bk->min_pix_clk_div ||
+		    pix_div > lim_bk->max_pix_clk_div) {
+			dev_dbg(dev,
+				"pix_div %u too small or too big (%u--%u)\n",
+				pix_div,
+				lim_bk->min_pix_clk_div,
+				lim_bk->max_pix_clk_div);
+			continue;
+		}
+
+		if (pix_div * sys_div <= best_div) {
+			best_pix_div = pix_div;
+			best_div = pix_div * sys_div;
+		}
+	}
+	if (best_pix_div == SHRT_MAX >> 1)
+		return -EINVAL;
+
+	pll_bk->sys_clk_div = best_div / best_pix_div;
+	pll_bk->pix_clk_div = best_pix_div;
+
+	pll_bk->sys_clk_freq_hz =
+		pll_fr->pll_op_clk_freq_hz / pll_bk->sys_clk_div;
+	pll_bk->pix_clk_freq_hz =
+		pll_bk->sys_clk_freq_hz / pll_bk->pix_clk_div;
+
+	pll->pixel_rate_pixel_array =
+		pll_bk->pix_clk_freq_hz * pll->vt_lanes;
+
+	return 0;
+}
+
+static int ccs_pll_calculate_vt_tree(struct device *dev,
+				     const struct ccs_pll_limits *lim,
+				     struct ccs_pll *pll)
+{
+	const struct ccs_pll_branch_limits_fr *lim_fr = &lim->vt_fr;
+	struct ccs_pll_branch_fr *pll_fr = &pll->vt_fr;
+	uint16_t min_pre_pll_clk_div = lim_fr->min_pre_pll_clk_div;
+	uint16_t max_pre_pll_clk_div = lim_fr->max_pre_pll_clk_div;
+	uint32_t pre_mul, pre_div;
+
+	pre_div = gcd(pll->pixel_rate_csi,
+		      pll->ext_clk_freq_hz * pll->vt_lanes);
+	pre_mul = pll->pixel_rate_csi / pre_div;
+	pre_div = pll->ext_clk_freq_hz * pll->vt_lanes / pre_div;
+
+	/* Make sure PLL input frequency is within limits */
+	max_pre_pll_clk_div =
+		min_t(uint16_t, max_pre_pll_clk_div,
+		      DIV_ROUND_UP(pll->ext_clk_freq_hz,
+				   lim_fr->min_pll_ip_clk_freq_hz));
+
+	min_pre_pll_clk_div = max_t(uint16_t, min_pre_pll_clk_div,
+				    pll->ext_clk_freq_hz /
+				    lim_fr->max_pll_ip_clk_freq_hz);
+
+	dev_dbg(dev, "vt min/max_pre_pll_clk_div: %u,%u\n",
+		min_pre_pll_clk_div, max_pre_pll_clk_div);
+
+	for (pll_fr->pre_pll_clk_div = min_pre_pll_clk_div;
+	     pll_fr->pre_pll_clk_div <= max_pre_pll_clk_div;
+	     pll_fr->pre_pll_clk_div +=
+		     (pll->flags & CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER) ? 1 :
+		     2 - (pll_fr->pre_pll_clk_div & 1)) {
+		uint32_t mul, div;
+		int rval;
+
+		div = gcd(pre_mul * pll_fr->pre_pll_clk_div, pre_div);
+		mul = pre_mul * pll_fr->pre_pll_clk_div / div;
+		div = pre_div / div;
+
+		dev_dbg(dev, "vt pre-div/mul/div: %u,%u,%u\n",
+			pll_fr->pre_pll_clk_div, mul, div);
+
+		rval = __ccs_pll_calculate_vt_tree(dev, lim, pll,
+						   mul, div);
+		if (rval)
+			continue;
+
+		rval = check_fr_bounds(dev, lim, pll, PLL_VT);
+		if (rval)
+			continue;
+
+		rval = check_bk_bounds(dev, lim, pll, PLL_VT);
+		if (rval)
+			continue;
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static void ccs_pll_calculate_vt(
+	struct device *dev, const struct ccs_pll_limits *lim,
+	const struct ccs_pll_branch_limits_bk *op_lim_bk, struct ccs_pll *pll,
+	struct ccs_pll_branch_fr *pll_fr, struct ccs_pll_branch_bk *op_pll_bk,
+	bool cphy, uint32_t phy_const)
 {
 	uint16_t sys_div;
 	uint16_t best_pix_div = SHRT_MAX >> 1;
@@ -525,10 +672,10 @@ ccs_pll_calculate_op(struct device *dev, const struct ccs_pll_limits *lim,
 int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 		      struct ccs_pll *pll)
 {
-	const struct ccs_pll_branch_limits_fr *op_lim_fr = &lim->vt_fr;
-	const struct ccs_pll_branch_limits_bk *op_lim_bk = &lim->op_bk;
-	struct ccs_pll_branch_fr *op_pll_fr = &pll->vt_fr;
-	struct ccs_pll_branch_bk *op_pll_bk = &pll->op_bk;
+	const struct ccs_pll_branch_limits_fr *op_lim_fr;
+	const struct ccs_pll_branch_limits_bk *op_lim_bk;
+	struct ccs_pll_branch_fr *op_pll_fr;
+	struct ccs_pll_branch_bk *op_pll_bk;
 	bool cphy = pll->bus_type == CCS_PLL_BUS_TYPE_CSI2_CPHY;
 	uint32_t phy_const = cphy ? CPHY_CONST : DPHY_CONST;
 	uint16_t min_op_pre_pll_clk_div;
@@ -544,6 +691,28 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 		pll->vt_lanes = 1;
 	}
 
+	if (pll->flags & CCS_PLL_FLAG_DUAL_PLL) {
+		op_lim_fr = &lim->op_fr;
+		op_lim_bk = &lim->op_bk;
+		op_pll_fr = &pll->op_fr;
+		op_pll_bk = &pll->op_bk;
+	} else if (pll->flags & CCS_PLL_FLAG_NO_OP_CLOCKS) {
+		/*
+		 * If there's no OP PLL at all, use the VT values
+		 * instead. The OP values are ignored for the rest of
+		 * the PLL calculation.
+		 */
+		op_lim_fr = &lim->vt_fr;
+		op_lim_bk = &lim->vt_bk;
+		op_pll_fr = &pll->vt_fr;
+		op_pll_bk = &pll->vt_bk;
+	} else {
+		op_lim_fr = &lim->vt_fr;
+		op_lim_bk = &lim->op_bk;
+		op_pll_fr = &pll->vt_fr;
+		op_pll_bk = &pll->op_bk;
+	}
+
 	if (!pll->op_lanes || !pll->vt_lanes || !pll->bits_per_pixel ||
 	    !pll->ext_clk_freq_hz || !pll->link_freq || !pll->scale_m ||
 	    !op_lim_fr->min_pll_ip_clk_freq_hz ||
@@ -567,17 +736,6 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	dev_dbg(dev, "vt_lanes: %u\n", pll->vt_lanes);
 	dev_dbg(dev, "op_lanes: %u\n", pll->op_lanes);
 
-	if (pll->flags & CCS_PLL_FLAG_NO_OP_CLOCKS) {
-		/*
-		 * If there's no OP PLL at all, use the VT values
-		 * instead. The OP values are ignored for the rest of
-		 * the PLL calculation.
-		 */
-		op_lim_fr = &lim->vt_fr;
-		op_lim_bk = &lim->vt_bk;
-		op_pll_bk = &pll->vt_bk;
-	}
-
 	dev_dbg(dev, "binning: %ux%u\n", pll->binning_horizontal,
 		pll->binning_vertical);
 
@@ -653,6 +811,9 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 		if (rval)
 			continue;
 
+		if (pll->flags & CCS_PLL_FLAG_DUAL_PLL)
+			break;
+
 		ccs_pll_calculate_vt(dev, lim, op_lim_bk, pll, op_pll_fr,
 				     op_pll_bk, cphy, phy_const);
 
@@ -663,14 +824,25 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 		if (rval)
 			continue;
 
-		print_pll(dev, pll);
+		break;
+	}
+
+	if (rval) {
+		dev_dbg(dev, "unable to compute pre_pll divisor\n");
 
-		return 0;
+		return rval;
 	}
 
-	dev_dbg(dev, "unable to compute pre_pll divisor\n");
+	if (pll->flags & CCS_PLL_FLAG_DUAL_PLL) {
+		rval = ccs_pll_calculate_vt_tree(dev, lim, pll);
 
-	return rval;
+		if (rval)
+			return rval;
+	}
+
+	print_pll(dev, pll);
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(ccs_pll_calculate);
 
diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
index 4fa3d4e459a0..1be8f300c860 100644
--- a/drivers/media/i2c/ccs-pll.h
+++ b/drivers/media/i2c/ccs-pll.h
@@ -29,6 +29,7 @@
 #define CCS_PLL_FLAG_FLEXIBLE_OP_PIX_CLK_DIV			BIT(5)
 #define CCS_PLL_FLAG_FIFO_DERATING				BIT(6)
 #define CCS_PLL_FLAG_FIFO_OVERRATING				BIT(7)
+#define CCS_PLL_FLAG_DUAL_PLL					BIT(8)
 
 /**
  * struct ccs_pll_branch_fr - CCS PLL configuration (front)
-- 
2.27.0

