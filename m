Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A0EAE2F12
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 12:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438816AbfJXKcN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 06:32:13 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:47489 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409175AbfJXKcN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 06:32:13 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iNaPc-0008F0-11; Thu, 24 Oct 2019 12:32:12 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de
Subject: [PATCH] media: coda: fix deadlock between decoder picture run and start command
Date:   Thu, 24 Oct 2019 12:32:11 +0200
Message-Id: <20191024103211.22489-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
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

The BIT decoder picture run temporarily locks the bitstream mutex while
the coda device mutex is locked, to refill the bitstream ring buffer.
Consequently, the decoder start command, which locks both mutexes when
flushing the bitstream ring buffer, must lock the coda device mutex
first as well, to avoid an ABBA deadlock.

Fixes: e7fd95849b3c ("media: coda: flush bitstream ring buffer on decoder restart")
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 73222c0615c0..834f11fe9dc2 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -1084,16 +1084,16 @@ static int coda_decoder_cmd(struct file *file, void *fh,
 
 	switch (dc->cmd) {
 	case V4L2_DEC_CMD_START:
-		mutex_lock(&ctx->bitstream_mutex);
 		mutex_lock(&dev->coda_mutex);
+		mutex_lock(&ctx->bitstream_mutex);
 		coda_bitstream_flush(ctx);
-		mutex_unlock(&dev->coda_mutex);
 		dst_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
 					 V4L2_BUF_TYPE_VIDEO_CAPTURE);
 		vb2_clear_last_buffer_dequeued(dst_vq);
 		ctx->bit_stream_param &= ~CODA_BIT_STREAM_END_FLAG;
 		coda_fill_bitstream(ctx, NULL);
 		mutex_unlock(&ctx->bitstream_mutex);
+		mutex_unlock(&dev->coda_mutex);
 		break;
 	case V4L2_DEC_CMD_STOP:
 		stream_end = false;
-- 
2.20.1

