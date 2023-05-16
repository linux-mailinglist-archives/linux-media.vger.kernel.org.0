Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2FA70495F
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 11:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbjEPJdf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 05:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231792AbjEPJdb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 05:33:31 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EA281BFC
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 02:33:30 -0700 (PDT)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1pyqj5-0005XH-4k; Tue, 16 May 2023 11:12:11 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        benjamin.gaignard@collabora.com
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        kernel@pengutronix.de, m.tretter@pengutronix.de
Subject: [PATCH] media: verisilicon: Fix null pointer dereference in try_fmt
Date:   Tue, 16 May 2023 11:12:09 +0200
Message-Id: <20230516091209.3098262-1-m.tretter@pengutronix.de>
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

Since commit db6f68b51e5c ("media: verisilicon: Do not set context
src/dst formats in reset functions"), vpu_src_fmt is not set in the
reset function, but only set in hantro_set_fmt_out, which calls
hantro_try_fmt before setting the format. Therefore, hantro_try_fmt
might be called with vpu_src_fmt still being null.

Add a test if the format is actually set before checking the format.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
Fixes: db6f68b51e5c ("media: verisilicon: Do not set context src/dst formats in reset functions")
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 835518534e3b..ec37d2646fde 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -313,17 +313,20 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
 		/* Fill remaining fields */
 		v4l2_fill_pixfmt_mp(pix_mp, fmt->fourcc, pix_mp->width,
 				    pix_mp->height);
-		if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE &&
+		if (ctx->vpu_src_fmt &&
+		    ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE &&
 		    !hantro_needs_postproc(ctx, fmt))
 			pix_mp->plane_fmt[0].sizeimage +=
 				hantro_h264_mv_size(pix_mp->width,
 						    pix_mp->height);
-		else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_VP9_FRAME &&
+		else if (ctx->vpu_src_fmt &&
+			 ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_VP9_FRAME &&
 			 !hantro_needs_postproc(ctx, fmt))
 			pix_mp->plane_fmt[0].sizeimage +=
 				hantro_vp9_mv_size(pix_mp->width,
 						   pix_mp->height);
-		else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_HEVC_SLICE &&
+		else if (ctx->vpu_src_fmt &&
+			 ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_HEVC_SLICE &&
 			 !hantro_needs_postproc(ctx, fmt))
 			pix_mp->plane_fmt[0].sizeimage +=
 				hantro_hevc_mv_size(pix_mp->width,
-- 
2.39.2

