Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34E812D7792
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 15:16:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405459AbgLKOPQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 09:15:16 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:50949 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405910AbgLKOPE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 09:15:04 -0500
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 4914C200007;
        Fri, 11 Dec 2020 14:14:21 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com
Cc:     Jacopo Mondi <jacopo@jmondi.org>, tfiga@chromium.org,
        linux-media@vger.kernel.org
Subject: [PATCH 1/2] media: i2c: ov13858: Add .get_selection support
Date:   Fri, 11 Dec 2020 15:14:23 +0100
Message-Id: <20201211141424.277975-2-jacopo@jmondi.org>
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
 drivers/media/i2c/ov13858.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index 2f3be7a80cef4..5cda917e10569 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -82,6 +82,10 @@
 /* Number of frames to skip */
 #define OV13858_NUM_OF_SKIP_FRAMES	2
 
+/* OV13858 pixel array size. */
+#define OV13858_PIXEL_ARRAY_WIDTH	4256
+#define OV13858_PIXEL_ARRAY_HEIGHT	3168
+
 struct ov13858_reg {
 	u16 address;
 	u8 val;
@@ -1152,6 +1156,7 @@ static int ov13858_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	struct v4l2_mbus_framefmt *try_fmt = v4l2_subdev_get_try_format(sd,
 									fh->pad,
 									0);
+	struct v4l2_rect *try_crop;
 
 	mutex_lock(&ov13858->mutex);
 
@@ -1161,6 +1166,13 @@ static int ov13858_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	try_fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	try_fmt->field = V4L2_FIELD_NONE;
 
+	/* Initialize try_crop */
+	try_crop = v4l2_subdev_get_try_crop(sd, fh->pad, 0);
+	try_crop->top = 0;
+	try_crop->left = 0;
+	try_crop->width = OV13858_PIXEL_ARRAY_WIDTH;
+	try_crop->height = OV13858_PIXEL_ARRAY_HEIGHT;
+
 	/* No crop or compose */
 	mutex_unlock(&ov13858->mutex);
 
@@ -1402,6 +1414,24 @@ ov13858_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int ov13858_get_selection(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = OV13858_PIXEL_ARRAY_WIDTH;
+		sel->r.height = OV13858_PIXEL_ARRAY_HEIGHT;
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 static int ov13858_get_skip_frames(struct v4l2_subdev *sd, u32 *frames)
 {
 	*frames = OV13858_NUM_OF_SKIP_FRAMES;
@@ -1563,6 +1593,7 @@ static const struct v4l2_subdev_pad_ops ov13858_pad_ops = {
 	.enum_mbus_code = ov13858_enum_mbus_code,
 	.get_fmt = ov13858_get_pad_format,
 	.set_fmt = ov13858_set_pad_format,
+	.get_selection = ov13858_get_selection,
 	.enum_frame_size = ov13858_enum_frame_size,
 };
 
-- 
2.29.2

