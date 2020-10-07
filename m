Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0442285B11
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbgJGIqt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:46:49 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57052 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728019AbgJGIqN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:13 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 1E371634CED
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:21 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 074/106] ccs-pll: Add support for extended input PLL clock divider
Date:   Wed,  7 Oct 2020 11:45:25 +0300
Message-Id: <20201007084557.25843-65-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
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
index c3c4f59670e2..00957568407a 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3211,6 +3211,9 @@ static int ccs_probe(struct i2c_client *client)
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

