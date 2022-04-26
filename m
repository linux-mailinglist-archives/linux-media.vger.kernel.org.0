Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E29750F958
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 11:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345134AbiDZJ5y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 05:57:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347569AbiDZJ5m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 05:57:42 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A3FD37AB8
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 02:15:46 -0700 (PDT)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1njHIO-0003qo-PW; Tue, 26 Apr 2022 11:15:44 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@pengutronix.de,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2] media: coda: fix default JPEG colorimetry
Date:   Tue, 26 Apr 2022 11:15:43 +0200
Message-Id: <20220426091543.2213405-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
v2: Drop the S_FMT(V4L2_COLORSPACE_DEFAULT) modifications,
    they are not required for compliance.
---
 .../media/platform/chips-media/coda-common.c    | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda-common.c b/drivers/media/platform/chips-media/coda-common.c
index d246afcb3f49..7528f2718c4d 100644
--- a/drivers/media/platform/chips-media/coda-common.c
+++ b/drivers/media/platform/chips-media/coda-common.c
@@ -1653,13 +1653,18 @@ static void set_default_params(struct coda_ctx *ctx)
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

