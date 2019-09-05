Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FFF5A9FA1
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 12:26:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732448AbfIEK0L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 06:26:11 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42699 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731716AbfIEK0L (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 06:26:11 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i5oxt-0003GL-Kr; Thu, 05 Sep 2019 12:26:09 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        kernel@pengutronix.de
Subject: [PATCH] media: hantro: streamline open, reuse error path
Date:   Thu,  5 Sep 2019 12:25:54 +0200
Message-Id: <20190905102554.26411-1-p.zabel@pengutronix.de>
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

This adds a label to the error path to avoid calling
v4l2_m2m_ctx_init() and kfree(ctx) in two places each.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/staging/media/hantro/hantro_drv.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index d8b6816b643b..4bf2a5d938e9 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -413,20 +413,18 @@ static int hantro_open(struct file *filp)
 	if (func->id == MEDIA_ENT_F_PROC_VIDEO_ENCODER) {
 		allowed_codecs = vpu->variant->codec & HANTRO_ENCODERS;
 		ctx->buf_finish = hantro_enc_buf_finish;
-		ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(vpu->m2m_dev, ctx,
-						    queue_init);
 	} else if (func->id == MEDIA_ENT_F_PROC_VIDEO_DECODER) {
 		allowed_codecs = vpu->variant->codec & HANTRO_DECODERS;
 		ctx->buf_finish = hantro_dec_buf_finish;
-		ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(vpu->m2m_dev, ctx,
-						    queue_init);
 	} else {
-		ctx->fh.m2m_ctx = ERR_PTR(-ENODEV);
+		ret = -ENODEV;
+		goto err_ctx_free;
 	}
+
+	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(vpu->m2m_dev, ctx, queue_init);
 	if (IS_ERR(ctx->fh.m2m_ctx)) {
 		ret = PTR_ERR(ctx->fh.m2m_ctx);
-		kfree(ctx);
-		return ret;
+		goto err_ctx_free;
 	}
 
 	v4l2_fh_init(&ctx->fh, vdev);
@@ -447,6 +445,7 @@ static int hantro_open(struct file *filp)
 err_fh_free:
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
+err_ctx_free:
 	kfree(ctx);
 	return ret;
 }
-- 
2.20.1

