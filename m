Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72E78285B10
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728103AbgJGIqt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:46:49 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57072 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728016AbgJGIqN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:13 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id F1C86634CEB
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:20 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 072/106] ccs: Add support for lane speed model
Date:   Wed,  7 Oct 2020 11:45:23 +0300
Message-Id: <20201007084557.25843-63-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
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
index 2ee972bb4885..8b022f2ea17e 100644
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
 
@@ -3194,6 +3196,13 @@ static int ccs_probe(struct i2c_client *client)
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

