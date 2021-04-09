Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A904E359FF6
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 15:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231819AbhDINhl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 09:37:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231402AbhDINhk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 09:37:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA1B2C061760
        for <linux-media@vger.kernel.org>; Fri,  9 Apr 2021 06:37:27 -0700 (PDT)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 560234A3;
        Fri,  9 Apr 2021 15:37:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1617975445;
        bh=3QYsOHSh2LbID7s9IoiQwTd9JYYo+qz6mza/PH3nho4=;
        h=From:To:Cc:Subject:Date:From;
        b=SuEnO8i7kBuZHgDX9DkL5DXwyiO0l0mb6bxe7JY2Abkz7dSoMkUPPqe2HEyUS1WqV
         wuZeNPFbMkpOXHxrY3GBxcWwVgQSa6HgOxEwsz1dY+1tAgzKE5O81/dIwEUD+xn6RP
         gKYKGf7HDtDcxC679bCakxXLMFWTAs7MAY7YXlCQ=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH] RFC: media: v4l2-subdev: add subdev-wide config struct
Date:   Fri,  9 Apr 2021 16:36:59 +0300
Message-Id: <20210409133659.389544-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We have 'struct v4l2_subdev_pad_config' which contains configuration for
a single pad used for the TRY functionality, and an array of those
structs is passed to various v4l2_subdev_pad_ops.

I was working on subdev internal routing between pads, and realized that
there's no way to add TRY functionality for routes, which is not pad
specific configuration. Adding a separate struct for try-route config
wouldn't work either, as e.g. set-fmt needs to know the try-route
configuration to propagate the settings.

This patch adds a new struct, 'struct v4l2_subdev_config' (which at the
moment only contains the v4l2_subdev_pad_config array) and the new
struct is used in most of the places where v4l2_subdev_pad_config was
used. All v4l2_subdev_pad_ops functions taking v4l2_subdev_pad_config
are changed to instead take v4l2_subdev_config.

Two drivers are changed to work with the above changes (drivers for HW
which I have) as an example.

I worked on a semantic patch (included below, my first spatch...) to do
this change to all drivers, but hit lots of problems with non-trivial
uses of v4l2_subdev_pad_config.

As it looks like substantial amount of manual work is needed, I'm
posting this RFC to get an ack on the changes before continuing that
work.

@ v4l2_subdev_pad_ops @
identifier pad_ops;
identifier func;
@@

(
static const struct v4l2_subdev_pad_ops pad_ops = {
        ...,
        .enum_mbus_code = func,
        ...,
};
|
static const struct v4l2_subdev_pad_ops pad_ops = {
        ...,
        .enum_frame_size = func,
        ...,
};
|
static const struct v4l2_subdev_pad_ops pad_ops = {
        ...,
        .enum_frame_interval = func,
        ...,
};
|
static const struct v4l2_subdev_pad_ops pad_ops = {
        ...,
        .get_fmt = func,
        ...,
};
|
static const struct v4l2_subdev_pad_ops pad_ops = {
        ...,
        .set_fmt = func,
        ...,
};
|
static const struct v4l2_subdev_pad_ops pad_ops = {
        ...,
        .get_selection = func,
        ...,
};
|
static const struct v4l2_subdev_pad_ops pad_ops = {
        ...,
        .set_selection = func,
        ...,
};
|
static const struct v4l2_subdev_pad_ops pad_ops = {
        ...,
        .init_cfg = func,
        ...,
};
)

@@
identifier v4l2_subdev_pad_ops.func;
identifier sd;
identifier cfg;
@@

 func(struct v4l2_subdev *sd,
-	struct v4l2_subdev_pad_config *cfg,
+	struct v4l2_subdev_config *cfg,
	...
      )
 {
    ...
 }

@@
identifier v4l2_subdev_pad_ops.func;
identifier sd;
identifier cfg;
@@

 func(struct v4l2_subdev *sd,
-   struct v4l2_subdev_pad_config *cfg
+   struct v4l2_subdev_config *cfg
      )
 {
    ...
 }

@@
struct v4l2_subdev_fh *fh;
@@
-    fh->pad
+    &fh->cfg

@@
identifier func;
identifier cfg;
@@

func(...,
- struct v4l2_subdev_pad_config *cfg,
+ struct v4l2_subdev_config *cfg,
 ...)
{
    ...
}

@@
struct v4l2_subdev_config *cfg;
@@
 {
    <...
(
-   cfg->try_fmt
+   cfg->pad_configs->try_fmt
|
-   cfg->try_crop
+   cfg->pad_configs->try_crop
|
-   cfg->try_compose
+   cfg->pad_configs->try_compose
)
    ...>
 }

@@
identifier pad_cfg;
@@
{
    ...
    struct v4l2_subdev_pad_config pad_cfg;
+   struct v4l2_subdev_config cfg = { .pad_configs = &pad_cfg };
    <...
-   &pad_cfg
+   &cfg
    ...>
}

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c                   | 10 +--
 drivers/media/platform/ti-vpe/cal-camerarx.c | 12 +--
 drivers/media/v4l2-core/v4l2-subdev.c        | 85 ++++++++++----------
 include/media/v4l2-subdev.h                  | 49 +++++------
 4 files changed, 78 insertions(+), 78 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 14f3afa7721a..7c76c0754426 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -2227,7 +2227,7 @@ static int ov5640_try_frame_interval(struct ov5640_dev *sensor,
 }
 
 static int ov5640_get_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_config *cfg,
 			  struct v4l2_subdev_format *format)
 {
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
@@ -2285,7 +2285,7 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
 }
 
 static int ov5640_set_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_config *cfg,
 			  struct v4l2_subdev_format *format)
 {
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
@@ -2818,7 +2818,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 }
 
 static int ov5640_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_config *cfg,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (fse->pad != 0)
@@ -2838,7 +2838,7 @@ static int ov5640_enum_frame_size(struct v4l2_subdev *sd,
 
 static int ov5640_enum_frame_interval(
 	struct v4l2_subdev *sd,
-	struct v4l2_subdev_pad_config *cfg,
+	struct v4l2_subdev_config *cfg,
 	struct v4l2_subdev_frame_interval_enum *fie)
 {
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
@@ -2924,7 +2924,7 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
 }
 
 static int ov5640_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_config *cfg,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad != 0)
diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index cbe6114908de..c708c61f2188 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -586,7 +586,7 @@ static inline struct cal_camerarx *to_cal_camerarx(struct v4l2_subdev *sd)
 
 static struct v4l2_mbus_framefmt *
 cal_camerarx_get_pad_format(struct cal_camerarx *phy,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_config *cfg,
 			    unsigned int pad, u32 which)
 {
 	switch (which) {
@@ -611,7 +611,7 @@ static int cal_camerarx_sd_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
-					  struct v4l2_subdev_pad_config *cfg,
+					  struct v4l2_subdev_config *cfg,
 					  struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
@@ -639,7 +639,7 @@ static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
-					   struct v4l2_subdev_pad_config *cfg,
+					   struct v4l2_subdev_config *cfg,
 					   struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
@@ -679,7 +679,7 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int cal_camerarx_sd_get_fmt(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_config *cfg,
 				   struct v4l2_subdev_format *format)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
@@ -692,7 +692,7 @@ static int cal_camerarx_sd_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_config *cfg,
 				   struct v4l2_subdev_format *format)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
@@ -742,7 +742,7 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int cal_camerarx_sd_init_cfg(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_pad_config *cfg)
+				    struct v4l2_subdev_config *cfg)
 {
 	struct v4l2_subdev_format format = {
 		.which = cfg ? V4L2_SUBDEV_FORMAT_TRY
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 956dafab43d4..248fa4ee9356 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -26,19 +26,18 @@
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
 {
-	if (sd->entity.num_pads) {
-		fh->pad = v4l2_subdev_alloc_pad_config(sd);
-		if (fh->pad == NULL)
-			return -ENOMEM;
-	}
+	int ret;
+
+	ret = v4l2_subdev_init_config(sd, &fh->cfg);
+	if (ret)
+		return ret;
 
 	return 0;
 }
 
 static void subdev_fh_free(struct v4l2_subdev_fh *fh)
 {
-	v4l2_subdev_free_pad_config(fh->pad);
-	fh->pad = NULL;
+	v4l2_subdev_uninit_config(&fh->cfg);
 }
 
 static int subdev_open(struct file *file)
@@ -146,7 +145,7 @@ static inline int check_pad(struct v4l2_subdev *sd, u32 pad)
 	return 0;
 }
 
-static int check_cfg(u32 which, struct v4l2_subdev_pad_config *cfg)
+static int check_cfg(u32 which, struct v4l2_subdev_config *cfg)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY && !cfg)
 		return -EINVAL;
@@ -155,7 +154,7 @@ static int check_cfg(u32 which, struct v4l2_subdev_pad_config *cfg)
 }
 
 static inline int check_format(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_config *cfg,
 			       struct v4l2_subdev_format *format)
 {
 	if (!format)
@@ -166,7 +165,7 @@ static inline int check_format(struct v4l2_subdev *sd,
 }
 
 static int call_get_fmt(struct v4l2_subdev *sd,
-			struct v4l2_subdev_pad_config *cfg,
+			struct v4l2_subdev_config *cfg,
 			struct v4l2_subdev_format *format)
 {
 	return check_format(sd, cfg, format) ? :
@@ -174,7 +173,7 @@ static int call_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int call_set_fmt(struct v4l2_subdev *sd,
-			struct v4l2_subdev_pad_config *cfg,
+			struct v4l2_subdev_config *cfg,
 			struct v4l2_subdev_format *format)
 {
 	return check_format(sd, cfg, format) ? :
@@ -182,7 +181,7 @@ static int call_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int call_enum_mbus_code(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_config *cfg,
 			       struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (!code)
@@ -194,7 +193,7 @@ static int call_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int call_enum_frame_size(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_config *cfg,
 				struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (!fse)
@@ -229,7 +228,7 @@ static int call_s_frame_interval(struct v4l2_subdev *sd,
 }
 
 static int call_enum_frame_interval(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_config *cfg,
 				    struct v4l2_subdev_frame_interval_enum *fie)
 {
 	if (!fie)
@@ -241,7 +240,7 @@ static int call_enum_frame_interval(struct v4l2_subdev *sd,
 }
 
 static inline int check_selection(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_config *cfg,
 				  struct v4l2_subdev_selection *sel)
 {
 	if (!sel)
@@ -252,7 +251,7 @@ static inline int check_selection(struct v4l2_subdev *sd,
 }
 
 static int call_get_selection(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_config *cfg,
 			      struct v4l2_subdev_selection *sel)
 {
 	return check_selection(sd, cfg, sel) ? :
@@ -260,7 +259,7 @@ static int call_get_selection(struct v4l2_subdev *sd,
 }
 
 static int call_set_selection(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_config *cfg,
 			      struct v4l2_subdev_selection *sel)
 {
 	return check_selection(sd, cfg, sel) ? :
@@ -506,7 +505,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 
 		memset(format->reserved, 0, sizeof(format->reserved));
 		memset(format->format.reserved, 0, sizeof(format->format.reserved));
-		return v4l2_subdev_call(sd, pad, get_fmt, subdev_fh->pad, format);
+		return v4l2_subdev_call(sd, pad, get_fmt, &subdev_fh->cfg, format);
 	}
 
 	case VIDIOC_SUBDEV_S_FMT: {
@@ -517,7 +516,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 
 		memset(format->reserved, 0, sizeof(format->reserved));
 		memset(format->format.reserved, 0, sizeof(format->format.reserved));
-		return v4l2_subdev_call(sd, pad, set_fmt, subdev_fh->pad, format);
+		return v4l2_subdev_call(sd, pad, set_fmt, &subdev_fh->cfg, format);
 	}
 
 	case VIDIOC_SUBDEV_G_CROP: {
@@ -531,7 +530,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		sel.target = V4L2_SEL_TGT_CROP;
 
 		rval = v4l2_subdev_call(
-			sd, pad, get_selection, subdev_fh->pad, &sel);
+			sd, pad, get_selection, &subdev_fh->cfg, &sel);
 
 		crop->rect = sel.r;
 
@@ -553,7 +552,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		sel.r = crop->rect;
 
 		rval = v4l2_subdev_call(
-			sd, pad, set_selection, subdev_fh->pad, &sel);
+			sd, pad, set_selection, &subdev_fh->cfg, &sel);
 
 		crop->rect = sel.r;
 
@@ -564,7 +563,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		struct v4l2_subdev_mbus_code_enum *code = arg;
 
 		memset(code->reserved, 0, sizeof(code->reserved));
-		return v4l2_subdev_call(sd, pad, enum_mbus_code, subdev_fh->pad,
+		return v4l2_subdev_call(sd, pad, enum_mbus_code, &subdev_fh->cfg,
 					code);
 	}
 
@@ -572,7 +571,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		struct v4l2_subdev_frame_size_enum *fse = arg;
 
 		memset(fse->reserved, 0, sizeof(fse->reserved));
-		return v4l2_subdev_call(sd, pad, enum_frame_size, subdev_fh->pad,
+		return v4l2_subdev_call(sd, pad, enum_frame_size, &subdev_fh->cfg,
 					fse);
 	}
 
@@ -597,7 +596,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		struct v4l2_subdev_frame_interval_enum *fie = arg;
 
 		memset(fie->reserved, 0, sizeof(fie->reserved));
-		return v4l2_subdev_call(sd, pad, enum_frame_interval, subdev_fh->pad,
+		return v4l2_subdev_call(sd, pad, enum_frame_interval, &subdev_fh->cfg,
 					fie);
 	}
 
@@ -606,7 +605,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 
 		memset(sel->reserved, 0, sizeof(sel->reserved));
 		return v4l2_subdev_call(
-			sd, pad, get_selection, subdev_fh->pad, sel);
+			sd, pad, get_selection, &subdev_fh->cfg, sel);
 	}
 
 	case VIDIOC_SUBDEV_S_SELECTION: {
@@ -617,7 +616,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 
 		memset(sel->reserved, 0, sizeof(sel->reserved));
 		return v4l2_subdev_call(
-			sd, pad, set_selection, subdev_fh->pad, sel);
+			sd, pad, set_selection, &subdev_fh->cfg, sel);
 	}
 
 	case VIDIOC_G_EDID: {
@@ -892,35 +891,35 @@ int v4l2_subdev_link_validate(struct media_link *link)
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
 
-struct v4l2_subdev_pad_config *
-v4l2_subdev_alloc_pad_config(struct v4l2_subdev *sd)
+int v4l2_subdev_init_config(struct v4l2_subdev *sd, struct v4l2_subdev_config *cfg)
 {
-	struct v4l2_subdev_pad_config *cfg;
 	int ret;
 
-	if (!sd->entity.num_pads)
-		return NULL;
-
-	cfg = kvmalloc_array(sd->entity.num_pads, sizeof(*cfg),
-			     GFP_KERNEL | __GFP_ZERO);
-	if (!cfg)
-		return NULL;
+	if (sd->entity.num_pads) {
+		cfg->pad_configs = kvmalloc_array(sd->entity.num_pads, sizeof(*cfg->pad_configs),
+				     GFP_KERNEL | __GFP_ZERO);
+		if (!cfg->pad_configs)
+			return -ENOMEM;
+	} else {
+		cfg->pad_configs = NULL;
+	}
 
 	ret = v4l2_subdev_call(sd, pad, init_cfg, cfg);
 	if (ret < 0 && ret != -ENOIOCTLCMD) {
-		kvfree(cfg);
-		return NULL;
+		kvfree(cfg->pad_configs);
+		return ret;
 	}
 
-	return cfg;
+	return 0;
 }
-EXPORT_SYMBOL_GPL(v4l2_subdev_alloc_pad_config);
+EXPORT_SYMBOL_GPL(v4l2_subdev_init_config);
 
-void v4l2_subdev_free_pad_config(struct v4l2_subdev_pad_config *cfg)
+void v4l2_subdev_uninit_config(struct v4l2_subdev_config *cfg)
 {
-	kvfree(cfg);
+	kvfree(cfg->pad_configs);
 }
-EXPORT_SYMBOL_GPL(v4l2_subdev_free_pad_config);
+EXPORT_SYMBOL_GPL(v4l2_subdev_uninit_config);
+
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 void v4l2_subdev_init(struct v4l2_subdev *sd, const struct v4l2_subdev_ops *ops)
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index d0e9a5bdb08b..1873e527987a 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -623,6 +623,10 @@ struct v4l2_subdev_pad_config {
 	struct v4l2_rect try_compose;
 };
 
+struct v4l2_subdev_config {
+	struct v4l2_subdev_pad_config *pad_configs;
+};
+
 /**
  * struct v4l2_subdev_pad_ops - v4l2-subdev pad level operations
  *
@@ -687,27 +691,27 @@ struct v4l2_subdev_pad_config {
  */
 struct v4l2_subdev_pad_ops {
 	int (*init_cfg)(struct v4l2_subdev *sd,
-			struct v4l2_subdev_pad_config *cfg);
+			struct v4l2_subdev_config *cfg);
 	int (*enum_mbus_code)(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_config *cfg,
 			      struct v4l2_subdev_mbus_code_enum *code);
 	int (*enum_frame_size)(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_config *cfg,
 			       struct v4l2_subdev_frame_size_enum *fse);
 	int (*enum_frame_interval)(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_config *cfg,
 				   struct v4l2_subdev_frame_interval_enum *fie);
 	int (*get_fmt)(struct v4l2_subdev *sd,
-		       struct v4l2_subdev_pad_config *cfg,
+		       struct v4l2_subdev_config *cfg,
 		       struct v4l2_subdev_format *format);
 	int (*set_fmt)(struct v4l2_subdev *sd,
-		       struct v4l2_subdev_pad_config *cfg,
+		       struct v4l2_subdev_config *cfg,
 		       struct v4l2_subdev_format *format);
 	int (*get_selection)(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_config *cfg,
 			     struct v4l2_subdev_selection *sel);
 	int (*set_selection)(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_config *cfg,
 			     struct v4l2_subdev_selection *sel);
 	int (*get_edid)(struct v4l2_subdev *sd, struct v4l2_edid *edid);
 	int (*set_edid)(struct v4l2_subdev *sd, struct v4l2_edid *edid);
@@ -925,7 +929,7 @@ struct v4l2_subdev_fh {
 	struct v4l2_fh vfh;
 	struct module *owner;
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
-	struct v4l2_subdev_pad_config *pad;
+	struct v4l2_subdev_config cfg;
 #endif
 };
 
@@ -950,12 +954,12 @@ struct v4l2_subdev_fh {
  */
 static inline struct v4l2_mbus_framefmt *
 v4l2_subdev_get_try_format(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_config *cfg,
 			   unsigned int pad)
 {
 	if (WARN_ON(pad >= sd->entity.num_pads))
 		pad = 0;
-	return &cfg[pad].try_fmt;
+	return &cfg->pad_configs[pad].try_fmt;
 }
 
 /**
@@ -968,12 +972,12 @@ v4l2_subdev_get_try_format(struct v4l2_subdev *sd,
  */
 static inline struct v4l2_rect *
 v4l2_subdev_get_try_crop(struct v4l2_subdev *sd,
-			 struct v4l2_subdev_pad_config *cfg,
+			 struct v4l2_subdev_config *cfg,
 			 unsigned int pad)
 {
 	if (WARN_ON(pad >= sd->entity.num_pads))
 		pad = 0;
-	return &cfg[pad].try_crop;
+	return &cfg->pad_configs[pad].try_crop;
 }
 
 /**
@@ -986,12 +990,12 @@ v4l2_subdev_get_try_crop(struct v4l2_subdev *sd,
  */
 static inline struct v4l2_rect *
 v4l2_subdev_get_try_compose(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_config *cfg,
 			    unsigned int pad)
 {
 	if (WARN_ON(pad >= sd->entity.num_pads))
 		pad = 0;
-	return &cfg[pad].try_compose;
+	return &cfg->pad_configs[pad].try_compose;
 }
 
 #endif
@@ -1093,20 +1097,17 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
 int v4l2_subdev_link_validate(struct media_link *link);
 
 /**
- * v4l2_subdev_alloc_pad_config - Allocates memory for pad config
+ * v4l2_subdev_init_config - initialize v4l2_subdev_config
  *
- * @sd: pointer to struct v4l2_subdev
+ * Must call v4l2_subdev_uninit_config() when config is no longer needed.
  */
-struct
-v4l2_subdev_pad_config *v4l2_subdev_alloc_pad_config(struct v4l2_subdev *sd);
+int v4l2_subdev_init_config(struct v4l2_subdev *sd, struct v4l2_subdev_config *cfg);
 
 /**
- * v4l2_subdev_free_pad_config - Frees memory allocated by
- *	v4l2_subdev_alloc_pad_config().
- *
- * @cfg: pointer to &struct v4l2_subdev_pad_config
+ * v4l2_subdev_uninit_config - uninitialize v4l2_subdev_config
  */
-void v4l2_subdev_free_pad_config(struct v4l2_subdev_pad_config *cfg);
+void v4l2_subdev_uninit_config(struct v4l2_subdev_config *cfg);
+
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 /**
-- 
2.25.1

