Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66A65426B7D
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 15:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241603AbhJHNMz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 09:12:55 -0400
Received: from phobos.denx.de ([85.214.62.61]:39628 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230243AbhJHNMy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Oct 2021 09:12:54 -0400
Received: from localhost.localdomain (unknown [IPv6:2804:14c:485:504a:c805:3148:c0be:5fdf])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: festevam@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id A3CBF83572;
        Fri,  8 Oct 2021 15:10:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1633698658;
        bh=Ose9C+If+jeKapsyJAtnoR9PIwQsKytKGJI3b8IscwE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hfTNS+14/8i/c+f89aiD3XXDD77jKgkRTmrHBS5hhUmw2/yctrQkhWrqMHSFLChGF
         FbUaRtaDNYfUxATlrXF4iaGHthudkpxOGpBrFmDShzIMR15JoiqYnrHnSmRZGboWwh
         4+uFUhwug46Qzg5xaoXk6oyxOulRGiL+slQyZGMwitOO8pKEAhFdl0czNesQ/boLfG
         XaK8ybbKmxJ3KvJ47Yk8PQvLeUYsvFTcrQCLd/1ztV2mp4FFPesaperYVzfBQspMzF
         X/YnpU5P8TfWp4QFPFozQg32QjbSdrZgsdMBsTLEglxkBJ8GV9bXmKIB2w7r8bl1XP
         ZAK2JbSB07hyQ==
From:   Fabio Estevam <festevam@denx.de>
To:     p.zabel@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: [PATCH v4 2/2] media: imx-pxp: Add rotation support
Date:   Fri,  8 Oct 2021 10:10:15 -0300
Message-Id: <20211008131015.3303915-2-festevam@denx.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211008131015.3303915-1-festevam@denx.de>
References: <20211008131015.3303915-1-festevam@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PXP allows clockwise rotation of 0°, 90°, 180° and 270°.

Add support for it.

Tested on a imx6ull-evk.

For example, to rotate 90° the following Gstreamer pipeline can
be used:

gst-launch-1.0 videotestsrc ! video/x-raw,width=640,height=480 ! \
v4l2convert extra-controls=cid,rotate=90  ! \
video/x-raw,width=120,height=160 ! fbdevsink

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v3:
- Use existing definitions for the rotation modes (Philipp)
- Combine the 0 and default cases (Philipp)

 drivers/media/platform/imx-pxp.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/imx-pxp.c b/drivers/media/platform/imx-pxp.c
index b7174778db53..689ae5e6ac62 100644
--- a/drivers/media/platform/imx-pxp.c
+++ b/drivers/media/platform/imx-pxp.c
@@ -211,6 +211,7 @@ struct pxp_ctx {
 	/* Processing mode */
 	int			mode;
 	u8			alpha_component;
+	u8			rotation;
 
 	enum v4l2_colorspace	colorspace;
 	enum v4l2_xfer_func	xfer_func;
@@ -767,14 +768,20 @@ static int pxp_start(struct pxp_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
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
 		   pxp_v4l2_pix_fmt_to_out_format(dst_fourcc);
 	out_buf = p_out;
+
+	if (ctx->rotation == BV_PXP_CTRL_ROTATE0__ROT_90 ||
+	    ctx->rotation == BV_PXP_CTRL_ROTATE0__ROT_270)
+		swap(dst_width, dst_height);
+
 	switch (dst_fourcc) {
 	case V4L2_PIX_FMT_NV12:
 	case V4L2_PIX_FMT_NV21:
@@ -1297,6 +1304,21 @@ static int pxp_s_fmt_vid_out(struct file *file, void *priv,
 	return 0;
 }
 
+static u8 pxp_degrees_to_rot_mode(u32 degrees)
+{
+	switch (degrees) {
+	case 90:
+		return BV_PXP_CTRL_ROTATE0__ROT_90;
+	case 180:
+		return BV_PXP_CTRL_ROTATE0__ROT_180;
+	case 270:
+		return BV_PXP_CTRL_ROTATE0__ROT_270;
+	case 0:
+	default:
+		return BV_PXP_CTRL_ROTATE0__ROT_0;
+	}
+}
+
 static int pxp_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct pxp_ctx *ctx =
@@ -1317,6 +1339,10 @@ static int pxp_s_ctrl(struct v4l2_ctrl *ctrl)
 			ctx->mode &= ~MEM2MEM_VFLIP;
 		break;
 
+	case V4L2_CID_ROTATE:
+		ctx->rotation = pxp_degrees_to_rot_mode(ctrl->val);
+		break;
+
 	case V4L2_CID_ALPHA_COMPONENT:
 		ctx->alpha_component = ctrl->val;
 		break;
@@ -1524,6 +1550,7 @@ static int pxp_open(struct file *file)
 	v4l2_ctrl_handler_init(hdl, 4);
 	v4l2_ctrl_new_std(hdl, &pxp_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
 	v4l2_ctrl_new_std(hdl, &pxp_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
+	v4l2_ctrl_new_std(hdl, &pxp_ctrl_ops, V4L2_CID_ROTATE, 0, 270, 90, 0);
 	v4l2_ctrl_new_std(hdl, &pxp_ctrl_ops, V4L2_CID_ALPHA_COMPONENT,
 			  0, 255, 1, 255);
 	if (hdl->error) {
-- 
2.25.1

