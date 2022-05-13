Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 444D15263CC
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351501AbiEMOS7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241355AbiEMOS5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:18:57 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E828313F414
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:18:56 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id EE285240006;
        Fri, 13 May 2022 14:18:54 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     sakari.ailus@iki.fi, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v7 21/28] media: ov5640: Implement get_selection
Date:   Fri, 13 May 2022 16:14:09 +0200
Message-Id: <20220513141416.120552-22-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513141416.120552-1-jacopo@jmondi.org>
References: <20220513141416.120552-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement the get_selection pad operation for the OV5640 sensor driver.

The supported targets report the sensor's native size, the active pixel
array size and the analog crop rectangle from which the image is
produced.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 46 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index cc72ad19d032..f7d1bf19d911 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -2866,6 +2866,45 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
 	return ret;
 }
 
+static int ov5640_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_selection *sel)
+{
+	struct ov5640_dev *sensor = to_ov5640_dev(sd);
+	const struct ov5640_mode_info *mode = sensor->current_mode;
+	const struct ov5640_timings *timings;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP: {
+		mutex_lock(&sensor->lock);
+		timings = ov5640_timings(sensor, mode);
+		sel->r = timings->analog_crop;
+		mutex_unlock(&sensor->lock);
+
+		return 0;
+	}
+
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = OV5640_NATIVE_WIDTH;
+		sel->r.height = OV5640_NATIVE_HEIGHT;
+
+		return 0;
+
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r.top = OV5640_PIXEL_ARRAY_TOP;
+		sel->r.left = OV5640_PIXEL_ARRAY_LEFT;
+		sel->r.width = OV5640_PIXEL_ARRAY_WIDTH;
+		sel->r.height = OV5640_PIXEL_ARRAY_HEIGHT;
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 static int ov5640_set_framefmt(struct ov5640_dev *sensor,
 			       struct v4l2_mbus_framefmt *format)
 {
@@ -3565,9 +3604,15 @@ static int ov5640_init_cfg(struct v4l2_subdev *sd,
 {
 	struct v4l2_mbus_framefmt *fmt =
 				v4l2_subdev_get_try_format(sd, state, 0);
+	struct v4l2_rect *crop = v4l2_subdev_get_try_crop(sd, state, 0);
 
 	*fmt = ov5640_default_fmt;
 
+	crop->left = OV5640_PIXEL_ARRAY_LEFT;
+	crop->top = OV5640_PIXEL_ARRAY_TOP;
+	crop->width = OV5640_PIXEL_ARRAY_WIDTH;
+	crop->height = OV5640_PIXEL_ARRAY_HEIGHT;
+
 	return 0;
 }
 
@@ -3589,6 +3634,7 @@ static const struct v4l2_subdev_pad_ops ov5640_pad_ops = {
 	.enum_mbus_code = ov5640_enum_mbus_code,
 	.get_fmt = ov5640_get_fmt,
 	.set_fmt = ov5640_set_fmt,
+	.get_selection = ov5640_get_selection,
 	.enum_frame_size = ov5640_enum_frame_size,
 	.enum_frame_interval = ov5640_enum_frame_interval,
 };
-- 
2.35.1

