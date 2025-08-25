Return-Path: <linux-media+bounces-41031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1065B3440E
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 16:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BB11163739
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 14:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1F0302766;
	Mon, 25 Aug 2025 14:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="o33kY2P4"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99C82FA0DF;
	Mon, 25 Aug 2025 14:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756132028; cv=none; b=JoWzxY1iNBWG9nUk9+B52+K2fYvWbD2ZqMCdjh4gIzMj1lbLHESe0Q4HT+cvLvLJce9VQgxqDGlNpyyAz+Quqm01g7/JF2crhZr3qqWvQHRIdBZO+WwXG2D0AUFPdbtxzQDo0zvSJ3pbBEoIqUHQ6zxYjo0m7H/WsArJHFVTFV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756132028; c=relaxed/simple;
	bh=pWSpjK1wP40/QBr9fwg3xtF4BiLeFPlWxv3auejPZ5s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vai+WeUL6DJW3g/9jh9qBsQ7sn+Zklgjrpj2iqBhEv8c8cwNsSx1F6lCYRu+ZE/MhUaKiQUh+ccpTbXiQj9NPSy4yF+qdmuAejEizJHhE/ZMt0Vdk9MnZAkm9Qq5D2Y7K3jBFak3KifEkarcRRiLzYTL5DKGYSvi+DyBkCaNKuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=o33kY2P4; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57PEQobs826938;
	Mon, 25 Aug 2025 09:26:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756132010;
	bh=OqhEkN67tyFmKn6Rpn/Rf+C74vycdo0JayWac+LnJOo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=o33kY2P4LDwI+xjDBv0MKZkDgzwbApAh4I/hN478PnhYWSQmnthdSD/RAerzu+jGX
	 rTsnA+ffxEjr3uReGBqU8y0HrU7RrxPRtFsckkKETV+9z4JgsY138lURhMYjR0g4px
	 y+zBa/DYEHDarKWSXAQ0TmjuLJvuv3NpLJ/xfNlc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57PEQoNu669582
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 25 Aug 2025 09:26:50 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 25
 Aug 2025 09:26:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 25 Aug 2025 09:26:49 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57PEPN423747540;
	Mon, 25 Aug 2025 09:26:43 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
        <mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
        <vaishnav.a@ti.com>, <s-jain1@ti.com>, <vigneshr@ti.com>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <sakari.ailus@linux.intel.com>,
        <hverkuil-cisco@xs4all.nl>, <tomi.valkeinen@ideasonboard.com>,
        <jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
        <jack.zhu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v5 13/14] media: ti: j721e-csi2rx: Change the drain architecture for multistream
Date: Mon, 25 Aug 2025 19:55:21 +0530
Message-ID: <20250825142522.1826188-14-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250825142522.1826188-1-r-donadkar@ti.com>
References: <20250825142522.1826188-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On buffer starvation the DMA is marked IDLE, and the stale data in the
internal FIFOs gets drained only on the next VIDIOC_QBUF call from the
userspace. This approach works fine for a single stream case.

But in multistream scenarios, buffer starvation for one stream i.e. one
virtual channel, can block the shared HW FIFO of the CSI2RX IP. This can
stall the pipeline for all other virtual channels, even if buffers are
available for them.

This patch introduces a new architecture, that continuously drains data
from the shared HW FIFO into a small (32KiB) buffer if no buffers are made
available to the driver from the userspace. This ensures independence
between different streams, where a slower downstream element for one
camera does not block streaming for other cameras.

Additionally, after a drain is done for a VC, the next frame will be a
partial frame, as a portion of its data will have already been drained
before a valid buffer is queued by user space to the driver.

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 99 +++++++------------
 1 file changed, 36 insertions(+), 63 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index ba8f476fe779..4ac6a76b9409 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -61,7 +61,6 @@
 #define TI_CSI2RX_MAX_SOURCE_PADS	TI_CSI2RX_MAX_CTX
 #define TI_CSI2RX_MAX_PADS		(1 + TI_CSI2RX_MAX_SOURCE_PADS)
 
-#define DRAIN_TIMEOUT_MS		50
 #define DRAIN_BUFFER_SIZE		SZ_32K
 
 #define CSI2RX_BRIDGE_SOURCE_PAD	1
@@ -83,7 +82,6 @@ struct ti_csi2rx_buffer {
 
 enum ti_csi2rx_dma_state {
 	TI_CSI2RX_DMA_STOPPED,	/* Streaming not started yet. */
-	TI_CSI2RX_DMA_IDLE,	/* Streaming but no pending DMA operation. */
 	TI_CSI2RX_DMA_ACTIVE,	/* Streaming and pending DMA operation. */
 };
 
@@ -252,6 +250,10 @@ static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
 static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *ctx,
 			       struct ti_csi2rx_buffer *buf);
 
+/* Forward declarations needed by ti_csi2rx_drain_callback. */
+static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx);
+static int ti_csi2rx_dma_submit_pending(struct ti_csi2rx_ctx *ctx);
+
 static const struct ti_csi2rx_fmt *find_format_by_fourcc(u32 pixelformat)
 {
 	unsigned int i;
@@ -621,9 +623,31 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 
 static void ti_csi2rx_drain_callback(void *param)
 {
-	struct completion *drain_complete = param;
+	struct ti_csi2rx_ctx *ctx = param;
+	struct ti_csi2rx_dma *dma = &ctx->dma;
+	unsigned long flags;
 
-	complete(drain_complete);
+	spin_lock_irqsave(&dma->lock, flags);
+
+	if (dma->state == TI_CSI2RX_DMA_STOPPED) {
+		spin_unlock_irqrestore(&dma->lock, flags);
+		return;
+	}
+
+	/*
+	 * If dma->queue is empty, it indicates that no buffer has been
+	 * provided by user space. In this case, initiate a transactions
+	 * to drain the DMA. Since one drain of size DRAIN_BUFFER_SIZE
+	 * will be done here, the subsequent frame will be a
+	 * partial frame, with a size of frame_size - DRAIN_BUFFER_SIZE
+	 */
+	if (list_empty(&dma->queue)) {
+		if (ti_csi2rx_drain_dma(ctx))
+			dev_warn(ctx->csi->dev, "DMA drain failed\n");
+	} else {
+		ti_csi2rx_dma_submit_pending(ctx);
+	}
+	spin_unlock_irqrestore(&dma->lock, flags);
 }
 
 /*
@@ -641,12 +665,9 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
 {
 	struct ti_csi2rx_dev *csi = ctx->csi;
 	struct dma_async_tx_descriptor *desc;
-	struct completion drain_complete;
 	dma_cookie_t cookie;
 	int ret;
 
-	init_completion(&drain_complete);
-
 	desc = dmaengine_prep_slave_single(ctx->dma.chan, csi->drain.paddr,
 					   csi->drain.len, DMA_DEV_TO_MEM,
 					   DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
@@ -656,7 +677,7 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
 	}
 
 	desc->callback = ti_csi2rx_drain_callback;
-	desc->callback_param = &drain_complete;
+	desc->callback_param = ctx;
 
 	cookie = dmaengine_submit(desc);
 	ret = dma_submit_error(cookie);
@@ -665,13 +686,6 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
 
 	dma_async_issue_pending(ctx->dma.chan);
 
-	if (!wait_for_completion_timeout(&drain_complete,
-					 msecs_to_jiffies(DRAIN_TIMEOUT_MS))) {
-		dmaengine_terminate_sync(ctx->dma.chan);
-		dev_dbg(csi->dev, "DMA transfer timed out for drain buffer\n");
-		ret = -ETIMEDOUT;
-		goto out;
-	}
 out:
 	return ret;
 }
@@ -720,9 +734,11 @@ static void ti_csi2rx_dma_callback(void *param)
 
 	ti_csi2rx_dma_submit_pending(ctx);
 
-	if (list_empty(&dma->submitted))
-		dma->state = TI_CSI2RX_DMA_IDLE;
-
+	if (list_empty(&dma->submitted)) {
+		if (ti_csi2rx_drain_dma(ctx))
+			dev_warn(ctx->csi->dev,
+				 "DMA drain failed on one of the transactions\n");
+	}
 	spin_unlock_irqrestore(&dma->lock, flags);
 }
 
@@ -775,7 +791,7 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
 		 * enforced before terminating DMA.
 		 */
 		ret = ti_csi2rx_drain_dma(ctx);
-		if (ret && ret != -ETIMEDOUT)
+		if (ret)
 			dev_warn(ctx->csi->dev,
 				 "Failed to drain DMA. Next frame might be bogus\n");
 	}
@@ -842,57 +858,14 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
 	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 	struct ti_csi2rx_buffer *buf;
 	struct ti_csi2rx_dma *dma = &ctx->dma;
-	bool restart_dma = false;
 	unsigned long flags = 0;
-	int ret;
 
 	buf = container_of(vb, struct ti_csi2rx_buffer, vb.vb2_buf);
 	buf->ctx = ctx;
 
 	spin_lock_irqsave(&dma->lock, flags);
-	/*
-	 * Usually the DMA callback takes care of queueing the pending buffers.
-	 * But if DMA has stalled due to lack of buffers, restart it now.
-	 */
-	if (dma->state == TI_CSI2RX_DMA_IDLE) {
-		/*
-		 * Do not restart DMA with the lock held because
-		 * ti_csi2rx_drain_dma() might block for completion.
-		 * There won't be a race on queueing DMA anyway since the
-		 * callback is not being fired.
-		 */
-		restart_dma = true;
-		dma->state = TI_CSI2RX_DMA_ACTIVE;
-	} else {
-		list_add_tail(&buf->list, &dma->queue);
-	}
+	list_add_tail(&buf->list, &dma->queue);
 	spin_unlock_irqrestore(&dma->lock, flags);
-
-	if (restart_dma) {
-		/*
-		 * Once frames start dropping, some data gets stuck in the DMA
-		 * pipeline somewhere. So the first DMA transfer after frame
-		 * drops gives a partial frame. This is obviously not useful to
-		 * the application and will only confuse it. Issue a DMA
-		 * transaction to drain that up.
-		 */
-		ret = ti_csi2rx_drain_dma(ctx);
-		if (ret && ret != -ETIMEDOUT)
-			dev_warn(ctx->csi->dev,
-				 "Failed to drain DMA. Next frame might be bogus\n");
-
-		spin_lock_irqsave(&dma->lock, flags);
-		ret = ti_csi2rx_start_dma(ctx, buf);
-		if (ret) {
-			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
-			dma->state = TI_CSI2RX_DMA_IDLE;
-			spin_unlock_irqrestore(&dma->lock, flags);
-			dev_err(ctx->csi->dev, "Failed to start DMA: %d\n", ret);
-		} else {
-			list_add_tail(&buf->list, &dma->submitted);
-			spin_unlock_irqrestore(&dma->lock, flags);
-		}
-	}
 }
 
 static int ti_csi2rx_get_route(struct ti_csi2rx_ctx *ctx)
-- 
2.34.1


