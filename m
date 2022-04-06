Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 099044F5ECF
	for <lists+linux-media@lfdr.de>; Wed,  6 Apr 2022 15:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbiDFMvJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Apr 2022 08:51:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231635AbiDFMuo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Apr 2022 08:50:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F24CEF23
        for <linux-media@vger.kernel.org>; Wed,  6 Apr 2022 01:54:08 -0700 (PDT)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nc1QV-0000IQ-9l; Wed, 06 Apr 2022 10:54:07 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
Subject: [PATCH 2/3] media: coda: jpeg: improve header parse error message
Date:   Wed,  6 Apr 2022 10:53:52 +0200
Message-Id: <20220406085353.2369313-2-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220406085353.2369313-1-p.zabel@pengutronix.de>
References: <20220406085353.2369313-1-p.zabel@pengutronix.de>
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

If JPEG header parsing fails, output a single message instead of two
messages that say the same thing.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/chips-media/coda-common.c | 6 +-----
 drivers/media/platform/chips-media/coda-jpeg.c   | 6 ++----
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda-common.c b/drivers/media/platform/chips-media/coda-common.c
index a57822b05070..9000377e592f 100644
--- a/drivers/media/platform/chips-media/coda-common.c
+++ b/drivers/media/platform/chips-media/coda-common.c
@@ -2012,12 +2012,8 @@ static int coda_start_streaming(struct vb2_queue *q, unsigned int count)
 		if (q_data_src->fourcc == V4L2_PIX_FMT_JPEG) {
 			buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 			ret = coda_jpeg_decode_header(ctx, &buf->vb2_buf);
-			if (ret < 0) {
-				v4l2_err(v4l2_dev,
-					 "failed to decode JPEG header: %d\n",
-					 ret);
+			if (ret < 0)
 				goto err;
-			}
 
 			q_data_dst = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
 			q_data_dst->width = round_up(q_data_src->width, 16);
diff --git a/drivers/media/platform/chips-media/coda-jpeg.c b/drivers/media/platform/chips-media/coda-jpeg.c
index 9e3e05434b96..155373ad73a4 100644
--- a/drivers/media/platform/chips-media/coda-jpeg.c
+++ b/drivers/media/platform/chips-media/coda-jpeg.c
@@ -283,7 +283,8 @@ int coda_jpeg_decode_header(struct coda_ctx *ctx, struct vb2_buffer *vb)
 
 	ret = v4l2_jpeg_parse_header(buf, len, &header);
 	if (ret < 0) {
-		v4l2_err(&dev->v4l2_dev, "failed to parse header\n");
+		v4l2_err(&dev->v4l2_dev, "failed to parse JPEG header: %pe\n",
+			 ERR_PTR(ret));
 		return ret;
 	}
 
@@ -1347,9 +1348,6 @@ static int coda9_jpeg_prepare_decode(struct coda_ctx *ctx)
 
 	ret = coda_jpeg_decode_header(ctx, &src_buf->vb2_buf);
 	if (ret < 0) {
-		v4l2_err(&dev->v4l2_dev, "failed to decode JPEG header: %d\n",
-			 ret);
-
 		src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
 		dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
-- 
2.30.2

