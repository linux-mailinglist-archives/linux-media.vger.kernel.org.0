Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 625B627ECCF
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731136AbgI3P3z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:55 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44664 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730998AbgI3P3K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:10 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 28A3D634C97
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:51 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 054/100] ccs-pll: Remove parallel bus support
Date:   Wed, 30 Sep 2020 18:28:12 +0300
Message-Id: <20200930152858.8471-55-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
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
index 7ee1af198972..61ace70852e0 100644
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

