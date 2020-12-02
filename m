Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC5FB2CC4D8
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 19:15:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387793AbgLBSPY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 13:15:24 -0500
Received: from retiisi.eu ([95.216.213.190]:33494 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728928AbgLBSPY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 13:15:24 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 8C960634CD5;
        Wed,  2 Dec 2020 20:08:33 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 35/38] ccs: Add support for DDR OP SYS and OP PIX clocks
Date:   Wed,  2 Dec 2020 20:06:38 +0200
Message-Id: <20201202180641.17401-36-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
References: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Support dual data rate operational system and pixel clocks by conveying
the flags to the PLL calculator and updating how the link rate is
calculated.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 137d951b551a..c41c47b40e73 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -388,7 +388,8 @@ static int ccs_pll_configure(struct ccs_sensor *sensor)
 			 DIV_ROUND_UP(pll->op_bk.sys_clk_freq_hz,
 				      1000000 / 256 / 256) *
 			 (pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL ?
-			  sensor->pll.csi2.lanes : 1));
+			  sensor->pll.csi2.lanes : 1) <<
+			 (pll->flags & CCS_PLL_FLAG_OP_SYS_DDR ? 1 : 0));
 	if (rval < 0 || sensor->pll.flags & CCS_PLL_FLAG_NO_OP_CLOCKS)
 		return rval;
 
@@ -3274,6 +3275,12 @@ static int ccs_probe(struct i2c_client *client)
 		} else {
 			sensor->pll.flags |= CCS_PLL_FLAG_DUAL_PLL;
 		}
+		if (CCS_LIM(sensor, CLOCK_CALCULATION) &
+		    CCS_CLOCK_CALCULATION_DUAL_PLL_OP_SYS_DDR)
+			sensor->pll.flags |= CCS_PLL_FLAG_OP_SYS_DDR;
+		if (CCS_LIM(sensor, CLOCK_CALCULATION) &
+		    CCS_CLOCK_CALCULATION_DUAL_PLL_OP_PIX_DDR)
+			sensor->pll.flags |= CCS_PLL_FLAG_OP_PIX_DDR;
 	}
 	sensor->pll.op_bits_per_lane = CCS_LIM(sensor, OP_BITS_PER_LANE);
 	sensor->pll.ext_clk_freq_hz = sensor->hwcfg.ext_clk;
-- 
2.27.0

