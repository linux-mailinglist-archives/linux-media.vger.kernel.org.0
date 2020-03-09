Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35DE517DD2C
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 11:15:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgCIKO7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 06:14:59 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:50953 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbgCIKOs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 06:14:48 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQj-0003mh-6N; Mon, 09 Mar 2020 11:14:37 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQg-0001m8-SB; Mon, 09 Mar 2020 11:14:34 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: [PATCH v12 11/19] media: tvp5150: add FORMAT_TRY support for get/set selection handlers
Date:   Mon,  9 Mar 2020 11:14:20 +0100
Message-Id: <20200309101428.15267-12-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200309101428.15267-1-m.felsch@pengutronix.de>
References: <20200309101428.15267-1-m.felsch@pengutronix.de>
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
v11:
- s/__tvp5150_get_pad_crop/tvp5150_get_pad_crop/
- s/__tvp5150_set_selection/tvp5150_set_hw_selection/
- drop inline for tvp5150_set_hw_selection
- fix allignment issue

v10:
- __tvp5150_get_pad_crop: drop confusing fall-through
- set_selection: fix FORMAT_TRY handling if CONFIG_VIDEO_V4L2_SUBDEV_API
                 is disabled. Adapt sel->r and return 0.
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
---
 drivers/media/i2c/tvp5150.c | 113 ++++++++++++++++++++++++++----------
 1 file changed, 81 insertions(+), 32 deletions(-)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index 38f02c23e352..e9fa473d61f3 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -19,6 +19,7 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-mc.h>
+#include <media/v4l2-rect.h>
 
 #include "tvp5150_reg.h"
 
@@ -995,6 +996,25 @@ static void tvp5150_set_default(v4l2_std_id std, struct v4l2_rect *crop)
 		crop->height = TVP5150_V_MAX_OTHERS;
 }
 
+static struct v4l2_rect *
+tvp5150_get_pad_crop(struct tvp5150 *decoder,
+		     struct v4l2_subdev_pad_config *cfg, unsigned int pad,
+		     enum v4l2_subdev_format_whence which)
+{
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		return &decoder->rect;
+	case V4L2_SUBDEV_FORMAT_TRY:
+#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
+		return v4l2_subdev_get_try_crop(&decoder->sd, cfg, pad);
+#else
+		return ERR_PTR(-EINVAL);
+#endif
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+}
+
 static int tvp5150_fill_fmt(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_pad_config *cfg,
 			    struct v4l2_subdev_format *format)
@@ -1019,17 +1039,51 @@ static int tvp5150_fill_fmt(struct v4l2_subdev *sd,
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
+static void tvp5150_set_hw_selection(struct v4l2_subdev *sd,
+				     struct v4l2_rect *rect)
+{
+	struct tvp5150 *decoder = to_tvp5150(sd);
+	unsigned int hmax = tvp5150_get_hmax(sd);
+
+	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_START, rect->top);
+	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_STOP,
+		     rect->top + rect->height - hmax);
+	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_MSB,
+		     rect->left >> TVP5150_CROP_SHIFT);
+	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_LSB,
+		     rect->left | (1 << TVP5150_CROP_SHIFT));
+	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_MSB,
+		     (rect->left + rect->width - TVP5150_MAX_CROP_LEFT) >>
+		     TVP5150_CROP_SHIFT);
+	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_LSB,
+		     rect->left + rect->width - TVP5150_MAX_CROP_LEFT);
+}
+
 static int tvp5150_set_selection(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_pad_config *cfg,
 				 struct v4l2_subdev_selection *sel)
 {
 	struct tvp5150 *decoder = to_tvp5150(sd);
 	struct v4l2_rect *rect = &sel->r;
-	v4l2_std_id std;
-	int hmax;
+	struct v4l2_rect *crop;
+	unsigned int hmax;
 
-	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE ||
-	    sel->target != V4L2_SEL_TGT_CROP)
+	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
 	dev_dbg_lvl(sd->dev, 1, debug, "%s left=%d, top=%d, width=%d, height=%d\n",
@@ -1038,17 +1092,7 @@ static int tvp5150_set_selection(struct v4l2_subdev *sd,
 	/* tvp5150 has some special limits */
 	rect->left = clamp(rect->left, 0, TVP5150_MAX_CROP_LEFT);
 	rect->top = clamp(rect->top, 0, TVP5150_MAX_CROP_TOP);
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
@@ -1061,20 +1105,23 @@ static int tvp5150_set_selection(struct v4l2_subdev *sd,
 			      hmax - TVP5150_MAX_CROP_TOP - rect->top,
 			      hmax - rect->top, 0, 0);
 
-	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_START, rect->top);
-	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_STOP,
-		     rect->top + rect->height - hmax);
-	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_MSB,
-		     rect->left >> TVP5150_CROP_SHIFT);
-	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_LSB,
-		     rect->left | (1 << TVP5150_CROP_SHIFT));
-	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_MSB,
-		     (rect->left + rect->width - TVP5150_MAX_CROP_LEFT) >>
-		     TVP5150_CROP_SHIFT);
-	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_LSB,
-		     rect->left + rect->width - TVP5150_MAX_CROP_LEFT);
+	if (!IS_ENABLED(CONFIG_VIDEO_V4L2_SUBDEV_API) &&
+	    sel->which == V4L2_SUBDEV_FORMAT_TRY)
+		return 0;
+
+	crop = tvp5150_get_pad_crop(decoder, cfg, sel->pad, sel->which);
+	if (IS_ERR(crop))
+		return PTR_ERR(crop);
+
+	/*
+	 * Update output image size if the selection (crop) rectangle size or
+	 * position has been modified.
+	 */
+	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    !v4l2_rect_equal(rect, crop))
+		tvp5150_set_hw_selection(sd, rect);
 
-	decoder->rect = *rect;
+	*crop = *rect;
 
 	return 0;
 }
@@ -1084,11 +1131,9 @@ static int tvp5150_get_selection(struct v4l2_subdev *sd,
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
@@ -1106,7 +1151,11 @@ static int tvp5150_get_selection(struct v4l2_subdev *sd,
 			sel->r.height = TVP5150_V_MAX_OTHERS;
 		return 0;
 	case V4L2_SEL_TGT_CROP:
-		sel->r = decoder->rect;
+		crop = tvp5150_get_pad_crop(decoder, cfg, sel->pad,
+					    sel->which);
+		if (IS_ERR(crop))
+			return PTR_ERR(crop);
+		sel->r = *crop;
 		return 0;
 	default:
 		return -EINVAL;
-- 
2.20.1

