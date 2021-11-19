Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6C3456DB2
	for <lists+linux-media@lfdr.de>; Fri, 19 Nov 2021 11:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234792AbhKSKol (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Nov 2021 05:44:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233406AbhKSKol (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Nov 2021 05:44:41 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CED5C061574
        for <linux-media@vger.kernel.org>; Fri, 19 Nov 2021 02:41:39 -0800 (PST)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mo1Kr-0003ZB-6O; Fri, 19 Nov 2021 11:41:37 +0100
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Martin Weber <martin.weber@br-automation.com>,
        kernel@pengutronix.de
Subject: [PATCH] media: coda: fix CODA960 JPEG encoder buffer overflow
Date:   Fri, 19 Nov 2021 11:41:20 +0100
Message-Id: <20211119104120.827482-1-p.zabel@pengutronix.de>
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

Stop the CODA960 JPEG encoder from overflowing capture buffers.
The bitstream buffer overflow interrupt doesn't seem to be connected,
so this has to be handled via timeout instead.

Reported-by: Martin Weber <martin.weber@br-automation.com>
Fixes: 96f6f62c4656 ("media: coda: jpeg: add CODA960 JPEG encoder support")
Tested-by: Martin Weber <martin.weber@br-automation.com>
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-common.c |  8 +++++---
 drivers/media/platform/coda/coda-jpeg.c   | 21 ++++++++++++++++++++-
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 0e312b0842d7..9a2640a9c75c 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -1537,11 +1537,13 @@ static void coda_pic_run_work(struct work_struct *work)
 
 	if (!wait_for_completion_timeout(&ctx->completion,
 					 msecs_to_jiffies(1000))) {
-		dev_err(dev->dev, "CODA PIC_RUN timeout\n");
+		if (ctx->use_bit) {
+			dev_err(dev->dev, "CODA PIC_RUN timeout\n");
 
-		ctx->hold = true;
+			ctx->hold = true;
 
-		coda_hw_reset(ctx);
+			coda_hw_reset(ctx);
+		}
 
 		if (ctx->ops->run_timeout)
 			ctx->ops->run_timeout(ctx);
diff --git a/drivers/media/platform/coda/coda-jpeg.c b/drivers/media/platform/coda/coda-jpeg.c
index b11cfbe166dd..a72f4655e5ad 100644
--- a/drivers/media/platform/coda/coda-jpeg.c
+++ b/drivers/media/platform/coda/coda-jpeg.c
@@ -1127,7 +1127,8 @@ static int coda9_jpeg_prepare_encode(struct coda_ctx *ctx)
 	coda_write(dev, 0, CODA9_REG_JPEG_GBU_BT_PTR);
 	coda_write(dev, 0, CODA9_REG_JPEG_GBU_WD_PTR);
 	coda_write(dev, 0, CODA9_REG_JPEG_GBU_BBSR);
-	coda_write(dev, 0, CODA9_REG_JPEG_BBC_STRM_CTRL);
+	coda_write(dev, BIT(31) | ((end_addr - start_addr - header_len) / 256),
+		   CODA9_REG_JPEG_BBC_STRM_CTRL);
 	coda_write(dev, 0, CODA9_REG_JPEG_GBU_CTRL);
 	coda_write(dev, 0, CODA9_REG_JPEG_GBU_FF_RPTR);
 	coda_write(dev, 127, CODA9_REG_JPEG_GBU_BBER);
@@ -1257,6 +1258,23 @@ static void coda9_jpeg_finish_encode(struct coda_ctx *ctx)
 	coda_hw_reset(ctx);
 }
 
+static void coda9_jpeg_encode_timeout(struct coda_ctx *ctx)
+{
+	struct coda_dev *dev = ctx->dev;
+	u32 end_addr, wr_ptr;
+
+	/* Handle missing BBC overflow interrupt via timeout */
+	end_addr = coda_read(dev, CODA9_REG_JPEG_BBC_END_ADDR);
+	wr_ptr = coda_read(dev, CODA9_REG_JPEG_BBC_WR_PTR);
+	if (wr_ptr >= end_addr - 256) {
+		v4l2_err(&dev->v4l2_dev, "JPEG too large for capture buffer\n");
+		coda9_jpeg_finish_encode(ctx);
+		return;
+	}
+
+	coda_hw_reset(ctx);
+}
+
 static void coda9_jpeg_release(struct coda_ctx *ctx)
 {
 	int i;
@@ -1276,6 +1294,7 @@ const struct coda_context_ops coda9_jpeg_encode_ops = {
 	.start_streaming = coda9_jpeg_start_encoding,
 	.prepare_run = coda9_jpeg_prepare_encode,
 	.finish_run = coda9_jpeg_finish_encode,
+	.run_timeout = coda9_jpeg_encode_timeout,
 	.release = coda9_jpeg_release,
 };
 
-- 
2.30.2

