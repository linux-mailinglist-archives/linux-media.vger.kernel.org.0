Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 074E327ECB5
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731098AbgI3P33 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:29 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44690 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731003AbgI3P3Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:16 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 4428E634CF5
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:53 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 082/100] ccs: Dual PLL support
Date:   Wed, 30 Sep 2020 18:28:40 +0300
Message-Id: <20200930152858.8471-83-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for sensors that either require dual PLL or support single or
dual PLL but use dual PLL as default.

Use sensor default configuration for sensors that support both modes.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c      |  9 +++++--
 drivers/media/i2c/ccs/ccs-core.c | 45 +++++++++++++++++++++++++++++++-
 2 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 62ce38efb118..dbb22096447d 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -331,7 +331,10 @@ __ccs_pll_calculate_vt_tree(struct device *dev,
 			continue;
 		}
 
-		if (pix_div * sys_div <= best_div) {
+		dev_dbg(dev, "sys/pix/best_pix: %u,%u,%u\n", sys_div, pix_div,
+			best_pix_div);
+
+		if (pix_div * sys_div <= best_pix_div) {
 			best_pix_div = pix_div;
 			best_div = pix_div * sys_div;
 		}
@@ -803,7 +806,9 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 		if (rval)
 			continue;
 
-		rval = check_fr_bounds(dev, lim, pll, PLL_VT);
+		rval = check_fr_bounds(dev, lim, pll,
+				       pll->flags & CCS_PLL_FLAG_DUAL_PLL ?
+				       PLL_OP : PLL_VT);
 		if (rval)
 			continue;
 
diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index ace2844b5798..1272cfe201e3 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -394,7 +394,23 @@ static int ccs_pll_configure(struct ccs_sensor *sensor)
 	if (rval < 0)
 		return rval;
 
-	return ccs_write(sensor, OP_SYS_CLK_DIV, pll->op_bk.sys_clk_div);
+	rval = ccs_write(sensor, OP_SYS_CLK_DIV, pll->op_bk.sys_clk_div);
+	if (rval < 0)
+		return rval;
+
+	if (!(pll->flags & CCS_PLL_FLAG_DUAL_PLL))
+		return 0;
+
+	rval = ccs_write(sensor, PLL_MODE, CCS_PLL_MODE_DUAL);
+	if (rval < 0)
+		return rval;
+
+	rval = ccs_write(sensor, OP_PRE_PLL_CLK_DIV,
+			 pll->op_fr.pre_pll_clk_div);
+	if (rval < 0)
+		return rval;
+
+	return ccs_write(sensor, OP_PLL_MULTIPLIER, pll->op_fr.pll_multiplier);
 }
 
 static int ccs_pll_try(struct ccs_sensor *sensor, struct ccs_pll *pll)
@@ -411,6 +427,16 @@ static int ccs_pll_try(struct ccs_sensor *sensor, struct ccs_pll *pll)
 			.min_pll_op_clk_freq_hz = CCS_LIM(sensor, MIN_PLL_OP_CLK_FREQ_MHZ),
 			.max_pll_op_clk_freq_hz = CCS_LIM(sensor, MAX_PLL_OP_CLK_FREQ_MHZ),
 		},
+		.op_fr = {
+			.min_pre_pll_clk_div = CCS_LIM(sensor, MIN_OP_PRE_PLL_CLK_DIV),
+			.max_pre_pll_clk_div = CCS_LIM(sensor, MAX_OP_PRE_PLL_CLK_DIV),
+			.min_pll_ip_clk_freq_hz = CCS_LIM(sensor, MIN_OP_PLL_IP_CLK_FREQ_MHZ),
+			.max_pll_ip_clk_freq_hz = CCS_LIM(sensor, MAX_OP_PLL_IP_CLK_FREQ_MHZ),
+			.min_pll_multiplier = CCS_LIM(sensor, MIN_OP_PLL_MULTIPLIER),
+			.max_pll_multiplier = CCS_LIM(sensor, MAX_OP_PLL_MULTIPLIER),
+			.min_pll_op_clk_freq_hz = CCS_LIM(sensor, MIN_OP_PLL_OP_CLK_FREQ_MHZ),
+			.max_pll_op_clk_freq_hz = CCS_LIM(sensor, MAX_OP_PLL_OP_CLK_FREQ_MHZ),
+		},
 		.op_bk = {
 			 .min_sys_clk_div = CCS_LIM(sensor, MIN_OP_SYS_CLK_DIV),
 			 .max_sys_clk_div = CCS_LIM(sensor, MAX_OP_SYS_CLK_DIV),
@@ -3210,6 +3236,23 @@ static int ccs_probe(struct i2c_client *client)
 	    CCS_FIFO_SUPPORT_CAPABILITY_DERATING_OVERRATING)
 		sensor->pll.flags |= CCS_PLL_FLAG_FIFO_DERATING |
 				     CCS_PLL_FLAG_FIFO_OVERRATING;
+	if (CCS_LIM(sensor, CLOCK_TREE_PLL_CAPABILITY) &
+	    CCS_CLOCK_TREE_PLL_CAPABILITY_DUAL_PLL) {
+		if (CCS_LIM(sensor, CLOCK_TREE_PLL_CAPABILITY) &
+		    CCS_CLOCK_TREE_PLL_CAPABILITY_SINGLE_PLL) {
+			u32 v;
+
+			/* Use sensor default in PLL mode selection */
+			rval = ccs_read(sensor, PLL_MODE, &v);
+			if (rval)
+				goto out_cleanup;
+
+			if (v == CCS_PLL_MODE_DUAL)
+				sensor->pll.flags |= CCS_PLL_FLAG_DUAL_PLL;
+		} else {
+			sensor->pll.flags |= CCS_PLL_FLAG_DUAL_PLL;
+		}
+	}
 	sensor->pll.op_bits_per_lane = CCS_LIM(sensor, OP_BITS_PER_LANE);
 	sensor->pll.ext_clk_freq_hz = sensor->hwcfg.ext_clk;
 	sensor->pll.scale_n = CCS_LIM(sensor, SCALER_N_MIN);
-- 
2.27.0

