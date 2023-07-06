Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A02774961F
	for <lists+linux-media@lfdr.de>; Thu,  6 Jul 2023 09:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233391AbjGFHPW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jul 2023 03:15:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbjGFHPV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jul 2023 03:15:21 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 720BADA
        for <linux-media@vger.kernel.org>; Thu,  6 Jul 2023 00:15:19 -0700 (PDT)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1qHJCq-0003MB-PE; Thu, 06 Jul 2023 09:15:12 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        mchehab@kernel.org, benjamin.gaignard@collabora.com
Cc:     m.szyprowski@samsung.com, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, kernel@collabora.com,
        kernel@pengutronix.de, mtr@pengutronix.de
Subject: [PATCH] media: verisilicon: Fix TRY_FMT on encoder OUTPUT
Date:   Thu,  6 Jul 2023 09:15:10 +0200
Message-Id: <20230706071510.1717684-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
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

Commit f100ce3bbd6a ("media: verisilicon: Fix crash when probing
encoder") removed vpu_fmt from hantro_try_fmt(), since it was
initialized from vpu_dst_fmt, which may not be initialized, when TRY_FMT
is called. It was replaced by fmt, which is found using the pixelformat.

For the encoder, this changed the fmt to contain the raw format instead
of the coded format. The format constraints as of fmt->frmsize are only
valid for the coded format and are 0 for the raw formats. Therefore, the
size of a encoder OUTPUT device is constrained to 0 and the
v4l2-compliance tests for G_FMT, TRY_FMT, and SET_FMT fail.

Bring back vpu_fmt to use the coded format on an encoder OUTPUT device,
but initialize it using the currently set pixelformat on dst_fmt, which
is the coded format on an encoder.

Fixes: f100ce3bbd6a ("media: verisilicon: Fix crash when probing encoder")
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index e871c078dd59..b3ae037a50f6 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -297,6 +297,7 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
 			  enum v4l2_buf_type type)
 {
 	const struct hantro_fmt *fmt;
+	const struct hantro_fmt *vpu_fmt;
 	bool capture = V4L2_TYPE_IS_CAPTURE(type);
 	bool coded;
 
@@ -316,19 +317,23 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
 
 	if (coded) {
 		pix_mp->num_planes = 1;
-	} else if (!ctx->is_encoder) {
+		vpu_fmt = fmt;
+	} else if (ctx->is_encoder) {
+		vpu_fmt = hantro_find_format(ctx, ctx->dst_fmt.pixelformat);
+	} else {
 		/*
 		 * Width/height on the CAPTURE end of a decoder are ignored and
 		 * replaced by the OUTPUT ones.
 		 */
 		pix_mp->width = ctx->src_fmt.width;
 		pix_mp->height = ctx->src_fmt.height;
+		vpu_fmt = fmt;
 	}
 
 	pix_mp->field = V4L2_FIELD_NONE;
 
 	v4l2_apply_frmsize_constraints(&pix_mp->width, &pix_mp->height,
-				       &fmt->frmsize);
+				       &vpu_fmt->frmsize);
 
 	if (!coded) {
 		/* Fill remaining fields */
-- 
2.39.2

