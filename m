Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB7A94A753
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730047AbfFRQpq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:45:46 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:36105 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729951AbfFRQpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:45:45 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hdHEt-0003WX-Fs; Tue, 18 Jun 2019 18:45:43 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@pengutronix.de
Subject: [PATCH 07/28] media: coda: split decoder sequence initialization out of start decoding
Date:   Tue, 18 Jun 2019 18:45:14 +0200
Message-Id: <20190618164535.20162-8-p.zabel@pengutronix.de>
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

The sequence initialization already has to happen during the
initialization phase, after headers have been queued on the OUTPUT
queue. This means that sequence initialization has to be queued as
a work item from QBUF on the OUTPUT queue. The internal framebuffer
setup should be done later during VIDIOC_REQBUFS() on the CAPTURE
queue.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-bit.c | 30 ++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
index 45ffe2e87e0a..cecfd51e3838 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -1661,7 +1661,7 @@ static bool coda_reorder_enable(struct coda_ctx *ctx)
 	return profile > V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE;
 }
 
-static int __coda_start_decoding(struct coda_ctx *ctx)
+static int __coda_decoder_seq_init(struct coda_ctx *ctx)
 {
 	struct coda_q_data *q_data_src, *q_data_dst;
 	u32 bitstream_buf, bitstream_size;
@@ -1684,8 +1684,6 @@ static int __coda_start_decoding(struct coda_ctx *ctx)
 	src_fourcc = q_data_src->fourcc;
 	dst_fourcc = q_data_dst->fourcc;
 
-	coda_write(dev, ctx->parabuf.paddr, CODA_REG_BIT_PARA_BUF_ADDR);
-
 	/* Update coda bitstream read and write pointers from kfifo */
 	coda_kfifo_sync_to_device_full(ctx);
 
@@ -1823,6 +1821,29 @@ static int __coda_start_decoding(struct coda_ctx *ctx)
 			coda_update_profile_level_ctrls(ctx, profile, level);
 	}
 
+	return 0;
+}
+
+static int __coda_start_decoding(struct coda_ctx *ctx)
+{
+	struct coda_q_data *q_data_src, *q_data_dst;
+	struct coda_dev *dev = ctx->dev;
+	u32 src_fourcc, dst_fourcc;
+	int ret;
+
+	if (!ctx->initialized) {
+		ret = __coda_decoder_seq_init(ctx);
+		if (ret < 0)
+			return ret;
+	}
+
+	q_data_src = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
+	q_data_dst = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	src_fourcc = q_data_src->fourcc;
+	dst_fourcc = q_data_dst->fourcc;
+
+	coda_write(dev, ctx->parabuf.paddr, CODA_REG_BIT_PARA_BUF_ADDR);
+
 	ret = coda_alloc_framebuffers(ctx, q_data_dst, src_fourcc);
 	if (ret < 0) {
 		v4l2_err(&dev->v4l2_dev, "failed to allocate framebuffers\n");
@@ -1831,7 +1852,8 @@ static int __coda_start_decoding(struct coda_ctx *ctx)
 
 	/* Tell the decoder how many frame buffers we allocated. */
 	coda_write(dev, ctx->num_internal_frames, CODA_CMD_SET_FRAME_BUF_NUM);
-	coda_write(dev, width, CODA_CMD_SET_FRAME_BUF_STRIDE);
+	coda_write(dev, round_up(q_data_dst->rect.width, 16),
+		   CODA_CMD_SET_FRAME_BUF_STRIDE);
 
 	if (dev->devtype->product != CODA_DX6) {
 		/* Set secondary AXI IRAM */
-- 
2.20.1

