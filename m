Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45E2A27ECBA
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731102AbgI3P3f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:35 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44650 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731036AbgI3P3O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:14 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id D2F11634CAA
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:52 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 077/100] ccs-pll: Rework bounds checks
Date:   Wed, 30 Sep 2020 18:28:35 +0300
Message-Id: <20200930152858.8471-78-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Refactor bounds checks so that the caller can decide what to check. This
allows doing the checks early, when the values are available.

This also adds front OP PLL configuration and limits.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 148 ++++++++++++++++++++++--------------
 drivers/media/i2c/ccs-pll.h |   2 +
 2 files changed, 93 insertions(+), 57 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index cff6b377ed84..e1755498cd79 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -46,12 +46,14 @@ static inline uint32_t one_or_more(uint32_t a)
 }
 
 static int bounds_check(struct device *dev, uint32_t val,
-			uint32_t min, uint32_t max, char *str)
+			uint32_t min, uint32_t max, const char *prefix,
+			char *str)
 {
 	if (val >= min && val <= max)
 		return 0;
 
-	dev_dbg(dev, "%s out of bounds: %d (%d--%d)\n", str, val, min, max);
+	dev_dbg(dev, "%s_%s out of bounds: %d (%d--%d)\n", prefix,
+		str, val, min, max);
 
 	return -EINVAL;
 }
@@ -81,7 +83,7 @@ static void print_pll(struct device *dev, struct ccs_pll *pll)
 		unsigned int which;
 	} branches[] = {
 		{ &pll->vt_fr, &pll->vt_bk, PLL_VT },
-		{ NULL, &pll->op_bk, PLL_OP }
+		{ &pll->op_fr, &pll->op_bk, PLL_OP }
 	}, *br;
 	unsigned int i;
 
@@ -127,68 +129,90 @@ static void print_pll(struct device *dev, struct ccs_pll *pll)
 		pll->flags & PLL_FL(FIFO_OVERRATING) ? " fifo-overrating" : "");
 }
 
-static int check_all_bounds(struct device *dev,
-			    const struct ccs_pll_limits *lim,
-			    const struct ccs_pll_branch_limits_fr *op_lim_fr,
-			    const struct ccs_pll_branch_limits_bk *op_lim_bk,
-			    struct ccs_pll *pll,
-			    struct ccs_pll_branch_fr *op_pll_fr,
-			    struct ccs_pll_branch_bk *op_pll_bk)
+static int check_fr_bounds(struct device *dev,
+			   const struct ccs_pll_limits *lim,
+			   struct ccs_pll *pll, unsigned int which)
 {
+	const struct ccs_pll_branch_limits_fr *lim_fr;
+	struct ccs_pll_branch_fr *pll_fr;
+	const char *s = pll_string(which);
 	int rval;
 
-	rval = bounds_check(dev, op_pll_fr->pll_ip_clk_freq_hz,
-			    op_lim_fr->min_pll_ip_clk_freq_hz,
-			    op_lim_fr->max_pll_ip_clk_freq_hz,
-			    "pll_ip_clk_freq_hz");
-	if (!rval)
-		rval = bounds_check(
-			dev, op_pll_fr->pll_multiplier,
-			op_lim_fr->min_pll_multiplier,
-			op_lim_fr->max_pll_multiplier, "pll_multiplier");
-	if (!rval)
-		rval = bounds_check(
-			dev, op_pll_fr->pll_op_clk_freq_hz,
-			op_lim_fr->min_pll_op_clk_freq_hz,
-			op_lim_fr->max_pll_op_clk_freq_hz, "pll_op_clk_freq_hz");
+	if (which == PLL_OP) {
+		lim_fr = &lim->op_fr;
+		pll_fr = &pll->op_fr;
+	} else {
+		lim_fr = &lim->vt_fr;
+		pll_fr = &pll->vt_fr;
+	}
+
+	rval = bounds_check(dev, pll_fr->pre_pll_clk_div,
+			    lim_fr->min_pre_pll_clk_div,
+			    lim_fr->max_pre_pll_clk_div, s, "pre_pll_clk_div");
+
 	if (!rval)
-		rval = bounds_check(
-			dev, op_pll_bk->sys_clk_div,
-			op_lim_bk->min_sys_clk_div, op_lim_bk->max_sys_clk_div,
-			"op_sys_clk_div");
+		rval = bounds_check(dev, pll_fr->pll_ip_clk_freq_hz,
+				    lim_fr->min_pll_ip_clk_freq_hz,
+				    lim_fr->max_pll_ip_clk_freq_hz,
+				    s, "pll_ip_clk_freq_hz");
 	if (!rval)
-		rval = bounds_check(
-			dev, op_pll_bk->sys_clk_freq_hz,
-			op_lim_bk->min_sys_clk_freq_hz,
-			op_lim_bk->max_sys_clk_freq_hz,
-			"op_sys_clk_freq_hz");
+		rval = bounds_check(dev, pll_fr->pll_multiplier,
+				    lim_fr->min_pll_multiplier,
+				    lim_fr->max_pll_multiplier,
+				    s, "pll_multiplier");
 	if (!rval)
-		rval = bounds_check(
-			dev, op_pll_bk->pix_clk_freq_hz,
-			op_lim_bk->min_pix_clk_freq_hz,
-			op_lim_bk->max_pix_clk_freq_hz,
-			"op_pix_clk_freq_hz");
+		rval = bounds_check(dev, pll_fr->pll_op_clk_freq_hz,
+				    lim_fr->min_pll_op_clk_freq_hz,
+				    lim_fr->max_pll_op_clk_freq_hz,
+				    s, "pll_op_clk_freq_hz");
 
-	/*
-	 * If there are no OP clocks, the VT clocks are contained in
-	 * the OP clock struct.
-	 */
-	if (pll->flags & CCS_PLL_FLAG_NO_OP_CLOCKS)
-		return rval;
+	return rval;
+}
+
+static int check_bk_bounds(struct device *dev,
+			   const struct ccs_pll_limits *lim,
+			   struct ccs_pll *pll, unsigned int which)
+{
+	const struct ccs_pll_branch_limits_bk *lim_bk;
+	struct ccs_pll_branch_bk *pll_bk;
+	const char *s = pll_string(which);
+	int rval;
+
+	if (which == PLL_OP) {
+		if (pll->flags & CCS_PLL_FLAG_NO_OP_CLOCKS)
+			return 0;
 
+		lim_bk = &lim->op_bk;
+		pll_bk = &pll->op_bk;
+	} else {
+		lim_bk = &lim->vt_bk;
+		pll_bk = &pll->vt_bk;
+	}
+
+	rval = bounds_check(dev, pll_bk->sys_clk_div,
+			    lim_bk->min_sys_clk_div,
+			    lim_bk->max_sys_clk_div, s, "op_sys_clk_div");
+	if (!rval)
+		rval = bounds_check(dev, pll_bk->sys_clk_freq_hz,
+				    lim_bk->min_sys_clk_freq_hz,
+				    lim_bk->max_sys_clk_freq_hz,
+				    s, "sys_clk_freq_hz");
 	if (!rval)
-		rval = bounds_check(
-			dev, pll->vt_bk.sys_clk_freq_hz,
-			lim->vt_bk.min_sys_clk_freq_hz,
-			lim->vt_bk.max_sys_clk_freq_hz,
-			"vt_sys_clk_freq_hz");
+		rval = bounds_check(dev, pll_bk->sys_clk_div,
+				    lim_bk->min_sys_clk_div,
+				    lim_bk->max_sys_clk_div,
+				    s, "sys_clk_div");
 	if (!rval)
-		rval = bounds_check(
-			dev, pll->vt_bk.pix_clk_freq_hz,
-			lim->vt_bk.min_pix_clk_freq_hz,
-			lim->vt_bk.max_pix_clk_freq_hz,
-			"vt_pix_clk_freq_hz");
+		rval = bounds_check(dev, pll_bk->pix_clk_freq_hz,
+				    lim_bk->min_pix_clk_freq_hz,
+				    lim_bk->max_pix_clk_freq_hz,
+				    s, "pix_clk_freq_hz");
+
+	return rval;
+}
 
+static int check_ext_bounds(struct device *dev, struct ccs_pll *pll)
+{
 	if (!(pll->flags & CCS_PLL_FLAG_FIFO_DERATING) &&
 	    pll->pixel_rate_pixel_array > pll->pixel_rate_csi) {
 		dev_dbg(dev, "device does not support derating\n");
@@ -201,7 +225,7 @@ static int check_all_bounds(struct device *dev,
 		return -EINVAL;
 	}
 
-	return rval;
+	return 0;
 }
 
 #define CPHY_CONST		7
@@ -610,11 +634,21 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 		if (rval)
 			continue;
 
+		rval = check_fr_bounds(dev, lim, pll, PLL_VT);
+		if (rval)
+			continue;
+
+		rval = check_bk_bounds(dev, lim, pll, PLL_OP);
+		if (rval)
+			continue;
+
 		ccs_pll_calculate_vt(dev, lim, op_lim_bk, pll, op_pll_fr,
 				     op_pll_bk, cphy, phy_const);
 
-		rval = check_all_bounds(dev, lim, op_lim_fr, op_lim_bk, pll,
-					op_pll_fr, op_pll_bk);
+		rval = check_bk_bounds(dev, lim, pll, PLL_VT);
+		if (rval)
+			continue;
+		rval = check_ext_bounds(dev, pll);
 		if (rval)
 			continue;
 
diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
index 9ba738ea7006..4fa3d4e459a0 100644
--- a/drivers/media/i2c/ccs-pll.h
+++ b/drivers/media/i2c/ccs-pll.h
@@ -111,6 +111,7 @@ struct ccs_pll {
 	/* output values */
 	struct ccs_pll_branch_fr vt_fr;
 	struct ccs_pll_branch_bk vt_bk;
+	struct ccs_pll_branch_fr op_fr;
 	struct ccs_pll_branch_bk op_bk;
 
 	uint32_t pixel_rate_csi;
@@ -181,6 +182,7 @@ struct ccs_pll_limits {
 
 	struct ccs_pll_branch_limits_fr vt_fr;
 	struct ccs_pll_branch_limits_bk vt_bk;
+	struct ccs_pll_branch_limits_fr op_fr;
 	struct ccs_pll_branch_limits_bk op_bk;
 
 	/* Other relevant limits */
-- 
2.27.0

