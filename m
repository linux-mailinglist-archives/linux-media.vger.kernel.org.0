Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E971E285B03
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728085AbgJGIqi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:46:38 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57058 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728035AbgJGIqQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:16 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 02222634CFC
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:22 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 086/106] ccs-pll: Separate VT divisor limit calculation from the rest
Date:   Wed,  7 Oct 2020 11:45:37 +0300
Message-Id: <20201007084557.25843-77-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
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
index 4321989b9013..8b300e786451 100644
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

