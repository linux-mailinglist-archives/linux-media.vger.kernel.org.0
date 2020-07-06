Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 398F0216124
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 23:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727864AbgGFVyr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 17:54:47 -0400
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:6357 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726918AbgGFVyj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 17:54:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=from:subject:in-reply-to:references:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=MLSvldzejjVa6mA9VLILpE7cVCqoIBR9HapVYyZOR0A=;
        b=HhG+fJE6+169yi9zVjcph7xe0etGhuWflJ+VOPLB8FnwVd8+BPow5Rjb07Y0m2p64WQh
        wi36rKVnhhaloYOKpMWy/02kOIbxpcwd6v+sXuq+T7a6QO6pRJOCPGGeA28ByK73wirGmU
        euyTQ7c9Ac+mVw36Lcdl3Nwop6dX8/s0A=
Received: by filterdrecv-p3iad2-5b55dcd864-hp5f5 with SMTP id filterdrecv-p3iad2-5b55dcd864-hp5f5-19-5F039D9D-44
        2020-07-06 21:54:37.854603941 +0000 UTC m=+881115.898031932
Received: from bionic.localdomain (unknown)
        by ismtpd0008p1lon1.sendgrid.net (SG) with ESMTP
        id Rz21i4k0TPihwDSj8S233A
        Mon, 06 Jul 2020 21:54:37.607 +0000 (UTC)
From:   Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 11/12] media: rkvdec: h264: Support High 10 and 4:2:2
 profiles
Date:   Mon, 06 Jul 2020 21:54:37 +0000 (UTC)
Message-Id: <20200706215430.22859-12-jonas@kwiboo.se>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200706215430.22859-1-jonas@kwiboo.se>
References: <20200701215616.30874-1-jonas@kwiboo.se>
 <20200706215430.22859-1-jonas@kwiboo.se>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h+R=2FN4SrW2dJiDYTG?=
 =?us-ascii?Q?Dah4WIX6jGHzzO2ZlGh8MC6B6jPMIEM1idY6ip1?=
 =?us-ascii?Q?c4tSpok6dKXGLm4Xw3VNEcUURkA+L3RUifV0mge?=
 =?us-ascii?Q?nX8GJ4namVxJwbi7SwFSl3xnMbi+claxe5gGGTi?=
 =?us-ascii?Q?3d+V5XsAhoDpwKd76fJjNisKKR9Lo1BcXiyVea8?=
 =?us-ascii?Q?De36ktqLa5bUSr3J8bnBg=3D=3D?=
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

Add support and enable decoding of H264 High 10 and 4:2:2 profiles.

Decoded CAPTURE buffer width is aligned to 64 pixels to accommodate HW
requirement on 10-bit format buffers.

The new valid_fmt operation is implemented and return a valid pixelformat
for the provided SPS control.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
- Only align decoded buffer instead of using frmsize step_width
---
 drivers/staging/media/rkvdec/rkvdec-h264.c | 20 ++++++++++++++++++++
 drivers/staging/media/rkvdec/rkvdec.c      | 19 +++++++++----------
 2 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index 10756b9d6118..0757fc97d1ff 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -1018,6 +1018,25 @@ static int rkvdec_h264_adjust_fmt(struct rkvdec_ctx *ctx,
 	return 0;
 }
 
+static u32 rkvdec_h264_valid_fmt(struct rkvdec_ctx *ctx, struct v4l2_ctrl *ctrl)
+{
+	const struct v4l2_ctrl_h264_sps *sps = ctrl->p_new.p;
+
+	if (sps->bit_depth_luma_minus8 == 0) {
+		if (sps->chroma_format_idc == 2)
+			return V4L2_PIX_FMT_NV16;
+		else
+			return V4L2_PIX_FMT_NV12;
+	} else if (sps->bit_depth_luma_minus8 == 2) {
+		if (sps->chroma_format_idc == 2)
+			return V4L2_PIX_FMT_NV20;
+		else
+			return V4L2_PIX_FMT_NV15;
+	}
+
+	return 0;
+}
+
 static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
 {
 	struct rkvdec_dev *rkvdec = ctx->dev;
@@ -1125,6 +1144,7 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
 
 const struct rkvdec_coded_fmt_ops rkvdec_h264_fmt_ops = {
 	.adjust_fmt = rkvdec_h264_adjust_fmt,
+	.valid_fmt = rkvdec_h264_valid_fmt,
 	.start = rkvdec_h264_start,
 	.stop = rkvdec_h264_stop,
 	.run = rkvdec_h264_run,
diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 11a88cb6407d..4faee9262392 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -31,7 +31,7 @@ static void rkvdec_fill_decoded_pixfmt(struct rkvdec_ctx *ctx,
 				       struct v4l2_pix_format_mplane *pix_mp)
 {
 	v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat,
-			    pix_mp->width, pix_mp->height);
+			    ALIGN(pix_mp->width, 64), pix_mp->height);
 	pix_mp->plane_fmt[0].sizeimage += 128 *
 		DIV_ROUND_UP(pix_mp->width, 16) *
 		DIV_ROUND_UP(pix_mp->height, 16);
@@ -55,19 +55,15 @@ static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
 	if (ctrl->id == V4L2_CID_MPEG_VIDEO_H264_SPS) {
 		const struct v4l2_ctrl_h264_sps *sps = ctrl->p_new.p;
 		unsigned int width, height;
-		/*
-		 * TODO: The hardware supports 10-bit and 4:2:2 profiles,
-		 * but it's currently broken in the driver.
-		 * Reject them for now, until it's fixed.
-		 */
-		if (sps->chroma_format_idc > 1)
-			/* Only 4:0:0 and 4:2:0 are supported */
+
+		if (sps->chroma_format_idc > 2)
+			/* Only 4:0:0, 4:2:0 and 4:2:2 are supported */
 			return -EINVAL;
 		if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
 			/* Luma and chroma bit depth mismatch */
 			return -EINVAL;
-		if (sps->bit_depth_luma_minus8 != 0)
-			/* Only 8-bit is supported */
+		if (sps->bit_depth_luma_minus8 != 0 && sps->bit_depth_luma_minus8 != 2)
+			/* Only 8-bit and 10-bit is supported */
 			return -EINVAL;
 
 		if (ctx->valid_fmt && ctx->valid_fmt != rkvdec_valid_fmt(ctx, ctrl))
@@ -157,6 +153,9 @@ static const struct rkvdec_ctrls rkvdec_h264_ctrls = {
 
 static const u32 rkvdec_h264_decoded_fmts[] = {
 	V4L2_PIX_FMT_NV12,
+	V4L2_PIX_FMT_NV15,
+	V4L2_PIX_FMT_NV16,
+	V4L2_PIX_FMT_NV20,
 };
 
 static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
-- 
2.17.1

