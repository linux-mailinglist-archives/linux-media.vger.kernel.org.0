Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23098285AFF
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728045AbgJGIqP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:46:15 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57058 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728006AbgJGIqM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:12 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 7A7E7634CE3
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:20 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 065/106] ccs-pll: Begin calculation from OP system clock frequency
Date:   Wed,  7 Oct 2020 11:45:16 +0300
Message-Id: <20201007084557.25843-56-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The OP system clock frequency defines the CSI-2 bus clock frequency, not
the PLL output clock frequency. Both values were overwritten in the end,
but the wrong limit value was used for the OP system clock frequency,
possibly leading to too high frequencies being used.

Also remove now duplicated calculation of OP system clock frequency later
in the PLL calculator.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index c6435ed0597e..584be36f8c66 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -247,10 +247,6 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	op_pll_fr->pll_op_clk_freq_hz = op_pll_fr->pll_ip_clk_freq_hz
 		* op_pll_fr->pll_multiplier;
 
-	/* Derive pll_op_clk_freq_hz. */
-	op_pll_bk->sys_clk_freq_hz =
-		op_pll_fr->pll_op_clk_freq_hz / op_pll_bk->sys_clk_div;
-
 	op_pll_bk->pix_clk_div = pll->bits_per_pixel;
 	dev_dbg(dev, "op_pix_clk_div: %u\n", op_pll_bk->pix_clk_div);
 
@@ -432,7 +428,7 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	switch (pll->bus_type) {
 	case CCS_PLL_BUS_TYPE_CSI2_DPHY:
 		/* CSI transfers 2 bits per clock per lane; thus times 2 */
-		op_pll_fr->pll_op_clk_freq_hz = pll->link_freq * 2
+		op_pll_bk->sys_clk_freq_hz = pll->link_freq * 2
 			* (pll->csi2.lanes / lane_op_clock_ratio);
 		break;
 	default:
@@ -454,8 +450,8 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	dev_dbg(dev, "pre-pll check: min / max op_pre_pll_clk_div: %u / %u\n",
 		min_op_pre_pll_clk_div, max_op_pre_pll_clk_div);
 
-	i = gcd(op_pll_fr->pll_op_clk_freq_hz, pll->ext_clk_freq_hz);
-	mul = op_pll_fr->pll_op_clk_freq_hz / i;
+	i = gcd(op_pll_bk->sys_clk_freq_hz, pll->ext_clk_freq_hz);
+	mul = op_pll_bk->sys_clk_freq_hz / i;
 	div = pll->ext_clk_freq_hz / i;
 	dev_dbg(dev, "mul %u / div %u\n", mul, div);
 
@@ -463,7 +459,7 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 		max_t(uint16_t, min_op_pre_pll_clk_div,
 		      clk_div_even_up(
 			      DIV_ROUND_UP(mul * pll->ext_clk_freq_hz,
-					   op_lim_fr->max_pll_op_clk_freq_hz)));
+					   op_lim_bk->max_sys_clk_freq_hz)));
 	dev_dbg(dev, "pll_op check: min / max op_pre_pll_clk_div: %u / %u\n",
 		min_op_pre_pll_clk_div, max_op_pre_pll_clk_div);
 
-- 
2.27.0

