Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB28527ECB9
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731025AbgI3P3d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:33 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44664 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731046AbgI3P3P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:15 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 1BBAE634CF3
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:53 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 080/100] ccs-pll: Separate VT divisor limit calculation from the rest
Date:   Wed, 30 Sep 2020 18:28:38 +0300
Message-Id: <20200930152858.8471-81-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Separate VT divisor limit calculation from the rest of the VT PLL branch
calculation. This way it can be used for dual PLL support as well.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 64 +++++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 27 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 52dea3894229..d7805e61a7c0 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -228,6 +228,41 @@ static int check_ext_bounds(struct device *dev, struct ccs_pll *pll)
 	return 0;
 }
 
+static void
+ccs_pll_find_vt_sys_div(struct device *dev, const struct ccs_pll_limits *lim,
+			struct ccs_pll *pll, struct ccs_pll_branch_fr *pll_fr,
+			uint16_t min_vt_div, uint16_t max_vt_div,
+			uint16_t *min_sys_div, uint16_t *max_sys_div)
+{
+	/*
+	 * Find limits for sys_clk_div. Not all values are possible with all
+	 * values of pix_clk_div.
+	 */
+	*min_sys_div = lim->vt_bk.min_sys_clk_div;
+	dev_dbg(dev, "min_sys_div: %u\n", *min_sys_div);
+	*min_sys_div = max_t(uint16_t, *min_sys_div,
+			     DIV_ROUND_UP(min_vt_div,
+					  lim->vt_bk.max_pix_clk_div));
+	dev_dbg(dev, "min_sys_div: max_vt_pix_clk_div: %u\n", *min_sys_div);
+	*min_sys_div = max_t(uint16_t, *min_sys_div,
+			     pll_fr->pll_op_clk_freq_hz
+			     / lim->vt_bk.max_sys_clk_freq_hz);
+	dev_dbg(dev, "min_sys_div: max_pll_op_clk_freq_hz: %u\n", *min_sys_div);
+	*min_sys_div = clk_div_even_up(*min_sys_div);
+	dev_dbg(dev, "min_sys_div: one or even: %u\n", *min_sys_div);
+
+	*max_sys_div = lim->vt_bk.max_sys_clk_div;
+	dev_dbg(dev, "max_sys_div: %u\n", *max_sys_div);
+	*max_sys_div = min_t(uint16_t, *max_sys_div,
+			     DIV_ROUND_UP(max_vt_div,
+					  lim->vt_bk.min_pix_clk_div));
+	dev_dbg(dev, "max_sys_div: min_vt_pix_clk_div: %u\n", *max_sys_div);
+	*max_sys_div = min_t(uint16_t, *max_sys_div,
+			     DIV_ROUND_UP(pll_fr->pll_op_clk_freq_hz,
+					  lim->vt_bk.min_pix_clk_freq_hz));
+	dev_dbg(dev, "max_sys_div: min_vt_pix_clk_freq_hz: %u\n", *max_sys_div);
+}
+
 #define CPHY_CONST		7
 #define DPHY_CONST		16
 #define PHY_CONST_DIV		16
@@ -314,33 +349,8 @@ ccs_pll_calculate_vt(struct device *dev, const struct ccs_pll_limits *lim,
 	dev_dbg(dev, "max_vt_div: min_vt_pix_clk_freq_hz: %u\n",
 		max_vt_div);
 
-	/*
-	 * Find limitsits for sys_clk_div. Not all values are possible
-	 * with all values of pix_clk_div.
-	 */
-	min_sys_div = lim->vt_bk.min_sys_clk_div;
-	dev_dbg(dev, "min_sys_div: %u\n", min_sys_div);
-	min_sys_div = max_t(uint16_t, min_sys_div,
-			    DIV_ROUND_UP(min_vt_div,
-					 lim->vt_bk.max_pix_clk_div));
-	dev_dbg(dev, "min_sys_div: max_vt_pix_clk_div: %u\n", min_sys_div);
-	min_sys_div = max_t(uint16_t, min_sys_div,
-			    pll_fr->pll_op_clk_freq_hz
-			    / lim->vt_bk.max_sys_clk_freq_hz);
-	dev_dbg(dev, "min_sys_div: max_pll_op_clk_freq_hz: %u\n", min_sys_div);
-	min_sys_div = clk_div_even_up(min_sys_div);
-	dev_dbg(dev, "min_sys_div: one or even: %u\n", min_sys_div);
-
-	max_sys_div = lim->vt_bk.max_sys_clk_div;
-	dev_dbg(dev, "max_sys_div: %u\n", max_sys_div);
-	max_sys_div = min_t(uint16_t, max_sys_div,
-			    DIV_ROUND_UP(max_vt_div,
-					 lim->vt_bk.min_pix_clk_div));
-	dev_dbg(dev, "max_sys_div: min_vt_pix_clk_div: %u\n", max_sys_div);
-	max_sys_div = min_t(uint16_t, max_sys_div,
-			    DIV_ROUND_UP(pll_fr->pll_op_clk_freq_hz,
-					 lim->vt_bk.min_pix_clk_freq_hz));
-	dev_dbg(dev, "max_sys_div: min_vt_pix_clk_freq_hz: %u\n", max_sys_div);
+	ccs_pll_find_vt_sys_div(dev, lim, pll, pll_fr, min_vt_div,
+				max_vt_div, &min_sys_div, &max_sys_div);
 
 	/*
 	 * Find pix_div such that a legal pix_div * sys_div results
-- 
2.27.0

