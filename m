Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 316193A2EC1
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 16:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231452AbhFJO6e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 10:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231384AbhFJO6d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 10:58:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54910C061574
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 07:56:37 -0700 (PDT)
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DADE629CF;
        Thu, 10 Jun 2021 16:56:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623336995;
        bh=0W6A5NhrlzsUOKaJJVnqheySaEcxTTV1azEoP4TvF90=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PHlX7NaKoeDo6XYIVsvOyXjLVRl1n8gLfvAu6Pfm3Q/AcVeUpfA+xr7axafrbOFlR
         H1vRudfFcGrBe0jnai96xeJkbgIH5faXl2HFBh+pGON5kznTHU9qV4x2v1WAaVUKUl
         iRlYWWEn2U2mCgz+HyTO+t9TIbCPPRIXMdIfdpbg=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Walls <awalls@md.metrocast.net>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v5 5/9] media: pci: changes for subdev-wide state struct
Date:   Thu, 10 Jun 2021 17:56:02 +0300
Message-Id: <20210610145606.3468235-6-tomi.valkeinen@ideasonboard.com>
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

This patch does the required changes for drivers/media/pci/

Note that this patch is meant to be squashed into the main patch.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/pci/cx18/cx18-av-core.c         |  2 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 17 +++++++++--------
 drivers/media/pci/saa7134/saa7134-empress.c   |  5 ++++-
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-av-core.c b/drivers/media/pci/cx18/cx18-av-core.c
index 11cfe35fd730..76e5a504df8c 100644
--- a/drivers/media/pci/cx18/cx18-av-core.c
+++ b/drivers/media/pci/cx18/cx18-av-core.c
@@ -930,7 +930,7 @@ static int cx18_av_s_ctrl(struct v4l2_ctrl *ctrl)
 }
 
 static int cx18_av_set_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index ca8040d1a725..47db0ee0fcbf 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -1199,11 +1199,11 @@ static int cio2_subdev_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	};
 
 	/* Initialize try_fmt */
-	format = v4l2_subdev_get_try_format(sd, fh->pad, CIO2_PAD_SINK);
+	format = v4l2_subdev_get_try_format(sd, fh->state, CIO2_PAD_SINK);
 	*format = fmt_default;
 
 	/* same as sink */
-	format = v4l2_subdev_get_try_format(sd, fh->pad, CIO2_PAD_SOURCE);
+	format = v4l2_subdev_get_try_format(sd, fh->state, CIO2_PAD_SOURCE);
 	*format = fmt_default;
 
 	return 0;
@@ -1217,7 +1217,7 @@ static int cio2_subdev_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
  * return -EINVAL or zero on success
  */
 static int cio2_subdev_get_fmt(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt)
 {
 	struct cio2_queue *q = container_of(sd, struct cio2_queue, subdev);
@@ -1225,7 +1225,8 @@ static int cio2_subdev_get_fmt(struct v4l2_subdev *sd,
 	mutex_lock(&q->subdev_lock);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt->format = *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		fmt->format = *v4l2_subdev_get_try_format(sd, sd_state,
+							  fmt->pad);
 	else
 		fmt->format = q->subdev_fmt;
 
@@ -1242,7 +1243,7 @@ static int cio2_subdev_get_fmt(struct v4l2_subdev *sd,
  * return -EINVAL or zero on success
  */
 static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt)
 {
 	struct cio2_queue *q = container_of(sd, struct cio2_queue, subdev);
@@ -1255,10 +1256,10 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
 	 * source always propagates from sink
 	 */
 	if (fmt->pad == CIO2_PAD_SOURCE)
-		return cio2_subdev_get_fmt(sd, cfg, fmt);
+		return cio2_subdev_get_fmt(sd, sd_state, fmt);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		mbus = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		mbus = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
 	else
 		mbus = &q->subdev_fmt;
 
@@ -1283,7 +1284,7 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int cio2_subdev_enum_mbus_code(struct v4l2_subdev *sd,
-				      struct v4l2_subdev_pad_config *cfg,
+				      struct v4l2_subdev_state *sd_state,
 				      struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index >= ARRAY_SIZE(formats))
diff --git a/drivers/media/pci/saa7134/saa7134-empress.c b/drivers/media/pci/saa7134/saa7134-empress.c
index 76a37fbd8458..aafbb34765b0 100644
--- a/drivers/media/pci/saa7134/saa7134-empress.c
+++ b/drivers/media/pci/saa7134/saa7134-empress.c
@@ -138,12 +138,15 @@ static int empress_try_fmt_vid_cap(struct file *file, void *priv,
 {
 	struct saa7134_dev *dev = video_drvdata(file);
 	struct v4l2_subdev_pad_config pad_cfg;
+	struct v4l2_subdev_state pad_state = {
+		.pads = &pad_cfg
+		};
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
 
 	v4l2_fill_mbus_format(&format.format, &f->fmt.pix, MEDIA_BUS_FMT_FIXED);
-	saa_call_all(dev, pad, set_fmt, &pad_cfg, &format);
+	saa_call_all(dev, pad, set_fmt, &pad_state, &format);
 	v4l2_fill_pix_format(&f->fmt.pix, &format.format);
 
 	f->fmt.pix.pixelformat  = V4L2_PIX_FMT_MPEG;
-- 
2.25.1

