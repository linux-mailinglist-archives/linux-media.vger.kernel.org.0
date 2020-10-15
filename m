Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32C1728FB83
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 01:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732767AbgJOXOg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Oct 2020 19:14:36 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:57699 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726877AbgJOXOc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Oct 2020 19:14:32 -0400
X-Halon-ID: 255f27c2-0f3c-11eb-9f83-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2fef.dip0.t-ipconnect.de [79.202.47.239])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 255f27c2-0f3c-11eb-9f83-005056917a89;
        Fri, 16 Oct 2020 01:14:16 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 4/5] rcar-vin: Break out hardware start and stop to new methods
Date:   Fri, 16 Oct 2020 01:14:07 +0200
Message-Id: <20201015231408.2399933-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015231408.2399933-1-niklas.soderlund+renesas@ragnatech.se>
References: <20201015231408.2399933-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To support suspend and resume the ability to start and stop the hardware
needs to be available internally in the driver. Currently this code is
in the start and stop callbacks of the vb2_ops struct. In these
callbacks the code is intertwined with buffer allocation and freeing.

Prepare for suspend and resume support by braking out the hardware
start/stop code into new methods.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-dma.c | 78 +++++++++++++---------
 drivers/media/platform/rcar-vin/rcar-vin.h |  3 +
 2 files changed, 48 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index f65deac4c2dbed54..5a5f0e5007478c8d 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -1050,16 +1050,20 @@ static irqreturn_t rvin_irq(int irq, void *data)
 	return IRQ_RETVAL(handled);
 }
 
-/* Need to hold qlock before calling */
 static void return_unused_buffers(struct rvin_dev *vin,
 				  enum vb2_buffer_state state)
 {
 	struct rvin_buffer *buf, *node;
+	unsigned long flags;
+
+	spin_lock_irqsave(&vin->qlock, flags);
 
 	list_for_each_entry_safe(buf, node, &vin->buf_list, list) {
 		vb2_buffer_done(&buf->vb.vb2_buf, state);
 		list_del(&buf->list);
 	}
+
+	spin_unlock_irqrestore(&vin->qlock, flags);
 }
 
 static int rvin_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
@@ -1243,53 +1247,55 @@ static int rvin_set_stream(struct rvin_dev *vin, int on)
 	return ret;
 }
 
-static int rvin_start_streaming(struct vb2_queue *vq, unsigned int count)
+int rvin_start_streaming(struct rvin_dev *vin)
 {
-	struct rvin_dev *vin = vb2_get_drv_priv(vq);
 	unsigned long flags;
 	int ret;
 
-	/* Allocate scratch buffer. */
-	vin->scratch = dma_alloc_coherent(vin->dev, vin->format.sizeimage,
-					  &vin->scratch_phys, GFP_KERNEL);
-	if (!vin->scratch) {
-		spin_lock_irqsave(&vin->qlock, flags);
-		return_unused_buffers(vin, VB2_BUF_STATE_QUEUED);
-		spin_unlock_irqrestore(&vin->qlock, flags);
-		vin_err(vin, "Failed to allocate scratch buffer\n");
-		return -ENOMEM;
-	}
-
 	ret = rvin_set_stream(vin, 1);
-	if (ret) {
-		spin_lock_irqsave(&vin->qlock, flags);
-		return_unused_buffers(vin, VB2_BUF_STATE_QUEUED);
-		spin_unlock_irqrestore(&vin->qlock, flags);
-		goto out;
-	}
+	if (ret)
+		return ret;
 
 	spin_lock_irqsave(&vin->qlock, flags);
 
 	vin->sequence = 0;
 
 	ret = rvin_capture_start(vin);
-	if (ret) {
-		return_unused_buffers(vin, VB2_BUF_STATE_QUEUED);
+	if (ret)
 		rvin_set_stream(vin, 0);
-	}
 
 	spin_unlock_irqrestore(&vin->qlock, flags);
-out:
-	if (ret)
-		dma_free_coherent(vin->dev, vin->format.sizeimage, vin->scratch,
-				  vin->scratch_phys);
 
 	return ret;
 }
 
-static void rvin_stop_streaming(struct vb2_queue *vq)
+static int rvin_start_streaming_vq(struct vb2_queue *vq, unsigned int count)
 {
 	struct rvin_dev *vin = vb2_get_drv_priv(vq);
+	int ret = -ENOMEM;
+
+	/* Allocate scratch buffer. */
+	vin->scratch = dma_alloc_coherent(vin->dev, vin->format.sizeimage,
+					  &vin->scratch_phys, GFP_KERNEL);
+	if (!vin->scratch)
+		goto err_scratch;
+
+	ret = rvin_start_streaming(vin);
+	if (ret)
+		goto err_start;
+
+	return 0;
+err_start:
+	dma_free_coherent(vin->dev, vin->format.sizeimage, vin->scratch,
+			  vin->scratch_phys);
+err_scratch:
+	return_unused_buffers(vin, VB2_BUF_STATE_QUEUED);
+
+	return ret;
+}
+
+void rvin_stop_streaming(struct rvin_dev *vin)
+{
 	unsigned int i, retries;
 	unsigned long flags;
 	bool buffersFreed;
@@ -1341,27 +1347,33 @@ static void rvin_stop_streaming(struct vb2_queue *vq)
 		vin->state = STOPPED;
 	}
 
-	/* Return all unused buffers. */
-	return_unused_buffers(vin, VB2_BUF_STATE_ERROR);
-
 	spin_unlock_irqrestore(&vin->qlock, flags);
 
 	rvin_set_stream(vin, 0);
 
 	/* disable interrupts */
 	rvin_disable_interrupts(vin);
+}
+
+static void rvin_stop_streaming_vq(struct vb2_queue *vq)
+{
+	struct rvin_dev *vin = vb2_get_drv_priv(vq);
+
+	rvin_stop_streaming(vin);
 
 	/* Free scratch buffer. */
 	dma_free_coherent(vin->dev, vin->format.sizeimage, vin->scratch,
 			  vin->scratch_phys);
+
+	return_unused_buffers(vin, VB2_BUF_STATE_ERROR);
 }
 
 static const struct vb2_ops rvin_qops = {
 	.queue_setup		= rvin_queue_setup,
 	.buf_prepare		= rvin_buffer_prepare,
 	.buf_queue		= rvin_buffer_queue,
-	.start_streaming	= rvin_start_streaming,
-	.stop_streaming		= rvin_stop_streaming,
+	.start_streaming	= rvin_start_streaming_vq,
+	.stop_streaming		= rvin_stop_streaming_vq,
 	.wait_prepare		= vb2_ops_wait_prepare,
 	.wait_finish		= vb2_ops_wait_finish,
 };
diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
index 2fef23470e3ddfe3..4ec8584709c847a9 100644
--- a/drivers/media/platform/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/rcar-vin/rcar-vin.h
@@ -299,4 +299,7 @@ void rvin_crop_scale_comp(struct rvin_dev *vin);
 int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel);
 void rvin_set_alpha(struct rvin_dev *vin, unsigned int alpha);
 
+int rvin_start_streaming(struct rvin_dev *vin);
+void rvin_stop_streaming(struct rvin_dev *vin);
+
 #endif
-- 
2.28.0

