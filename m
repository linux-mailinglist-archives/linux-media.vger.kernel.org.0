Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6C972D0852
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 00:57:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728673AbgLFX5H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 18:57:07 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60444 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728661AbgLFX5H (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 18:57:07 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E031E1576;
        Mon,  7 Dec 2020 00:54:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607298846;
        bh=kSrmGSWAzrLTr9C1V4BqNxbUyZVSD8Wk2kzwvoUsHhA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fgOHX27jesAH9SxA/TBve7ngmxdpFwzmOafAYf6MAOB+RcyyqdwGOvD4A6oPMjRYo
         WuyJWwhPwlvqN2QbA2QBTdXMa7XhhNMPBxlzEulxDCG3UD2iGNMZhUd/q6Pcs+HHlV
         lyUbjyBZQrmSUlVf74qBeMeOwGzMGvHQdz+MRw9g=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v3 14/24] media: ti-vpe: cal: Use spin_lock_irq() when starting or stopping stream
Date:   Mon,  7 Dec 2020 01:53:43 +0200
Message-Id: <20201206235353.26968-15-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201206235353.26968-1-laurent.pinchart@ideasonboard.com>
References: <20201206235353.26968-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cal_start_streaming() and cal_stop_streaming() functions are called
with interrupts enabled. spin_lock_irq() can thus be used instead of
spin_lock_irqsave().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal-video.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index d3f805a512c0..de0ba6128715 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -492,12 +492,11 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	struct cal_dmaqueue *dma_q = &ctx->vidq;
 	struct cal_buffer *buf, *tmp;
 	unsigned long addr;
-	unsigned long flags;
 	int ret;
 
-	spin_lock_irqsave(&ctx->slock, flags);
+	spin_lock_irq(&ctx->slock);
 	if (list_empty(&dma_q->active)) {
-		spin_unlock_irqrestore(&ctx->slock, flags);
+		spin_unlock_irq(&ctx->slock);
 		ctx_dbg(3, ctx, "buffer queue is empty\n");
 		return -EIO;
 	}
@@ -506,7 +505,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	ctx->cur_frm = buf;
 	ctx->next_frm = buf;
 	list_del(&buf->list);
-	spin_unlock_irqrestore(&ctx->slock, flags);
+	spin_unlock_irq(&ctx->slock);
 
 	addr = vb2_dma_contig_plane_dma_addr(&ctx->cur_frm->vb.vb2_buf, 0);
 	ctx->sequence = 0;
@@ -534,7 +533,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	cal_ctx_disable_irqs(ctx);
 	ctx->dma_state = CAL_DMA_STOPPED;
 
-	spin_lock_irqsave(&ctx->slock, flags);
+	spin_lock_irq(&ctx->slock);
 	vb2_buffer_done(&ctx->cur_frm->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
 	ctx->cur_frm = NULL;
 	ctx->next_frm = NULL;
@@ -542,7 +541,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 		list_del(&buf->list);
 		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
 	}
-	spin_unlock_irqrestore(&ctx->slock, flags);
+	spin_unlock_irq(&ctx->slock);
 	return ret;
 }
 
@@ -551,7 +550,6 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
 	struct cal_dmaqueue *dma_q = &ctx->vidq;
 	struct cal_buffer *buf, *tmp;
-	unsigned long flags;
 
 	cal_ctx_wr_dma_stop(ctx);
 	cal_ctx_disable_irqs(ctx);
@@ -559,7 +557,7 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 	v4l2_subdev_call(&ctx->phy->subdev, video, s_stream, 0);
 
 	/* Release all active buffers */
-	spin_lock_irqsave(&ctx->slock, flags);
+	spin_lock_irq(&ctx->slock);
 	list_for_each_entry_safe(buf, tmp, &dma_q->active, list) {
 		list_del(&buf->list);
 		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
@@ -574,7 +572,7 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 	}
 	ctx->cur_frm = NULL;
 	ctx->next_frm = NULL;
-	spin_unlock_irqrestore(&ctx->slock, flags);
+	spin_unlock_irq(&ctx->slock);
 
 	pm_runtime_put_sync(ctx->cal->dev);
 }
-- 
Regards,

Laurent Pinchart

