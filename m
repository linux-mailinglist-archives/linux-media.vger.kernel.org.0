Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 762CB445A24
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 20:02:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234060AbhKDTEs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 15:04:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:45516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231732AbhKDTEr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Nov 2021 15:04:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 350DC61051;
        Thu,  4 Nov 2021 19:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636052529;
        bh=4j4HtgJYLeoXx4wc8k7GJKoZhBpleOSnZLSVCMvidWA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tTXg713n7Hw0GbrT3W/w3wdutWSxOHc3rjpr6R2zhBSAaEqVboD3Yvd0VJuZCO4qx
         bHkIiUowdwym1MF2kHYz6KktV9sQQR1/o1trWe+BEh1bVjW0AvhfOvZrYQJJetACXD
         VdcQ4gNW6L1DXTjCx92rO+X8asRoMPks9LEHm61tSy32dCqtgIkFhdOiX4dmVrWAgx
         BgeIimJGuK+ApImyGMh2hVVqBm2rvt2NxschvHSJOVC6nyJtiD7Ev+6W64h8lWjV3K
         C5scDrHxMO0uwz8dRn2OShOx+ZEYagSicLIBzE0ay22m3kHdIKp6NVWEpEW75y3boU
         nImFXrqbvMnzA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mihzw-006bKH-Dq; Thu, 04 Nov 2021 19:02:04 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Deepak R Varma <drv@mailo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Leonid Kushnir <leonf008@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 2/4] media: atomisp-gc0310: use v4l2_find_nearest_size()
Date:   Thu,  4 Nov 2021 19:02:01 +0000
Message-Id: <96baf0373e727971cf25e922c122384b3acd4ef6.1636052511.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <e7aebe347f3878d54bceeb48d8d0574e944c5608.1636052511.git.mchehab+huawei@kernel.org>
References: <e7aebe347f3878d54bceeb48d8d0574e944c5608.1636052511.git.mchehab+huawei@kernel.org>
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
 .../media/atomisp/i2c/atomisp-gc0310.c        | 119 ++++--------------
 drivers/staging/media/atomisp/i2c/gc0310.h    |   3 +-
 2 files changed, 22 insertions(+), 100 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 687888d643df..cbc8b1d91995 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -266,7 +266,7 @@ static int gc0310_g_bin_factor_x(struct v4l2_subdev *sd, s32 *val)
 {
 	struct gc0310_device *dev = to_gc0310_sensor(sd);
 
-	*val = gc0310_res[dev->fmt_idx].bin_factor_x;
+	*val = dev->res->bin_factor_x;
 
 	return 0;
 }
@@ -275,7 +275,7 @@ static int gc0310_g_bin_factor_y(struct v4l2_subdev *sd, s32 *val)
 {
 	struct gc0310_device *dev = to_gc0310_sensor(sd);
 
-	*val = gc0310_res[dev->fmt_idx].bin_factor_y;
+	*val = dev->res->bin_factor_y;
 
 	return 0;
 }
@@ -878,76 +878,6 @@ static int gc0310_s_power(struct v4l2_subdev *sd, int on)
 	return gc0310_init(sd);
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
-static int distance(struct gc0310_resolution *res, u32 w, u32 h)
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
-	if ((w_ratio < 8192) || (h_ratio < 8192)  ||
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
-	struct gc0310_resolution *tmp_res = NULL;
-
-	for (i = 0; i < N_RES; i++) {
-		tmp_res = &gc0310_res[i];
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
-		if (w != gc0310_res[i].width)
-			continue;
-		if (h != gc0310_res[i].height)
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
@@ -955,7 +885,7 @@ static int startup(struct v4l2_subdev *sd)
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
-	ret = gc0310_write_reg_array(client, gc0310_res[dev->fmt_idx].regs);
+	ret = gc0310_write_reg_array(client, dev->res->regs);
 	if (ret) {
 		dev_err(&client->dev, "gc0310 write register err.\n");
 		return ret;
@@ -972,8 +902,8 @@ static int gc0310_set_fmt(struct v4l2_subdev *sd,
 	struct gc0310_device *dev = to_gc0310_sensor(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct camera_mipi_info *gc0310_info = NULL;
+	struct gc0310_resolution *res;
 	int ret = 0;
-	int idx = 0;
 
 	if (format->pad)
 		return -EINVAL;
@@ -987,15 +917,16 @@ static int gc0310_set_fmt(struct v4l2_subdev *sd,
 
 	mutex_lock(&dev->input_lock);
 
-	idx = nearest_resolution_index(fmt->width, fmt->height);
-	if (idx == -1) {
-		/* return the largest resolution */
-		fmt->width = gc0310_res[N_RES - 1].width;
-		fmt->height = gc0310_res[N_RES - 1].height;
-	} else {
-		fmt->width = gc0310_res[idx].width;
-		fmt->height = gc0310_res[idx].height;
-	}
+	res = v4l2_find_nearest_size(gc0310_res_preview,
+				     ARRAY_SIZE(gc0310_res_preview), width,
+				     height, fmt->width, fmt->height);
+	if (!res)
+		res = &gc0310_res_preview[N_RES - 1];
+
+	fmt->width = res->width;
+	fmt->height = res->height;
+	dev->res = res;
+
 	fmt->code = MEDIA_BUS_FMT_SGRBG8_1X8;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
@@ -1004,23 +935,15 @@ static int gc0310_set_fmt(struct v4l2_subdev *sd,
 		return 0;
 	}
 
-	dev->fmt_idx = get_resolution_index(fmt->width, fmt->height);
-	if (dev->fmt_idx == -1) {
-		dev_err(&client->dev, "get resolution fail\n");
-		mutex_unlock(&dev->input_lock);
-		return -EINVAL;
-	}
-
 	dev_dbg(&client->dev, "%s: before gc0310_write_reg_array %s\n",
-		__func__, gc0310_res[dev->fmt_idx].desc);
+		__func__, dev->res->desc);
 	ret = startup(sd);
 	if (ret) {
 		dev_err(&client->dev, "gc0310 startup err\n");
 		goto err;
 	}
 
-	ret = gc0310_get_intg_factor(client, gc0310_info,
-				     &gc0310_res[dev->fmt_idx]);
+	ret = gc0310_get_intg_factor(client, gc0310_info, dev->res);
 	if (ret) {
 		dev_err(&client->dev, "failed to get integration_factor\n");
 		goto err;
@@ -1044,8 +967,8 @@ static int gc0310_get_fmt(struct v4l2_subdev *sd,
 	if (!fmt)
 		return -EINVAL;
 
-	fmt->width = gc0310_res[dev->fmt_idx].width;
-	fmt->height = gc0310_res[dev->fmt_idx].height;
+	fmt->width = dev->res->width;
+	fmt->height = dev->res->height;
 	fmt->code = MEDIA_BUS_FMT_SGRBG8_1X8;
 
 	return 0;
@@ -1199,7 +1122,7 @@ static int gc0310_g_frame_interval(struct v4l2_subdev *sd,
 	struct gc0310_device *dev = to_gc0310_sensor(sd);
 
 	interval->interval.numerator = 1;
-	interval->interval.denominator = gc0310_res[dev->fmt_idx].fps;
+	interval->interval.denominator = dev->res->fps;
 
 	return 0;
 }
@@ -1237,7 +1160,7 @@ static int gc0310_g_skip_frames(struct v4l2_subdev *sd, u32 *frames)
 	struct gc0310_device *dev = to_gc0310_sensor(sd);
 
 	mutex_lock(&dev->input_lock);
-	*frames = gc0310_res[dev->fmt_idx].skip_frames;
+	*frames = dev->res->skip_frames;
 	mutex_unlock(&dev->input_lock);
 
 	return 0;
@@ -1301,7 +1224,7 @@ static int gc0310_probe(struct i2c_client *client)
 
 	mutex_init(&dev->input_lock);
 
-	dev->fmt_idx = 0;
+	dev->res = &gc0310_res_preview[0];
 	v4l2_i2c_subdev_init(&dev->sd, client, &gc0310_ops);
 
 	pdata = gmin_camera_platform_data(&dev->sd,
diff --git a/drivers/staging/media/atomisp/i2c/gc0310.h b/drivers/staging/media/atomisp/i2c/gc0310.h
index 2fe3de115083..db643ebc3909 100644
--- a/drivers/staging/media/atomisp/i2c/gc0310.h
+++ b/drivers/staging/media/atomisp/i2c/gc0310.h
@@ -150,8 +150,7 @@ struct gc0310_device {
 
 	struct camera_sensor_platform_data *platform_data;
 	int vt_pix_clk_freq_mhz;
-	int fmt_idx;
-	u8 res;
+	struct gc0310_resolution *res;
 	u8 type;
 };
 
-- 
2.31.1

