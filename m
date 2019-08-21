Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F28A97380
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 09:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728333AbfHUHbZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 03:31:25 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:54605 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728348AbfHUHbY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 03:31:24 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1i0L5N-0003ay-2W; Wed, 21 Aug 2019 09:31:13 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1i0L5H-0005N5-Df; Wed, 21 Aug 2019 09:31:07 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: [PATCH v8 07/13] media: tvp5150: add FORMAT_TRY support for get/set selection handlers
Date:   Wed, 21 Aug 2019 09:30:57 +0200
Message-Id: <20190821073103.19634-8-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821073103.19634-1-m.felsch@pengutronix.de>
References: <20190821073103.19634-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since commit 10d5509c8d50 ("[media] v4l2: remove g/s_crop from video ops")
the 'which' field for set/get_selection must be FORMAT_ACTIVE. There is
no way to try different selections. The patch adds a helper function to
select the correct selection memory space (sub-device file handle or
driver state) which will be set/returned.

The selection rectangle is updated if the format is FORMAT_ACTIVE and
the rectangle position and/or size differs from the current set
rectangle.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Changelog:

v8:
- adapt commit message
- remove wrong FORMAT_TRY handling for tvp5150_fill_fmt() handling
- return 0 during set_selection if FORMAT_TRY was requested and
  CONFIG_VIDEO_V4L2_SUBDEV_API is disabled
- return -EINVAL during get_selection if FORMAT_TRY was requested and
  CONFIG_VIDEO_V4L2_SUBDEV_API is disabled
v7:
- __tvp5150_get_pad_crop(): return error on default case
- simplify __tvp5150_get_pad_crop() error handling
- tvp5150_set_selection() squash __tvp5150_set_selection() execution
  conditions
v6:
nothing
v5:
 - handle stub for v4l2_subdev_get_try_crop() internal since commit
   ("media: v4l2-subdev: add stubs for v4l2_subdev_get_try_*")
   isn't anymore part of this series.
 - add error handling of __tvp5150_get_pad_crop()
v4:
 - fix merge conflict due to rebase on top of media-tree/master
 - __tvp5150_get_pad_crop(): cosmetic alignment fixes

 drivers/media/i2c/tvp5150.c | 111 +++++++++++++++++++++++++-----------
 1 file changed, 79 insertions(+), 32 deletions(-)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index 477a929d4f89..62a1c7c3a7c0 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -19,6 +19,7 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-mc.h>
+#include <media/v4l2-rect.h>
 
 #include "tvp5150_reg.h"
 
@@ -995,6 +996,23 @@ static void tvp5150_set_default(v4l2_std_id std, struct v4l2_rect *crop)
 		crop->height = TVP5150_V_MAX_OTHERS;
 }
 
+static struct v4l2_rect *
+__tvp5150_get_pad_crop(struct tvp5150 *decoder,
+		       struct v4l2_subdev_pad_config *cfg, unsigned int pad,
+		       enum v4l2_subdev_format_whence which)
+{
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		return &decoder->rect;
+	case V4L2_SUBDEV_FORMAT_TRY:
+#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
+		return v4l2_subdev_get_try_crop(&decoder->sd, cfg, pad);
+#endif
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+}
+
 static int tvp5150_fill_fmt(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_pad_config *cfg,
 			    struct v4l2_subdev_format *format)
@@ -1019,36 +1037,68 @@ static int tvp5150_fill_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
+unsigned int tvp5150_get_hmax(struct v4l2_subdev *sd)
+{
+	struct tvp5150 *decoder = to_tvp5150(sd);
+	v4l2_std_id std;
+
+	/* Calculate height based on current standard */
+	if (decoder->norm == V4L2_STD_ALL)
+		std = tvp5150_read_std(sd);
+	else
+		std = decoder->norm;
+
+	return (std & V4L2_STD_525_60) ?
+		TVP5150_V_MAX_525_60 : TVP5150_V_MAX_OTHERS;
+}
+
+static inline void
+__tvp5150_set_selection(struct v4l2_subdev *sd, struct v4l2_rect rect)
+{
+	struct tvp5150 *decoder = to_tvp5150(sd);
+	unsigned int hmax = tvp5150_get_hmax(sd);
+
+	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_START, rect.top);
+	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_STOP,
+		     rect.top + rect.height - hmax);
+	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_MSB,
+		     rect.left >> TVP5150_CROP_SHIFT);
+	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_LSB,
+		     rect.left | (1 << TVP5150_CROP_SHIFT));
+	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_MSB,
+		     (rect.left + rect.width - TVP5150_MAX_CROP_LEFT) >>
+		     TVP5150_CROP_SHIFT);
+	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_LSB,
+		     rect.left + rect.width - TVP5150_MAX_CROP_LEFT);
+}
+
 static int tvp5150_set_selection(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_pad_config *cfg,
 				 struct v4l2_subdev_selection *sel)
 {
 	struct tvp5150 *decoder = to_tvp5150(sd);
 	struct v4l2_rect rect = sel->r;
-	v4l2_std_id std;
-	int hmax;
+	struct v4l2_rect *crop;
+	unsigned int hmax;
 
-	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE ||
-	    sel->target != V4L2_SEL_TGT_CROP)
+	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
 	dev_dbg_lvl(sd->dev, 1, debug, "%s left=%d, top=%d, width=%d, height=%d\n",
 		__func__, rect.left, rect.top, rect.width, rect.height);
 
+	/*
+	 * Do not apply the request in case of FORMAT_TRY and disabled
+	 * CONFIG_VIDEO_V4L2_SUBDEV_API support.
+	 */
+	crop = __tvp5150_get_pad_crop(decoder, cfg, sel->pad, sel->which);
+	if (IS_ERR(crop))
+		return 0;
+
 	/* tvp5150 has some special limits */
 	rect.left = clamp(rect.left, 0, TVP5150_MAX_CROP_LEFT);
 	rect.top = clamp(rect.top, 0, TVP5150_MAX_CROP_TOP);
-
-	/* Calculate height based on current standard */
-	if (decoder->norm == V4L2_STD_ALL)
-		std = tvp5150_read_std(sd);
-	else
-		std = decoder->norm;
-
-	if (std & V4L2_STD_525_60)
-		hmax = TVP5150_V_MAX_525_60;
-	else
-		hmax = TVP5150_V_MAX_OTHERS;
+	hmax = tvp5150_get_hmax(sd);
 
 	/*
 	 * alignments:
@@ -1061,20 +1111,15 @@ static int tvp5150_set_selection(struct v4l2_subdev *sd,
 			      hmax - TVP5150_MAX_CROP_TOP - rect.top,
 			      hmax - rect.top, 0, 0);
 
-	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_START, rect.top);
-	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_STOP,
-		     rect.top + rect.height - hmax);
-	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_MSB,
-		     rect.left >> TVP5150_CROP_SHIFT);
-	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_LSB,
-		     rect.left | (1 << TVP5150_CROP_SHIFT));
-	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_MSB,
-		     (rect.left + rect.width - TVP5150_MAX_CROP_LEFT) >>
-		     TVP5150_CROP_SHIFT);
-	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_LSB,
-		     rect.left + rect.width - TVP5150_MAX_CROP_LEFT);
+	/*
+	 * Update output image size if the selection (crop) rectangle size or
+	 * position has been modified.
+	 */
+	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    !v4l2_rect_equal(&rect, crop))
+		__tvp5150_set_selection(sd, rect);
 
-	decoder->rect = rect;
+	*crop = rect;
 
 	return 0;
 }
@@ -1084,11 +1129,9 @@ static int tvp5150_get_selection(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_selection *sel)
 {
 	struct tvp5150 *decoder = container_of(sd, struct tvp5150, sd);
+	struct v4l2_rect *crop;
 	v4l2_std_id std;
 
-	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE)
-		return -EINVAL;
-
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 		sel->r.left = 0;
@@ -1106,7 +1149,11 @@ static int tvp5150_get_selection(struct v4l2_subdev *sd,
 			sel->r.height = TVP5150_V_MAX_OTHERS;
 		return 0;
 	case V4L2_SEL_TGT_CROP:
-		sel->r = decoder->rect;
+		crop = __tvp5150_get_pad_crop(decoder, cfg, sel->pad,
+						sel->which);
+		if (IS_ERR(crop))
+			return PTR_ERR(crop);
+		sel->r = *crop;
 		return 0;
 	default:
 		return -EINVAL;
-- 
2.20.1

