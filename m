Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1B0B3A2EB8
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 16:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbhFJO6b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 10:58:31 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45088 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbhFJO6a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 10:58:30 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6758E79;
        Thu, 10 Jun 2021 16:56:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623336992;
        bh=n95gKXcTBfH8ZJ0Sz1Z17oiLyYW3QWCBmMXuHH0riFA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZMLLsUlXOQQ5Fq3MBUNAqKzv+i/f6lfB0PvFzddoskJ0yxY+vlVuaAPe574L3Zz3r
         nhNB4id61Z1QEUf53y2u2rRRd0meTzOjaGReVD5bNCRaRtWr34wxUj/rowm+dvP08j
         v2dmxqQ9tEYaZy8vN7Tf9eBnnqFJEGrFSISKdePM=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v5 2/9] media: s5k5baf: changes for subdev-wide state struct
Date:   Thu, 10 Jun 2021 17:55:59 +0300
Message-Id: <20210610145606.3468235-3-tomi.valkeinen@ideasonboard.com>
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

This patch does the required changes for drivers/media/i2c/s5k5baf.c

Note that this patch is meant to be squashed into the main patch.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/s5k5baf.c | 49 +++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
index bc560817e504..6a5dceb699a8 100644
--- a/drivers/media/i2c/s5k5baf.c
+++ b/drivers/media/i2c/s5k5baf.c
@@ -1180,7 +1180,7 @@ static int s5k5baf_s_frame_interval(struct v4l2_subdev *sd,
  * V4L2 subdev pad level and video operations
  */
 static int s5k5baf_enum_frame_interval(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_frame_interval_enum *fie)
 {
 	if (fie->index > S5K5BAF_MAX_FR_TIME - S5K5BAF_MIN_FR_TIME ||
@@ -1199,7 +1199,7 @@ static int s5k5baf_enum_frame_interval(struct v4l2_subdev *sd,
 }
 
 static int s5k5baf_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad == PAD_CIS) {
@@ -1217,7 +1217,7 @@ static int s5k5baf_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int s5k5baf_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	int i;
@@ -1274,15 +1274,16 @@ static int s5k5baf_try_isp_format(struct v4l2_mbus_framefmt *mf)
 	return pixfmt;
 }
 
-static int s5k5baf_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cfg,
-			  struct v4l2_subdev_format *fmt)
+static int s5k5baf_get_fmt(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *sd_state,
+			   struct v4l2_subdev_format *fmt)
 {
 	struct s5k5baf *state = to_s5k5baf(sd);
 	const struct s5k5baf_pixfmt *pixfmt;
 	struct v4l2_mbus_framefmt *mf;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mf = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		mf = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
 		fmt->format = *mf;
 		return 0;
 	}
@@ -1304,8 +1305,9 @@ static int s5k5baf_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config
 	return 0;
 }
 
-static int s5k5baf_set_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cfg,
-			  struct v4l2_subdev_format *fmt)
+static int s5k5baf_set_fmt(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *sd_state,
+			   struct v4l2_subdev_format *fmt)
 {
 	struct v4l2_mbus_framefmt *mf = &fmt->format;
 	struct s5k5baf *state = to_s5k5baf(sd);
@@ -1315,7 +1317,7 @@ static int s5k5baf_set_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config
 	mf->field = V4L2_FIELD_NONE;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = *mf;
+		*v4l2_subdev_get_try_format(sd, sd_state, fmt->pad) = *mf;
 		return 0;
 	}
 
@@ -1367,7 +1369,7 @@ static int s5k5baf_is_bound_target(u32 target)
 }
 
 static int s5k5baf_get_selection(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
 	enum selection_rect rtype;
@@ -1387,9 +1389,11 @@ static int s5k5baf_get_selection(struct v4l2_subdev *sd,
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
 		if (rtype == R_COMPOSE)
-			sel->r = *v4l2_subdev_get_try_compose(sd, cfg, sel->pad);
+			sel->r = *v4l2_subdev_get_try_compose(sd, sd_state,
+							      sel->pad);
 		else
-			sel->r = *v4l2_subdev_get_try_crop(sd, cfg, sel->pad);
+			sel->r = *v4l2_subdev_get_try_crop(sd, sd_state,
+							   sel->pad);
 		return 0;
 	}
 
@@ -1458,7 +1462,7 @@ static bool s5k5baf_cmp_rect(const struct v4l2_rect *r1,
 }
 
 static int s5k5baf_set_selection(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
 	static enum selection_rect rtype;
@@ -1479,9 +1483,12 @@ static int s5k5baf_set_selection(struct v4l2_subdev *sd,
 	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
 		rects = (struct v4l2_rect * []) {
 				&s5k5baf_cis_rect,
-				v4l2_subdev_get_try_crop(sd, cfg, PAD_CIS),
-				v4l2_subdev_get_try_compose(sd, cfg, PAD_CIS),
-				v4l2_subdev_get_try_crop(sd, cfg, PAD_OUT)
+				v4l2_subdev_get_try_crop(sd, sd_state,
+							 PAD_CIS),
+				v4l2_subdev_get_try_compose(sd, sd_state,
+							    PAD_CIS),
+				v4l2_subdev_get_try_crop(sd, sd_state,
+							 PAD_OUT)
 			};
 		s5k5baf_set_rect_and_adjust(rects, rtype, &sel->r);
 		return 0;
@@ -1699,22 +1706,22 @@ static int s5k5baf_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct v4l2_mbus_framefmt *mf;
 
-	mf = v4l2_subdev_get_try_format(sd, fh->pad, PAD_CIS);
+	mf = v4l2_subdev_get_try_format(sd, fh->state, PAD_CIS);
 	s5k5baf_try_cis_format(mf);
 
 	if (s5k5baf_is_cis_subdev(sd))
 		return 0;
 
-	mf = v4l2_subdev_get_try_format(sd, fh->pad, PAD_OUT);
+	mf = v4l2_subdev_get_try_format(sd, fh->state, PAD_OUT);
 	mf->colorspace = s5k5baf_formats[0].colorspace;
 	mf->code = s5k5baf_formats[0].code;
 	mf->width = s5k5baf_cis_rect.width;
 	mf->height = s5k5baf_cis_rect.height;
 	mf->field = V4L2_FIELD_NONE;
 
-	*v4l2_subdev_get_try_crop(sd, fh->pad, PAD_CIS) = s5k5baf_cis_rect;
-	*v4l2_subdev_get_try_compose(sd, fh->pad, PAD_CIS) = s5k5baf_cis_rect;
-	*v4l2_subdev_get_try_crop(sd, fh->pad, PAD_OUT) = s5k5baf_cis_rect;
+	*v4l2_subdev_get_try_crop(sd, fh->state, PAD_CIS) = s5k5baf_cis_rect;
+	*v4l2_subdev_get_try_compose(sd, fh->state, PAD_CIS) = s5k5baf_cis_rect;
+	*v4l2_subdev_get_try_crop(sd, fh->state, PAD_OUT) = s5k5baf_cis_rect;
 
 	return 0;
 }
-- 
2.25.1

