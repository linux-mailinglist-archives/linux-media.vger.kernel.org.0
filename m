Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4195B425201
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 13:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240919AbhJGLch (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Oct 2021 07:32:37 -0400
Received: from phobos.denx.de ([85.214.62.61]:57944 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230087AbhJGLcg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Oct 2021 07:32:36 -0400
Received: from localhost.localdomain (unknown [IPv6:2804:14c:485:504a:4341:77b:7540:97e3])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: festevam@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 7DBAE831A4;
        Thu,  7 Oct 2021 13:30:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1633606242;
        bh=wdusPC96evzSr9PhxAaih124XgxwYKHldN/26L79+HA=;
        h=From:To:Cc:Subject:Date:From;
        b=i3ZGpiTUGTG6X5lm0JgL24MW1/TrIWBYtUYNp2qHVhA4Gasyi8+/6urFaEdq6KKlP
         0mxxEte5ycH2zkhMIEay6eSi2ubNEEv1HK8UZlvy9ripuRJpKvYEMzGWk7DO6enW96
         aB7AkA8OQuCYyoDfK2EEfHU9cZu5oQ1EJHi6Awh3XGFyOOAFyodx1koto+xUq1e0Ys
         HtdgXVp55NqeP52mpODYMJBcFOxw978XT2Nq0N3fAjZwMna55Q+pVZ7d0TBDENKIla
         +bZoMSpq29C61K2JZsXaIKKRH0sruzqChZDKr2vzBEGX/ThRG9+1Tg//9pjKLSwxqu
         1rpBqGLTfPGqQ==
From:   Fabio Estevam <festevam@denx.de>
To:     p.zabel@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] media: imx-pxp: Add rotation support
Date:   Thu,  7 Oct 2021 08:30:24 -0300
Message-Id: <20211007113024.2043114-1-festevam@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PXP allows clockwise rotation in 0°, 90°, 180° and 270° degrees.

Add support for it.

Tested on a imx6ull-evk.

For example, to rotate 90° the following Gstreamer pipeline can
be used:

gst-launch-1.0 videotestsrc ! video/x-raw,width=640,height=480 ! \
v4l2convert extra-controls=cid,rotate=90  ! \
video/x-raw,width=120,height=160 ! fbdevsink

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Use 'return PXP_ROTATE_0' instead of 'return 0' in the fall
back case.

 drivers/media/platform/imx-pxp.c | 38 ++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/imx-pxp.c b/drivers/media/platform/imx-pxp.c
index 723b096fedd1..4d4cc960c3e8 100644
--- a/drivers/media/platform/imx-pxp.c
+++ b/drivers/media/platform/imx-pxp.c
@@ -168,6 +168,13 @@ enum {
 	V4L2_M2M_DST = 1,
 };
 
+enum pxp_rotation_modes {
+	PXP_ROTATE_0,
+	PXP_ROTATE_90,
+	PXP_ROTATE_180,
+	PXP_ROTATE_270,
+};
+
 static struct pxp_fmt *find_format(struct v4l2_format *f)
 {
 	struct pxp_fmt *fmt;
@@ -211,6 +218,7 @@ struct pxp_ctx {
 	/* Processing mode */
 	int			mode;
 	u8			alpha_component;
+	u8			rotation;
 
 	enum v4l2_colorspace	colorspace;
 	enum v4l2_xfer_func	xfer_func;
@@ -767,9 +775,10 @@ static int pxp_start(struct pxp_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
 		 V4L2_BUF_FLAG_BFRAME |
 		 V4L2_BUF_FLAG_TSTAMP_SRC_MASK);
 
-	/* Rotation disabled, 8x8 block size */
+	/* 8x8 block size */
 	ctrl = BF_PXP_CTRL_VFLIP0(!!(ctx->mode & MEM2MEM_VFLIP)) |
-	       BF_PXP_CTRL_HFLIP0(!!(ctx->mode & MEM2MEM_HFLIP));
+	       BF_PXP_CTRL_HFLIP0(!!(ctx->mode & MEM2MEM_HFLIP)) |
+	       BF_PXP_CTRL_ROTATE0(ctx->rotation);
 	/* Always write alpha value as V4L2_CID_ALPHA_COMPONENT */
 	out_ctrl = BF_PXP_OUT_CTRL_ALPHA(ctx->alpha_component) |
 		   BF_PXP_OUT_CTRL_ALPHA_OUTPUT(1) |
@@ -787,6 +796,10 @@ static int pxp_start(struct pxp_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
 	}
 
 	out_pitch = BF_PXP_OUT_PITCH_PITCH(dst_stride);
+
+	if (ctx->rotation == PXP_ROTATE_90 || ctx->rotation == PXP_ROTATE_270)
+		swap(dst_width, dst_height);
+
 	out_lrc = BF_PXP_OUT_LRC_X(dst_width - 1) |
 		  BF_PXP_OUT_LRC_Y(dst_height - 1);
 	/* PS covers whole output */
@@ -1297,6 +1310,22 @@ static int pxp_s_fmt_vid_out(struct file *file, void *priv,
 	return 0;
 }
 
+static u8 pxp_degrees_to_rot_mode(u32 degrees)
+{
+	switch (degrees) {
+	case 0:
+		return PXP_ROTATE_0;
+	case 90:
+		return PXP_ROTATE_90;
+	case 180:
+		return PXP_ROTATE_180;
+	case 270:
+		return PXP_ROTATE_270;
+	default:
+		return PXP_ROTATE_0;
+	}
+}
+
 static int pxp_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct pxp_ctx *ctx =
@@ -1317,6 +1346,10 @@ static int pxp_s_ctrl(struct v4l2_ctrl *ctrl)
 			ctx->mode &= ~MEM2MEM_VFLIP;
 		break;
 
+	case V4L2_CID_ROTATE:
+		ctx->rotation = pxp_degrees_to_rot_mode(ctrl->val);
+		break;
+
 	case V4L2_CID_ALPHA_COMPONENT:
 		ctx->alpha_component = ctrl->val;
 		break;
@@ -1524,6 +1557,7 @@ static int pxp_open(struct file *file)
 	v4l2_ctrl_handler_init(hdl, 4);
 	v4l2_ctrl_new_std(hdl, &pxp_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
 	v4l2_ctrl_new_std(hdl, &pxp_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
+	v4l2_ctrl_new_std(hdl, &pxp_ctrl_ops, V4L2_CID_ROTATE, 0, 270, 90, 0);
 	v4l2_ctrl_new_std(hdl, &pxp_ctrl_ops, V4L2_CID_ALPHA_COMPONENT,
 			  0, 255, 1, 255);
 	if (hdl->error) {
-- 
2.25.1

