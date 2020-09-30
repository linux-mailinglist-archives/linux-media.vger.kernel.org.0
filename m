Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BAFF27EC95
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731052AbgI3P3P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:15 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44670 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731003AbgI3P3O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:14 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 38B13634CA4
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:52 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 069/100] ccs-pll: Support two cycles per pixel on OP domain
Date:   Wed, 30 Sep 2020 18:28:27 +0300
Message-Id: <20200930152858.8471-70-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The l parameter defines the number of clock cycles to process a single
pixel per OP lane. It is calculated based on a new register
op_bits_per_lane.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c      | 19 +++++++++++++------
 drivers/media/i2c/ccs-pll.h      |  2 ++
 drivers/media/i2c/ccs/ccs-core.c |  1 +
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index ace2c2f352a9..8996f30c1e3b 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -162,7 +162,7 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 		    const struct ccs_pll_branch_limits_bk *op_lim_bk,
 		    struct ccs_pll *pll, struct ccs_pll_branch_fr *op_pll_fr,
 		    struct ccs_pll_branch_bk *op_pll_bk, uint32_t mul,
-		    uint32_t div)
+		    uint32_t div, uint32_t l)
 {
 	uint32_t sys_div;
 	uint32_t best_pix_div = INT_MAX >> 1;
@@ -252,10 +252,15 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	op_pll_fr->pll_op_clk_freq_hz = op_pll_fr->pll_ip_clk_freq_hz
 		* op_pll_fr->pll_multiplier;
 
-	op_pll_bk->pix_clk_div = pll->bits_per_pixel
-		* pll->op_lanes / pll->csi2.lanes;
+	if (pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL)
+		op_pll_bk->pix_clk_div = pll->bits_per_pixel
+			* pll->op_lanes / pll->csi2.lanes / l;
+	else
+		op_pll_bk->pix_clk_div = pll->bits_per_pixel / l;
+
 	op_pll_bk->pix_clk_freq_hz =
 		op_pll_bk->sys_clk_freq_hz / op_pll_bk->pix_clk_div;
+
 	dev_dbg(dev, "op_pix_clk_div: %u\n", op_pll_bk->pix_clk_div);
 
 	if (pll->flags & CCS_PLL_FLAG_NO_OP_CLOCKS) {
@@ -291,7 +296,7 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	dev_dbg(dev, "scale_m: %u\n", pll->scale_m);
 	min_vt_div = DIV_ROUND_UP(op_pll_bk->pix_clk_div
 				  * op_pll_bk->sys_clk_div * pll->scale_n
-				  * pll->vt_lanes,
+				  * pll->vt_lanes * l,
 				  pll->op_lanes * vt_op_binning_div
 				  * pll->scale_m);
 
@@ -406,6 +411,8 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	uint16_t min_op_pre_pll_clk_div;
 	uint16_t max_op_pre_pll_clk_div;
 	uint32_t mul, div;
+	uint32_t l = (!pll->op_bits_per_lane ||
+		      pll->op_bits_per_lane >= pll->bits_per_pixel) ? 1 : 2;
 	uint32_t i;
 	int rval = -EINVAL;
 
@@ -444,7 +451,7 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	pll->pixel_rate_csi =
 		op_pll_bk->pix_clk_freq_hz
 		* (pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL ?
-		   pll->csi2.lanes : 1);
+		   pll->csi2.lanes : 1) / l;
 
 	/* Figure out limits for OP pre-pll divider based on extclk */
 	dev_dbg(dev, "min / max op_pre_pll_clk_div: %u / %u\n",
@@ -482,7 +489,7 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 		     (pll->flags & CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER) ? 1 :
 		     2 - (op_pll_fr->pre_pll_clk_div & 1)) {
 		rval = __ccs_pll_calculate(dev, lim, op_lim_fr, op_lim_bk, pll,
-					   op_pll_fr, op_pll_bk, mul, div);
+					   op_pll_fr, op_pll_bk, mul, div, l);
 		if (rval)
 			continue;
 
diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
index 7c2b7a85de6a..dd97cd6dca0d 100644
--- a/drivers/media/i2c/ccs-pll.h
+++ b/drivers/media/i2c/ccs-pll.h
@@ -75,6 +75,7 @@ struct ccs_pll_branch_bk {
  * @scale_m: Downscaling factor, M component, [16, max] (input)
  * @scale_n: Downscaling factor, N component, typically 16 (input)
  * @bits_per_pixel: Bits per pixel on the output data bus (input)
+ * @op_bits_per_lane: Number of bits per OP lane (input)
  * @flags: CCS_PLL_FLAG_* (input)
  * @link_freq: Chosen link frequency (input)
  * @ext_clk_freq_hz: External clock frequency, i.e. the sensor's input clock
@@ -99,6 +100,7 @@ struct ccs_pll {
 	uint8_t scale_m;
 	uint8_t scale_n;
 	uint8_t bits_per_pixel;
+	uint8_t op_bits_per_lane;
 	uint16_t flags;
 	uint32_t link_freq;
 	uint32_t ext_clk_freq_hz;
diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 5f361eec2006..7ba5e7b0f2f7 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3201,6 +3201,7 @@ static int ccs_probe(struct i2c_client *client)
 	if (CCS_LIM(sensor, CLOCK_TREE_PLL_CAPABILITY) &
 	    CCS_CLOCK_TREE_PLL_CAPABILITY_EXT_DIVIDER)
 		sensor->pll.flags |= CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER;
+	sensor->pll.op_bits_per_lane = CCS_LIM(sensor, OP_BITS_PER_LANE);
 	sensor->pll.ext_clk_freq_hz = sensor->hwcfg.ext_clk;
 	sensor->pll.scale_n = CCS_LIM(sensor, SCALER_N_MIN);
 
-- 
2.27.0

