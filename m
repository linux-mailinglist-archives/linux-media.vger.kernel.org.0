Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF9E22CC4C2
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 19:15:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387531AbgLBSNJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 13:13:09 -0500
Received: from retiisi.eu ([95.216.213.190]:33622 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729090AbgLBSNI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 13:13:08 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 30519634CA3;
        Wed,  2 Dec 2020 20:08:32 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 17/38] ccs: Add support for lane speed model
Date:   Wed,  2 Dec 2020 20:06:20 +0200
Message-Id: <20201202180641.17401-18-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
References: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convey the relevant PLL flags to the PLL calculator. Also the lane speed
model affects how the link rate is calculated on the CSI-2 bus, as the
rate is total of all lanes.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 591953cec6ec..f3d4209c818c 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -387,7 +387,9 @@ static int ccs_pll_configure(struct ccs_sensor *sensor)
 	/* Lane op clock ratio does not apply here. */
 	rval = ccs_write(sensor, REQUESTED_LINK_RATE,
 			 DIV_ROUND_UP(pll->op_bk.sys_clk_freq_hz,
-				      1000000 / 256 / 256));
+				      1000000 / 256 / 256) *
+			 (pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL ?
+			  sensor->pll.csi2.lanes : 1));
 	if (rval < 0 || sensor->pll.flags & CCS_PLL_FLAG_NO_OP_CLOCKS)
 		return rval;
 
@@ -3203,6 +3205,13 @@ static int ccs_probe(struct i2c_client *client)
 	/* prepare PLL configuration input values */
 	sensor->pll.bus_type = CCS_PLL_BUS_TYPE_CSI2_DPHY;
 	sensor->pll.csi2.lanes = sensor->hwcfg.lanes;
+	if (CCS_LIM(sensor, CLOCK_CALCULATION) &
+	    CCS_CLOCK_CALCULATION_LANE_SPEED) {
+		sensor->pll.vt_lanes =
+			CCS_LIM(sensor, NUM_OF_VT_LANES) + 1;
+		sensor->pll.op_lanes = sensor->pll.vt_lanes;
+		sensor->pll.flags |= CCS_PLL_FLAG_LANE_SPEED_MODEL;
+	}
 	sensor->pll.ext_clk_freq_hz = sensor->hwcfg.ext_clk;
 	sensor->pll.scale_n = CCS_LIM(sensor, SCALER_N_MIN);
 
-- 
2.27.0

