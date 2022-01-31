Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB0A4A4992
	for <lists+linux-media@lfdr.de>; Mon, 31 Jan 2022 15:44:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240939AbiAaOo0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jan 2022 09:44:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240884AbiAaOoG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jan 2022 09:44:06 -0500
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 460C1C06173B
        for <linux-media@vger.kernel.org>; Mon, 31 Jan 2022 06:44:06 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 713C2C000F;
        Mon, 31 Jan 2022 14:44:01 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     slongerbeam@gmail.com
Cc:     laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        eugen.hristev@microchip.com, jbrunet@baylibre.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH 14/21] media: ov5640: Implement get_selection
Date:   Mon, 31 Jan 2022 15:44:42 +0100
Message-Id: <20220131144444.129036-3-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131144444.129036-1-jacopo@jmondi.org>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131144444.129036-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement the get_selection pad operation for the OV5640 sensor driver.

The supported targets report the sensor's native size, the active pixel
array size and the analog crop rectangle from which the image is
produced.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5640.c | 61 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 762bdca83aec..ae22300b9655 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -35,6 +35,13 @@
 #define OV5640_MIN_VBLANK	24
 #define OV5640_MAX_VTS		1968
 
+#define OV5640_NATIVE_WIDTH		2624
+#define OV5640_NATIVE_HEIGHT		1964
+#define OV5640_PIXEL_ARRAY_TOP		8
+#define OV5640_PIXEL_ARRAY_LEFT		16
+#define OV5640_PIXEL_ARRAY_WIDTH	2592
+#define OV5640_PIXEL_ARRAY_HEIGHT	1944
+
 #define OV5640_DEFAULT_SLAVE_ID 0x3c
 
 #define OV5640_REG_SYS_RESET02		0x3002
@@ -2667,6 +2674,52 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
 	return ret;
 }
 
+static int ov5640_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_selection *sel)
+{
+	struct ov5640_dev *sensor = to_ov5640_dev(sd);
+	const struct ov5640_mode_info *mode = sensor->current_mode;
+	const struct v4l2_rect *analog_crop = &mode->analog_crop;
+	const struct v4l2_rect *crop = &mode->crop;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP: {
+		mutex_lock(&sensor->lock);
+
+		sel->r.top = analog_crop->top + OV5640_PIXEL_ARRAY_TOP;
+		sel->r.left = analog_crop->left + OV5640_PIXEL_ARRAY_LEFT;
+		sel->r.width = analog_crop->width
+			     - analog_crop->left - crop->left;
+		sel->r.height = analog_crop->height
+			      - analog_crop->top - crop->top;
+
+		mutex_unlock(&sensor->lock);
+
+		return 0;
+	}
+
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = OV5640_NATIVE_WIDTH;
+		sel->r.height = OV5640_NATIVE_HEIGHT;
+
+		return 0;
+
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
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
@@ -3369,6 +3422,7 @@ static const struct v4l2_subdev_pad_ops ov5640_pad_ops = {
 	.enum_mbus_code = ov5640_enum_mbus_code,
 	.get_fmt = ov5640_get_fmt,
 	.set_fmt = ov5640_set_fmt,
+	.get_selection = ov5640_get_selection,
 	.enum_frame_size = ov5640_enum_frame_size,
 	.enum_frame_interval = ov5640_enum_frame_interval,
 };
@@ -3383,9 +3437,16 @@ static int ov5640_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct v4l2_mbus_framefmt *try_fmt =
 		v4l2_subdev_get_try_format(sd, fh->state, 0);
+	struct v4l2_rect *try_crop =
+		v4l2_subdev_get_try_crop(sd, fh->state, 0);
 
 	*try_fmt = ov5640_default_fmt;
 
+	try_crop->left = OV5640_PIXEL_ARRAY_LEFT;
+	try_crop->top = OV5640_PIXEL_ARRAY_TOP;
+	try_crop->width = OV5640_PIXEL_ARRAY_WIDTH;
+	try_crop->height = OV5640_PIXEL_ARRAY_HEIGHT;
+
 	return 0;
 }
 
-- 
2.35.0

