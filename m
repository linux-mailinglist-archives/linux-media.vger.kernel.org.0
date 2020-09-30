Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 928F027ECCB
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731132AbgI3P3w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:52 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44656 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730999AbgI3P3L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:11 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 396EE634CDE
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:51 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 055/100] ccs-pll: Differentiate between CSI-2 D-PHY and C-PHY
Date:   Wed, 30 Sep 2020 18:28:13 +0300
Message-Id: <20200930152858.8471-56-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Differentiate between CSI-2 D-PHY and C-PHY. This does not yet include
support for C-PHY.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c      | 2 +-
 drivers/media/i2c/ccs-pll.h      | 3 ++-
 drivers/media/i2c/ccs/ccs-core.c | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 61ace70852e0..069f2ee821fe 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -430,7 +430,7 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 		pll->binning_vertical);
 
 	switch (pll->bus_type) {
-	case CCS_PLL_BUS_TYPE_CSI2:
+	case CCS_PLL_BUS_TYPE_CSI2_DPHY:
 		/* CSI transfers 2 bits per clock per lane; thus times 2 */
 		op_pll_fr->pll_op_clk_freq_hz = pll->link_freq * 2
 			* (pll->csi2.lanes / lane_op_clock_ratio);
diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
index 578c9272688a..d06a80c4fc52 100644
--- a/drivers/media/i2c/ccs-pll.h
+++ b/drivers/media/i2c/ccs-pll.h
@@ -13,7 +13,8 @@
 #define CCS_PLL_H
 
 /* CSI-2 or CCP-2 */
-#define CCS_PLL_BUS_TYPE_CSI2					0x00
+#define CCS_PLL_BUS_TYPE_CSI2_DPHY				0x00
+#define CCS_PLL_BUS_TYPE_CSI2_CPHY				0x01
 
 /* op pix clock is for all lanes in total normally */
 #define CCS_PLL_FLAG_OP_PIX_CLOCK_PER_LANE			(1 << 0)
diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 0dc1c0e05c34..adf9c3e06567 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3179,7 +3179,7 @@ static int ccs_probe(struct i2c_client *client)
 	sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
 
 	/* prepare PLL configuration input values */
-	sensor->pll.bus_type = CCS_PLL_BUS_TYPE_CSI2;
+	sensor->pll.bus_type = CCS_PLL_BUS_TYPE_CSI2_DPHY;
 	sensor->pll.csi2.lanes = sensor->hwcfg.lanes;
 	sensor->pll.ext_clk_freq_hz = sensor->hwcfg.ext_clk;
 	sensor->pll.scale_n = CCS_LIM(sensor, SCALER_N_MIN);
-- 
2.27.0

