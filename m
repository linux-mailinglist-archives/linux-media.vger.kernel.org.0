Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E25244A763
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730070AbfFRQp5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:45:57 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:38485 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730003AbfFRQpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:45:45 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hdHEt-0003WX-VT; Tue, 18 Jun 2019 18:45:43 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@pengutronix.de
Subject: [PATCH 17/28] media: coda: mark the last output buffer on decoder stop command
Date:   Tue, 18 Jun 2019 18:45:24 +0200
Message-Id: <20190618164535.20162-18-p.zabel@pengutronix.de>
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

Mark the last output buffer to be decoded and only copy pending queued
output buffers into the bitstream ring buffer in the BIT processor
decoder case.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-bit.c    | 3 +++
 drivers/media/platform/coda/coda-common.c | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
index bfe6019e68a8..cbcec571a014 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -312,6 +312,9 @@ static bool coda_bitstream_try_queue(struct coda_ctx *ctx,
 	if (ctx == v4l2_m2m_get_curr_priv(ctx->dev->m2m_dev))
 		coda_kfifo_sync_to_device_write(ctx);
 
+	/* Set the stream-end flag after the last buffer is queued */
+	if (src_buf->flags & V4L2_BUF_FLAG_LAST)
+		coda_bit_stream_end_flag(ctx);
 	ctx->hold = false;
 
 	return true;
diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 29d050fbb899..9b32b5862aa8 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -1071,6 +1071,7 @@ static int coda_decoder_cmd(struct file *file, void *fh,
 {
 	struct coda_ctx *ctx = fh_to_ctx(fh);
 	struct coda_dev *dev = ctx->dev;
+	struct vb2_v4l2_buffer *buf;
 	struct vb2_queue *dst_vq;
 	int ret;
 
@@ -1092,6 +1093,11 @@ static int coda_decoder_cmd(struct file *file, void *fh,
 		mutex_unlock(&ctx->bitstream_mutex);
 		break;
 	case V4L2_DEC_CMD_STOP:
+		buf = v4l2_m2m_last_src_buf(ctx->fh.m2m_ctx);
+		if (buf)
+			/* Mark last buffer */
+			buf->flags |= V4L2_BUF_FLAG_LAST;
+
 		/* Set the stream-end flag on this context */
 		coda_bit_stream_end_flag(ctx);
 		ctx->hold = false;
-- 
2.20.1

