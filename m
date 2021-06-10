Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C19C53A2EBE
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 16:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231440AbhFJO6c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 10:58:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231339AbhFJO6c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 10:58:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5600C061574
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 07:56:35 -0700 (PDT)
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 35BE5E86;
        Thu, 10 Jun 2021 16:56:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623336992;
        bh=8yGHQZ9nOVEPWZMt/f7dSMhekwFwAMkYkIH3soRJ9vE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wYpNSOkpkjr2UxLMXZHadjjUfYuB+d/d0zyK09vx3I/jL6V947KyJOEvF1esj2DcA
         YCFTMXhokNBaktEqneN1eH3p96O+GkedL4w2dtBjZvlIqvWoksgf74ZOAsYBJCKpj9
         Ez2ACg5uAUDPlejPPuJlAHvtROujZOP9sUq03Fpk=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v5 3/9] media: s3c-camif: changes for subdev-wide state struct
Date:   Thu, 10 Jun 2021 17:56:00 +0300
Message-Id: <20210610145606.3468235-4-tomi.valkeinen@ideasonboard.com>
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

This patch does the required changes for
drivers/media/platform/s3c-camif/camif-capture.c

Note that this patch is meant to be squashed into the main patch.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../media/platform/s3c-camif/camif-capture.c   | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/s3c-camif/camif-capture.c b/drivers/media/platform/s3c-camif/camif-capture.c
index 62241ec3b978..140854ab4dd8 100644
--- a/drivers/media/platform/s3c-camif/camif-capture.c
+++ b/drivers/media/platform/s3c-camif/camif-capture.c
@@ -1199,7 +1199,7 @@ static const u32 camif_mbus_formats[] = {
  */
 
 static int s3c_camif_subdev_enum_mbus_code(struct v4l2_subdev *sd,
-					struct v4l2_subdev_pad_config *cfg,
+					struct v4l2_subdev_state *sd_state,
 					struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index >= ARRAY_SIZE(camif_mbus_formats))
@@ -1210,14 +1210,14 @@ static int s3c_camif_subdev_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int s3c_camif_subdev_get_fmt(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_format *fmt)
 {
 	struct camif_dev *camif = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *mf = &fmt->format;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mf = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		mf = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
 		fmt->format = *mf;
 		return 0;
 	}
@@ -1278,7 +1278,7 @@ static void __camif_subdev_try_format(struct camif_dev *camif,
 }
 
 static int s3c_camif_subdev_set_fmt(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_format *fmt)
 {
 	struct camif_dev *camif = v4l2_get_subdevdata(sd);
@@ -1306,7 +1306,7 @@ static int s3c_camif_subdev_set_fmt(struct v4l2_subdev *sd,
 	__camif_subdev_try_format(camif, mf, fmt->pad);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mf = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		mf = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
 		*mf = fmt->format;
 		mutex_unlock(&camif->lock);
 		return 0;
@@ -1345,7 +1345,7 @@ static int s3c_camif_subdev_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int s3c_camif_subdev_get_selection(struct v4l2_subdev *sd,
-					  struct v4l2_subdev_pad_config *cfg,
+					  struct v4l2_subdev_state *sd_state,
 					  struct v4l2_subdev_selection *sel)
 {
 	struct camif_dev *camif = v4l2_get_subdevdata(sd);
@@ -1358,7 +1358,7 @@ static int s3c_camif_subdev_get_selection(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
-		sel->r = *v4l2_subdev_get_try_crop(sd, cfg, sel->pad);
+		sel->r = *v4l2_subdev_get_try_crop(sd, sd_state, sel->pad);
 		return 0;
 	}
 
@@ -1432,7 +1432,7 @@ static void __camif_try_crop(struct camif_dev *camif, struct v4l2_rect *r)
 }
 
 static int s3c_camif_subdev_set_selection(struct v4l2_subdev *sd,
-					  struct v4l2_subdev_pad_config *cfg,
+					  struct v4l2_subdev_state *sd_state,
 					  struct v4l2_subdev_selection *sel)
 {
 	struct camif_dev *camif = v4l2_get_subdevdata(sd);
@@ -1446,7 +1446,7 @@ static int s3c_camif_subdev_set_selection(struct v4l2_subdev *sd,
 	__camif_try_crop(camif, &sel->r);
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_crop(sd, cfg, sel->pad) = sel->r;
+		*v4l2_subdev_get_try_crop(sd, sd_state, sel->pad) = sel->r;
 	} else {
 		unsigned long flags;
 		unsigned int i;
-- 
2.25.1

