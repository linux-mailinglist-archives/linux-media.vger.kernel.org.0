Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2C7427ECC0
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731030AbgI3P3k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:40 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44650 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731012AbgI3P3N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:13 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id D8CC8634CCC
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:51 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 065/100] ccs-pll: Add support for lane speed model
Date:   Wed, 30 Sep 2020 18:28:23 +0300
Message-Id: <20200930152858.8471-66-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CCS PLL includes a capability to calculate the VT clocks on per-lane
basis. Add support for this feature.

Move calculation of the pixel rate on the CSI-2 bus early in the function
as everything needed to calculate it is already available.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 36 +++++++++++++++++++++++++-----------
 drivers/media/i2c/ccs-pll.h |  6 ++++++
 2 files changed, 31 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 6c77a5886954..c8222ee29421 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -251,11 +251,12 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	op_pll_fr->pll_op_clk_freq_hz = op_pll_fr->pll_ip_clk_freq_hz
 		* op_pll_fr->pll_multiplier;
 
-	op_pll_bk->pix_clk_div = pll->bits_per_pixel;
-	dev_dbg(dev, "op_pix_clk_div: %u\n", op_pll_bk->pix_clk_div);
-
+	op_pll_bk->pix_clk_div = pll->bits_per_pixel
+		* pll->op_lanes / pll->csi2.lanes;
 	op_pll_bk->pix_clk_freq_hz =
 		op_pll_bk->sys_clk_freq_hz / op_pll_bk->pix_clk_div;
+	dev_dbg(dev, "op_pix_clk_div: %u\n", op_pll_bk->pix_clk_div);
+
 
 	if (pll->flags & CCS_PLL_FLAG_NO_OP_CLOCKS) {
 		/* No OP clocks --- VT clocks are used instead. */
@@ -283,15 +284,16 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	 * divisors. One must make sure that horizontal blanking is
 	 * enough to accommodate the CSI-2 sync codes.
 	 *
-	 * Take scaling factor into account as well.
+	 * Take scaling factor and number of VT lanes into account as well.
 	 *
 	 * Find absolute limits for the factor of vt divider.
 	 */
 	dev_dbg(dev, "scale_m: %u\n", pll->scale_m);
 	min_vt_div = DIV_ROUND_UP(op_pll_bk->pix_clk_div
-				  * op_pll_bk->sys_clk_div * pll->scale_n,
-				  lane_op_clock_ratio * vt_op_binning_div
-				  * pll->scale_m);
+				  * op_pll_bk->sys_clk_div * pll->scale_n
+				  * pll->vt_lanes,
+				  pll->op_lanes * vt_op_binning_div
+				  * pll->scale_m * lane_op_clock_ratio);
 
 	/* Find smallest and biggest allowed vt divisor. */
 	dev_dbg(dev, "min_vt_div: %u\n", min_vt_div);
@@ -387,9 +389,8 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 		pll->vt_bk.sys_clk_freq_hz / pll->vt_bk.pix_clk_div;
 
 out_skip_vt_calc:
-	pll->pixel_rate_csi =
-		op_pll_bk->pix_clk_freq_hz * lane_op_clock_ratio;
-	pll->pixel_rate_pixel_array = pll->vt_bk.pix_clk_freq_hz;
+	pll->pixel_rate_pixel_array =
+		pll->vt_bk.pix_clk_freq_hz * pll->vt_lanes;
 
 	return check_all_bounds(dev, lim, op_lim_fr, op_lim_bk, pll, op_pll_fr,
 				op_pll_bk);
@@ -409,6 +410,13 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	uint32_t i;
 	int rval = -EINVAL;
 
+	if (!(pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL)) {
+		pll->op_lanes = 1;
+		pll->vt_lanes = 1;
+	}
+	dev_dbg(dev, "vt_lanes: %u\n", pll->vt_lanes);
+	dev_dbg(dev, "op_lanes: %u\n", pll->op_lanes);
+
 	if (pll->flags & CCS_PLL_FLAG_NO_OP_CLOCKS) {
 		/*
 		 * If there's no OP PLL at all, use the VT values
@@ -433,12 +441,18 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	case CCS_PLL_BUS_TYPE_CSI2_DPHY:
 		/* CSI transfers 2 bits per clock per lane; thus times 2 */
 		op_pll_bk->sys_clk_freq_hz = pll->link_freq * 2
-			* (pll->csi2.lanes / lane_op_clock_ratio);
+			* (pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL ?
+			   1 : pll->csi2.lanes) / lane_op_clock_ratio;
 		break;
 	default:
 		return -EINVAL;
 	}
 
+	pll->pixel_rate_csi =
+		op_pll_bk->pix_clk_freq_hz
+		* (pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL ?
+		   pll->csi2.lanes : 1) * lane_op_clock_ratio;
+
 	/* Figure out limits for OP pre-pll divider based on extclk */
 	dev_dbg(dev, "min / max op_pre_pll_clk_div: %u / %u\n",
 		op_lim_fr->min_pre_pll_clk_div, op_lim_fr->max_pre_pll_clk_div);
diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
index f772ed8ef579..57308b8f3a8a 100644
--- a/drivers/media/i2c/ccs-pll.h
+++ b/drivers/media/i2c/ccs-pll.h
@@ -22,6 +22,8 @@
 /* op pix clock is for all lanes in total normally */
 #define CCS_PLL_FLAG_OP_PIX_CLOCK_PER_LANE			BIT(0)
 #define CCS_PLL_FLAG_NO_OP_CLOCKS				BIT(1)
+/* CCS PLL flags */
+#define CCS_PLL_FLAG_LANE_SPEED_MODEL				BIT(2)
 
 /**
  * struct ccs_pll_branch_fr - CCS PLL configuration (front)
@@ -63,6 +65,8 @@ struct ccs_pll_branch_bk {
  * All information required to calculate CCS PLL configuration.
  *
  * @bus_type: Type of the data bus, CCS_PLL_BUS_TYPE_* (input)
+ * @op_lanes: Number of operational lanes (input)
+ * @vt_lanes: Number of video timing lanes (input)
  * @csi2.lanes: The number of the CSI-2 data lanes (input)
  * @binning_vertical: Vertical binning factor (input)
  * @binning_horizontal: Horizontal binning factor (input)
@@ -83,6 +87,8 @@ struct ccs_pll_branch_bk {
 struct ccs_pll {
 	/* input values */
 	uint8_t bus_type;
+	uint8_t op_lanes;
+	uint8_t vt_lanes;
 	struct {
 		uint8_t lanes;
 	} csi2;
-- 
2.27.0

