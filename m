Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AFBF6B925
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2019 11:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbfGQJYU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jul 2019 05:24:20 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:59429 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725906AbfGQJYT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jul 2019 05:24:19 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ngAXhuwPc0SBqngAahZVCs; Wed, 17 Jul 2019 11:24:17 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Rui Miguel Silva <rui.silva@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media/i2c: don't return ENOTTY if SUBDEV_API is not set
Message-ID: <854769c0-c933-0919-2798-e8286e1694fb@xs4all.nl>
Date:   Wed, 17 Jul 2019 11:24:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHO5GL5IHDCkGkF/uOztHSrXtlVRRWhrY2jWrQFoS+6sx2SaKcKN53Phc3T3HJ+F3gnJ3E0MwwifQ7MHGe5iMOF+tAgg9qh2/tWW4J98rdCogp711doL
 m5iIVZxibCtQ05E8NeqIt9UFfihivhNZBTy63YO1zttjfBx2dL0yR+cwPqS10+/BfH9dbZxZSXNtyouVmt8bE/oYgehIibfAmSwXxLbOWtFFqApqJTdKXSGQ
 2+qKdb+WX4RyRGzu11EPNkecOWqdD3qb7iIPwPGJIMbzXRO33O/T7YqTPmPsy1ybaDiLGJPZTBnQxe+sc1ziK4xHF42ie2yu951OMLs5HQXo2/fBqUvmai63
 NgCl7ezOS+79D25HCxd+8TmbsDFmJZzlcwACnzwzEJ80u03AYcX4mfGEUE9dKPlHlKaO2R+W
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If CONFIG_VIDEO_V4L2_SUBDEV_API is not set, then it is still possible
to call set_fmt for V4L2_SUBDEV_FORMAT_TRY, the result is just not
stored. So return 0 instead of -ENOTTY.

Calling get_fmt with V4L2_SUBDEV_FORMAT_TRY should return -EINVAL
instead of -ENOTTY, after all the get_fmt functionality is still
present, just not supported for TRY.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
This was fixed for the ov7670 (https://patchwork.linuxtv.org/patch/57584/) when
working on the via-camera driver, but the same pattern is found in other drivers,
and those are fixed in this patch.
---
 drivers/media/i2c/mt9m111.c | 2 +-
 drivers/media/i2c/ov2640.c  | 2 +-
 drivers/media/i2c/ov2659.c  | 4 +---
 drivers/media/i2c/ov2680.c  | 5 +----
 drivers/media/i2c/ov5695.c  | 5 +----
 drivers/media/i2c/ov7740.c  | 8 ++------
 6 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index d10fe3712036..d4864d155f0b 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -536,7 +536,7 @@ static int mt9m111_get_fmt(struct v4l2_subdev *sd,
 		format->format = *mf;
 		return 0;
 #else
-		return -ENOTTY;
+		return -EINVAL;
 #endif
 	}

diff --git a/drivers/media/i2c/ov2640.c b/drivers/media/i2c/ov2640.c
index 30e7e6b2b293..39474b287bb2 100644
--- a/drivers/media/i2c/ov2640.c
+++ b/drivers/media/i2c/ov2640.c
@@ -932,7 +932,7 @@ static int ov2640_get_fmt(struct v4l2_subdev *sd,
 		format->format = *mf;
 		return 0;
 #else
-		return -ENOTTY;
+		return -EINVAL;
 #endif
 	}

diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index 5ed2413eac8a..a71277e361ff 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -1055,7 +1055,7 @@ static int ov2659_get_fmt(struct v4l2_subdev *sd,
 		mutex_unlock(&ov2659->lock);
 		return 0;
 #else
-	return -ENOTTY;
+		return -EINVAL;
 #endif
 	}

@@ -1131,8 +1131,6 @@ static int ov2659_set_fmt(struct v4l2_subdev *sd,
 #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
 		mf = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
 		*mf = fmt->format;
-#else
-		ret = -ENOTTY;
 #endif
 	} else {
 		s64 val;
diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index b10bcfabaeeb..164f983c1814 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -675,7 +675,7 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
 #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
 		fmt = v4l2_subdev_get_try_format(&sensor->sd, cfg, format->pad);
 #else
-		ret = -ENOTTY;
+		ret = -EINVAL;
 #endif
 	} else {
 		fmt = &sensor->fmt;
@@ -723,10 +723,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
 		try_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
 		format->format = *try_fmt;
-#else
-		ret = -ENOTTY;
 #endif
-
 		goto unlock;
 	}

diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
index e65a94353175..34b7046d9702 100644
--- a/drivers/media/i2c/ov5695.c
+++ b/drivers/media/i2c/ov5695.c
@@ -823,9 +823,6 @@ static int ov5695_set_fmt(struct v4l2_subdev *sd,
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
 		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
-#else
-		mutex_unlock(&ov5695->mutex);
-		return -ENOTTY;
 #endif
 	} else {
 		ov5695->cur_mode = mode;
@@ -856,7 +853,7 @@ static int ov5695_get_fmt(struct v4l2_subdev *sd,
 		fmt->format = *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
 #else
 		mutex_unlock(&ov5695->mutex);
-		return -ENOTTY;
+		return -EINVAL;
 #endif
 	} else {
 		fmt->format.width = mode->width;
diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
index 70bb870b1d08..a2f8f19bca7c 100644
--- a/drivers/media/i2c/ov7740.c
+++ b/drivers/media/i2c/ov7740.c
@@ -827,13 +827,9 @@ static int ov7740_set_fmt(struct v4l2_subdev *sd,
 #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
 		mbus_fmt = v4l2_subdev_get_try_format(sd, cfg, format->pad);
 		*mbus_fmt = format->format;
-
+#endif
 		mutex_unlock(&ov7740->mutex);
 		return 0;
-#else
-		ret = -ENOTTY;
-		goto error;
-#endif
 	}

 	ret = ov7740_try_fmt_internal(sd, &format->format, &ovfmt, &fsize);
@@ -868,7 +864,7 @@ static int ov7740_get_fmt(struct v4l2_subdev *sd,
 		format->format = *mbus_fmt;
 		ret = 0;
 #else
-		ret = -ENOTTY;
+		ret = -EINVAL;
 #endif
 	} else {
 		format->format = ov7740->format;
-- 
2.20.1

