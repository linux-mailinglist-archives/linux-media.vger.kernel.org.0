Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACEF62D7793
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 15:16:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405903AbgLKOPn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 09:15:43 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:42039 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405911AbgLKOPF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 09:15:05 -0500
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id B1B59200006;
        Fri, 11 Dec 2020 14:14:22 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com
Cc:     Jacopo Mondi <jacopo@jmondi.org>, tfiga@chromium.org,
        linux-media@vger.kernel.org
Subject: [PATCH 2/2] media: i2c: ov5670: Add .get_selection support
Date:   Fri, 11 Dec 2020 15:14:24 +0100
Message-Id: <20201211141424.277975-3-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211141424.277975-1-jacopo@jmondi.org>
References: <20201211141424.277975-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for the get_selection subdev pad operation.

Support the V4L2_SEL_TGT_CROP_DEFAULT and V4L2_SEL_TGT_CROP_BOUNDS
static targets only to report the active pixel array size.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5670.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 148fd4e05029a..7f85ae1d93faf 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -67,6 +67,10 @@
 /* Initial number of frames to skip to avoid possible garbage */
 #define OV5670_NUM_OF_SKIP_FRAMES	2
 
+/* OV5670 pixel array size. */
+#define OV5670_PIXEL_ARRAY_WIDTH	2592
+#define OV5670_PIXEL_ARRAY_HEIGHT	1944
+
 struct ov5670_reg {
 	u16 address;
 	u8 val;
@@ -1938,6 +1942,7 @@ static int ov5670_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	struct ov5670 *ov5670 = to_ov5670(sd);
 	struct v4l2_mbus_framefmt *try_fmt =
 				v4l2_subdev_get_try_format(sd, fh->pad, 0);
+	struct v4l2_rect *try_crop;
 
 	mutex_lock(&ov5670->mutex);
 
@@ -1947,7 +1952,13 @@ static int ov5670_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	try_fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	try_fmt->field = V4L2_FIELD_NONE;
 
-	/* No crop or compose */
+	/* Initialize try_crop */
+	try_crop = v4l2_subdev_get_try_crop(sd, fh->pad, 0);
+	try_crop->top = 0;
+	try_crop->left = 0;
+	try_crop->width = OV5670_PIXEL_ARRAY_WIDTH;
+	try_crop->height = OV5670_PIXEL_ARRAY_HEIGHT;
+
 	mutex_unlock(&ov5670->mutex);
 
 	return 0;
@@ -2263,6 +2274,24 @@ static int ov5670_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int ov5670_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = OV5670_PIXEL_ARRAY_WIDTH;
+		sel->r.height = OV5670_PIXEL_ARRAY_HEIGHT;
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 static int ov5670_get_skip_frames(struct v4l2_subdev *sd, u32 *frames)
 {
 	*frames = OV5670_NUM_OF_SKIP_FRAMES;
@@ -2428,6 +2457,7 @@ static const struct v4l2_subdev_pad_ops ov5670_pad_ops = {
 	.enum_mbus_code = ov5670_enum_mbus_code,
 	.get_fmt = ov5670_get_pad_format,
 	.set_fmt = ov5670_set_pad_format,
+	.get_selection = ov5670_get_selection,
 	.enum_frame_size = ov5670_enum_frame_size,
 };
 
-- 
2.29.2

