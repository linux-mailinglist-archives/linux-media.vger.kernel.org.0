Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2524B445A25
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 20:02:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234085AbhKDTEt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 15:04:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:45538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234052AbhKDTEs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Nov 2021 15:04:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E508761215;
        Thu,  4 Nov 2021 19:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636052529;
        bh=jeGb7KDr9H9aYgpc5GqB5nCNFONEG93gCA4GSQUlK5k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ws9Uj9wQKIns5SfykPCfhIlXn68DXNrRRkK3mKF1j0TPf3ytRXyhVUsdxmV3XIq5f
         QLwZrBwyT8W4Euv9ldLaZsHNRCx/4NsnGpTCV4Gny8E+2Pka4f6qKyU/d9mMNdmBbx
         1J6lHHrnXGnSPUfkrnsFYzexHCy74biAAzRWxkkqVDYK9z83pf+10w3Qj7cJli1VCq
         dheBlkj0V8ScigE7M1ZKBTL+gxWIMRPV799+UhXII7GX/j9Q0CtyTJWI9g4/ZrN2rS
         WYn8r5rHF0f9wz6ZptLWtCNcW6GlyhB9rMMDvdojvKejcb4amcoBcWYnv5dMLJIUrv
         qMl0SKRcUWlPA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mihzw-006bKK-EO; Thu, 04 Nov 2021 19:02:04 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Beatriz Martins de Carvalho 
        <martinsdecarvalhobeatriz@gmail.com>,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Deepak R Varma <drv@mailo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tom Rix <trix@redhat.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 3/4] media: atomisp-gc2235: use v4l2_find_nearest_size()
Date:   Thu,  4 Nov 2021 19:02:02 +0000
Message-Id: <e03bec823dcb31cb08f43e331f41acda0c63b071.1636052511.git.mchehab+huawei@kernel.org>
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
 .../media/atomisp/i2c/atomisp-gc2235.c        | 113 +++---------------
 drivers/staging/media/atomisp/i2c/gc2235.h    |   3 +-
 2 files changed, 20 insertions(+), 96 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index 4d769590f2d3..5e7085264189 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -670,76 +670,6 @@ static int gc2235_s_power(struct v4l2_subdev *sd, int on)
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
-static int distance(struct gc2235_resolution *res, u32 w, u32 h)
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
-	struct gc2235_resolution *tmp_res = NULL;
-
-	for (i = 0; i < N_RES; i++) {
-		tmp_res = &gc2235_res[i];
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
-		if (w != gc2235_res[i].width)
-			continue;
-		if (h != gc2235_res[i].height)
-			continue;
-
-		return i;
-	}
-
-	return -1;
-}
-
 static int startup(struct v4l2_subdev *sd)
 {
 	struct gc2235_device *dev = to_gc2235_sensor(sd);
@@ -758,7 +688,7 @@ static int startup(struct v4l2_subdev *sd)
 		gc2235_write_reg_array(client, gc2235_init_settings);
 	}
 
-	ret = gc2235_write_reg_array(client, gc2235_res[dev->fmt_idx].regs);
+	ret = gc2235_write_reg_array(client, dev->res->regs);
 	if (ret) {
 		dev_err(&client->dev, "gc2235 write register err.\n");
 		return ret;
@@ -776,8 +706,8 @@ static int gc2235_set_fmt(struct v4l2_subdev *sd,
 	struct gc2235_device *dev = to_gc2235_sensor(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct camera_mipi_info *gc2235_info = NULL;
+	struct gc2235_resolution *res;
 	int ret = 0;
-	int idx;
 
 	gc2235_info = v4l2_get_subdev_hostdata(sd);
 	if (!gc2235_info)
@@ -786,16 +716,18 @@ static int gc2235_set_fmt(struct v4l2_subdev *sd,
 		return -EINVAL;
 	if (!fmt)
 		return -EINVAL;
+
 	mutex_lock(&dev->input_lock);
-	idx = nearest_resolution_index(fmt->width, fmt->height);
-	if (idx == -1) {
-		/* return the largest resolution */
-		fmt->width = gc2235_res[N_RES - 1].width;
-		fmt->height = gc2235_res[N_RES - 1].height;
-	} else {
-		fmt->width = gc2235_res[idx].width;
-		fmt->height = gc2235_res[idx].height;
-	}
+	res = v4l2_find_nearest_size(gc2235_res_preview,
+				     ARRAY_SIZE(gc2235_res_preview), width,
+				     height, fmt->width, fmt->height);
+	if (!res)
+		res = &gc2235_res_preview[N_RES - 1];
+
+	fmt->width = res->width;
+	fmt->height = res->height;
+	dev->res = res;
+
 	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		sd_state->pads->try_fmt = *fmt;
@@ -803,13 +735,6 @@ static int gc2235_set_fmt(struct v4l2_subdev *sd,
 		return 0;
 	}
 
-	dev->fmt_idx = get_resolution_index(fmt->width, fmt->height);
-	if (dev->fmt_idx == -1) {
-		dev_err(&client->dev, "get resolution fail\n");
-		mutex_unlock(&dev->input_lock);
-		return -EINVAL;
-	}
-
 	ret = startup(sd);
 	if (ret) {
 		dev_err(&client->dev, "gc2235 startup err\n");
@@ -817,7 +742,7 @@ static int gc2235_set_fmt(struct v4l2_subdev *sd,
 	}
 
 	ret = gc2235_get_intg_factor(client, gc2235_info,
-				     &gc2235_res[dev->fmt_idx]);
+				     dev->res);
 	if (ret)
 		dev_err(&client->dev, "failed to get integration_factor\n");
 
@@ -839,8 +764,8 @@ static int gc2235_get_fmt(struct v4l2_subdev *sd,
 	if (!fmt)
 		return -EINVAL;
 
-	fmt->width = gc2235_res[dev->fmt_idx].width;
-	fmt->height = gc2235_res[dev->fmt_idx].height;
+	fmt->width = dev->res->width;
+	fmt->height = dev->res->height;
 	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
 
 	return 0;
@@ -953,7 +878,7 @@ static int gc2235_g_frame_interval(struct v4l2_subdev *sd,
 	struct gc2235_device *dev = to_gc2235_sensor(sd);
 
 	interval->interval.numerator = 1;
-	interval->interval.denominator = gc2235_res[dev->fmt_idx].fps;
+	interval->interval.denominator = dev->res->fps;
 
 	return 0;
 }
@@ -991,7 +916,7 @@ static int gc2235_g_skip_frames(struct v4l2_subdev *sd, u32 *frames)
 	struct gc2235_device *dev = to_gc2235_sensor(sd);
 
 	mutex_lock(&dev->input_lock);
-	*frames = gc2235_res[dev->fmt_idx].skip_frames;
+	*frames = dev->res->skip_frames;
 	mutex_unlock(&dev->input_lock);
 
 	return 0;
@@ -1055,7 +980,7 @@ static int gc2235_probe(struct i2c_client *client)
 
 	mutex_init(&dev->input_lock);
 
-	dev->fmt_idx = 0;
+	dev->res = &gc2235_res_preview[0];
 	v4l2_i2c_subdev_init(&dev->sd, client, &gc2235_ops);
 
 	gcpdev = gmin_camera_platform_data(&dev->sd,
diff --git a/drivers/staging/media/atomisp/i2c/gc2235.h b/drivers/staging/media/atomisp/i2c/gc2235.h
index ba5db1230033..806be5dff7a5 100644
--- a/drivers/staging/media/atomisp/i2c/gc2235.h
+++ b/drivers/staging/media/atomisp/i2c/gc2235.h
@@ -158,11 +158,10 @@ struct gc2235_device {
 	struct v4l2_mbus_framefmt format;
 	struct mutex input_lock;
 	struct v4l2_ctrl_handler ctrl_handler;
+	struct gc2235_resolution *res;
 
 	struct camera_sensor_platform_data *platform_data;
 	int vt_pix_clk_freq_mhz;
-	int fmt_idx;
-	u8 res;
 	u8 type;
 };
 
-- 
2.31.1

