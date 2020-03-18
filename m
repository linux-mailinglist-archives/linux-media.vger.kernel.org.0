Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 018F818A276
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 19:36:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbgCRSgD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 14:36:03 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:36547 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726836AbgCRSgD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 14:36:03 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jEdXt-00011Z-OM; Wed, 18 Mar 2020 19:36:01 +0100
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>, kernel@pengutronix.de,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH v2 6/6] media: coda: lock capture queue wakeup against decoder stop command
Date:   Wed, 18 Mar 2020 19:35:36 +0100
Message-Id: <20200318183536.15779-7-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200318183536.15779-1-p.zabel@pengutronix.de>
References: <20200318183536.15779-1-p.zabel@pengutronix.de>
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

Similar to commit 9ee50a9489f1 ("media: coda: lock capture queue wakeup
against encoder stop command"), make sure that a JPEG decoder stop
command running concurrently with a decoder finish_run always either
flags the last returned buffer or wakes up the capture queue to signal
the end of stream condition afterwards.

This was not necessary for BIT processor contexts because of the need to
release the bitstream buffer with the stream end condition. In contrast,
the JPEG decoder can be finished with decoding the image between the
time the application queues the last output buffer and the time it
issues the decoder stop command.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-common.c | 3 +++
 drivers/media/platform/coda/coda-jpeg.c   | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index f3d85205ec9f..175504141a2c 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -1229,6 +1229,8 @@ static int coda_decoder_cmd(struct file *file, void *fh,
 		stream_end = false;
 		wakeup = false;
 
+		mutex_lock(&ctx->wakeup_mutex);
+
 		buf = v4l2_m2m_last_src_buf(ctx->fh.m2m_ctx);
 		if (buf) {
 			coda_dbg(1, ctx, "marking last pending buffer\n");
@@ -1265,6 +1267,7 @@ static int coda_decoder_cmd(struct file *file, void *fh,
 			coda_wake_up_capture_queue(ctx);
 		}
 
+		mutex_unlock(&ctx->wakeup_mutex);
 		break;
 	default:
 		return -EINVAL;
diff --git a/drivers/media/platform/coda/coda-jpeg.c b/drivers/media/platform/coda/coda-jpeg.c
index 05e755207dfc..28fbb3169724 100644
--- a/drivers/media/platform/coda/coda-jpeg.c
+++ b/drivers/media/platform/coda/coda-jpeg.c
@@ -1428,6 +1428,12 @@ static void coda9_jpeg_finish_decode(struct coda_ctx *ctx)
 
 	coda_write(dev, 0, CODA9_REG_JPEG_BBC_FLUSH_CMD);
 
+	/*
+	 * Lock to make sure that a decoder stop command running in parallel
+	 * will either already have marked src_buf as last, or it will wake up
+	 * the capture queue after the buffers are returned.
+	 */
+	mutex_lock(&ctx->wakeup_mutex);
 	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
 	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 	dst_buf->sequence = ctx->osequence++;
@@ -1447,6 +1453,8 @@ static void coda9_jpeg_finish_decode(struct coda_ctx *ctx)
 	coda_m2m_buf_done(ctx, dst_buf, err_mb ? VB2_BUF_STATE_ERROR :
 						 VB2_BUF_STATE_DONE);
 
+	mutex_unlock(&ctx->wakeup_mutex);
+
 	coda_dbg(1, ctx, "job finished: decoded frame (%u)%s\n",
 		 dst_buf->sequence,
 		 (dst_buf->flags & V4L2_BUF_FLAG_LAST) ? " (last)" : "");
-- 
2.20.1

