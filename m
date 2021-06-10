Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19E803A2EC4
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 16:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbhFJO6h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 10:58:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbhFJO6f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 10:58:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62727C061574
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 07:56:39 -0700 (PDT)
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4BF429E1;
        Thu, 10 Jun 2021 16:56:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623336998;
        bh=P5kPaPvTb8IKrb2DSGRr+d4slN/w+v8lgwC00K3RlVw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TR0hO9DRa8VXoq9u8XJ6BqQg3X33C9FlAbveZShGRqVsDn6rSeUbOiWTZpDw4XPSv
         AnHHxN8V5UeTw2k6ayu8Qmt3YE++n5o5vRxRAdZ/KqxjEe270wx7yP15GZ97wHfhSN
         YEGwn5KCSjdnTCLdNHlkJ2rLWh50DMATEKTwHMjE=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v5 7/9] media: test-drivers: changes for subdev-wide state struct
Date:   Thu, 10 Jun 2021 17:56:04 +0300
Message-Id: <20210610145606.3468235-8-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610145606.3468235-1-tomi.valkeinen@ideasonboard.com>
References: <20210610145606.3468235-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Patch "media: v4l2-subdev: add subdev-wide state struct" changes how
subdev state is managed, adding a new struct to hold all the v4l2 subdev
state.

This patch does the required changes for drivers/media/test-drivers/

Note that this patch is meant to be squashed into the main patch.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../media/test-drivers/vimc/vimc-debayer.c    | 20 +++++------
 drivers/media/test-drivers/vimc/vimc-scaler.c | 36 +++++++++----------
 drivers/media/test-drivers/vimc/vimc-sensor.c | 16 ++++-----
 3 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
index c3f6fef34f68..2d06cdbacc76 100644
--- a/drivers/media/test-drivers/vimc/vimc-debayer.c
+++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
@@ -150,17 +150,17 @@ static bool vimc_deb_src_code_is_valid(u32 code)
 }
 
 static int vimc_deb_init_cfg(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg)
+			     struct v4l2_subdev_state *sd_state)
 {
 	struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *mf;
 	unsigned int i;
 
-	mf = v4l2_subdev_get_try_format(sd, cfg, 0);
+	mf = v4l2_subdev_get_try_format(sd, sd_state, 0);
 	*mf = sink_fmt_default;
 
 	for (i = 1; i < sd->entity.num_pads; i++) {
-		mf = v4l2_subdev_get_try_format(sd, cfg, i);
+		mf = v4l2_subdev_get_try_format(sd, sd_state, i);
 		*mf = sink_fmt_default;
 		mf->code = vdeb->src_code;
 	}
@@ -169,7 +169,7 @@ static int vimc_deb_init_cfg(struct v4l2_subdev *sd,
 }
 
 static int vimc_deb_enum_mbus_code(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (VIMC_IS_SRC(code->pad)) {
@@ -188,7 +188,7 @@ static int vimc_deb_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int vimc_deb_enum_frame_size(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (fse->index)
@@ -213,14 +213,14 @@ static int vimc_deb_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int vimc_deb_get_fmt(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
 	struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
 
 	/* Get the current sink format */
 	fmt->format = fmt->which == V4L2_SUBDEV_FORMAT_TRY ?
-		      *v4l2_subdev_get_try_format(sd, cfg, 0) :
+		      *v4l2_subdev_get_try_format(sd, sd_state, 0) :
 		      vdeb->sink_fmt;
 
 	/* Set the right code for the source pad */
@@ -251,7 +251,7 @@ static void vimc_deb_adjust_sink_fmt(struct v4l2_mbus_framefmt *fmt)
 }
 
 static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
 	struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
@@ -266,8 +266,8 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
 		sink_fmt = &vdeb->sink_fmt;
 		src_code = &vdeb->src_code;
 	} else {
-		sink_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
-		src_code = &v4l2_subdev_get_try_format(sd, cfg, 1)->code;
+		sink_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
+		src_code = &v4l2_subdev_get_try_format(sd, sd_state, 1)->code;
 	}
 
 	/*
diff --git a/drivers/media/test-drivers/vimc/vimc-scaler.c b/drivers/media/test-drivers/vimc/vimc-scaler.c
index 121fa7d62a2e..06880dd0b6ac 100644
--- a/drivers/media/test-drivers/vimc/vimc-scaler.c
+++ b/drivers/media/test-drivers/vimc/vimc-scaler.c
@@ -84,20 +84,20 @@ static void vimc_sca_adjust_sink_crop(struct v4l2_rect *r,
 }
 
 static int vimc_sca_init_cfg(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg)
+			     struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_mbus_framefmt *mf;
 	struct v4l2_rect *r;
 	unsigned int i;
 
-	mf = v4l2_subdev_get_try_format(sd, cfg, 0);
+	mf = v4l2_subdev_get_try_format(sd, sd_state, 0);
 	*mf = sink_fmt_default;
 
-	r = v4l2_subdev_get_try_crop(sd, cfg, 0);
+	r = v4l2_subdev_get_try_crop(sd, sd_state, 0);
 	*r = crop_rect_default;
 
 	for (i = 1; i < sd->entity.num_pads; i++) {
-		mf = v4l2_subdev_get_try_format(sd, cfg, i);
+		mf = v4l2_subdev_get_try_format(sd, sd_state, i);
 		*mf = sink_fmt_default;
 		mf->width = mf->width * sca_mult;
 		mf->height = mf->height * sca_mult;
@@ -107,7 +107,7 @@ static int vimc_sca_init_cfg(struct v4l2_subdev *sd,
 }
 
 static int vimc_sca_enum_mbus_code(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_mbus_code_enum *code)
 {
 	u32 mbus_code = vimc_mbus_code_by_index(code->index);
@@ -128,7 +128,7 @@ static int vimc_sca_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int vimc_sca_enum_frame_size(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_frame_size_enum *fse)
 {
 	const struct vimc_pix_map *vpix;
@@ -156,7 +156,7 @@ static int vimc_sca_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int vimc_sca_get_fmt(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *format)
 {
 	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
@@ -164,8 +164,8 @@ static int vimc_sca_get_fmt(struct v4l2_subdev *sd,
 
 	/* Get the current sink format */
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		format->format = *v4l2_subdev_get_try_format(sd, cfg, 0);
-		crop_rect = v4l2_subdev_get_try_crop(sd, cfg, 0);
+		format->format = *v4l2_subdev_get_try_format(sd, sd_state, 0);
+		crop_rect = v4l2_subdev_get_try_crop(sd, sd_state, 0);
 	} else {
 		format->format = vsca->sink_fmt;
 		crop_rect = &vsca->crop_rect;
@@ -201,7 +201,7 @@ static void vimc_sca_adjust_sink_fmt(struct v4l2_mbus_framefmt *fmt)
 }
 
 static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
 	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
@@ -216,8 +216,8 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
 		sink_fmt = &vsca->sink_fmt;
 		crop_rect = &vsca->crop_rect;
 	} else {
-		sink_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
-		crop_rect = v4l2_subdev_get_try_crop(sd, cfg, 0);
+		sink_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
+		crop_rect = v4l2_subdev_get_try_crop(sd, sd_state, 0);
 	}
 
 	/*
@@ -254,7 +254,7 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int vimc_sca_get_selection(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_selection *sel)
 {
 	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
@@ -268,8 +268,8 @@ static int vimc_sca_get_selection(struct v4l2_subdev *sd,
 		sink_fmt = &vsca->sink_fmt;
 		crop_rect = &vsca->crop_rect;
 	} else {
-		sink_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
-		crop_rect = v4l2_subdev_get_try_crop(sd, cfg, 0);
+		sink_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
+		crop_rect = v4l2_subdev_get_try_crop(sd, sd_state, 0);
 	}
 
 	switch (sel->target) {
@@ -287,7 +287,7 @@ static int vimc_sca_get_selection(struct v4l2_subdev *sd,
 }
 
 static int vimc_sca_set_selection(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_selection *sel)
 {
 	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
@@ -305,8 +305,8 @@ static int vimc_sca_set_selection(struct v4l2_subdev *sd,
 		crop_rect = &vsca->crop_rect;
 		sink_fmt = &vsca->sink_fmt;
 	} else {
-		crop_rect = v4l2_subdev_get_try_crop(sd, cfg, 0);
-		sink_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
+		crop_rect = v4l2_subdev_get_try_crop(sd, sd_state, 0);
+		sink_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
 	}
 
 	switch (sel->target) {
diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
index ba5db5a150b4..74ab79cadb5d 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -42,14 +42,14 @@ static const struct v4l2_mbus_framefmt fmt_default = {
 };
 
 static int vimc_sen_init_cfg(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg)
+			     struct v4l2_subdev_state *sd_state)
 {
 	unsigned int i;
 
 	for (i = 0; i < sd->entity.num_pads; i++) {
 		struct v4l2_mbus_framefmt *mf;
 
-		mf = v4l2_subdev_get_try_format(sd, cfg, i);
+		mf = v4l2_subdev_get_try_format(sd, sd_state, i);
 		*mf = fmt_default;
 	}
 
@@ -57,7 +57,7 @@ static int vimc_sen_init_cfg(struct v4l2_subdev *sd,
 }
 
 static int vimc_sen_enum_mbus_code(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_mbus_code_enum *code)
 {
 	u32 mbus_code = vimc_mbus_code_by_index(code->index);
@@ -71,7 +71,7 @@ static int vimc_sen_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int vimc_sen_enum_frame_size(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_frame_size_enum *fse)
 {
 	const struct vimc_pix_map *vpix;
@@ -93,14 +93,14 @@ static int vimc_sen_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int vimc_sen_get_fmt(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
 	struct vimc_sen_device *vsen =
 				container_of(sd, struct vimc_sen_device, sd);
 
 	fmt->format = fmt->which == V4L2_SUBDEV_FORMAT_TRY ?
-		      *v4l2_subdev_get_try_format(sd, cfg, fmt->pad) :
+		      *v4l2_subdev_get_try_format(sd, sd_state, fmt->pad) :
 		      vsen->mbus_format;
 
 	return 0;
@@ -146,7 +146,7 @@ static void vimc_sen_adjust_fmt(struct v4l2_mbus_framefmt *fmt)
 }
 
 static int vimc_sen_set_fmt(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
 	struct vimc_sen_device *vsen = v4l2_get_subdevdata(sd);
@@ -159,7 +159,7 @@ static int vimc_sen_set_fmt(struct v4l2_subdev *sd,
 
 		mf = &vsen->mbus_format;
 	} else {
-		mf = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		mf = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
 	}
 
 	/* Set the new format */
-- 
2.25.1

