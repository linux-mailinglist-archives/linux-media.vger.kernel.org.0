Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 726A52D1C0A
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 22:28:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727370AbgLGV0u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 16:26:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726415AbgLGV0t (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 16:26:49 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B7A8C0611D0
        for <linux-media@vger.kernel.org>; Mon,  7 Dec 2020 13:23:26 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id E0C95634CBD;
        Mon,  7 Dec 2020 23:23:13 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 22/24] ccs-pll: Switch from standard integer types to kernel ones
Date:   Mon,  7 Dec 2020 23:15:28 +0200
Message-Id: <20201207211530.21180-23-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
References: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The preferred integer types in the kernel are the Linux specific ones,
switch from standard C types to u32 and alike.

The patch has been produced with the following Coccinelle spatch, with few
alignment adjustments:

@@
typedef uint32_t;
typedef u32;
@@
- uint32_t
+ u32

@@
typedef uint16_t;
typedef u16;
@@
- uint16_t
+ u16

@@
typedef uint8_t;
typedef u8;
@@
- uint8_t
+ u8

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 114 ++++++++++++++++++------------------
 drivers/media/i2c/ccs-pll.h |  86 +++++++++++++--------------
 2 files changed, 100 insertions(+), 100 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index eb7b6f01f623..530085693a56 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -17,20 +17,20 @@
 #include "ccs-pll.h"
 
 /* Return an even number or one. */
-static inline uint32_t clk_div_even(uint32_t a)
+static inline u32 clk_div_even(u32 a)
 {
-	return max_t(uint32_t, 1, a & ~1);
+	return max_t(u32, 1, a & ~1);
 }
 
 /* Return an even number or one. */
-static inline uint32_t clk_div_even_up(uint32_t a)
+static inline u32 clk_div_even_up(u32 a)
 {
 	if (a == 1)
 		return 1;
 	return (a + 1) & ~1;
 }
 
-static inline uint32_t is_one_or_even(uint32_t a)
+static inline u32 is_one_or_even(u32 a)
 {
 	if (a == 1)
 		return 1;
@@ -40,13 +40,13 @@ static inline uint32_t is_one_or_even(uint32_t a)
 	return 1;
 }
 
-static inline uint32_t one_or_more(uint32_t a)
+static inline u32 one_or_more(u32 a)
 {
 	return a ?: 1;
 }
 
-static int bounds_check(struct device *dev, uint32_t val,
-			uint32_t min, uint32_t max, const char *prefix,
+static int bounds_check(struct device *dev, u32 val,
+			u32 min, u32 max, const char *prefix,
 			char *str)
 {
 	if (val >= min && val <= max)
@@ -138,12 +138,12 @@ static void print_pll(struct device *dev, struct ccs_pll *pll)
 		pll->flags & PLL_FL(OP_PIX_DDR) ? " op-pix-ddr" : "");
 }
 
-static uint32_t op_sys_ddr(uint32_t flags)
+static u32 op_sys_ddr(u32 flags)
 {
 	return flags & CCS_PLL_FLAG_OP_SYS_DDR ? 1 : 0;
 }
 
-static uint32_t op_pix_ddr(uint32_t flags)
+static u32 op_pix_ddr(u32 flags)
 {
 	return flags & CCS_PLL_FLAG_OP_PIX_DDR ? 1 : 0;
 }
@@ -250,8 +250,8 @@ static int check_ext_bounds(struct device *dev, struct ccs_pll *pll)
 static void
 ccs_pll_find_vt_sys_div(struct device *dev, const struct ccs_pll_limits *lim,
 			struct ccs_pll *pll, struct ccs_pll_branch_fr *pll_fr,
-			uint16_t min_vt_div, uint16_t max_vt_div,
-			uint16_t *min_sys_div, uint16_t *max_sys_div)
+			u16 min_vt_div, u16 max_vt_div,
+			u16 *min_sys_div, u16 *max_sys_div)
 {
 	/*
 	 * Find limits for sys_clk_div. Not all values are possible with all
@@ -259,11 +259,11 @@ ccs_pll_find_vt_sys_div(struct device *dev, const struct ccs_pll_limits *lim,
 	 */
 	*min_sys_div = lim->vt_bk.min_sys_clk_div;
 	dev_dbg(dev, "min_sys_div: %u\n", *min_sys_div);
-	*min_sys_div = max_t(uint16_t, *min_sys_div,
+	*min_sys_div = max_t(u16, *min_sys_div,
 			     DIV_ROUND_UP(min_vt_div,
 					  lim->vt_bk.max_pix_clk_div));
 	dev_dbg(dev, "min_sys_div: max_vt_pix_clk_div: %u\n", *min_sys_div);
-	*min_sys_div = max_t(uint16_t, *min_sys_div,
+	*min_sys_div = max_t(u16, *min_sys_div,
 			     pll_fr->pll_op_clk_freq_hz
 			     / lim->vt_bk.max_sys_clk_freq_hz);
 	dev_dbg(dev, "min_sys_div: max_pll_op_clk_freq_hz: %u\n", *min_sys_div);
@@ -272,11 +272,11 @@ ccs_pll_find_vt_sys_div(struct device *dev, const struct ccs_pll_limits *lim,
 
 	*max_sys_div = lim->vt_bk.max_sys_clk_div;
 	dev_dbg(dev, "max_sys_div: %u\n", *max_sys_div);
-	*max_sys_div = min_t(uint16_t, *max_sys_div,
+	*max_sys_div = min_t(u16, *max_sys_div,
 			     DIV_ROUND_UP(max_vt_div,
 					  lim->vt_bk.min_pix_clk_div));
 	dev_dbg(dev, "max_sys_div: min_vt_pix_clk_div: %u\n", *max_sys_div);
-	*max_sys_div = min_t(uint16_t, *max_sys_div,
+	*max_sys_div = min_t(u16, *max_sys_div,
 			     DIV_ROUND_UP(pll_fr->pll_op_clk_freq_hz,
 					  lim->vt_bk.min_pix_clk_freq_hz));
 	dev_dbg(dev, "max_sys_div: min_vt_pix_clk_freq_hz: %u\n", *max_sys_div);
@@ -289,15 +289,15 @@ ccs_pll_find_vt_sys_div(struct device *dev, const struct ccs_pll_limits *lim,
 static inline int
 __ccs_pll_calculate_vt_tree(struct device *dev,
 			    const struct ccs_pll_limits *lim,
-			    struct ccs_pll *pll, uint32_t mul, uint32_t div)
+			    struct ccs_pll *pll, u32 mul, u32 div)
 {
 	const struct ccs_pll_branch_limits_fr *lim_fr = &lim->vt_fr;
 	const struct ccs_pll_branch_limits_bk *lim_bk = &lim->vt_bk;
 	struct ccs_pll_branch_fr *pll_fr = &pll->vt_fr;
 	struct ccs_pll_branch_bk *pll_bk = &pll->vt_bk;
-	uint32_t more_mul;
-	uint16_t best_pix_div = SHRT_MAX >> 1, best_div;
-	uint16_t vt_div, min_sys_div, max_sys_div, sys_div;
+	u32 more_mul;
+	u16 best_pix_div = SHRT_MAX >> 1, best_div;
+	u16 vt_div, min_sys_div, max_sys_div, sys_div;
 
 	pll_fr->pll_ip_clk_freq_hz =
 		pll->ext_clk_freq_hz / pll_fr->pre_pll_clk_div;
@@ -331,7 +331,7 @@ __ccs_pll_calculate_vt_tree(struct device *dev,
 
 	for (sys_div = min_sys_div; sys_div <= max_sys_div;
 	     sys_div += 2 - (sys_div & 1)) {
-		uint16_t pix_div;
+		u16 pix_div;
 
 		if (vt_div % sys_div)
 			continue;
@@ -379,9 +379,9 @@ static int ccs_pll_calculate_vt_tree(struct device *dev,
 {
 	const struct ccs_pll_branch_limits_fr *lim_fr = &lim->vt_fr;
 	struct ccs_pll_branch_fr *pll_fr = &pll->vt_fr;
-	uint16_t min_pre_pll_clk_div = lim_fr->min_pre_pll_clk_div;
-	uint16_t max_pre_pll_clk_div = lim_fr->max_pre_pll_clk_div;
-	uint32_t pre_mul, pre_div;
+	u16 min_pre_pll_clk_div = lim_fr->min_pre_pll_clk_div;
+	u16 max_pre_pll_clk_div = lim_fr->max_pre_pll_clk_div;
+	u32 pre_mul, pre_div;
 
 	pre_div = gcd(pll->pixel_rate_csi,
 		      pll->ext_clk_freq_hz * pll->vt_lanes);
@@ -390,11 +390,11 @@ static int ccs_pll_calculate_vt_tree(struct device *dev,
 
 	/* Make sure PLL input frequency is within limits */
 	max_pre_pll_clk_div =
-		min_t(uint16_t, max_pre_pll_clk_div,
+		min_t(u16, max_pre_pll_clk_div,
 		      DIV_ROUND_UP(pll->ext_clk_freq_hz,
 				   lim_fr->min_pll_ip_clk_freq_hz));
 
-	min_pre_pll_clk_div = max_t(uint16_t, min_pre_pll_clk_div,
+	min_pre_pll_clk_div = max_t(u16, min_pre_pll_clk_div,
 				    pll->ext_clk_freq_hz /
 				    lim_fr->max_pll_ip_clk_freq_hz);
 
@@ -406,7 +406,7 @@ static int ccs_pll_calculate_vt_tree(struct device *dev,
 	     pll_fr->pre_pll_clk_div +=
 		     (pll->flags & CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER) ? 1 :
 		     2 - (pll_fr->pre_pll_clk_div & 1)) {
-		uint32_t mul, div;
+		u32 mul, div;
 		int rval;
 
 		div = gcd(pre_mul * pll_fr->pre_pll_clk_div, pre_div);
@@ -440,13 +440,13 @@ ccs_pll_calculate_vt(struct device *dev, const struct ccs_pll_limits *lim,
 		     const struct ccs_pll_branch_limits_bk *op_lim_bk,
 		     struct ccs_pll *pll, struct ccs_pll_branch_fr *pll_fr,
 		     struct ccs_pll_branch_bk *op_pll_bk, bool cphy,
-		     uint32_t phy_const)
+		     u32 phy_const)
 {
-	uint16_t sys_div;
-	uint16_t best_pix_div = SHRT_MAX >> 1;
-	uint16_t vt_op_binning_div;
-	uint16_t min_vt_div, max_vt_div, vt_div;
-	uint16_t min_sys_div, max_sys_div;
+	u16 sys_div;
+	u16 best_pix_div = SHRT_MAX >> 1;
+	u16 vt_op_binning_div;
+	u16 min_vt_div, max_vt_div, vt_div;
+	u16 min_sys_div, max_sys_div;
 
 	if (pll->flags & CCS_PLL_FLAG_NO_OP_CLOCKS)
 		goto out_calc_pixel_rate;
@@ -500,18 +500,18 @@ ccs_pll_calculate_vt(struct device *dev, const struct ccs_pll_limits *lim,
 
 	/* Find smallest and biggest allowed vt divisor. */
 	dev_dbg(dev, "min_vt_div: %u\n", min_vt_div);
-	min_vt_div = max_t(uint16_t, min_vt_div,
+	min_vt_div = max_t(u16, min_vt_div,
 			   DIV_ROUND_UP(pll_fr->pll_op_clk_freq_hz,
 					lim->vt_bk.max_pix_clk_freq_hz));
 	dev_dbg(dev, "min_vt_div: max_vt_pix_clk_freq_hz: %u\n",
 		min_vt_div);
-	min_vt_div = max_t(uint16_t, min_vt_div, lim->vt_bk.min_pix_clk_div
-						 * lim->vt_bk.min_sys_clk_div);
+	min_vt_div = max_t(u16, min_vt_div, lim->vt_bk.min_pix_clk_div
+					    * lim->vt_bk.min_sys_clk_div);
 	dev_dbg(dev, "min_vt_div: min_vt_clk_div: %u\n", min_vt_div);
 
 	max_vt_div = lim->vt_bk.max_sys_clk_div * lim->vt_bk.max_pix_clk_div;
 	dev_dbg(dev, "max_vt_div: %u\n", max_vt_div);
-	max_vt_div = min_t(uint16_t, max_vt_div,
+	max_vt_div = min_t(u16, max_vt_div,
 			   DIV_ROUND_UP(pll_fr->pll_op_clk_freq_hz,
 				      lim->vt_bk.min_pix_clk_freq_hz));
 	dev_dbg(dev, "max_vt_div: min_vt_pix_clk_freq_hz: %u\n",
@@ -526,12 +526,12 @@ ccs_pll_calculate_vt(struct device *dev, const struct ccs_pll_limits *lim,
 	 * divisor.
 	 */
 	for (vt_div = min_vt_div; vt_div <= max_vt_div; vt_div++) {
-		uint16_t __max_sys_div = vt_div & 1 ? 1 : max_sys_div;
+		u16 __max_sys_div = vt_div & 1 ? 1 : max_sys_div;
 
 		for (sys_div = min_sys_div; sys_div <= __max_sys_div;
 		     sys_div += 2 - (sys_div & 1)) {
-			uint16_t pix_div;
-			uint16_t rounded_div;
+			u16 pix_div;
+			u16 rounded_div;
 
 			pix_div = DIV_ROUND_UP(vt_div, sys_div);
 
@@ -588,9 +588,9 @@ ccs_pll_calculate_op(struct device *dev, const struct ccs_pll_limits *lim,
 		     const struct ccs_pll_branch_limits_fr *op_lim_fr,
 		     const struct ccs_pll_branch_limits_bk *op_lim_bk,
 		     struct ccs_pll *pll, struct ccs_pll_branch_fr *op_pll_fr,
-		     struct ccs_pll_branch_bk *op_pll_bk, uint32_t mul,
-		     uint32_t div, uint32_t op_sys_clk_freq_hz_sdr, uint32_t l,
-		     bool cphy, uint32_t phy_const)
+		     struct ccs_pll_branch_bk *op_pll_bk, u32 mul,
+		     u32 div, u32 op_sys_clk_freq_hz_sdr, u32 l,
+		     bool cphy, u32 phy_const)
 {
 	/*
 	 * Higher multipliers (and divisors) are often required than
@@ -598,9 +598,9 @@ ccs_pll_calculate_op(struct device *dev, const struct ccs_pll_limits *lim,
 	 * There are limits for all values in the clock tree. These
 	 * are the minimum and maximum multiplier for mul.
 	 */
-	uint32_t more_mul_min, more_mul_max;
-	uint32_t more_mul_factor;
-	uint32_t i;
+	u32 more_mul_min, more_mul_max;
+	u32 more_mul_factor;
+	u32 i;
 
 	/*
 	 * Get pre_pll_clk_div so that our pll_op_clk_freq_hz won't be
@@ -614,7 +614,7 @@ ccs_pll_calculate_op(struct device *dev, const struct ccs_pll_limits *lim,
 		more_mul_max);
 	/* Don't go above max pll op frequency. */
 	more_mul_max =
-		min_t(uint32_t,
+		min_t(u32,
 		      more_mul_max,
 		      op_lim_fr->max_pll_op_clk_freq_hz
 		      / (pll->ext_clk_freq_hz /
@@ -706,14 +706,14 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	struct ccs_pll_branch_fr *op_pll_fr;
 	struct ccs_pll_branch_bk *op_pll_bk;
 	bool cphy = pll->bus_type == CCS_PLL_BUS_TYPE_CSI2_CPHY;
-	uint32_t phy_const = cphy ? CPHY_CONST : DPHY_CONST;
-	uint32_t op_sys_clk_freq_hz_sdr;
-	uint16_t min_op_pre_pll_clk_div;
-	uint16_t max_op_pre_pll_clk_div;
-	uint32_t mul, div;
-	uint32_t l = (!pll->op_bits_per_lane ||
-		      pll->op_bits_per_lane >= pll->bits_per_pixel) ? 1 : 2;
-	uint32_t i;
+	u32 phy_const = cphy ? CPHY_CONST : DPHY_CONST;
+	u32 op_sys_clk_freq_hz_sdr;
+	u16 min_op_pre_pll_clk_div;
+	u16 max_op_pre_pll_clk_div;
+	u32 mul, div;
+	u32 l = (!pll->op_bits_per_lane ||
+		 pll->op_bits_per_lane >= pll->bits_per_pixel) ? 1 : 2;
+	u32 i;
 	int rval = -EINVAL;
 
 	if (!(pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL)) {
@@ -797,11 +797,11 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	dev_dbg(dev, "min / max op_pre_pll_clk_div: %u / %u\n",
 		op_lim_fr->min_pre_pll_clk_div, op_lim_fr->max_pre_pll_clk_div);
 	max_op_pre_pll_clk_div =
-		min_t(uint16_t, op_lim_fr->max_pre_pll_clk_div,
+		min_t(u16, op_lim_fr->max_pre_pll_clk_div,
 		      clk_div_even(pll->ext_clk_freq_hz /
 				   op_lim_fr->min_pll_ip_clk_freq_hz));
 	min_op_pre_pll_clk_div =
-		max_t(uint16_t, op_lim_fr->min_pre_pll_clk_div,
+		max_t(u16, op_lim_fr->min_pre_pll_clk_div,
 		      clk_div_even_up(
 			      DIV_ROUND_UP(pll->ext_clk_freq_hz,
 					   op_lim_fr->max_pll_ip_clk_freq_hz)));
@@ -815,7 +815,7 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	dev_dbg(dev, "mul %u / div %u\n", mul, div);
 
 	min_op_pre_pll_clk_div =
-		max_t(uint16_t, min_op_pre_pll_clk_div,
+		max_t(u16, min_op_pre_pll_clk_div,
 		      clk_div_even_up(
 			      mul /
 			      one_or_more(
diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
index b97d7ff50ea5..6eb1b1c68e1e 100644
--- a/drivers/media/i2c/ccs-pll.h
+++ b/drivers/media/i2c/ccs-pll.h
@@ -44,10 +44,10 @@
  * @pll_op_clk_freq_hz: PLL output clock frequency
  */
 struct ccs_pll_branch_fr {
-	uint16_t pre_pll_clk_div;
-	uint16_t pll_multiplier;
-	uint32_t pll_ip_clk_freq_hz;
-	uint32_t pll_op_clk_freq_hz;
+	u16 pre_pll_clk_div;
+	u16 pll_multiplier;
+	u32 pll_ip_clk_freq_hz;
+	u32 pll_op_clk_freq_hz;
 };
 
 /**
@@ -61,10 +61,10 @@ struct ccs_pll_branch_fr {
  * @pix_clk_freq_hz: Pixel clock frequency
  */
 struct ccs_pll_branch_bk {
-	uint16_t sys_clk_div;
-	uint16_t pix_clk_div;
-	uint32_t sys_clk_freq_hz;
-	uint32_t pix_clk_freq_hz;
+	u16 sys_clk_div;
+	u16 pix_clk_div;
+	u32 sys_clk_freq_hz;
+	u32 pix_clk_freq_hz;
 };
 
 /**
@@ -97,21 +97,21 @@ struct ccs_pll_branch_bk {
  */
 struct ccs_pll {
 	/* input values */
-	uint8_t bus_type;
-	uint8_t op_lanes;
-	uint8_t vt_lanes;
+	u8 bus_type;
+	u8 op_lanes;
+	u8 vt_lanes;
 	struct {
-		uint8_t lanes;
+		u8 lanes;
 	} csi2;
-	uint8_t binning_horizontal;
-	uint8_t binning_vertical;
-	uint8_t scale_m;
-	uint8_t scale_n;
-	uint8_t bits_per_pixel;
-	uint8_t op_bits_per_lane;
-	uint16_t flags;
-	uint32_t link_freq;
-	uint32_t ext_clk_freq_hz;
+	u8 binning_horizontal;
+	u8 binning_vertical;
+	u8 scale_m;
+	u8 scale_n;
+	u8 bits_per_pixel;
+	u8 op_bits_per_lane;
+	u16 flags;
+	u32 link_freq;
+	u32 ext_clk_freq_hz;
 
 	/* output values */
 	struct ccs_pll_branch_fr vt_fr;
@@ -119,8 +119,8 @@ struct ccs_pll {
 	struct ccs_pll_branch_fr op_fr;
 	struct ccs_pll_branch_bk op_bk;
 
-	uint32_t pixel_rate_csi;
-	uint32_t pixel_rate_pixel_array;
+	u32 pixel_rate_csi;
+	u32 pixel_rate_pixel_array;
 };
 
 /**
@@ -136,14 +136,14 @@ struct ccs_pll {
  * @max_pll_op_clk_freq_hz: Maximum PLL output clock frequency
  */
 struct ccs_pll_branch_limits_fr {
-	uint16_t min_pre_pll_clk_div;
-	uint16_t max_pre_pll_clk_div;
-	uint32_t min_pll_ip_clk_freq_hz;
-	uint32_t max_pll_ip_clk_freq_hz;
-	uint16_t min_pll_multiplier;
-	uint16_t max_pll_multiplier;
-	uint32_t min_pll_op_clk_freq_hz;
-	uint32_t max_pll_op_clk_freq_hz;
+	u16 min_pre_pll_clk_div;
+	u16 max_pre_pll_clk_div;
+	u32 min_pll_ip_clk_freq_hz;
+	u32 max_pll_ip_clk_freq_hz;
+	u16 min_pll_multiplier;
+	u16 max_pll_multiplier;
+	u32 min_pll_op_clk_freq_hz;
+	u32 max_pll_op_clk_freq_hz;
 };
 
 /**
@@ -159,14 +159,14 @@ struct ccs_pll_branch_limits_fr {
  * @max_pix_clk_freq_hz: Maximum pixel clock frequency
  */
 struct ccs_pll_branch_limits_bk {
-	uint16_t min_sys_clk_div;
-	uint16_t max_sys_clk_div;
-	uint32_t min_sys_clk_freq_hz;
-	uint32_t max_sys_clk_freq_hz;
-	uint16_t min_pix_clk_div;
-	uint16_t max_pix_clk_div;
-	uint32_t min_pix_clk_freq_hz;
-	uint32_t max_pix_clk_freq_hz;
+	u16 min_sys_clk_div;
+	u16 max_sys_clk_div;
+	u32 min_sys_clk_freq_hz;
+	u32 max_sys_clk_freq_hz;
+	u16 min_pix_clk_div;
+	u16 max_pix_clk_div;
+	u32 min_pix_clk_freq_hz;
+	u32 max_pix_clk_freq_hz;
 };
 
 /**
@@ -183,8 +183,8 @@ struct ccs_pll_branch_limits_bk {
  */
 struct ccs_pll_limits {
 	/* Strict PLL limits */
-	uint32_t min_ext_clk_freq_hz;
-	uint32_t max_ext_clk_freq_hz;
+	u32 min_ext_clk_freq_hz;
+	u32 max_ext_clk_freq_hz;
 
 	struct ccs_pll_branch_limits_fr vt_fr;
 	struct ccs_pll_branch_limits_bk vt_bk;
@@ -192,8 +192,8 @@ struct ccs_pll_limits {
 	struct ccs_pll_branch_limits_bk op_bk;
 
 	/* Other relevant limits */
-	uint32_t min_line_length_pck_bin;
-	uint32_t min_line_length_pck;
+	u32 min_line_length_pck_bin;
+	u32 min_line_length_pck;
 };
 
 struct device;
-- 
2.29.2

