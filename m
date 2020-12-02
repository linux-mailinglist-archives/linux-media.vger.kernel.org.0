Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0ACD2CC4B0
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 19:12:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728958AbgLBSL0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 13:11:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728656AbgLBSLZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 13:11:25 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FC2EC0613D6
        for <linux-media@vger.kernel.org>; Wed,  2 Dec 2020 10:09:45 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 38871634C8E;
        Wed,  2 Dec 2020 20:08:31 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 05/38] ccs-pll: Remove parallel bus support
Date:   Wed,  2 Dec 2020 20:06:08 +0200
Message-Id: <20201202180641.17401-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
References: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The parallel bus PLL calculation has no users. Remove it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c |  5 -----
 drivers/media/i2c/ccs-pll.h | 14 ++++----------
 2 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 22e29127804a..da97a2b91717 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -435,11 +435,6 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 		op_pll_fr->pll_op_clk_freq_hz = pll->link_freq * 2
 			* (pll->csi2.lanes / lane_op_clock_ratio);
 		break;
-	case CCS_PLL_BUS_TYPE_PARALLEL:
-		op_pll_fr->pll_op_clk_freq_hz = pll->link_freq * pll->bits_per_pixel
-			/ DIV_ROUND_UP(pll->bits_per_pixel,
-				       pll->parallel.bus_width);
-		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
index 03b1d8d11423..578c9272688a 100644
--- a/drivers/media/i2c/ccs-pll.h
+++ b/drivers/media/i2c/ccs-pll.h
@@ -13,8 +13,7 @@
 #define CCS_PLL_H
 
 /* CSI-2 or CCP-2 */
-#define CCS_PLL_BUS_TYPE_CSI2				0x00
-#define CCS_PLL_BUS_TYPE_PARALLEL				0x01
+#define CCS_PLL_BUS_TYPE_CSI2					0x00
 
 /* op pix clock is for all lanes in total normally */
 #define CCS_PLL_FLAG_OP_PIX_CLOCK_PER_LANE			(1 << 0)
@@ -37,14 +36,9 @@ struct ccs_pll_branch_bk {
 struct ccs_pll {
 	/* input values */
 	uint8_t bus_type;
-	union {
-		struct {
-			uint8_t lanes;
-		} csi2;
-		struct {
-			uint8_t bus_width;
-		} parallel;
-	};
+	struct {
+		uint8_t lanes;
+	} csi2;
 	unsigned long flags;
 	uint8_t binning_horizontal;
 	uint8_t binning_vertical;
-- 
2.27.0

