Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0502B7CD3
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 12:41:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727489AbgKRLie (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 06:38:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727116AbgKRLid (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 06:38:33 -0500
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 695E6C0613D4
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2020 03:38:33 -0800 (PST)
Received: from lanttu.localdomain (lanttu.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::c1:2])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id ACB69634CCF;
        Wed, 18 Nov 2020 13:38:18 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH 21/29] ccs: Give all subdevs a function
Date:   Wed, 18 Nov 2020 13:31:03 +0200
Message-Id: <20201118113111.2548-22-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201118113111.2548-1-sakari.ailus@linux.intel.com>
References: <20201118113111.2548-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This removes a warning at driver probe time telling that one or two
entities have no function set. The function used for both the binner and
scaler is the scaler.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index cc3a81200050..bddfee637f33 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2685,7 +2685,7 @@ static void ccs_cleanup(struct ccs_sensor *sensor)
 
 static void ccs_create_subdev(struct ccs_sensor *sensor,
 			      struct ccs_subdev *ssd, const char *name,
-			      unsigned short num_pads)
+			      unsigned short num_pads, u32 function)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 
@@ -2696,6 +2696,7 @@ static void ccs_create_subdev(struct ccs_sensor *sensor,
 		v4l2_subdev_init(&ssd->sd, &ccs_ops);
 
 	ssd->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ssd->sd.entity.function = function;
 	ssd->sensor = sensor;
 
 	ssd->npads = num_pads;
@@ -3123,11 +3124,12 @@ static int ccs_probe(struct i2c_client *client)
 	sensor->pll.ext_clk_freq_hz = sensor->hwcfg->ext_clk;
 	sensor->pll.scale_n = CCS_LIM(sensor, SCALER_N_MIN);
 
-	ccs_create_subdev(sensor, sensor->scaler, " scaler", 2);
-	ccs_create_subdev(sensor, sensor->binner, " binner", 2);
-	ccs_create_subdev(sensor, sensor->pixel_array, " pixel_array", 1);
-
-	sensor->pixel_array->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	ccs_create_subdev(sensor, sensor->scaler, " scaler", 2,
+			  MEDIA_ENT_F_CAM_SENSOR);
+	ccs_create_subdev(sensor, sensor->binner, " binner", 2,
+			  MEDIA_ENT_F_PROC_VIDEO_SCALER);
+	ccs_create_subdev(sensor, sensor->pixel_array, " pixel_array", 1,
+			  MEDIA_ENT_F_PROC_VIDEO_SCALER);
 
 	rval = ccs_init_controls(sensor);
 	if (rval < 0)
-- 
2.27.0

