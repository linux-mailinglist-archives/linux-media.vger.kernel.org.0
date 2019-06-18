Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A136C4A769
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730085AbfFRQqD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:46:03 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42943 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729455AbfFRQpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:45:45 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hdHEt-0003WX-BD; Tue, 18 Jun 2019 18:45:43 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@pengutronix.de
Subject: [PATCH 01/28] media: coda: implement CMD_START to restart decoding
Date:   Tue, 18 Jun 2019 18:45:08 +0200
Message-Id: <20190618164535.20162-2-p.zabel@pengutronix.de>
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

From: Michael Tretter <m.tretter@pengutronix.de>

The CMD_START shall be used to start the processing after a drain that
was initiated with CMD_STOP.

Up until now, a drain on coda could only be finished with a
STREAMOFF-STREAMON, which resulted in a reset of the device.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-common.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 751b0be1c2ea..a5e0d5c1528e 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -1059,16 +1059,29 @@ static int coda_decoder_cmd(struct file *file, void *fh,
 			    struct v4l2_decoder_cmd *dc)
 {
 	struct coda_ctx *ctx = fh_to_ctx(fh);
+	struct vb2_queue *dst_vq;
 	int ret;
 
 	ret = coda_try_decoder_cmd(file, fh, dc);
 	if (ret < 0)
 		return ret;
 
-	/* Set the stream-end flag on this context */
-	coda_bit_stream_end_flag(ctx);
-	ctx->hold = false;
-	v4l2_m2m_try_schedule(ctx->fh.m2m_ctx);
+	switch (dc->cmd) {
+	case V4L2_DEC_CMD_START:
+		dst_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
+					 V4L2_BUF_TYPE_VIDEO_CAPTURE);
+		vb2_clear_last_buffer_dequeued(dst_vq);
+		ctx->bit_stream_param &= ~CODA_BIT_STREAM_END_FLAG;
+		break;
+	case V4L2_DEC_CMD_STOP:
+		/* Set the stream-end flag on this context */
+		coda_bit_stream_end_flag(ctx);
+		ctx->hold = false;
+		v4l2_m2m_try_schedule(ctx->fh.m2m_ctx);
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	return 0;
 }
-- 
2.20.1

