Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84F6427ECBF
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730567AbgI3P3k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:40 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44682 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731029AbgI3P3O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:14 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 619C4634CA5
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:52 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 072/100] ccs-pll: Add C-PHY support
Date:   Wed, 30 Sep 2020 18:28:30 +0300
Message-Id: <20200930152858.8471-73-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add C-PHY support for the CCS PLL calculator.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 1a4fccfc1158..52e6230c087d 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -145,6 +145,10 @@ static int check_all_bounds(struct device *dev,
 	return rval;
 }
 
+#define CPHY_CONST		7
+#define DPHY_CONST		16
+#define PHY_CONST_DIV		16
+
 /*
  * Heuristically guess the PLL tree for a given common multiplier and
  * divisor. Begin with the operational timing and continue to video
@@ -162,7 +166,7 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 		    const struct ccs_pll_branch_limits_bk *op_lim_bk,
 		    struct ccs_pll *pll, struct ccs_pll_branch_fr *op_pll_fr,
 		    struct ccs_pll_branch_bk *op_pll_bk, uint32_t mul,
-		    uint32_t div, uint32_t l)
+		    uint32_t div, uint32_t l, bool cphy, uint32_t phy_const)
 {
 	uint32_t sys_div;
 	uint32_t best_pix_div = INT_MAX >> 1;
@@ -254,9 +258,11 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 
 	if (pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL)
 		op_pll_bk->pix_clk_div = pll->bits_per_pixel
-			* pll->op_lanes / pll->csi2.lanes / l;
+			* pll->op_lanes * phy_const
+			/ PHY_CONST_DIV / pll->csi2.lanes / l;
 	else
-		op_pll_bk->pix_clk_div = pll->bits_per_pixel / l;
+		op_pll_bk->pix_clk_div =
+			pll->bits_per_pixel * phy_const / PHY_CONST_DIV / l;
 
 	op_pll_bk->pix_clk_freq_hz =
 		op_pll_bk->sys_clk_freq_hz / op_pll_bk->pix_clk_div;
@@ -295,10 +301,11 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	 */
 	dev_dbg(dev, "scale_m: %u\n", pll->scale_m);
 	min_vt_div = DIV_ROUND_UP(pll->bits_per_pixel * op_pll_bk->sys_clk_div
-				  * pll->scale_n * pll->vt_lanes,
+				  * pll->scale_n * pll->vt_lanes * phy_const,
 				  (pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL ?
 				   pll->csi2.lanes : 1)
-				  * vt_op_binning_div * pll->scale_m);
+				  * vt_op_binning_div * pll->scale_m
+				  * PHY_CONST_DIV);
 
 	/* Find smallest and biggest allowed vt divisor. */
 	dev_dbg(dev, "min_vt_div: %u\n", min_vt_div);
@@ -408,6 +415,8 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	const struct ccs_pll_branch_limits_bk *op_lim_bk = &lim->op_bk;
 	struct ccs_pll_branch_fr *op_pll_fr = &pll->vt_fr;
 	struct ccs_pll_branch_bk *op_pll_bk = &pll->op_bk;
+	bool cphy = pll->bus_type == CCS_PLL_BUS_TYPE_CSI2_CPHY;
+	uint32_t phy_const = cphy ? CPHY_CONST : DPHY_CONST;
 	uint16_t min_op_pre_pll_clk_div;
 	uint16_t max_op_pre_pll_clk_div;
 	uint32_t mul, div;
@@ -465,14 +474,21 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 			* (pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL ?
 			   1 : pll->csi2.lanes);
 		break;
+	case CCS_PLL_BUS_TYPE_CSI2_CPHY:
+		op_pll_bk->sys_clk_freq_hz =
+			pll->link_freq
+			* (pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL ?
+			   1 : pll->csi2.lanes);
+		break;
 	default:
 		return -EINVAL;
 	}
 
 	pll->pixel_rate_csi =
-		op_pll_bk->sys_clk_freq_hz
-		* (pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL ?
-		   pll->csi2.lanes : 1) / pll->bits_per_pixel / l;
+		div_u64((uint64_t)op_pll_bk->sys_clk_freq_hz
+			* (pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL ?
+			   pll->csi2.lanes : 1) * PHY_CONST_DIV,
+			phy_const * pll->bits_per_pixel * l);
 
 	/* Figure out limits for OP pre-pll divider based on extclk */
 	dev_dbg(dev, "min / max op_pre_pll_clk_div: %u / %u\n",
@@ -510,7 +526,8 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 		     (pll->flags & CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER) ? 1 :
 		     2 - (op_pll_fr->pre_pll_clk_div & 1)) {
 		rval = __ccs_pll_calculate(dev, lim, op_lim_fr, op_lim_bk, pll,
-					   op_pll_fr, op_pll_bk, mul, div, l);
+					   op_pll_fr, op_pll_bk, mul, div, l,
+					   cphy, phy_const);
 		if (rval)
 			continue;
 
-- 
2.27.0

