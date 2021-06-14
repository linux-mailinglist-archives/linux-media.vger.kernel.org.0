Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA52A3A65CA
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236140AbhFNLmK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:42:10 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58306 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237193AbhFNLlC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:41:02 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC3675EB1;
        Mon, 14 Jun 2021 13:24:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623669853;
        bh=EnxelMK4bdCNWXio+kb6ujji4d7ZQxfNG9YhjVpjD+M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MVR7z53ggw2AZb8fLfI7N6BLYYGMrBxQYt8WMzm87EZAqqNQYy2fOS/RD/JAiHtxa
         iG7I6eLEg0AWUVaY6tMi91VaLF8gd9olsMKSLnHrK/uzwNERMXfVl2fNySIef2GHRc
         lIlb+xeto7cN0S4Fwe6dly8UcJxxy3y7bNsWV/aU=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 25/35] media: ti-vpe: cal: rename non-MC funcs to cal_legacy_*
Date:   Mon, 14 Jun 2021 14:23:35 +0300
Message-Id: <20210614112345.2032435-26-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
References: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To make it more obvious if the function in question is dealing with
media-controller API or the legacy API, rename legacy API functions to
cal_legacy_*.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-video.c | 58 +++++++++++------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 1099ef4ae968..fb50b1acd24c 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -102,8 +102,8 @@ static const struct cal_format_info *find_format_by_code(struct cal_ctx *ctx,
 	return NULL;
 }
 
-static int cal_enum_fmt_vid_cap(struct file *file, void  *priv,
-				struct v4l2_fmtdesc *f)
+static int cal_legacy_enum_fmt_vid_cap(struct file *file, void *priv,
+				       struct v4l2_fmtdesc *f)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
 	const struct cal_format_info *fmtinfo;
@@ -189,8 +189,8 @@ static void cal_calc_format_size(struct cal_ctx *ctx,
 		f->fmt.pix.bytesperline, f->fmt.pix.sizeimage);
 }
 
-static int cal_try_fmt_vid_cap(struct file *file, void *priv,
-			       struct v4l2_format *f)
+static int cal_legacy_try_fmt_vid_cap(struct file *file, void *priv,
+				      struct v4l2_format *f)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
 	const struct cal_format_info *fmtinfo;
@@ -249,8 +249,8 @@ static int cal_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int cal_s_fmt_vid_cap(struct file *file, void *priv,
-			     struct v4l2_format *f)
+static int cal_legacy_s_fmt_vid_cap(struct file *file, void *priv,
+				    struct v4l2_format *f)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
 	struct vb2_queue *q = &ctx->vb_vidq;
@@ -266,7 +266,7 @@ static int cal_s_fmt_vid_cap(struct file *file, void *priv,
 		return -EBUSY;
 	}
 
-	ret = cal_try_fmt_vid_cap(file, priv, f);
+	ret = cal_legacy_try_fmt_vid_cap(file, priv, f);
 	if (ret < 0)
 		return ret;
 
@@ -300,8 +300,8 @@ static int cal_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int cal_enum_framesizes(struct file *file, void *fh,
-			       struct v4l2_frmsizeenum *fsize)
+static int cal_legacy_enum_framesizes(struct file *file, void *fh,
+				      struct v4l2_frmsizeenum *fsize)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
 	const struct cal_format_info *fmtinfo;
@@ -337,8 +337,8 @@ static int cal_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
-static int cal_enum_input(struct file *file, void *priv,
-			  struct v4l2_input *inp)
+static int cal_legacy_enum_input(struct file *file, void *priv,
+				 struct v4l2_input *inp)
 {
 	if (inp->index > 0)
 		return -EINVAL;
@@ -348,20 +348,20 @@ static int cal_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int cal_g_input(struct file *file, void *priv, unsigned int *i)
+static int cal_legacy_g_input(struct file *file, void *priv, unsigned int *i)
 {
 	*i = 0;
 	return 0;
 }
 
-static int cal_s_input(struct file *file, void *priv, unsigned int i)
+static int cal_legacy_s_input(struct file *file, void *priv, unsigned int i)
 {
 	return i > 0 ? -EINVAL : 0;
 }
 
 /* timeperframe is arbitrary and continuous */
-static int cal_enum_frameintervals(struct file *file, void *priv,
-				   struct v4l2_frmivalenum *fival)
+static int cal_legacy_enum_frameintervals(struct file *file, void *priv,
+					  struct v4l2_frmivalenum *fival)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
 	const struct cal_format_info *fmtinfo;
@@ -388,27 +388,27 @@ static int cal_enum_frameintervals(struct file *file, void *priv,
 	return 0;
 }
 
-static int cal_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+static int cal_legacy_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
 
 	return v4l2_g_parm_cap(video_devdata(file), ctx->phy->source, a);
 }
 
-static int cal_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+static int cal_legacy_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
 
 	return v4l2_s_parm_cap(video_devdata(file), ctx->phy->source, a);
 }
 
-static const struct v4l2_ioctl_ops cal_ioctl_video_ops = {
+static const struct v4l2_ioctl_ops cal_ioctl_legacy_ops = {
 	.vidioc_querycap      = cal_querycap,
-	.vidioc_enum_fmt_vid_cap  = cal_enum_fmt_vid_cap,
+	.vidioc_enum_fmt_vid_cap  = cal_legacy_enum_fmt_vid_cap,
 	.vidioc_g_fmt_vid_cap     = cal_g_fmt_vid_cap,
-	.vidioc_try_fmt_vid_cap   = cal_try_fmt_vid_cap,
-	.vidioc_s_fmt_vid_cap     = cal_s_fmt_vid_cap,
-	.vidioc_enum_framesizes   = cal_enum_framesizes,
+	.vidioc_try_fmt_vid_cap   = cal_legacy_try_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap     = cal_legacy_s_fmt_vid_cap,
+	.vidioc_enum_framesizes   = cal_legacy_enum_framesizes,
 	.vidioc_reqbufs       = vb2_ioctl_reqbufs,
 	.vidioc_create_bufs   = vb2_ioctl_create_bufs,
 	.vidioc_prepare_buf   = vb2_ioctl_prepare_buf,
@@ -416,17 +416,17 @@ static const struct v4l2_ioctl_ops cal_ioctl_video_ops = {
 	.vidioc_qbuf          = vb2_ioctl_qbuf,
 	.vidioc_dqbuf         = vb2_ioctl_dqbuf,
 	.vidioc_expbuf        = vb2_ioctl_expbuf,
-	.vidioc_enum_input    = cal_enum_input,
-	.vidioc_g_input       = cal_g_input,
-	.vidioc_s_input       = cal_s_input,
-	.vidioc_enum_frameintervals = cal_enum_frameintervals,
+	.vidioc_enum_input    = cal_legacy_enum_input,
+	.vidioc_g_input       = cal_legacy_g_input,
+	.vidioc_s_input       = cal_legacy_s_input,
+	.vidioc_enum_frameintervals = cal_legacy_enum_frameintervals,
 	.vidioc_streamon      = vb2_ioctl_streamon,
 	.vidioc_streamoff     = vb2_ioctl_streamoff,
 	.vidioc_log_status    = v4l2_ctrl_log_status,
 	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
 	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
-	.vidioc_g_parm		= cal_g_parm,
-	.vidioc_s_parm		= cal_s_parm,
+	.vidioc_g_parm		= cal_legacy_g_parm,
+	.vidioc_s_parm		= cal_legacy_s_parm,
 };
 
 /* ------------------------------------------------------------------
@@ -968,7 +968,7 @@ int cal_ctx_v4l2_init(struct cal_ctx *ctx)
 	vfd->queue = q;
 	snprintf(vfd->name, sizeof(vfd->name), "CAL output %u", ctx->dma_ctx);
 	vfd->release = video_device_release_empty;
-	vfd->ioctl_ops = cal_mc_api ? &cal_ioctl_mc_ops : &cal_ioctl_video_ops;
+	vfd->ioctl_ops = cal_mc_api ? &cal_ioctl_mc_ops : &cal_ioctl_legacy_ops;
 	vfd->lock = &ctx->mutex;
 	video_set_drvdata(vfd, ctx);
 
-- 
2.25.1

