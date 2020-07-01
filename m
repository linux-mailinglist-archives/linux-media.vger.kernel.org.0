Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 708E321158A
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 00:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727813AbgGAWBZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 18:01:25 -0400
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:28144 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726438AbgGAWBZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 18:01:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=from:subject:in-reply-to:references:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=hPL/kgQTz6wlFRy8GpHOwzP9TJx6MI3KcPavoqbKOOc=;
        b=WSi8BJTUy3xDpcNlZN5tgfE1peEZwGWXPR8iKHe6BqAwMIL3afNAX6UTQthDkJGX9Lk7
        WKl/9aE5gP4U4tiqW2w3Qh7W8S2yrj2ayYFlPTWGRA5muHaRKVU9zc9ahIY6WQCGfgNaT/
        I740X3GHA6TgaYdhueZaThZOdgN1oFw+8=
Received: by filterdrecv-p3iad2-5b55dcd864-xvj6x with SMTP id filterdrecv-p3iad2-5b55dcd864-xvj6x-20-5EFD0685-3B
        2020-07-01 21:56:21.873945324 +0000 UTC m=+449225.981582369
Received: from bionic.localdomain (unknown)
        by ismtpd0001p1lon1.sendgrid.net (SG) with ESMTP
        id tbZBENmMR5K2F9HM17zllg
        Wed, 01 Jul 2020 21:56:21.586 +0000 (UTC)
From:   Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 3/9] media: rkvdec: h264: Fix pic width and height in mbs
Date:   Wed, 01 Jul 2020 21:56:21 +0000 (UTC)
Message-Id: <20200701215616.30874-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200701215616.30874-1-jonas@kwiboo.se>
References: <20200701215616.30874-1-jonas@kwiboo.se>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h46KlexVvyedR2tUq?=
 =?us-ascii?Q?gjVmM=2FILFuMT+pt9FyPU3oqNPS8WalWdE9qEGVv?=
 =?us-ascii?Q?QSMehNe2haUM8g4S6hR000xVYRiSvFbpfjB0=2F0W?=
 =?us-ascii?Q?ndmyd876dVoeywH9JdFz5=2Fcaz8Wogw7YjoOS2+C?=
 =?us-ascii?Q?pRmKbPlklJHc1DZKAqIjWVaPW94EkwFOBIT9lbS?=
 =?us-ascii?Q?twKZMZk3nFMbP1TlGK0rg=3D=3D?=
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

The width and height in mbs is currently configured based on OUTPUT buffer
resolution, this works for frame pictures but can cause issues for field
pictures or when frmsize step_width is changed to support 10-bit decoding.

When frame_mbs_only_flag is 0 the height in mbs should be height of
the field instead of height of frame.

Validate pic_width_in_mbs_minus1 and pic_height_in_map_units_minus1
against CAPTURE buffer resolution and use these values to configure HW.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/staging/media/rkvdec/rkvdec-h264.c | 44 +++++++++++++++++++---
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index f0cfed84d60d..c9aebeb8f9b3 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -672,8 +672,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 		  LOG2_MAX_PIC_ORDER_CNT_LSB_MINUS4);
 	WRITE_PPS(!!(sps->flags & V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO),
 		  DELTA_PIC_ORDER_ALWAYS_ZERO_FLAG);
-	WRITE_PPS(DIV_ROUND_UP(ctx->coded_fmt.fmt.pix_mp.width, 16), PIC_WIDTH_IN_MBS);
-	WRITE_PPS(DIV_ROUND_UP(ctx->coded_fmt.fmt.pix_mp.height, 16), PIC_HEIGHT_IN_MBS);
+	WRITE_PPS(sps->pic_width_in_mbs_minus1 + 1, PIC_WIDTH_IN_MBS);
+	WRITE_PPS(sps->pic_height_in_map_units_minus1 + 1, PIC_HEIGHT_IN_MBS);
 	WRITE_PPS(!!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY),
 		  FRAME_MBS_ONLY_FLAG);
 	WRITE_PPS(!!(sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD),
@@ -1058,10 +1058,33 @@ static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
 	kfree(h264_ctx);
 }
 
-static void rkvdec_h264_run_preamble(struct rkvdec_ctx *ctx,
-				     struct rkvdec_h264_run *run)
+static int validate_sps(struct rkvdec_ctx *ctx,
+			const struct v4l2_ctrl_h264_sps *sps)
+{
+	unsigned int width, height;
+
+	if (WARN_ON(!sps))
+		return -EINVAL;
+
+	width = (sps->pic_width_in_mbs_minus1 + 1) * 16;
+	height = (sps->pic_height_in_map_units_minus1 + 1) * 16;
+
+	if (width > ctx->decoded_fmt.fmt.pix_mp.width ||
+	    height > ctx->decoded_fmt.fmt.pix_mp.height) {
+		dev_err(ctx->dev->dev,
+			"unexpected bitstream resolution %ux%u\n",
+			width, height);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rkvdec_h264_run_preamble(struct rkvdec_ctx *ctx,
+				    struct rkvdec_h264_run *run)
 {
 	struct v4l2_ctrl *ctrl;
+	int ret;
 
 	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
 			      V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS);
@@ -1080,6 +1103,12 @@ static void rkvdec_h264_run_preamble(struct rkvdec_ctx *ctx,
 	run->scaling_matrix = ctrl ? ctrl->p_cur.p : NULL;
 
 	rkvdec_run_preamble(ctx, &run->base);
+
+	ret = validate_sps(ctx, run->sps);
+	if (ret)
+		return ret;
+
+	return 0;
 }
 
 static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
@@ -1088,8 +1117,13 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
 	struct rkvdec_dev *rkvdec = ctx->dev;
 	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
 	struct rkvdec_h264_run run;
+	int ret;
 
-	rkvdec_h264_run_preamble(ctx, &run);
+	ret = rkvdec_h264_run_preamble(ctx, &run);
+	if (ret) {
+		rkvdec_run_postamble(ctx, &run.base);
+		return ret;
+	}
 
 	/* Build the P/B{0,1} ref lists. */
 	v4l2_h264_init_reflist_builder(&reflist_builder, run.decode_params,
-- 
2.17.1

