Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4B727ECD1
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731140AbgI3P34 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:56 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44650 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730987AbgI3P3K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:10 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 90B3E634C94
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:50 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 047/100] ccs: Wrap long lines, unwrap short ones
Date:   Wed, 30 Sep 2020 18:28:05 +0300
Message-Id: <20200930152858.8471-48-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Over the years (and renaming) some lines that may well be wrapped ended up
being over 80 characters, likewise there are shorter lines that can be
merged. Do that.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 45 +++++++++++++-------------------
 1 file changed, 18 insertions(+), 27 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 474cfc8e0c7e..4bc483db6001 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -651,8 +651,7 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_HBLANK:
 		rval = ccs_write(sensor, LINE_LENGTH_PCK,
-				 sensor->pixel_array->crop[
-					 CCS_PA_PAD_SRC].width
+				 sensor->pixel_array->crop[CCS_PA_PAD_SRC].width
 				 + ctrl->val);
 
 		break;
@@ -983,15 +982,13 @@ static void ccs_update_blanking(struct ccs_sensor *sensor)
 
 	min = max_t(int,
 		    CCS_LIM(sensor, MIN_FRAME_BLANKING_LINES),
-		    min_fll -
-		    sensor->pixel_array->crop[CCS_PA_PAD_SRC].height);
+		    min_fll - sensor->pixel_array->crop[CCS_PA_PAD_SRC].height);
 	max = max_fll -	sensor->pixel_array->crop[CCS_PA_PAD_SRC].height;
 
 	__v4l2_ctrl_modify_range(vblank, min, max, vblank->step, min);
 
 	min = max_t(int,
-		    min_llp -
-		    sensor->pixel_array->crop[CCS_PA_PAD_SRC].width,
+		    min_llp - sensor->pixel_array->crop[CCS_PA_PAD_SRC].width,
 		    min_lbp);
 	max = max_llp - sensor->pixel_array->crop[CCS_PA_PAD_SRC].width;
 
@@ -1778,7 +1775,8 @@ static void ccs_get_crop_compose(struct v4l2_subdev *subdev,
 	} else {
 		if (crops) {
 			for (i = 0; i < subdev->entity.num_pads; i++)
-				crops[i] = v4l2_subdev_get_try_crop(subdev, cfg, i);
+				crops[i] = v4l2_subdev_get_try_crop(subdev,
+								    cfg, i);
 		}
 		if (comps)
 			*comps = v4l2_subdev_get_try_compose(subdev, cfg,
@@ -1803,8 +1801,7 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 		comp->height = crops[CCS_PAD_SINK]->height;
 		if (which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 			if (ssd == sensor->scaler) {
-				sensor->scale_m =
-					CCS_LIM(sensor, SCALER_N_MIN);
+				sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
 				sensor->scaling_mode =
 					CCS_SCALING_MODE_NO_SCALING;
 			} else if (ssd == sensor->binner) {
@@ -2230,9 +2227,11 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 		if (sel->pad == ssd->sink_pad) {
 			_r.left = 0;
 			_r.top = 0;
-			_r.width = v4l2_subdev_get_try_format(subdev, cfg, sel->pad)
+			_r.width = v4l2_subdev_get_try_format(subdev, cfg,
+							      sel->pad)
 				->width;
-			_r.height = v4l2_subdev_get_try_format(subdev, cfg, sel->pad)
+			_r.height = v4l2_subdev_get_try_format(subdev, cfg,
+							       sel->pad)
 				->height;
 			src_size = &_r;
 		} else {
@@ -2350,11 +2349,9 @@ static int ccs_set_selection(struct v4l2_subdev *subdev,
 	sel->r.width = CCS_ALIGN_DIM(sel->r.width, sel->flags);
 	sel->r.height =	CCS_ALIGN_DIM(sel->r.height, sel->flags);
 
-	sel->r.width = max_t(unsigned int,
-			     CCS_LIM(sensor, MIN_X_OUTPUT_SIZE),
+	sel->r.width = max_t(unsigned int, CCS_LIM(sensor, MIN_X_OUTPUT_SIZE),
 			     sel->r.width);
-	sel->r.height = max_t(unsigned int,
-			      CCS_LIM(sensor, MIN_Y_OUTPUT_SIZE),
+	sel->r.height = max_t(unsigned int, CCS_LIM(sensor, MIN_Y_OUTPUT_SIZE),
 			      sel->r.height);
 
 	switch (sel->target) {
@@ -2607,8 +2604,7 @@ static int ccs_identify_module(struct ccs_sensor *sensor)
 		dev_warn(&client->dev,
 			 "no quirks for this module; let's hope it's fully compliant\n");
 
-	dev_dbg(&client->dev, "the sensor is called %s\n",
-		minfo->name);
+	dev_dbg(&client->dev, "the sensor is called %s\n", minfo->name);
 
 	return 0;
 }
@@ -2628,19 +2624,15 @@ static int ccs_register_subdev(struct ccs_sensor *sensor,
 	if (!sink_ssd)
 		return 0;
 
-	rval = media_entity_pads_init(&ssd->sd.entity,
-				      ssd->npads, ssd->pads);
+	rval = media_entity_pads_init(&ssd->sd.entity, ssd->npads, ssd->pads);
 	if (rval) {
-		dev_err(&client->dev,
-			"media_entity_pads_init failed\n");
+		dev_err(&client->dev, "media_entity_pads_init failed\n");
 		return rval;
 	}
 
-	rval = v4l2_device_register_subdev(sensor->src->sd.v4l2_dev,
-					   &ssd->sd);
+	rval = v4l2_device_register_subdev(sensor->src->sd.v4l2_dev, &ssd->sd);
 	if (rval) {
-		dev_err(&client->dev,
-			"v4l2_device_register_subdev failed\n");
+		dev_err(&client->dev, "v4l2_device_register_subdev failed\n");
 		return rval;
 	}
 
@@ -2648,8 +2640,7 @@ static int ccs_register_subdev(struct ccs_sensor *sensor,
 				     &sink_ssd->sd.entity, sink_pad,
 				     link_flags);
 	if (rval) {
-		dev_err(&client->dev,
-			"media_create_pad_link failed\n");
+		dev_err(&client->dev, "media_create_pad_link failed\n");
 		v4l2_device_unregister_subdev(&ssd->sd);
 		return rval;
 	}
-- 
2.27.0

