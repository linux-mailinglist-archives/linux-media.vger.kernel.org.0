Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A28A327ECA7
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731081AbgI3P3R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:17 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44682 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731049AbgI3P3P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:15 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 56759634CBF
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:53 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 083/100] ccs-pll: Add support for DDR OP system and pixel clocks
Date:   Wed, 30 Sep 2020 18:28:41 +0300
Message-Id: <20200930152858.8471-84-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for dual data rate operational system and pixel clocks. This
is implemented using two PLL flags.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 64 +++++++++++++++++++++++++------------
 drivers/media/i2c/ccs-pll.h |  2 ++
 2 files changed, 46 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index dbb22096447d..cec811bb37a4 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -119,7 +119,7 @@ static void print_pll(struct device *dev, struct ccs_pll *pll)
 		}
 	}
 
-	dev_dbg(dev, "flags%s%s%s%s%s%s%s\n",
+	dev_dbg(dev, "flags%s%s%s%s%s%s%s%s%s\n",
 		pll->flags & PLL_FL(LANE_SPEED_MODEL) ? " lane-speed" : "",
 		pll->flags & PLL_FL(LINK_DECOUPLED) ? " link-decoupled" : "",
 		pll->flags & PLL_FL(EXT_IP_PLL_DIVIDER) ?
@@ -128,7 +128,19 @@ static void print_pll(struct device *dev, struct ccs_pll *pll)
 		" flexible-op-pix-div" : "",
 		pll->flags & PLL_FL(FIFO_DERATING) ? " fifo-derating" : "",
 		pll->flags & PLL_FL(FIFO_OVERRATING) ? " fifo-overrating" : "",
-		pll->flags & PLL_FL(DUAL_PLL) ? " dual-pll" : "");
+		pll->flags & PLL_FL(DUAL_PLL) ? " dual-pll" : "",
+		pll->flags & PLL_FL(OP_SYS_DDR) ? " op-sys-ddr" : "",
+		pll->flags & PLL_FL(OP_PIX_DDR) ? " op-pix-ddr" : "");
+}
+
+static uint32_t op_sys_ddr(uint32_t flags)
+{
+	return flags & CCS_PLL_FLAG_OP_SYS_DDR ? 1 : 0;
+}
+
+static uint32_t op_pix_ddr(uint32_t flags)
+{
+	return flags & CCS_PLL_FLAG_OP_PIX_DDR ? 1 : 0;
 }
 
 static int check_fr_bounds(struct device *dev,
@@ -440,8 +452,8 @@ static void ccs_pll_calculate_vt(
 	if (!(pll->flags & CCS_PLL_FLAG_FIFO_DERATING)) {
 		min_vt_div =
 			op_pll_bk->sys_clk_div * op_pll_bk->pix_clk_div
-			* pll->vt_lanes * phy_const
-			/ pll->op_lanes / PHY_CONST_DIV;
+			* pll->vt_lanes * phy_const / pll->op_lanes
+			/ (PHY_CONST_DIV << op_pix_ddr(pll->flags));
 	} else {
 		/*
 		 * Some sensors perform analogue binning and some do this
@@ -477,7 +489,7 @@ static void ccs_pll_calculate_vt(
 				      CCS_PLL_FLAG_LANE_SPEED_MODEL ?
 				      pll->csi2.lanes : 1)
 				     * vt_op_binning_div * pll->scale_m
-				     * PHY_CONST_DIV);
+				     * PHY_CONST_DIV << op_pix_ddr(pll->flags));
 	}
 
 	/* Find smallest and biggest allowed vt divisor. */
@@ -571,7 +583,8 @@ ccs_pll_calculate_op(struct device *dev, const struct ccs_pll_limits *lim,
 		     const struct ccs_pll_branch_limits_bk *op_lim_bk,
 		     struct ccs_pll *pll, struct ccs_pll_branch_fr *op_pll_fr,
 		     struct ccs_pll_branch_bk *op_pll_bk, uint32_t mul,
-		     uint32_t div, uint32_t l, bool cphy, uint32_t phy_const)
+		     uint32_t div, uint32_t op_sys_clk_freq_hz_sdr, uint32_t l,
+		     bool cphy, uint32_t phy_const)
 {
 	/*
 	 * Higher multipliers (and divisors) are often required than
@@ -657,15 +670,22 @@ ccs_pll_calculate_op(struct device *dev, const struct ccs_pll_limits *lim,
 		* op_pll_fr->pll_multiplier;
 
 	if (pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL)
-		op_pll_bk->pix_clk_div = pll->bits_per_pixel
-			* pll->op_lanes * phy_const
-			/ PHY_CONST_DIV / pll->csi2.lanes / l;
+		op_pll_bk->pix_clk_div =
+			(pll->bits_per_pixel
+			 * pll->op_lanes * (phy_const << op_sys_ddr(pll->flags))
+			 / PHY_CONST_DIV / pll->csi2.lanes / l)
+			>> op_pix_ddr(pll->flags);
 	else
 		op_pll_bk->pix_clk_div =
-			pll->bits_per_pixel * phy_const / PHY_CONST_DIV / l;
+			(pll->bits_per_pixel
+			 * (phy_const << op_sys_ddr(pll->flags))
+			 / PHY_CONST_DIV / l) >> op_pix_ddr(pll->flags);
 
 	op_pll_bk->pix_clk_freq_hz =
-		op_pll_bk->sys_clk_freq_hz / op_pll_bk->pix_clk_div;
+		(op_sys_clk_freq_hz_sdr >> op_pix_ddr(pll->flags))
+		/ op_pll_bk->pix_clk_div;
+	op_pll_bk->sys_clk_freq_hz =
+		op_sys_clk_freq_hz_sdr >> op_sys_ddr(pll->flags);
 
 	dev_dbg(dev, "op_pix_clk_div: %u\n", op_pll_bk->pix_clk_div);
 
@@ -681,6 +701,7 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	struct ccs_pll_branch_bk *op_pll_bk;
 	bool cphy = pll->bus_type == CCS_PLL_BUS_TYPE_CSI2_CPHY;
 	uint32_t phy_const = cphy ? CPHY_CONST : DPHY_CONST;
+	uint32_t op_sys_clk_freq_hz_sdr;
 	uint16_t min_op_pre_pll_clk_div;
 	uint16_t max_op_pre_pll_clk_div;
 	uint32_t mul, div;
@@ -730,7 +751,8 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	 * op_pix_clk_div is supported
 	 */
 	if (!(pll->flags & CCS_PLL_FLAG_FLEXIBLE_OP_PIX_CLK_DIV) &&
-	    (pll->bits_per_pixel * pll->op_lanes) % (pll->csi2.lanes * l)) {
+	    (pll->bits_per_pixel * pll->op_lanes) %
+	    (pll->csi2.lanes * l << op_pix_ddr(pll->flags))) {
 		dev_dbg(dev, "op_pix_clk_div not an integer (bpp %u, op lanes %u, lanes %u, l %u)\n",
 			pll->bits_per_pixel, pll->op_lanes, pll->csi2.lanes, l);
 		return -EINVAL;
@@ -745,12 +767,12 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	switch (pll->bus_type) {
 	case CCS_PLL_BUS_TYPE_CSI2_DPHY:
 		/* CSI transfers 2 bits per clock per lane; thus times 2 */
-		op_pll_bk->sys_clk_freq_hz = pll->link_freq * 2
+		op_sys_clk_freq_hz_sdr = pll->link_freq * 2
 			* (pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL ?
 			   1 : pll->csi2.lanes);
 		break;
 	case CCS_PLL_BUS_TYPE_CSI2_CPHY:
-		op_pll_bk->sys_clk_freq_hz =
+		op_sys_clk_freq_hz_sdr =
 			pll->link_freq
 			* (pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL ?
 			   1 : pll->csi2.lanes);
@@ -760,7 +782,7 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	}
 
 	pll->pixel_rate_csi =
-		div_u64((uint64_t)op_pll_bk->sys_clk_freq_hz
+		div_u64((uint64_t)op_sys_clk_freq_hz_sdr
 			* (pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL ?
 			   pll->csi2.lanes : 1) * PHY_CONST_DIV,
 			phy_const * pll->bits_per_pixel * l);
@@ -780,9 +802,10 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	dev_dbg(dev, "pre-pll check: min / max op_pre_pll_clk_div: %u / %u\n",
 		min_op_pre_pll_clk_div, max_op_pre_pll_clk_div);
 
-	i = gcd(op_pll_bk->sys_clk_freq_hz, pll->ext_clk_freq_hz);
-	mul = op_pll_bk->sys_clk_freq_hz / i;
-	div = pll->ext_clk_freq_hz / i;
+	i = gcd(op_sys_clk_freq_hz_sdr,
+		pll->ext_clk_freq_hz << op_pix_ddr(pll->flags));
+	mul = op_sys_clk_freq_hz_sdr / i;
+	div = (pll->ext_clk_freq_hz << op_pix_ddr(pll->flags)) / i;
 	dev_dbg(dev, "mul %u / div %u\n", mul, div);
 
 	min_op_pre_pll_clk_div =
@@ -801,8 +824,9 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 		     (pll->flags & CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER) ? 1 :
 		     2 - (op_pll_fr->pre_pll_clk_div & 1)) {
 		rval = ccs_pll_calculate_op(dev, lim, op_lim_fr, op_lim_bk, pll,
-					    op_pll_fr, op_pll_bk, mul, div, l,
-					    cphy, phy_const);
+					    op_pll_fr, op_pll_bk, mul, div,
+					    op_sys_clk_freq_hz_sdr, l, cphy,
+					    phy_const);
 		if (rval)
 			continue;
 
diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
index 1be8f300c860..7d1e6e3eaada 100644
--- a/drivers/media/i2c/ccs-pll.h
+++ b/drivers/media/i2c/ccs-pll.h
@@ -30,6 +30,8 @@
 #define CCS_PLL_FLAG_FIFO_DERATING				BIT(6)
 #define CCS_PLL_FLAG_FIFO_OVERRATING				BIT(7)
 #define CCS_PLL_FLAG_DUAL_PLL					BIT(8)
+#define CCS_PLL_FLAG_OP_SYS_DDR					BIT(9)
+#define CCS_PLL_FLAG_OP_PIX_DDR					BIT(10)
 
 /**
  * struct ccs_pll_branch_fr - CCS PLL configuration (front)
-- 
2.27.0

