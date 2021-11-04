Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 180D84452A4
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 13:06:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231489AbhKDMIm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 08:08:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:37174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230509AbhKDMIj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Nov 2021 08:08:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AC5B61212;
        Thu,  4 Nov 2021 12:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636027560;
        bh=89U7OihVrGHCIndEED01TZH9T7hEmolUfa4Qi9OrMjg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=k9uNg9f5sHkCG8yyW3e49t/yF/WHYHjXKBXLKG6vtZwji6wmL1K+cjtRMhuR056Jw
         Ox9LWpuSHRNUgDKxSUTsD/3FAfeCwK+KB2Z20gBgJUAOvXn3P2Z/FCZK2yta5i0GEs
         JmmBaPSJtRwAfsD2bd80GLjCDHT8oQxNHe7XfgCwqj2uf07BZa8EnGDK4nJSmXR3+i
         fJ98N7NHeYIUyJeiEXS9fpZ3lzOeIMyoWjbl53elh3a7WUT/s/iDHaj+/htoeV/yI1
         KKEcLL9TfJVQO9QdPju9pYlWqHhIOLbaWneYb3I0tBkPuy/5JtK++gdeE26B4X2/ui
         CDXXWTvj4emqw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mibVG-005nHe-5C; Thu, 04 Nov 2021 12:05:58 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Deepak R Varma <drv@mailo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 1/7] media: atomisp-ov2680: use v4l2_find_nearest_size()
Date:   Thu,  4 Nov 2021 12:05:50 +0000
Message-Id: <06b0692f74b03bb66ba1cbe4ae93187a8dd56283.1636026959.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636026959.git.mchehab+huawei@kernel.org>
References: <cover.1636026959.git.mchehab+huawei@kernel.org>
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

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/7] at: https://lore.kernel.org/all/cover.1636026959.git.mchehab+huawei@kernel.org/

 .../media/atomisp/i2c/atomisp-ov2680.c        | 127 ++++--------------
 drivers/staging/media/atomisp/i2c/ov2680.h    |   3 +-
 2 files changed, 25 insertions(+), 105 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 2111e4a478c1..160efa432934 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -147,7 +147,7 @@ static int ov2680_g_bin_factor_x(struct v4l2_subdev *sd, s32 *val)
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 
 	dev_dbg(&client->dev,  "++++ov2680_g_bin_factor_x\n");
-	*val = ov2680_res[dev->fmt_idx].bin_factor_x;
+	*val = dev->res->bin_factor_x;
 
 	return 0;
 }
@@ -157,7 +157,7 @@ static int ov2680_g_bin_factor_y(struct v4l2_subdev *sd, s32 *val)
 	struct ov2680_device *dev = to_ov2680_sensor(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 
-	*val = ov2680_res[dev->fmt_idx].bin_factor_y;
+	*val = dev->res->bin_factor_y;
 	dev_dbg(&client->dev,  "++++ov2680_g_bin_factor_y\n");
 	return 0;
 }
@@ -254,7 +254,7 @@ static long __ov2680_set_exposure(struct v4l2_subdev *sd, int coarse_itg,
 		"+++++++__ov2680_set_exposure coarse_itg %d, gain %d, digitgain %d++\n",
 		coarse_itg, gain, digitgain);
 
-	vts = ov2680_res[dev->fmt_idx].lines_per_frame;
+	vts = dev->res->lines_per_frame;
 
 	/* group hold */
 	ret = ov2680_write_reg(client, 1,
@@ -843,76 +843,6 @@ static int ov2680_s_power(struct v4l2_subdev *sd, int on)
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
-#define LARGEST_ALLOWED_RATIO_MISMATCH 600
-static int distance(struct ov2680_resolution *res, u32 w, u32 h)
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
-	struct ov2680_resolution *tmp_res = NULL;
-
-	for (i = 0; i < N_RES; i++) {
-		tmp_res = &ov2680_res[i];
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
-		if (w != ov2680_res[i].width)
-			continue;
-		if (h != ov2680_res[i].height)
-			continue;
-
-		return i;
-	}
-
-	return -1;
-}
-
 static int ov2680_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
@@ -921,8 +851,8 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	struct ov2680_device *dev = to_ov2680_sensor(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct camera_mipi_info *ov2680_info = NULL;
+	static struct ov2680_resolution *res;
 	int ret = 0;
-	int idx = 0;
 
 	dev_dbg(&client->dev, "%s: %s: pad: %d, fmt: %p\n",
 		__func__,
@@ -940,41 +870,34 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	mutex_lock(&dev->input_lock);
-	idx = nearest_resolution_index(fmt->width, fmt->height);
-	if (idx == -1) {
-		/* return the largest resolution */
-		fmt->width = ov2680_res[N_RES - 1].width;
-		fmt->height = ov2680_res[N_RES - 1].height;
-	} else {
-		fmt->width = ov2680_res[idx].width;
-		fmt->height = ov2680_res[idx].height;
-	}
+
+	res = v4l2_find_nearest_size(ov2680_res_preview,
+				ARRAY_SIZE(ov2680_res_preview), width,
+				height, fmt->width, fmt->height);
+	if (!res)
+		res = &ov2680_res[N_RES - 1];
+
+	fmt->width = res->width;
+	fmt->height = res->height;
+
 	fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		sd_state->pads->try_fmt = *fmt;
 		mutex_unlock(&dev->input_lock);
 		return 0;
 	}
-	dev->fmt_idx = get_resolution_index(fmt->width, fmt->height);
-	dev_dbg(&client->dev, "%s: Resolution index: %d\n",
-		__func__, dev->fmt_idx);
-	if (dev->fmt_idx == -1) {
-		dev_err(&client->dev, "get resolution fail\n");
-		mutex_unlock(&dev->input_lock);
-		return -EINVAL;
-	}
-	dev_dbg(&client->dev, "%s: i=%d, w=%d, h=%d\n",
-		__func__, dev->fmt_idx, fmt->width, fmt->height);
+
+	dev_dbg(&client->dev, "%s: %dx%d\n",
+		__func__, fmt->width, fmt->height);
 
 	// IS IT NEEDED?
 	power_up(sd);
-	ret = ov2680_write_reg_array(client, ov2680_res[dev->fmt_idx].regs);
+	ret = ov2680_write_reg_array(client, dev->res->regs);
 	if (ret)
 		dev_err(&client->dev,
 			"ov2680 write resolution register err: %d\n", ret);
 
-	ret = ov2680_get_intg_factor(client, ov2680_info,
-				     &ov2680_res[dev->fmt_idx]);
+	ret = ov2680_get_intg_factor(client, ov2680_info, res);
 	if (ret) {
 		dev_err(&client->dev, "failed to get integration factor\n");
 		goto err;
@@ -989,8 +912,6 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	if (v_flag)
 		ov2680_v_flip(sd, v_flag);
 
-	v4l2_info(client, "\n%s idx %d\n", __func__, dev->fmt_idx);
-
 	/*
 	 * ret = startup(sd);
 	 * if (ret)
@@ -1014,8 +935,8 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
 	if (!fmt)
 		return -EINVAL;
 
-	fmt->width = ov2680_res[dev->fmt_idx].width;
-	fmt->height = ov2680_res[dev->fmt_idx].height;
+	fmt->width = dev->res->width;
+	fmt->height = dev->res->height;
 	fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
 
 	return 0;
@@ -1155,7 +1076,7 @@ static int ov2680_g_frame_interval(struct v4l2_subdev *sd,
 	struct ov2680_device *dev = to_ov2680_sensor(sd);
 
 	interval->interval.numerator = 1;
-	interval->interval.denominator = ov2680_res[dev->fmt_idx].fps;
+	interval->interval.denominator = dev->res->fps;
 
 	return 0;
 }
@@ -1193,7 +1114,7 @@ static int ov2680_g_skip_frames(struct v4l2_subdev *sd, u32 *frames)
 	struct ov2680_device *dev = to_ov2680_sensor(sd);
 
 	mutex_lock(&dev->input_lock);
-	*frames = ov2680_res[dev->fmt_idx].skip_frames;
+	*frames = dev->res->skip_frames;
 	mutex_unlock(&dev->input_lock);
 
 	return 0;
@@ -1257,7 +1178,7 @@ static int ov2680_probe(struct i2c_client *client)
 
 	mutex_init(&dev->input_lock);
 
-	dev->fmt_idx = 0;
+	dev->res = &ov2680_res_preview[0];
 	v4l2_i2c_subdev_init(&dev->sd, client, &ov2680_ops);
 
 	pdata = gmin_camera_platform_data(&dev->sd,
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index 874115f35fca..535440ed14d7 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -172,11 +172,10 @@ struct ov2680_device {
 	struct v4l2_mbus_framefmt format;
 	struct mutex input_lock;
 	struct v4l2_ctrl_handler ctrl_handler;
+	struct ov2680_resolution *res;
 	struct camera_sensor_platform_data *platform_data;
 	int vt_pix_clk_freq_mhz;
-	int fmt_idx;
 	int run_mode;
-	u8 res;
 	u8 type;
 };
 
-- 
2.31.1

