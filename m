Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75A2A2D0ED9
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 12:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbgLGLTm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 06:19:42 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:49413 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726322AbgLGLTm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Dec 2020 06:19:42 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id mEXfkFZitarN7mEXikzLAS; Mon, 07 Dec 2020 12:18:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1607339939; bh=cDW2r5fF1HAIDDwKn7uJtN04s7Dj72XgdjLzBpxKarA=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=LTp4qYTVp66KgX/XbFl/Va2ODIjqwMf8fp+gOxbjFyngTqPcTBio1bQyDfBx1y0Q3
         9BamWFw0baNPC6rxoGWskpngs4kqjZU0KDtnQn4NPsmlSJqS52Ch09rUL7sfFI8MqY
         Spxj3eoFZGk9N2fEPGHAA2PNtzhDMX51L+w2x6yLm8+ae2vZzumoYvfhdgRqXeugp6
         5ao5yAQ73PSfa2rRJH8ZfmTVF3yL+0S6lxsUWsN7lSdL3iAeGq+C7HAAR+b3frO5oI
         i7El+korvuuhCdJYVGsTEUDkfU+Xz4Kw+blffCB4WEz7dLcqwrGrFZ6uM7ADrV63B8
         +AZRxIP/Xr8PQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] imx274: remove composition support, add
 V4L2_SEL_TGT_CROP_DEFAULT
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Eugen.Hristev@microchip.com" <Eugen.Hristev@microchip.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <7940b65c-b5d8-0167-3262-4282f10e873c@xs4all.nl>
Date:   Mon, 7 Dec 2020 12:18:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKYyR29CqHikPZB9/BtclIPjFRsMBEmQG9pNZVvNFJlntbtOYOE0RZJ4fODLFAuxclF8gIv4btRzW4icWNjksEO3ABu2xtBzEyi6ZNo/ZoptITwsS3O+
 jo74aQQYHWP6uwfys5xyzYQCFmxrL817a66UQNy+WGGWQVX94N9I6chNooEvZwnU1DBPq/vZGgfwpIuHCm63mRCNs129LLlt2TXHKu33mK0/SWUuax8CPYdx
 75oQj8x9U/IfkzPkWrQreB3q2Bews5bbadgPrb8QKyQWj87rfbEkptUiOOqzDEGD/FwkPGB5lMMbCMXFK+xq5aSuwgOtqrkF/Lhxk2GFiwIXANQuqY2J6fqS
 deA4lY9F
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This driver does not support composition, only cropping.
Composition means that the sensor can output e.g. 1920x1080,
but can compose a cropped 1280x720 image in the middle of the
1920x1080 canvas, filling in the unused area with a background
color.

That's not supported at all. So drop the bogus composition support.

Support for V4L2_SEL_TGT_CROP_DEFAULT was missing in imx274_get_selection,
which meant that VIDIOC_CROPCAP couldn't be emulated and that caused a
v4l2-compliance failure. Add support for this target to fix this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
This patch has been in my queue for almost half a year. I thought I had
posted it before, but apparently not. Apologies for that.
---
 drivers/media/i2c/imx274.c | 125 +++++++++++--------------------------
 1 file changed, 36 insertions(+), 89 deletions(-)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index 54642d5f2d5b..abb2f8d4895f 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -980,11 +980,11 @@ static int imx274_binning_goodness(struct stimx274 *imx274,
 }

 /**
- * Helper function to change binning and set both compose and format.
+ * Helper function to change binning and set both crop and format.
  *
  * We have two entry points to change binning: set_fmt and
- * set_selection(COMPOSE). Both have to compute the new output size
- * and set it in both the compose rect and the frame format size. We
+ * set_selection(CROP). Both have to compute the new output size
+ * and set it in both the crop rect and the frame format size. We
  * also need to do the same things after setting cropping to restore
  * 1:1 binning.
  *
@@ -1003,12 +1003,12 @@ static int imx274_binning_goodness(struct stimx274 *imx274,
  * @flags:  Selection flags from struct v4l2_subdev_selection, or 0 if not
  *          available (when called from set_fmt)
  */
-static int __imx274_change_compose(struct stimx274 *imx274,
-				   struct v4l2_subdev_pad_config *cfg,
-				   u32 which,
-				   u32 *width,
-				   u32 *height,
-				   u32 flags)
+static int __imx274_change_crop_fmt(struct stimx274 *imx274,
+				    struct v4l2_subdev_pad_config *cfg,
+				    u32 which,
+				    u32 *width,
+				    u32 *height,
+				    u32 flags)
 {
 	struct device *dev = &imx274->client->dev;
 	const struct v4l2_rect *cur_crop;
@@ -1099,14 +1099,14 @@ static int imx274_set_fmt(struct v4l2_subdev *sd,

 	mutex_lock(&imx274->lock);

-	err = __imx274_change_compose(imx274, cfg, format->which,
-				      &fmt->width, &fmt->height, 0);
+	err = __imx274_change_crop_fmt(imx274, cfg, format->which,
+				       &fmt->width, &fmt->height, 0);

 	if (err)
 		goto out;

 	/*
-	 * __imx274_change_compose already set width and height in the
+	 * __imx274_change_crop_fmt already set width and height in the
 	 * applicable format, but we need to keep all other format
 	 * values, so do a full copy here
 	 */
@@ -1127,14 +1127,12 @@ static int imx274_get_selection(struct v4l2_subdev *sd,
 				struct v4l2_subdev_selection *sel)
 {
 	struct stimx274 *imx274 = to_imx274(sd);
-	const struct v4l2_rect *src_crop;
-	const struct v4l2_mbus_framefmt *src_fmt;
-	int ret = 0;

 	if (sel->pad != 0)
 		return -EINVAL;

-	if (sel->target == V4L2_SEL_TGT_CROP_BOUNDS) {
+	if (sel->target == V4L2_SEL_TGT_CROP_BOUNDS ||
+	    sel->target == V4L2_SEL_TGT_CROP_DEFAULT) {
 		sel->r.left = 0;
 		sel->r.top = 0;
 		sel->r.width = IMX274_MAX_WIDTH;
@@ -1142,57 +1140,42 @@ static int imx274_get_selection(struct v4l2_subdev *sd,
 		return 0;
 	}

-	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
-		src_crop = &cfg->try_crop;
-		src_fmt = &cfg->try_fmt;
-	} else {
-		src_crop = &imx274->crop;
-		src_fmt = &imx274->format;
-	}
+	if (sel->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;

 	mutex_lock(&imx274->lock);
-
-	switch (sel->target) {
-	case V4L2_SEL_TGT_CROP:
-		sel->r = *src_crop;
-		break;
-	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
-		sel->r.top = 0;
-		sel->r.left = 0;
-		sel->r.width = src_crop->width;
-		sel->r.height = src_crop->height;
-		break;
-	case V4L2_SEL_TGT_COMPOSE:
-		sel->r.top = 0;
-		sel->r.left = 0;
-		sel->r.width = src_fmt->width;
-		sel->r.height = src_fmt->height;
-		break;
-	default:
-		ret = -EINVAL;
-	}
+	if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
+		sel->r = cfg->try_crop;
+	else
+		sel->r = imx274->crop;

 	mutex_unlock(&imx274->lock);

-	return ret;
+	return 0;
 }

-static int imx274_set_selection_crop(struct stimx274 *imx274,
-				     struct v4l2_subdev_pad_config *cfg,
-				     struct v4l2_subdev_selection *sel)
+static int imx274_set_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_selection *sel)
 {
+	struct stimx274 *imx274 = to_imx274(sd);
 	struct v4l2_rect *tgt_crop;
 	struct v4l2_rect new_crop;
 	bool size_changed;
-
 	/*
 	 * h_step could be 12 or 24 depending on the binning. But we
 	 * won't know the binning until we choose the mode later in
-	 * __imx274_change_compose(). Thus let's be safe and use the
+	 * __imx274_change_crop_fmt(). Thus let's be safe and use the
 	 * most conservative value in all cases.
 	 */
 	const u32 h_step = 24;

+	if (sel->pad != 0)
+		return -EINVAL;
+
+	if (sel->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
 	new_crop.width = min_t(u32,
 			       IMX274_ROUND(sel->r.width, h_step, sel->flags),
 			       IMX274_MAX_WIDTH);
@@ -1224,56 +1207,20 @@ static int imx274_set_selection_crop(struct stimx274 *imx274,
 	size_changed = (new_crop.width != tgt_crop->width ||
 			new_crop.height != tgt_crop->height);

-	/* __imx274_change_compose needs the new size in *tgt_crop */
+	/* __imx274_change_crop_fmt needs the new size in *tgt_crop */
 	*tgt_crop = new_crop;

 	/* if crop size changed then reset the output image size */
 	if (size_changed)
-		__imx274_change_compose(imx274, cfg, sel->which,
-					&new_crop.width, &new_crop.height,
-					sel->flags);
+		__imx274_change_crop_fmt(imx274, cfg, sel->which,
+					 &new_crop.width, &new_crop.height,
+					 sel->flags);

 	mutex_unlock(&imx274->lock);

 	return 0;
 }

-static int imx274_set_selection(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
-				struct v4l2_subdev_selection *sel)
-{
-	struct stimx274 *imx274 = to_imx274(sd);
-
-	if (sel->pad != 0)
-		return -EINVAL;
-
-	if (sel->target == V4L2_SEL_TGT_CROP)
-		return imx274_set_selection_crop(imx274, cfg, sel);
-
-	if (sel->target == V4L2_SEL_TGT_COMPOSE) {
-		int err;
-
-		mutex_lock(&imx274->lock);
-		err =  __imx274_change_compose(imx274, cfg, sel->which,
-					       &sel->r.width, &sel->r.height,
-					       sel->flags);
-		mutex_unlock(&imx274->lock);
-
-		/*
-		 * __imx274_change_compose already set width and
-		 * height in set->r, we still need to set top-left
-		 */
-		if (!err) {
-			sel->r.top = 0;
-			sel->r.left = 0;
-		}
-
-		return err;
-	}
-
-	return -EINVAL;
-}
-
 static int imx274_apply_trimming(struct stimx274 *imx274)
 {
 	u32 h_start;
-- 
2.29.2

