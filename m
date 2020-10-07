Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36989285B07
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728093AbgJGIqm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:46:42 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57082 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728029AbgJGIqO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:14 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 98B49634CF8
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:21 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 081/106] ccs-pll: Better separate OP and VT sub-tree calculation
Date:   Wed,  7 Oct 2020 11:45:32 +0300
Message-Id: <20201007084557.25843-72-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Better separate OP PLL branch calculation from VT branch calculation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 54 +++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 96eb71f16c81..e879c03a3d3b 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -162,11 +162,11 @@ static int check_all_bounds(struct device *dev,
 #define PHY_CONST_DIV		16
 
 static void
-__ccs_pll_calculate_vt(struct device *dev, const struct ccs_pll_limits *lim,
-		       const struct ccs_pll_branch_limits_bk *op_lim_bk,
-		       struct ccs_pll *pll, struct ccs_pll_branch_fr *pll_fr,
-		       struct ccs_pll_branch_bk *op_pll_bk, bool cphy,
-		       uint32_t phy_const)
+ccs_pll_calculate_vt(struct device *dev, const struct ccs_pll_limits *lim,
+		     const struct ccs_pll_branch_limits_bk *op_lim_bk,
+		     struct ccs_pll *pll, struct ccs_pll_branch_fr *pll_fr,
+		     struct ccs_pll_branch_bk *op_pll_bk, bool cphy,
+		     uint32_t phy_const)
 {
 	uint32_t sys_div;
 	uint32_t best_pix_div = INT_MAX >> 1;
@@ -174,6 +174,9 @@ __ccs_pll_calculate_vt(struct device *dev, const struct ccs_pll_limits *lim,
 	uint32_t min_vt_div, max_vt_div, vt_div;
 	uint32_t min_sys_div, max_sys_div;
 
+	if (pll->flags & CCS_PLL_FLAG_NO_OP_CLOCKS)
+		goto out_calc_pixel_rate;
+
 	/*
 	 * Find out whether a sensor supports derating. If it does not, VT and
 	 * OP domains are required to run at the same pixel rate.
@@ -313,6 +316,10 @@ __ccs_pll_calculate_vt(struct device *dev, const struct ccs_pll_limits *lim,
 		pll_fr->pll_op_clk_freq_hz / pll->vt_bk.sys_clk_div;
 	pll->vt_bk.pix_clk_freq_hz =
 		pll->vt_bk.sys_clk_freq_hz / pll->vt_bk.pix_clk_div;
+
+out_calc_pixel_rate:
+	pll->pixel_rate_pixel_array =
+		pll->vt_bk.pix_clk_freq_hz * pll->vt_lanes;
 }
 
 /*
@@ -327,12 +334,12 @@ __ccs_pll_calculate_vt(struct device *dev, const struct ccs_pll_limits *lim,
  * @return Zero on success, error code on error.
  */
 static int
-__ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
-		    const struct ccs_pll_branch_limits_fr *op_lim_fr,
-		    const struct ccs_pll_branch_limits_bk *op_lim_bk,
-		    struct ccs_pll *pll, struct ccs_pll_branch_fr *op_pll_fr,
-		    struct ccs_pll_branch_bk *op_pll_bk, uint32_t mul,
-		    uint32_t div, uint32_t l, bool cphy, uint32_t phy_const)
+ccs_pll_calculate_op(struct device *dev, const struct ccs_pll_limits *lim,
+		     const struct ccs_pll_branch_limits_fr *op_lim_fr,
+		     const struct ccs_pll_branch_limits_bk *op_lim_bk,
+		     struct ccs_pll *pll, struct ccs_pll_branch_fr *op_pll_fr,
+		     struct ccs_pll_branch_bk *op_pll_bk, uint32_t mul,
+		     uint32_t div, uint32_t l, bool cphy, uint32_t phy_const)
 {
 	/*
 	 * Higher multipliers (and divisors) are often required than
@@ -430,15 +437,7 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 
 	dev_dbg(dev, "op_pix_clk_div: %u\n", op_pll_bk->pix_clk_div);
 
-	if (!(pll->flags & CCS_PLL_FLAG_NO_OP_CLOCKS))
-		__ccs_pll_calculate_vt(dev, lim, op_lim_bk, pll, op_pll_fr,
-				       op_pll_bk, cphy, phy_const);
-
-	pll->pixel_rate_pixel_array =
-		pll->vt_bk.pix_clk_freq_hz * pll->vt_lanes;
-
-	return check_all_bounds(dev, lim, op_lim_fr, op_lim_bk, pll, op_pll_fr,
-				op_pll_bk);
+	return 0;
 }
 
 int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
@@ -558,13 +557,22 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	     op_pll_fr->pre_pll_clk_div +=
 		     (pll->flags & CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER) ? 1 :
 		     2 - (op_pll_fr->pre_pll_clk_div & 1)) {
-		rval = __ccs_pll_calculate(dev, lim, op_lim_fr, op_lim_bk, pll,
-					   op_pll_fr, op_pll_bk, mul, div, l,
-					   cphy, phy_const);
+		rval = ccs_pll_calculate_op(dev, lim, op_lim_fr, op_lim_bk, pll,
+					    op_pll_fr, op_pll_bk, mul, div, l,
+					    cphy, phy_const);
+		if (rval)
+			continue;
+
+		ccs_pll_calculate_vt(dev, lim, op_lim_bk, pll, op_pll_fr,
+				     op_pll_bk, cphy, phy_const);
+
+		rval = check_all_bounds(dev, lim, op_lim_fr, op_lim_bk, pll,
+					op_pll_fr, op_pll_bk);
 		if (rval)
 			continue;
 
 		print_pll(dev, pll);
+
 		return 0;
 	}
 
-- 
2.27.0

