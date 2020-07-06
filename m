Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2027216123
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 23:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727858AbgGFVyp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 17:54:45 -0400
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:19624 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727124AbgGFVyj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 17:54:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=from:subject:in-reply-to:references:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=3J91EmTF5OcN7m3vDKl6Rjiu026EUSnJD5AzCjIGOG8=;
        b=YhYy5chJSocG6eniupnaylgEcjEdI83n6ieim4g31wWdZYhp0g+7BoESXr5eYcYxMDG4
        IRSbLeFN32P97k/+Q0FpnS2e2YVRMjxnY7SZFK+6zFi24sjpJCtrt1NDE2v7/BParEVZ4I
        eamt6gmNiFKkl3Sm+ZsXeeOGvM6KAkfVg=
Received: by filterdrecv-p3iad2-5b55dcd864-v6r54 with SMTP id filterdrecv-p3iad2-5b55dcd864-v6r54-19-5F039D9D-2F
        2020-07-06 21:54:37.447138052 +0000 UTC m=+881111.294147889
Received: from bionic.localdomain (unknown)
        by ismtpd0008p1lon1.sendgrid.net (SG) with ESMTP
        id Dz87MUcKQ8qbnGWsGSIFHg
        Mon, 06 Jul 2020 21:54:37.197 +0000 (UTC)
From:   Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 10/12] media: rkvdec: Lock capture pixel format in s_ctrl
 and s_fmt
Date:   Mon, 06 Jul 2020 21:54:37 +0000 (UTC)
Message-Id: <20200706215430.22859-11-jonas@kwiboo.se>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200706215430.22859-1-jonas@kwiboo.se>
References: <20200701215616.30874-1-jonas@kwiboo.se>
 <20200706215430.22859-1-jonas@kwiboo.se>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h0i3HAJ5P855+2MmH?=
 =?us-ascii?Q?PYyDRJwSFB674zB7UomfNLPdwR8Qrr2woWvwvrS?=
 =?us-ascii?Q?ny51hdKo9SN0lZ7AGR1S425aXw+20Se4Hu8mX15?=
 =?us-ascii?Q?7gdpbgopgsEbC5hJT=2FqPSCjBGsGQZmKsB8tp111?=
 =?us-ascii?Q?LkbMNC3SxPoTjXfIjtorkOGHjrK=2F4kwwyhQp4RQ?=
 =?us-ascii?Q?b5iUpzS5hjJUckph7I6Gw=3D=3D?=
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Jonas Karlman <jonas@kwiboo.se>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add an optional valid_fmt operation that should return the valid
pixelformat of CAPTURE buffers.

This is used in next patch to ensure correct pixelformat is used for 10-bit
and 4:2:2 content.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
- Reworked validation of pixelformat

Limitations:
- Only a single valid format is supported, technically both CbCr and CrCb
  format variants could be supported by HW.

Example call order using ffmpeg for a 10-bit H.264 608x480 video:

0) Open /dev/video node
rkvdec_reset_decoded_fmt: current valid_fmt= new valid_fmt=
rkvdec_fill_decoded_pixfmt: pixelformat=NV12 width=64 height=48
rkvdec_s_ctrl: current valid_fmt= new valid_fmt=NV12
rkvdec_fill_decoded_pixfmt: pixelformat=NV12 width=64 height=48

1) Set the coded format on the OUTPUT queue via VIDIOC_S_FMT()
rkvdec_enum_output_fmt: index=0 pixelformat=S264
rkvdec_s_output_fmt: pixelformat=S264 width=608 height=480 valid_fmt=NV12
rkvdec_reset_decoded_fmt: current valid_fmt=NV12 new valid_fmt=
rkvdec_fill_decoded_pixfmt: pixelformat=NV12 width=640 height=480

2) Call VIDIOC_S_EXT_CTRLS() to set all the controls
rkvdec_try_ctrl: current valid_fmt=
rkvdec_s_ctrl: current valid_fmt= new valid_fmt=NV15
rkvdec_fill_decoded_pixfmt: pixelformat=NV15 width=640 height=480

3) Call VIDIOC_G_FMT() for CAPTURE queue
rkvdec_g_capture_fmt: pixelformat=NV15 width=640 height=480

4) Enumerate CAPTURE formats via VIDIOC_ENUM_FMT() on the CAPTURE queue
rkvdec_enum_capture_fmt: index=0 pixelformat=NV15 valid_fmt=NV15

5) Choose a different CAPTURE format than suggested via VIDIOC_G_FMT()
rkvdec_s_capture_fmt: pixelformat=NV15 width=608 height=480 valid_fmt=NV15
rkvdec_fill_decoded_pixfmt: pixelformat=NV15 width=640 height=480
rkvdec_g_capture_fmt: pixelformat=NV15 width=640 height=480
---
 drivers/staging/media/rkvdec/rkvdec.c | 59 ++++++++++++++++++++++++---
 drivers/staging/media/rkvdec/rkvdec.h |  2 +
 2 files changed, 55 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 911132be6d50..11a88cb6407d 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -38,6 +38,16 @@ static void rkvdec_fill_decoded_pixfmt(struct rkvdec_ctx *ctx,
 	pix_mp->field = V4L2_FIELD_NONE;
 }
 
+static u32 rkvdec_valid_fmt(struct rkvdec_ctx *ctx, struct v4l2_ctrl *ctrl)
+{
+	const struct rkvdec_coded_fmt_desc *coded_desc = ctx->coded_fmt_desc;
+
+	if (coded_desc->ops->valid_fmt)
+		return coded_desc->ops->valid_fmt(ctx, ctrl);
+
+	return ctx->valid_fmt;
+}
+
 static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
@@ -60,6 +70,10 @@ static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
 			/* Only 8-bit is supported */
 			return -EINVAL;
 
+		if (ctx->valid_fmt && ctx->valid_fmt != rkvdec_valid_fmt(ctx, ctrl))
+			/* Only current valid format */
+			return -EINVAL;
+
 		width = (sps->pic_width_in_mbs_minus1 + 1) * 16;
 		height = (sps->pic_height_in_map_units_minus1 + 1) * 16;
 
@@ -70,8 +84,27 @@ static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
+static int rkvdec_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
+
+	if (ctrl->id == V4L2_CID_MPEG_VIDEO_H264_SPS && !ctx->valid_fmt) {
+		ctx->valid_fmt = rkvdec_valid_fmt(ctx, ctrl);
+		if (ctx->valid_fmt) {
+			struct v4l2_pix_format_mplane *pix_mp;
+
+			pix_mp = &ctx->decoded_fmt.fmt.pix_mp;
+			pix_mp->pixelformat = ctx->valid_fmt;
+			rkvdec_fill_decoded_pixfmt(ctx, pix_mp);
+		}
+	}
+
+	return 0;
+}
+
 static const struct v4l2_ctrl_ops rkvdec_ctrl_ops = {
 	.try_ctrl = rkvdec_try_ctrl,
+	.s_ctrl = rkvdec_s_ctrl,
 };
 
 static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
@@ -188,6 +221,7 @@ static void rkvdec_reset_decoded_fmt(struct rkvdec_ctx *ctx)
 {
 	struct v4l2_format *f = &ctx->decoded_fmt;
 
+	ctx->valid_fmt = 0;
 	rkvdec_reset_fmt(ctx, f, ctx->coded_fmt_desc->decoded_fmts[0]);
 	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	f->fmt.pix_mp.width = ctx->coded_fmt.fmt.pix_mp.width;
@@ -243,13 +277,17 @@ static int rkvdec_try_capture_fmt(struct file *file, void *priv,
 	if (WARN_ON(!coded_desc))
 		return -EINVAL;
 
-	for (i = 0; i < coded_desc->num_decoded_fmts; i++) {
-		if (coded_desc->decoded_fmts[i] == pix_mp->pixelformat)
-			break;
-	}
+	if (ctx->valid_fmt) {
+		pix_mp->pixelformat = ctx->valid_fmt;
+	} else {
+		for (i = 0; i < coded_desc->num_decoded_fmts; i++) {
+			if (coded_desc->decoded_fmts[i] == pix_mp->pixelformat)
+				break;
+		}
 
-	if (i == coded_desc->num_decoded_fmts)
-		pix_mp->pixelformat = coded_desc->decoded_fmts[0];
+		if (i == coded_desc->num_decoded_fmts)
+			pix_mp->pixelformat = coded_desc->decoded_fmts[0];
+	}
 
 	/* Always apply the frmsize constraint of the coded end. */
 	pix_mp->width = max(pix_mp->width, ctx->coded_fmt.fmt.pix_mp.width);
@@ -324,6 +362,7 @@ static int rkvdec_s_capture_fmt(struct file *file, void *priv,
 		return ret;
 
 	ctx->decoded_fmt = *f;
+	ctx->valid_fmt = f->fmt.pix_mp.pixelformat;
 	return 0;
 }
 
@@ -413,6 +452,14 @@ static int rkvdec_enum_capture_fmt(struct file *file, void *priv,
 	if (WARN_ON(!ctx->coded_fmt_desc))
 		return -EINVAL;
 
+	if (ctx->valid_fmt) {
+		if (f->index)
+			return -EINVAL;
+
+		f->pixelformat = ctx->valid_fmt;
+		return 0;
+	}
+
 	if (f->index >= ctx->coded_fmt_desc->num_decoded_fmts)
 		return -EINVAL;
 
diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
index 2fc9f46b6910..50e67401fdbe 100644
--- a/drivers/staging/media/rkvdec/rkvdec.h
+++ b/drivers/staging/media/rkvdec/rkvdec.h
@@ -64,6 +64,7 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
 struct rkvdec_coded_fmt_ops {
 	int (*adjust_fmt)(struct rkvdec_ctx *ctx,
 			  struct v4l2_format *f);
+	u32 (*valid_fmt)(struct rkvdec_ctx *ctx, struct v4l2_ctrl *ctrl);
 	int (*start)(struct rkvdec_ctx *ctx);
 	void (*stop)(struct rkvdec_ctx *ctx);
 	int (*run)(struct rkvdec_ctx *ctx);
@@ -97,6 +98,7 @@ struct rkvdec_ctx {
 	struct v4l2_fh fh;
 	struct v4l2_format coded_fmt;
 	struct v4l2_format decoded_fmt;
+	u32 valid_fmt;
 	const struct rkvdec_coded_fmt_desc *coded_fmt_desc;
 	struct v4l2_ctrl_handler ctrl_hdl;
 	struct rkvdec_dev *dev;
-- 
2.17.1

