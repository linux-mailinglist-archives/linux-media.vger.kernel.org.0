Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80BE318A274
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 19:36:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgCRSgB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 14:36:01 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:59439 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726903AbgCRSgB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 14:36:01 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jEdXs-00011Z-EE; Wed, 18 Mar 2020 19:36:00 +0100
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>, kernel@pengutronix.de,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH v2 5/6] media: coda: mark last capture buffer
Date:   Wed, 18 Mar 2020 19:35:35 +0100
Message-Id: <20200318183536.15779-6-p.zabel@pengutronix.de>
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

If a JPEG decoding application queues the last capture and output
buffers, issues a decoder stop command after the decoding is already
done, and then dequeues the last capture buffer, it is not marked as
last. Detect this condition in the decoder stop command and mark the
last buffer on the capture done list.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
New in v2.
---
 drivers/media/platform/coda/coda-common.c | 35 +++++++++++++++++++++--
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index a06765e69d63..f3d85205ec9f 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -1172,6 +1172,31 @@ static bool coda_mark_last_meta(struct coda_ctx *ctx)
 	return true;
 }
 
+static bool coda_mark_last_dst_buf(struct coda_ctx *ctx)
+{
+	struct vb2_v4l2_buffer *buf;
+	struct vb2_buffer *dst_vb;
+	struct vb2_queue *dst_vq;
+	unsigned long flags;
+
+	coda_dbg(1, ctx, "marking last capture buffer\n");
+
+	dst_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	spin_lock_irqsave(&dst_vq->done_lock, flags);
+	if (list_empty(&dst_vq->done_list)) {
+		spin_unlock_irqrestore(&dst_vq->done_lock, flags);
+		return false;
+	}
+
+	dst_vb = list_last_entry(&dst_vq->done_list, struct vb2_buffer,
+				 done_entry);
+	buf = to_vb2_v4l2_buffer(dst_vb);
+	buf->flags |= V4L2_BUF_FLAG_LAST;
+
+	spin_unlock_irqrestore(&dst_vq->done_lock, flags);
+	return true;
+}
+
 static int coda_decoder_cmd(struct file *file, void *fh,
 			    struct v4l2_decoder_cmd *dc)
 {
@@ -1216,10 +1241,14 @@ static int coda_decoder_cmd(struct file *file, void *fh,
 				stream_end = true;
 			}
 		} else {
-			if (coda_mark_last_meta(ctx))
-				stream_end = true;
+			if (ctx->use_bit)
+				if (coda_mark_last_meta(ctx))
+					stream_end = true;
+				else
+					wakeup = true;
 			else
-				wakeup = true;
+				if (!coda_mark_last_dst_buf(ctx))
+					wakeup = true;
 		}
 
 		if (stream_end) {
-- 
2.20.1

