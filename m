Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A27BF215ED6
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730038AbgGFSjN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:39:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730026AbgGFSjN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:39:13 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 840232588;
        Mon,  6 Jul 2020 20:38:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060712;
        bh=yJTPZj8e4DGBe/mBy+K+pJTzr6hJZOqqdGNaFU7LXrk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wKoFzc93DkzO2QFPdt8ya6nmDWa3wTfT0jJHHXSox9/1I2U/+PGKc3gCiW/CTiX0R
         5pQygYenOMSBU2U+AAGzmrvWHXTCUoCfl3YjLor6iIQ1J9oQl8OqJuL/LYBYqXOeLv
         BJHyBg8MuIC/AkuClo7v0U09liWtMDHWV5CXPFnM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 099/108] media: ti-vpe: cal: Share buffer release code between start and stop
Date:   Mon,  6 Jul 2020 21:37:00 +0300
Message-Id: <20200706183709.12238-100-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cal_start_streaming() and cal_stop_streaming() functions duplicate
the same buffer release logic. split it to a separate function to share
the code.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal-video.c | 55 +++++++++++------------
 1 file changed, 26 insertions(+), 29 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index de0ba6128715..7eec0a57b141 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -486,11 +486,34 @@ static void cal_buffer_queue(struct vb2_buffer *vb)
 	spin_unlock_irqrestore(&ctx->slock, flags);
 }
 
+static void cal_release_buffers(struct cal_ctx *ctx,
+				enum vb2_buffer_state state)
+{
+	struct cal_buffer *buf, *tmp;
+
+	/* Release all active buffers. */
+	spin_lock_irq(&ctx->slock);
+
+	list_for_each_entry_safe(buf, tmp, &ctx->vidq.active, list) {
+		list_del(&buf->list);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+	}
+
+	if (ctx->next_frm != ctx->cur_frm)
+		vb2_buffer_done(&ctx->next_frm->vb.vb2_buf, state);
+	vb2_buffer_done(&ctx->cur_frm->vb.vb2_buf, state);
+
+	ctx->cur_frm = NULL;
+	ctx->next_frm = NULL;
+
+	spin_unlock_irq(&ctx->slock);
+}
+
 static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
 	struct cal_dmaqueue *dma_q = &ctx->vidq;
-	struct cal_buffer *buf, *tmp;
+	struct cal_buffer *buf;
 	unsigned long addr;
 	int ret;
 
@@ -533,46 +556,20 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	cal_ctx_disable_irqs(ctx);
 	ctx->dma_state = CAL_DMA_STOPPED;
 
-	spin_lock_irq(&ctx->slock);
-	vb2_buffer_done(&ctx->cur_frm->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
-	ctx->cur_frm = NULL;
-	ctx->next_frm = NULL;
-	list_for_each_entry_safe(buf, tmp, &dma_q->active, list) {
-		list_del(&buf->list);
-		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
-	}
-	spin_unlock_irq(&ctx->slock);
+	cal_release_buffers(ctx, VB2_BUF_STATE_QUEUED);
 	return ret;
 }
 
 static void cal_stop_streaming(struct vb2_queue *vq)
 {
 	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
-	struct cal_dmaqueue *dma_q = &ctx->vidq;
-	struct cal_buffer *buf, *tmp;
 
 	cal_ctx_wr_dma_stop(ctx);
 	cal_ctx_disable_irqs(ctx);
 
 	v4l2_subdev_call(&ctx->phy->subdev, video, s_stream, 0);
 
-	/* Release all active buffers */
-	spin_lock_irq(&ctx->slock);
-	list_for_each_entry_safe(buf, tmp, &dma_q->active, list) {
-		list_del(&buf->list);
-		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
-	}
-
-	if (ctx->cur_frm == ctx->next_frm) {
-		vb2_buffer_done(&ctx->cur_frm->vb.vb2_buf, VB2_BUF_STATE_ERROR);
-	} else {
-		vb2_buffer_done(&ctx->cur_frm->vb.vb2_buf, VB2_BUF_STATE_ERROR);
-		vb2_buffer_done(&ctx->next_frm->vb.vb2_buf,
-				VB2_BUF_STATE_ERROR);
-	}
-	ctx->cur_frm = NULL;
-	ctx->next_frm = NULL;
-	spin_unlock_irq(&ctx->slock);
+	cal_release_buffers(ctx, VB2_BUF_STATE_ERROR);
 
 	pm_runtime_put_sync(ctx->cal->dev);
 }
-- 
Regards,

Laurent Pinchart

