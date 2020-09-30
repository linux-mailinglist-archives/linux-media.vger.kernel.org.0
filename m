Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2D0327ECF0
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731179AbgI3PaV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730882AbgI3P3E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:04 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC255C061755
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 08:29:04 -0700 (PDT)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id EBAD6634CA4
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:47 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 018/100] ccs: Remove profile concept
Date:   Wed, 30 Sep 2020 18:27:36 +0300
Message-Id: <20200930152858.8471-19-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver doesn't do anything tangible with profiles. Remove the notion,
and use the capabilities directly.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 23 ++++++-----------------
 drivers/media/i2c/ccs/ccs.h      |  2 --
 2 files changed, 6 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 6a47a5c16bb1..22050d33f0e8 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -377,7 +377,7 @@ static int ccs_pll_configure(struct ccs_sensor *sensor)
 	rval = ccs_write(sensor, REQUESTED_LINK_RATE,
 			 DIV_ROUND_UP(pll->op.sys_clk_freq_hz,
 				      1000000 / 256 / 256));
-	if (rval < 0 || sensor->minfo.smiapp_profile == SMIAPP_PROFILE_0)
+	if (rval < 0 || sensor->pll.flags & SMIAPP_PLL_FLAG_NO_OP_CLOCKS)
 		return rval;
 
 	rval = ccs_write(sensor, OP_PIX_CLK_DIV, pll->op.pix_clk_div);
@@ -3096,23 +3096,17 @@ static int ccs_probe(struct i2c_client *client)
 		}
 	}
 
-	/* We consider this as profile 0 sensor if any of these are zero. */
 	if (!CCS_LIM(sensor, MIN_OP_SYS_CLK_DIV) ||
 	    !CCS_LIM(sensor, MAX_OP_SYS_CLK_DIV) ||
 	    !CCS_LIM(sensor, MIN_OP_PIX_CLK_DIV) ||
 	    !CCS_LIM(sensor, MAX_OP_PIX_CLK_DIV)) {
-		sensor->minfo.smiapp_profile = SMIAPP_PROFILE_0;
+		/* No OP clock branch */
+		sensor->pll.flags |= SMIAPP_PLL_FLAG_NO_OP_CLOCKS;
 	} else if (CCS_LIM(sensor, SCALING_CAPABILITY)
-		   != CCS_SCALING_CAPABILITY_NONE) {
-		if (CCS_LIM(sensor, SCALING_CAPABILITY)
-		    == CCS_SCALING_CAPABILITY_HORIZONTAL)
-			sensor->minfo.smiapp_profile = SMIAPP_PROFILE_1;
-		else
-			sensor->minfo.smiapp_profile = SMIAPP_PROFILE_2;
-		sensor->scaler = &sensor->ssds[sensor->ssds_used];
-		sensor->ssds_used++;
-	} else if (CCS_LIM(sensor, DIGITAL_CROP_CAPABILITY)
+		   != CCS_SCALING_CAPABILITY_NONE ||
+		   CCS_LIM(sensor, DIGITAL_CROP_CAPABILITY)
 		   == CCS_DIGITAL_CROP_CAPABILITY_INPUT_CROP) {
+		/* We have a scaler or digital crop. */
 		sensor->scaler = &sensor->ssds[sensor->ssds_used];
 		sensor->ssds_used++;
 	}
@@ -3128,16 +3122,11 @@ static int ccs_probe(struct i2c_client *client)
 	sensor->pll.csi2.lanes = sensor->hwcfg->lanes;
 	sensor->pll.ext_clk_freq_hz = sensor->hwcfg->ext_clk;
 	sensor->pll.scale_n = CCS_LIM(sensor, SCALER_N_MIN);
-	/* Profile 0 sensors have no separate OP clock branch. */
-	if (sensor->minfo.smiapp_profile == SMIAPP_PROFILE_0)
-		sensor->pll.flags |= SMIAPP_PLL_FLAG_NO_OP_CLOCKS;
 
 	ccs_create_subdev(sensor, sensor->scaler, " scaler", 2);
 	ccs_create_subdev(sensor, sensor->binner, " binner", 2);
 	ccs_create_subdev(sensor, sensor->pixel_array, " pixel_array", 1);
 
-	dev_dbg(&client->dev, "profile %d\n", sensor->minfo.smiapp_profile);
-
 	sensor->pixel_array->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
 	rval = ccs_init_controls(sensor);
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index 7f6ed95b7b78..8933f3d40fa5 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -124,8 +124,6 @@ struct ccs_module_info {
 	u32 smiapp_version;
 	u32 ccs_version;
 
-	u32 smiapp_profile;
-
 	char *name;
 	const struct ccs_quirk *quirk;
 };
-- 
2.27.0

