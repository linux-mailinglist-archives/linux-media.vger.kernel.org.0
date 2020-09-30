Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C59C27ECC1
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731012AbgI3P3l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:41 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44648 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731016AbgI3P3M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:12 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 24272634CED
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:52 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 068/100] ccs-pll: Add support for extended input PLL clock divider
Date:   Wed, 30 Sep 2020 18:28:26 +0300
Message-Id: <20200930152858.8471-69-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
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
index c95a03ffce59..ace2c2f352a9 100644
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
index 165de20af079..7c2b7a85de6a 100644
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
index 8b328ade055c..5f361eec2006 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3198,6 +3198,9 @@ static int ccs_probe(struct i2c_client *client)
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

