Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DEE14F1A71
	for <lists+linux-media@lfdr.de>; Mon,  4 Apr 2022 23:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378938AbiDDVS3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Apr 2022 17:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379157AbiDDQhv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Apr 2022 12:37:51 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACAF01A803
        for <linux-media@vger.kernel.org>; Mon,  4 Apr 2022 09:35:54 -0700 (PDT)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nbPgG-0004CX-Vg; Mon, 04 Apr 2022 18:35:53 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
Subject: [PATCH 5/7] media: coda: fix default JPEG colorimetry
Date:   Mon,  4 Apr 2022 18:35:31 +0200
Message-Id: <20220404163533.707508-5-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220404163533.707508-1-p.zabel@pengutronix.de>
References: <20220404163533.707508-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Set default colorspace to SRGB for JPEG encoder and decoder devices,
to fix the following v4l2-compliance test failure:

	test VIDIOC_TRY_FMT: OK
		fail: v4l2-test-formats.cpp(818): fmt_raw.g_colorspace() != V4L2_COLORSPACE_SRGB

Also explicitly set transfer function, YCbCr encoding and quantization
range, as required by v4l2-compliance for the JPEG encoded side.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 .../media/platform/chips-media/coda-common.c  | 36 +++++++++++++------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda-common.c b/drivers/media/platform/chips-media/coda-common.c
index 4a7346ed771e..c068c16d1eb4 100644
--- a/drivers/media/platform/chips-media/coda-common.c
+++ b/drivers/media/platform/chips-media/coda-common.c
@@ -732,13 +732,22 @@ static int coda_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static void coda_set_default_colorspace(struct v4l2_pix_format *fmt)
+static void coda_set_default_colorspace(struct coda_ctx *ctx,
+					struct v4l2_pix_format *fmt)
 {
 	enum v4l2_colorspace colorspace;
 
-	if (fmt->pixelformat == V4L2_PIX_FMT_JPEG)
-		colorspace = V4L2_COLORSPACE_JPEG;
-	else if (fmt->width <= 720 && fmt->height <= 576)
+	if (ctx->cvd->src_formats[0] == V4L2_PIX_FMT_JPEG ||
+	    ctx->cvd->dst_formats[0] == V4L2_PIX_FMT_JPEG ||
+	    fmt->pixelformat == V4L2_PIX_FMT_JPEG) {
+		fmt->colorspace = V4L2_COLORSPACE_SRGB;
+		fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
+		fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
+		fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+		return;
+	}
+
+	if (fmt->width <= 720 && fmt->height <= 576)
 		colorspace = V4L2_COLORSPACE_SMPTE170M;
 	else
 		colorspace = V4L2_COLORSPACE_REC709;
@@ -763,7 +772,7 @@ static int coda_try_fmt_vid_out(struct file *file, void *priv,
 		return ret;
 
 	if (f->fmt.pix.colorspace == V4L2_COLORSPACE_DEFAULT)
-		coda_set_default_colorspace(&f->fmt.pix);
+		coda_set_default_colorspace(ctx, &f->fmt.pix);
 
 	q_data_dst = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
 	codec = coda_find_codec(dev, f->fmt.pix.pixelformat, q_data_dst->fourcc);
@@ -1640,13 +1649,18 @@ static void set_default_params(struct coda_ctx *ctx)
 	csize = coda_estimate_sizeimage(ctx, usize, max_w, max_h);
 
 	ctx->params.codec_mode = ctx->codec->mode;
-	if (ctx->cvd->src_formats[0] == V4L2_PIX_FMT_JPEG)
-		ctx->colorspace = V4L2_COLORSPACE_JPEG;
-	else
+	if (ctx->cvd->src_formats[0] == V4L2_PIX_FMT_JPEG ||
+	    ctx->cvd->dst_formats[0] == V4L2_PIX_FMT_JPEG) {
+		ctx->colorspace = V4L2_COLORSPACE_SRGB;
+		ctx->xfer_func = V4L2_XFER_FUNC_SRGB;
+		ctx->ycbcr_enc = V4L2_YCBCR_ENC_601;
+		ctx->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	} else {
 		ctx->colorspace = V4L2_COLORSPACE_REC709;
-	ctx->xfer_func = V4L2_XFER_FUNC_DEFAULT;
-	ctx->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
-	ctx->quantization = V4L2_QUANTIZATION_DEFAULT;
+		ctx->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+		ctx->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+		ctx->quantization = V4L2_QUANTIZATION_DEFAULT;
+	}
 	ctx->params.framerate = 30;
 
 	/* Default formats for output and input queues */
-- 
2.30.2

