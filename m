Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45826445A2A
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 20:02:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234177AbhKDTEz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 15:04:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:45640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234113AbhKDTEu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Nov 2021 15:04:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E074161241;
        Thu,  4 Nov 2021 19:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636052531;
        bh=1EZx2skIv3gidB+okmu2aSt5UCRLWsBkMqEWZ/9Pu8Q=;
        h=From:To:Cc:Subject:Date:From;
        b=cpArnTU3+eEIP9kQwQgEmnLBzcLgOcL4NrFIQvI9itG9DZT9st/yQzaEFSS+aDusn
         VMqI2MI1bB15r9d1UntF2Q8KwElLNa3I+LmjuMWXCe14w9+Vna1MQ6m06joLk21ehB
         NwTyskkU7273ZbxxpuMcNSsVVrfqDrsYpvy6ozme9xLKsVBZbrhruWbEh0/yoRlJHR
         +B+rHp1xeeE+EfjquQy82xtlSZPc/FvRKogLk1t/4kIG3siqGTysAXoDDJ6uTrtmSe
         Z82Mzwu86meYjKwo0i6xZHpUOM+ZT4NUJenJ8SdNH4hMZaxNPR5YNdKw6p/xofHts6
         xOO/+5Fu+RguA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mihzw-006bKE-DH; Thu, 04 Nov 2021 19:02:04 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Filip Kolev <fil.kolev@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Martiros Shakhzadyan <vrzh@vrzh.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 1/4] media: atomisp-ov2722: use v4l2_find_nearest_size()
Date:   Thu,  4 Nov 2021 19:02:00 +0000
Message-Id: <e7aebe347f3878d54bceeb48d8d0574e944c5608.1636052511.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of reinventing the wheel, use v4l2_find_nearest_size()
in order to get the closest resolution.

This should address a bug where the wrong resolution was
selected.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/atomisp/i2c/atomisp-ov2722.c        | 118 ++++--------------
 drivers/staging/media/atomisp/i2c/ov2722.h    |   3 +-
 2 files changed, 22 insertions(+), 99 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 90d0871a78a3..da98094d7094 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -557,7 +557,7 @@ static int ov2722_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 		ret = ov2722_g_fnumber_range(&dev->sd, &ctrl->val);
 		break;
 	case V4L2_CID_LINK_FREQ:
-		val = ov2722_res[dev->fmt_idx].mipi_freq;
+		val = dev->res->mipi_freq;
 		if (val == 0)
 			return -EINVAL;
 
@@ -782,76 +782,6 @@ static int ov2722_s_power(struct v4l2_subdev *sd, int on)
 	return ret;
 }
 
-/*
- * distance - calculate the distance
- * @res: resolution
- * @w: width
- * @h: height
- *
- * Get the gap between resolution and w/h.
- * res->width/height smaller than w/h wouldn't be considered.
- * Returns the value of gap or -1 if fail.
- */
-#define LARGEST_ALLOWED_RATIO_MISMATCH 800
-static int distance(struct ov2722_resolution *res, u32 w, u32 h)
-{
-	unsigned int w_ratio = (res->width << 13) / w;
-	unsigned int h_ratio;
-	int match;
-
-	if (h == 0)
-		return -1;
-	h_ratio = (res->height << 13) / h;
-	if (h_ratio == 0)
-		return -1;
-	match   = abs(((w_ratio << 13) / h_ratio) - 8192);
-
-	if ((w_ratio < 8192) || (h_ratio < 8192) ||
-	    (match > LARGEST_ALLOWED_RATIO_MISMATCH))
-		return -1;
-
-	return w_ratio + h_ratio;
-}
-
-/* Return the nearest higher resolution index */
-static int nearest_resolution_index(int w, int h)
-{
-	int i;
-	int idx = -1;
-	int dist;
-	int min_dist = INT_MAX;
-	struct ov2722_resolution *tmp_res = NULL;
-
-	for (i = 0; i < N_RES; i++) {
-		tmp_res = &ov2722_res[i];
-		dist = distance(tmp_res, w, h);
-		if (dist == -1)
-			continue;
-		if (dist < min_dist) {
-			min_dist = dist;
-			idx = i;
-		}
-	}
-
-	return idx;
-}
-
-static int get_resolution_index(int w, int h)
-{
-	int i;
-
-	for (i = 0; i < N_RES; i++) {
-		if (w != ov2722_res[i].width)
-			continue;
-		if (h != ov2722_res[i].height)
-			continue;
-
-		return i;
-	}
-
-	return -1;
-}
-
 /* TODO: remove it. */
 static int startup(struct v4l2_subdev *sd)
 {
@@ -866,7 +796,7 @@ static int startup(struct v4l2_subdev *sd)
 		return ret;
 	}
 
-	ret = ov2722_write_reg_array(client, ov2722_res[dev->fmt_idx].regs);
+	ret = ov2722_write_reg_array(client, dev->res->regs);
 	if (ret) {
 		dev_err(&client->dev, "ov2722 write register err.\n");
 		return ret;
@@ -882,9 +812,9 @@ static int ov2722_set_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *fmt = &format->format;
 	struct ov2722_device *dev = to_ov2722_sensor(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ov2722_resolution *res;
 	struct camera_mipi_info *ov2722_info = NULL;
 	int ret = 0;
-	int idx;
 
 	if (format->pad)
 		return -EINVAL;
@@ -895,15 +825,16 @@ static int ov2722_set_fmt(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	mutex_lock(&dev->input_lock);
-	idx = nearest_resolution_index(fmt->width, fmt->height);
-	if (idx == -1) {
-		/* return the largest resolution */
-		fmt->width = ov2722_res[N_RES - 1].width;
-		fmt->height = ov2722_res[N_RES - 1].height;
-	} else {
-		fmt->width = ov2722_res[idx].width;
-		fmt->height = ov2722_res[idx].height;
-	}
+	res = v4l2_find_nearest_size(ov2722_res_preview,
+				     ARRAY_SIZE(ov2722_res_preview), width,
+				     height, fmt->width, fmt->height);
+	if (!res)
+		res = &ov2722_res_preview[N_RES - 1];
+
+	fmt->width = res->width;
+	fmt->height = res->height;
+	dev->res = res;
+
 	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		sd_state->pads->try_fmt = *fmt;
@@ -911,15 +842,9 @@ static int ov2722_set_fmt(struct v4l2_subdev *sd,
 		return 0;
 	}
 
-	dev->fmt_idx = get_resolution_index(fmt->width, fmt->height);
-	if (dev->fmt_idx == -1) {
-		dev_err(&client->dev, "get resolution fail\n");
-		mutex_unlock(&dev->input_lock);
-		return -EINVAL;
-	}
 
-	dev->pixels_per_line = ov2722_res[dev->fmt_idx].pixels_per_line;
-	dev->lines_per_frame = ov2722_res[dev->fmt_idx].lines_per_frame;
+	dev->pixels_per_line = dev->res->pixels_per_line;
+	dev->lines_per_frame = dev->res->lines_per_frame;
 
 	ret = startup(sd);
 	if (ret) {
@@ -950,8 +875,7 @@ static int ov2722_set_fmt(struct v4l2_subdev *sd,
 		}
 	}
 
-	ret = ov2722_get_intg_factor(client, ov2722_info,
-				     &ov2722_res[dev->fmt_idx]);
+	ret = ov2722_get_intg_factor(client, ov2722_info, dev->res);
 	if (ret)
 		dev_err(&client->dev, "failed to get integration_factor\n");
 
@@ -972,8 +896,8 @@ static int ov2722_get_fmt(struct v4l2_subdev *sd,
 	if (!fmt)
 		return -EINVAL;
 
-	fmt->width = ov2722_res[dev->fmt_idx].width;
-	fmt->height = ov2722_res[dev->fmt_idx].height;
+	fmt->width = dev->res->width;
+	fmt->height = dev->res->height;
 	fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
 
 	return 0;
@@ -1098,7 +1022,7 @@ static int ov2722_g_frame_interval(struct v4l2_subdev *sd,
 	struct ov2722_device *dev = to_ov2722_sensor(sd);
 
 	interval->interval.numerator = 1;
-	interval->interval.denominator = ov2722_res[dev->fmt_idx].fps;
+	interval->interval.denominator = dev->res->fps;
 
 	return 0;
 }
@@ -1136,7 +1060,7 @@ static int ov2722_g_skip_frames(struct v4l2_subdev *sd, u32 *frames)
 	struct ov2722_device *dev = to_ov2722_sensor(sd);
 
 	mutex_lock(&dev->input_lock);
-	*frames = ov2722_res[dev->fmt_idx].skip_frames;
+	*frames = dev->res->skip_frames;
 	mutex_unlock(&dev->input_lock);
 
 	return 0;
@@ -1220,7 +1144,7 @@ static int ov2722_probe(struct i2c_client *client)
 
 	mutex_init(&dev->input_lock);
 
-	dev->fmt_idx = 0;
+	dev->res = &ov2722_res_preview[0];
 	v4l2_i2c_subdev_init(&dev->sd, client, &ov2722_ops);
 
 	ovpdev = gmin_camera_platform_data(&dev->sd,
diff --git a/drivers/staging/media/atomisp/i2c/ov2722.h b/drivers/staging/media/atomisp/i2c/ov2722.h
index 7b0debb6c53d..d6e2510bc01c 100644
--- a/drivers/staging/media/atomisp/i2c/ov2722.h
+++ b/drivers/staging/media/atomisp/i2c/ov2722.h
@@ -201,14 +201,13 @@ struct ov2722_device {
 	struct media_pad pad;
 	struct v4l2_mbus_framefmt format;
 	struct mutex input_lock;
+	struct ov2722_resolution *res;
 
 	struct camera_sensor_platform_data *platform_data;
 	int vt_pix_clk_freq_mhz;
-	int fmt_idx;
 	int run_mode;
 	u16 pixels_per_line;
 	u16 lines_per_frame;
-	u8 res;
 	u8 type;
 
 	struct v4l2_ctrl_handler ctrl_handler;
-- 
2.31.1

