Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1E6C3CD77E
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 16:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241314AbhGSOQ7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 10:16:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241695AbhGSOQx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 10:16:53 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CC72C061574
        for <linux-media@vger.kernel.org>; Mon, 19 Jul 2021 07:26:16 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1m5Ui3-0006xD-NR; Mon, 19 Jul 2021 16:57:31 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Andrej Picej <andrej.picej@norik.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] media: coda: fix frame_mem_ctrl for YUV420 and YVU420 formats
Date:   Mon, 19 Jul 2021 16:57:08 +0200
Message-Id: <20210719145708.10643-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The frame memory control register value is currently determined
before userspace selects the final capture format and never corrected.
Update ctx->frame_mem_ctrl in __coda_start_decoding() to fix decoding
into YUV420 or YVU420 capture buffers.

Reported-by: Andrej Picej <andrej.picej@norik.com>
Fixes: 497e6b8559a6 ("media: coda: add sequence initialization work")
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-bit.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
index 2f42808c43a4..c484c008ab02 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -2053,17 +2053,25 @@ static int __coda_start_decoding(struct coda_ctx *ctx)
 	u32 src_fourcc, dst_fourcc;
 	int ret;
 
+	q_data_src = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
+	q_data_dst = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	src_fourcc = q_data_src->fourcc;
+	dst_fourcc = q_data_dst->fourcc;
+
 	if (!ctx->initialized) {
 		ret = __coda_decoder_seq_init(ctx);
 		if (ret < 0)
 			return ret;
+	} else {
+		ctx->frame_mem_ctrl &= ~(CODA_FRAME_CHROMA_INTERLEAVE | (0x3 << 9) |
+					 CODA9_FRAME_TILED2LINEAR);
+		if (dst_fourcc == V4L2_PIX_FMT_NV12 || dst_fourcc == V4L2_PIX_FMT_YUYV)
+			ctx->frame_mem_ctrl |= CODA_FRAME_CHROMA_INTERLEAVE;
+		if (ctx->tiled_map_type == GDI_TILED_FRAME_MB_RASTER_MAP)
+			ctx->frame_mem_ctrl |= (0x3 << 9) |
+				((ctx->use_vdoa) ? 0 : CODA9_FRAME_TILED2LINEAR);
 	}
 
-	q_data_src = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
-	q_data_dst = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
-	src_fourcc = q_data_src->fourcc;
-	dst_fourcc = q_data_dst->fourcc;
-
 	coda_write(dev, ctx->parabuf.paddr, CODA_REG_BIT_PARA_BUF_ADDR);
 
 	ret = coda_alloc_framebuffers(ctx, q_data_dst, src_fourcc);
-- 
2.30.2

