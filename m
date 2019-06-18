Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 995854A760
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730073AbfFRQp6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:45:58 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46293 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729965AbfFRQpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:45:45 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hdHEt-0003WX-L0; Tue, 18 Jun 2019 18:45:43 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@pengutronix.de
Subject: [PATCH 11/28] media: coda: make coda_bitstream_queue more versatile
Date:   Tue, 18 Jun 2019 18:45:18 +0200
Message-Id: <20190618164535.20162-12-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618164535.20162-1-p.zabel@pengutronix.de>
References: <20190618164535.20162-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Pass vaddr and size to coda_bitstream_queue instead of a struct
vb2_v4l2_buffer to make it reusable for queueing data that is
not exactly a whole v4l2 buffer into the bitstream ringbuffer.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-bit.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
index 494bc130c7af..4f96f808b4dd 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -199,33 +199,25 @@ static int coda_bitstream_pad(struct coda_ctx *ctx, u32 size)
 	return (n < size) ? -ENOSPC : 0;
 }
 
-static int coda_bitstream_queue(struct coda_ctx *ctx,
-				struct vb2_v4l2_buffer *src_buf)
+static int coda_bitstream_queue(struct coda_ctx *ctx, const u8 *buf, u32 size)
 {
-	u32 src_size = vb2_get_plane_payload(&src_buf->vb2_buf, 0);
-	u32 n;
-
-	n = kfifo_in(&ctx->bitstream_fifo,
-			vb2_plane_vaddr(&src_buf->vb2_buf, 0), src_size);
-	if (n < src_size)
-		return -ENOSPC;
+	u32 n = kfifo_in(&ctx->bitstream_fifo, buf, size);
 
-	src_buf->sequence = ctx->qsequence++;
-
-	return 0;
+	return (n < size) ? -ENOSPC : 0;
 }
 
 static bool coda_bitstream_try_queue(struct coda_ctx *ctx,
 				     struct vb2_v4l2_buffer *src_buf)
 {
 	unsigned long payload = vb2_get_plane_payload(&src_buf->vb2_buf, 0);
+	u8 *vaddr = vb2_plane_vaddr(&src_buf->vb2_buf, 0);
 	int ret;
 
 	if (coda_get_bitstream_payload(ctx) + payload + 512 >=
 	    ctx->bitstream.size)
 		return false;
 
-	if (vb2_plane_vaddr(&src_buf->vb2_buf, 0) == NULL) {
+	if (!vaddr) {
 		v4l2_err(&ctx->dev->v4l2_dev, "trying to queue empty buffer\n");
 		return true;
 	}
@@ -235,11 +227,14 @@ static bool coda_bitstream_try_queue(struct coda_ctx *ctx,
 	    ctx->codec->src_fourcc == V4L2_PIX_FMT_H264)
 		coda_bitstream_pad(ctx, 512 - payload);
 
-	ret = coda_bitstream_queue(ctx, src_buf);
+	ret = coda_bitstream_queue(ctx, vaddr, payload);
 	if (ret < 0) {
 		v4l2_err(&ctx->dev->v4l2_dev, "bitstream buffer overflow\n");
 		return false;
 	}
+
+	src_buf->sequence = ctx->qsequence++;
+
 	/* Sync read pointer to device */
 	if (ctx == v4l2_m2m_get_curr_priv(ctx->dev->m2m_dev))
 		coda_kfifo_sync_to_device_write(ctx);
-- 
2.20.1

