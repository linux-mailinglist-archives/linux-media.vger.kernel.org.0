Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 317C72CC4C5
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 19:15:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387881AbgLBSNL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 13:13:11 -0500
Received: from retiisi.eu ([95.216.213.190]:33628 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728241AbgLBSNL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 13:13:11 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 5E301634CA5;
        Wed,  2 Dec 2020 20:08:32 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 19/38] ccs-pll: Add support for extended input PLL clock divider
Date:   Wed,  2 Dec 2020 20:06:22 +0200
Message-Id: <20201202180641.17401-20-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
References: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CCS allows odd PLL dividers other than 1, granted that the corresponding
capability bit is set. Support this both in the PLL calculator and the CCS
driver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c      | 4 +++-
 drivers/media/i2c/ccs-pll.h      | 1 +
 drivers/media/i2c/ccs/ccs-core.c | 3 +++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index cb19a36e54df..62939ca5b8e2 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -478,7 +478,9 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 
 	for (op_pll_fr->pre_pll_clk_div = min_op_pre_pll_clk_div;
 	     op_pll_fr->pre_pll_clk_div <= max_op_pre_pll_clk_div;
-	     op_pll_fr->pre_pll_clk_div += 2 - (op_pll_fr->pre_pll_clk_div & 1)) {
+	     op_pll_fr->pre_pll_clk_div +=
+		     (pll->flags & CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER) ? 1 :
+		     2 - (op_pll_fr->pre_pll_clk_div & 1)) {
 		rval = __ccs_pll_calculate(dev, lim, op_lim_fr, op_lim_bk, pll,
 					   op_pll_fr, op_pll_bk, mul, div);
 		if (rval)
diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
index fe20af11a068..807ae7250aa2 100644
--- a/drivers/media/i2c/ccs-pll.h
+++ b/drivers/media/i2c/ccs-pll.h
@@ -25,6 +25,7 @@
 /* CCS PLL flags */
 #define CCS_PLL_FLAG_LANE_SPEED_MODEL				BIT(2)
 #define CCS_PLL_FLAG_LINK_DECOUPLED				BIT(3)
+#define CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER				BIT(4)
 
 /**
  * struct ccs_pll_branch_fr - CCS PLL configuration (front)
diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 41c006ad03c4..70f4f304fef6 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3220,6 +3220,9 @@ static int ccs_probe(struct i2c_client *client)
 			sensor->pll.op_lanes = sensor->pll.csi2.lanes;
 		}
 	}
+	if (CCS_LIM(sensor, CLOCK_TREE_PLL_CAPABILITY) &
+	    CCS_CLOCK_TREE_PLL_CAPABILITY_EXT_DIVIDER)
+		sensor->pll.flags |= CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER;
 	sensor->pll.ext_clk_freq_hz = sensor->hwcfg.ext_clk;
 	sensor->pll.scale_n = CCS_LIM(sensor, SCALER_N_MIN);
 
-- 
2.27.0

