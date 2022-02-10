Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7F2E4B0BE2
	for <lists+linux-media@lfdr.de>; Thu, 10 Feb 2022 12:09:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240581AbiBJLJY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Feb 2022 06:09:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240574AbiBJLJU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Feb 2022 06:09:20 -0500
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 356BAB71
        for <linux-media@vger.kernel.org>; Thu, 10 Feb 2022 03:09:22 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 92B151C0010;
        Thu, 10 Feb 2022 11:09:17 +0000 (UTC)
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
Subject: [PATCH v2 17/23] media: ov5640: Implement get_selection
Date:   Thu, 10 Feb 2022 12:10:02 +0100
Message-Id: <20220210111004.152859-5-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220210110458.152494-1-jacopo@jmondi.org>
References: <20220210110458.152494-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
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
---
 drivers/media/i2c/ov5640.c | 51 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 8b90fab26d16..4ebb76d95849 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -35,6 +35,13 @@
 #define OV5640_MIN_VBLANK	24
 #define OV5640_MAX_VTS		1968
 
+#define OV5640_NATIVE_WIDTH		2624
+#define OV5640_NATIVE_HEIGHT		1964
+#define OV5640_PIXEL_ARRAY_TOP		14
+#define OV5640_PIXEL_ARRAY_LEFT		16
+#define OV5640_PIXEL_ARRAY_WIDTH	2592
+#define OV5640_PIXEL_ARRAY_HEIGHT	1944
+
 #define OV5640_DEFAULT_SLAVE_ID 0x3c
 
 #define OV5640_LINK_RATE_MAX		490000000U
@@ -2693,6 +2700,43 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
 	return ret;
 }
 
+static int ov5640_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_selection *sel)
+{
+	struct ov5640_dev *sensor = to_ov5640_dev(sd);
+	const struct ov5640_mode_info *mode = sensor->current_mode;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP: {
+		mutex_lock(&sensor->lock);
+		sel->r = mode->analog_crop;
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
@@ -3383,9 +3427,15 @@ static int ov5640_init_cfg(struct v4l2_subdev *sd,
 			   struct v4l2_subdev_state *state)
 {
 	struct v4l2_mbus_framefmt *fmt = v4l2_subdev_get_try_format(sd, state, 0);
+	struct v4l2_rect *crop = v4l2_subdev_get_try_crop(sd, state, 0);
 
 	*fmt = ov5640_default_fmt;
 
+	crop->left = OV5640_PIXEL_ARRAY_LEFT;
+	crop->top = OV5640_PIXEL_ARRAY_TOP;
+	crop->width = OV5640_PIXEL_ARRAY_WIDTH;
+	crop->height = OV5640_PIXEL_ARRAY_HEIGHT;
+
 	return 0;
 }
 
@@ -3407,6 +3457,7 @@ static const struct v4l2_subdev_pad_ops ov5640_pad_ops = {
 	.enum_mbus_code = ov5640_enum_mbus_code,
 	.get_fmt = ov5640_get_fmt,
 	.set_fmt = ov5640_set_fmt,
+	.get_selection = ov5640_get_selection,
 	.enum_frame_size = ov5640_enum_frame_size,
 	.enum_frame_interval = ov5640_enum_frame_interval,
 };
-- 
2.35.0

