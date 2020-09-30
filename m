Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD41527EC96
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731062AbgI3P3P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:15 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44644 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731039AbgI3P3P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:15 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id EBF5B634CF0
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:52 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 078/100] ccs-pll: Make VT divisors 16-bit
Date:   Wed, 30 Sep 2020 18:28:36 +0300
Message-Id: <20200930152858.8471-79-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make VT divisors 16-bit unsigned numbers. They don't need 32 bits after
all.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 51 ++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index e1755498cd79..c0f3f68e55d8 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -239,11 +239,11 @@ ccs_pll_calculate_vt(struct device *dev, const struct ccs_pll_limits *lim,
 		     struct ccs_pll_branch_bk *op_pll_bk, bool cphy,
 		     uint32_t phy_const)
 {
-	uint32_t sys_div;
-	uint32_t best_pix_div = INT_MAX >> 1;
-	uint32_t vt_op_binning_div;
-	uint32_t min_vt_div, max_vt_div, vt_div;
-	uint32_t min_sys_div, max_sys_div;
+	uint16_t sys_div;
+	uint16_t best_pix_div = SHRT_MAX >> 1;
+	uint16_t vt_op_binning_div;
+	uint16_t min_vt_div, max_vt_div, vt_div;
+	uint16_t min_sys_div, max_sys_div;
 
 	if (pll->flags & CCS_PLL_FLAG_NO_OP_CLOCKS)
 		goto out_calc_pixel_rate;
@@ -297,20 +297,19 @@ ccs_pll_calculate_vt(struct device *dev, const struct ccs_pll_limits *lim,
 
 	/* Find smallest and biggest allowed vt divisor. */
 	dev_dbg(dev, "min_vt_div: %u\n", min_vt_div);
-	min_vt_div = max(min_vt_div,
-			 DIV_ROUND_UP(pll_fr->pll_op_clk_freq_hz,
-				      lim->vt_bk.max_pix_clk_freq_hz));
+	min_vt_div = max_t(uint16_t, min_vt_div,
+			   DIV_ROUND_UP(pll_fr->pll_op_clk_freq_hz,
+					lim->vt_bk.max_pix_clk_freq_hz));
 	dev_dbg(dev, "min_vt_div: max_vt_pix_clk_freq_hz: %u\n",
 		min_vt_div);
-	min_vt_div = max_t(uint32_t, min_vt_div,
-			   lim->vt_bk.min_pix_clk_div
-			   * lim->vt_bk.min_sys_clk_div);
+	min_vt_div = max_t(uint16_t, min_vt_div, lim->vt_bk.min_pix_clk_div
+						 * lim->vt_bk.min_sys_clk_div);
 	dev_dbg(dev, "min_vt_div: min_vt_clk_div: %u\n", min_vt_div);
 
 	max_vt_div = lim->vt_bk.max_sys_clk_div * lim->vt_bk.max_pix_clk_div;
 	dev_dbg(dev, "max_vt_div: %u\n", max_vt_div);
-	max_vt_div = min(max_vt_div,
-			 DIV_ROUND_UP(pll_fr->pll_op_clk_freq_hz,
+	max_vt_div = min_t(uint16_t, max_vt_div,
+			   DIV_ROUND_UP(pll_fr->pll_op_clk_freq_hz,
 				      lim->vt_bk.min_pix_clk_freq_hz));
 	dev_dbg(dev, "max_vt_div: min_vt_pix_clk_freq_hz: %u\n",
 		max_vt_div);
@@ -321,26 +320,26 @@ ccs_pll_calculate_vt(struct device *dev, const struct ccs_pll_limits *lim,
 	 */
 	min_sys_div = lim->vt_bk.min_sys_clk_div;
 	dev_dbg(dev, "min_sys_div: %u\n", min_sys_div);
-	min_sys_div = max(min_sys_div,
-			  DIV_ROUND_UP(min_vt_div,
-				       lim->vt_bk.max_pix_clk_div));
+	min_sys_div = max_t(uint16_t, min_sys_div,
+			    DIV_ROUND_UP(min_vt_div,
+					 lim->vt_bk.max_pix_clk_div));
 	dev_dbg(dev, "min_sys_div: max_vt_pix_clk_div: %u\n", min_sys_div);
-	min_sys_div = max(min_sys_div,
-			  pll_fr->pll_op_clk_freq_hz
-			  / lim->vt_bk.max_sys_clk_freq_hz);
+	min_sys_div = max_t(uint16_t, min_sys_div,
+			    pll_fr->pll_op_clk_freq_hz
+			    / lim->vt_bk.max_sys_clk_freq_hz);
 	dev_dbg(dev, "min_sys_div: max_pll_op_clk_freq_hz: %u\n", min_sys_div);
 	min_sys_div = clk_div_even_up(min_sys_div);
 	dev_dbg(dev, "min_sys_div: one or even: %u\n", min_sys_div);
 
 	max_sys_div = lim->vt_bk.max_sys_clk_div;
 	dev_dbg(dev, "max_sys_div: %u\n", max_sys_div);
-	max_sys_div = min(max_sys_div,
-			  DIV_ROUND_UP(max_vt_div,
-				       lim->vt_bk.min_pix_clk_div));
+	max_sys_div = min_t(uint16_t, max_sys_div,
+			    DIV_ROUND_UP(max_vt_div,
+					 lim->vt_bk.min_pix_clk_div));
 	dev_dbg(dev, "max_sys_div: min_vt_pix_clk_div: %u\n", max_sys_div);
-	max_sys_div = min(max_sys_div,
-			  DIV_ROUND_UP(pll_fr->pll_op_clk_freq_hz,
-				       lim->vt_bk.min_pix_clk_freq_hz));
+	max_sys_div = min_t(uint16_t, max_sys_div,
+			    DIV_ROUND_UP(pll_fr->pll_op_clk_freq_hz,
+					 lim->vt_bk.min_pix_clk_freq_hz));
 	dev_dbg(dev, "max_sys_div: min_vt_pix_clk_freq_hz: %u\n", max_sys_div);
 
 	/*
@@ -376,7 +375,7 @@ ccs_pll_calculate_vt(struct device *dev, const struct ccs_pll_limits *lim,
 			if (vt_div == rounded_div)
 				break;
 		}
-		if (best_pix_div < INT_MAX >> 1)
+		if (best_pix_div < SHRT_MAX >> 1)
 			break;
 	}
 
-- 
2.27.0

