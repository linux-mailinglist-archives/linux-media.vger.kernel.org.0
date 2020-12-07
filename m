Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC8602D1C0F
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 22:28:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727482AbgLGV0v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 16:26:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727459AbgLGV0v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 16:26:51 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83127C0611CE
        for <linux-media@vger.kernel.org>; Mon,  7 Dec 2020 13:23:24 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id B6671634CA9;
        Mon,  7 Dec 2020 23:23:13 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 20/24] ccs: Support and default to auto PHY control
Date:   Mon,  7 Dec 2020 23:15:26 +0200
Message-Id: <20201207211530.21180-21-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
References: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CCS supports three variants of PHY timing control, auto, UI based and
manual. The driver previously assumed UI based control that requires
updating the link rate to the sensor. Now default to automatic control
instead, and only write the link rate to the sensor in UI mode.

If neither auto or UI control is supported, return an error in probe.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 54 +++++++++++++++++++++++++-------
 1 file changed, 43 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 08fce285f73a..a8f591c95bc2 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -383,15 +383,22 @@ static int ccs_pll_configure(struct ccs_sensor *sensor)
 	if (rval < 0)
 		return rval;
 
-	/* Lane op clock ratio does not apply here. */
-	rval = ccs_write(sensor, REQUESTED_LINK_RATE,
-			 DIV_ROUND_UP(pll->op_bk.sys_clk_freq_hz,
-				      1000000 / 256 / 256) *
-			 (pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL ?
-			  sensor->pll.csi2.lanes : 1) <<
-			 (pll->flags & CCS_PLL_FLAG_OP_SYS_DDR ? 1 : 0));
-	if (rval < 0 || sensor->pll.flags & CCS_PLL_FLAG_NO_OP_CLOCKS)
-		return rval;
+	if (!(CCS_LIM(sensor, PHY_CTRL_CAPABILITY) &
+	      CCS_PHY_CTRL_CAPABILITY_AUTO_PHY_CTL)) {
+		/* Lane op clock ratio does not apply here. */
+		rval = ccs_write(sensor, REQUESTED_LINK_RATE,
+				 DIV_ROUND_UP(pll->op_bk.sys_clk_freq_hz,
+					      1000000 / 256 / 256) *
+				 (pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL ?
+				  sensor->pll.csi2.lanes : 1) <<
+				 (pll->flags & CCS_PLL_FLAG_OP_SYS_DDR ?
+				  1 : 0));
+		if (rval < 0)
+			return rval;
+	}
+
+	if (sensor->pll.flags & CCS_PLL_FLAG_NO_OP_CLOCKS)
+		return 0;
 
 	rval = ccs_write(sensor, OP_PIX_CLK_DIV, pll->op_bk.pix_clk_div);
 	if (rval < 0)
@@ -1504,6 +1511,28 @@ static int ccs_write_msr_regs(struct ccs_sensor *sensor)
 				   sensor->mdata.num_module_manufacturer_regs);
 }
 
+static int ccs_update_phy_ctrl(struct ccs_sensor *sensor)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
+	u8 val;
+
+	if (!sensor->ccs_limits)
+		return 0;
+
+	if (CCS_LIM(sensor, PHY_CTRL_CAPABILITY) &
+	    CCS_PHY_CTRL_CAPABILITY_AUTO_PHY_CTL) {
+		val = CCS_PHY_CTRL_AUTO;
+	} else if (CCS_LIM(sensor, PHY_CTRL_CAPABILITY) &
+		   CCS_PHY_CTRL_CAPABILITY_UI_PHY_CTL) {
+		val = CCS_PHY_CTRL_UI;
+	} else {
+		dev_err(&client->dev, "manual PHY control not supported\n");
+		return -EINVAL;
+	}
+
+	return ccs_write(sensor, PHY_CTRL, val);
+}
+
 static int ccs_power_on(struct device *dev)
 {
 	struct v4l2_subdev *subdev = dev_get_drvdata(dev);
@@ -1620,8 +1649,7 @@ static int ccs_power_on(struct device *dev)
 		goto out_cci_addr_fail;
 	}
 
-	/* DPHY control done by sensor based on requested link rate */
-	rval = ccs_write(sensor, PHY_CTRL, CCS_PHY_CTRL_UI);
+	rval = ccs_update_phy_ctrl(sensor);
 	if (rval < 0)
 		goto out_cci_addr_fail;
 
@@ -3348,6 +3376,10 @@ static int ccs_probe(struct i2c_client *client)
 		goto out_free_ccs_limits;
 	}
 
+	rval = ccs_update_phy_ctrl(sensor);
+	if (rval < 0)
+		goto out_free_ccs_limits;
+
 	/*
 	 * Handle Sensor Module orientation on the board.
 	 *
-- 
2.29.2

