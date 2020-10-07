Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9F33285AD7
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727979AbgJGIqG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:46:06 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57056 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727954AbgJGIqD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:03 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 59EE2634C89
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:17 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 019/106] ccs: Give all subdevs a function
Date:   Wed,  7 Oct 2020 11:44:39 +0300
Message-Id: <20201007084557.25843-19-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
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
index 22050d33f0e8..1880ed31845e 100644
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

