Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9C7F4D47BD
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 14:09:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236126AbiCJNKA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 08:10:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242293AbiCJNJ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 08:09:58 -0500
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7CDA14AC99
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 05:08:57 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 9547720005;
        Thu, 10 Mar 2022 13:08:54 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:OMNIVISION OV5670 SENSOR DRIVER)
Subject: [PATCH 6/6] media: i2c: ov5670: Add .get_selection() support
Date:   Thu, 10 Mar 2022 14:08:29 +0100
Message-Id: <20220310130829.96001-7-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310130829.96001-1-jacopo@jmondi.org>
References: <20220310130829.96001-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>

The ov5670 driver's v4l2_subdev_pad_ops currently does not include
.get_selection() - add support for that callback.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5670.c | 64 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index c9f69ffef210..1fa0d632c536 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -70,6 +70,15 @@
 #define OV5670_REG_VALUE_16BIT		2
 #define OV5670_REG_VALUE_24BIT		3
 
+/* Pixel Array */
+
+#define OV5670_NATIVE_WIDTH		2624
+#define OV5670_NATIVE_HEIGHT		1980
+#define OV5670_ACTIVE_START_TOP		8
+#define OV5670_ACTIVE_START_LEFT	16
+#define OV5670_ACTIVE_WIDTH		2592
+#define OV5670_ACTIVE_HEIGHT		1944
+
 /* Initial number of frames to skip to avoid possible garbage */
 #define OV5670_NUM_OF_SKIP_FRAMES	2
 
@@ -2491,6 +2500,59 @@ static const struct v4l2_subdev_core_ops ov5670_core_ops = {
 	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };
 
+static void
+__ov5670_get_pad_crop(struct ov5670 *sensor,
+		      struct v4l2_subdev_state *state, unsigned int pad,
+		      enum v4l2_subdev_format_whence which, struct v4l2_rect *r)
+{
+	const struct ov5670_mode *mode = sensor->cur_mode;
+
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		*r = *v4l2_subdev_get_try_crop(&sensor->sd, state, pad);
+		break;
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		r->height = mode->height;
+		r->width = mode->width;
+		r->top = (OV5670_NATIVE_HEIGHT - mode->height) / 2;
+		r->left = (OV5670_NATIVE_WIDTH - mode->width) / 2;
+		break;
+	}
+}
+
+static int ov5670_get_selection(struct v4l2_subdev *subdev,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_selection *sel)
+{
+	struct ov5670 *sensor = to_ov5670(subdev);
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		mutex_lock(&sensor->mutex);
+			__ov5670_get_pad_crop(sensor, state, sel->pad,
+					      sel->which, &sel->r);
+		mutex_unlock(&sensor->mutex);
+		break;
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = OV5670_NATIVE_WIDTH;
+		sel->r.height = OV5670_NATIVE_HEIGHT;
+		break;
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r.top = OV5670_ACTIVE_START_TOP;
+		sel->r.left = OV5670_ACTIVE_START_LEFT;
+		sel->r.width = OV5670_ACTIVE_WIDTH;
+		sel->r.height = OV5670_ACTIVE_HEIGHT;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static const struct v4l2_subdev_video_ops ov5670_video_ops = {
 	.s_stream = ov5670_set_stream,
 };
@@ -2500,6 +2562,8 @@ static const struct v4l2_subdev_pad_ops ov5670_pad_ops = {
 	.get_fmt = ov5670_get_pad_format,
 	.set_fmt = ov5670_set_pad_format,
 	.enum_frame_size = ov5670_enum_frame_size,
+	.get_selection = ov5670_get_selection,
+	.set_selection = ov5670_get_selection,
 };
 
 static const struct v4l2_subdev_sensor_ops ov5670_sensor_ops = {
-- 
2.35.1

