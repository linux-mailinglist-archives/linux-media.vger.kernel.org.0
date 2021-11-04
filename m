Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38B86445A27
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 20:02:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234122AbhKDTEv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 15:04:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:45604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231732AbhKDTEt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Nov 2021 15:04:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 60B0F61221;
        Thu,  4 Nov 2021 19:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636052531;
        bh=IduDkzBJsIVclmwQ6Q4Bi2nRgfJSw41FlZNeqKWHBs4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PcEBKJojsu9Un3e4vwYWTjROSoWckJnkdW7MiKcCPMbVLLZKBv7fiFumAMHXXklBn
         SK5bjSg7SXPvTep+0XHyuT1nGjSMYvO+P3rsjDinlkzhyCE0owNptisdD8pUnmvJUM
         hKcKuWi+fmy6i6MlOO15hk/CaACQgJKRVkr8AboziTAJ1LK1GgnToveErlvHrtQPix
         Dve2NretERsaTy6CondD/f55gDEaU4bigpmSYZyu2GWJEjvEe5Rw6KLW3XuynSe0df
         b+xKevqeSPtWsR9B8OEoOmF6/ng7v+aSZZnVuFV9zHybTPh3qZImnMATNTr378tOGk
         1AWhM8TcMY2VA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mihzw-006bKN-F1; Thu, 04 Nov 2021 19:02:04 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Deepak R Varma <drv@mailo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Martiros Shakhzadyan <vrzh@vrzh.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Yizhuo <yzhai003@ucr.edu>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 4/4] media: atomisp-mt9m114: use v4l2_find_nearest_size()
Date:   Thu,  4 Nov 2021 19:02:03 +0000
Message-Id: <f37d58fb71c32437bbfe26cb993cb9fa27b00323.1636052511.git.mchehab+huawei@kernel.org>
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
 .../media/atomisp/i2c/atomisp-mt9m114.c       | 130 ++----------------
 1 file changed, 15 insertions(+), 115 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index 49f4090856d3..00d6842c07d6 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -579,107 +579,6 @@ static int mt9m114_s_power(struct v4l2_subdev *sd, int power)
 	return mt9m114_init_common(sd);
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
-static int distance(struct mt9m114_res_struct const *res, u32 w, u32 h)
-{
-	unsigned int w_ratio;
-	unsigned int h_ratio;
-	int match;
-
-	if (w == 0)
-		return -1;
-	w_ratio = (res->width << 13) / w;
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
-	const struct mt9m114_res_struct *tmp_res = NULL;
-
-	for (i = 0; i < ARRAY_SIZE(mt9m114_res); i++) {
-		tmp_res = &mt9m114_res[i];
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
-static int mt9m114_try_res(u32 *w, u32 *h)
-{
-	int idx = 0;
-
-	if ((*w > MT9M114_RES_960P_SIZE_H)
-	    || (*h > MT9M114_RES_960P_SIZE_V)) {
-		*w = MT9M114_RES_960P_SIZE_H;
-		*h = MT9M114_RES_960P_SIZE_V;
-	} else {
-		idx = nearest_resolution_index(*w, *h);
-
-		/*
-		 * nearest_resolution_index() doesn't return smaller
-		 *  resolutions. If it fails, it means the requested
-		 *  resolution is higher than wecan support. Fallback
-		 *  to highest possible resolution in this case.
-		 */
-		if (idx == -1)
-			idx = ARRAY_SIZE(mt9m114_res) - 1;
-
-		*w = mt9m114_res[idx].width;
-		*h = mt9m114_res[idx].height;
-	}
-
-	return 0;
-}
-
-static struct mt9m114_res_struct *mt9m114_to_res(u32 w, u32 h)
-{
-	int  index;
-
-	for (index = 0; index < N_RES; index++) {
-		if ((mt9m114_res[index].width == w) &&
-		    (mt9m114_res[index].height == h))
-			break;
-	}
-
-	/* No mode found */
-	if (index >= N_RES)
-		return NULL;
-
-	return &mt9m114_res[index];
-}
-
 static int mt9m114_res2size(struct v4l2_subdev *sd, int *h_size, int *v_size)
 {
 	struct mt9m114_device *dev = to_mt9m114_sensor(sd);
@@ -829,7 +728,7 @@ static int mt9m114_set_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *fmt = &format->format;
 	struct i2c_client *c = v4l2_get_subdevdata(sd);
 	struct mt9m114_device *dev = to_mt9m114_sensor(sd);
-	struct mt9m114_res_struct *res_index;
+	struct mt9m114_res_struct *res;
 	u32 width = fmt->width;
 	u32 height = fmt->height;
 	struct camera_mipi_info *mt9m114_info = NULL;
@@ -845,20 +744,21 @@ static int mt9m114_set_fmt(struct v4l2_subdev *sd,
 	if (!mt9m114_info)
 		return -EINVAL;
 
-	mt9m114_try_res(&width, &height);
+	res = v4l2_find_nearest_size(mt9m114_res,
+				     ARRAY_SIZE(mt9m114_res), width,
+				     height, fmt->width, fmt->height);
+	if (!res)
+		res = &mt9m114_res[N_RES - 1];
+
+	fmt->width = res->width;
+	fmt->height = res->height;
+
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		sd_state->pads->try_fmt = *fmt;
 		return 0;
 	}
-	res_index = mt9m114_to_res(width, height);
 
-	/* Sanity check */
-	if (unlikely(!res_index)) {
-		WARN_ON(1);
-		return -EINVAL;
-	}
-
-	switch (res_index->res) {
+	switch (res->res) {
 	case MT9M114_RES_736P:
 		ret = mt9m114_write_reg_array(c, mt9m114_736P_init, NO_POLLING);
 		ret += misensor_rmw_reg(c, MISENSOR_16BIT, MISENSOR_READ_MODE,
@@ -876,7 +776,7 @@ static int mt9m114_set_fmt(struct v4l2_subdev *sd,
 					MISENSOR_R_MODE_MASK, MISENSOR_NORMAL_SET);
 		break;
 	default:
-		v4l2_err(sd, "set resolution: %d failed!\n", res_index->res);
+		v4l2_err(sd, "set resolution: %d failed!\n", res->res);
 		return -EINVAL;
 	}
 
@@ -890,7 +790,7 @@ static int mt9m114_set_fmt(struct v4l2_subdev *sd,
 	if (mt9m114_set_suspend(sd))
 		return -EINVAL;
 
-	if (dev->res != res_index->res) {
+	if (dev->res != res->res) {
 		int index;
 
 		/* Switch to different size */
@@ -922,7 +822,7 @@ static int mt9m114_set_fmt(struct v4l2_subdev *sd,
 		}
 	}
 	ret = mt9m114_get_intg_factor(c, mt9m114_info,
-				      &mt9m114_res[res_index->res]);
+				      &mt9m114_res[res->res]);
 	if (ret) {
 		dev_err(&c->dev, "failed to get integration_factor\n");
 		return -EINVAL;
@@ -931,7 +831,7 @@ static int mt9m114_set_fmt(struct v4l2_subdev *sd,
 	 * mt9m114 - we don't poll for context switch
 	 * because it does not happen with streaming disabled.
 	 */
-	dev->res = res_index->res;
+	dev->res = res->res;
 
 	fmt->width = width;
 	fmt->height = height;
-- 
2.31.1

