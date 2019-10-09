Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E90DD1BBC
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 00:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732340AbfJIW1o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 18:27:44 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:41157 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732332AbfJIW1n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Oct 2019 18:27:43 -0400
X-Halon-ID: dac2dcef-eae3-11e9-837a-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [84.172.88.101])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id dac2dcef-eae3-11e9-837a-0050569116f7;
        Thu, 10 Oct 2019 00:26:36 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 1/2] rcar-vin: Move hardware buffer tracking to own struct
Date:   Thu, 10 Oct 2019 00:27:33 +0200
Message-Id: <20191009222734.1911060-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191009222734.1911060-1-niklas.soderlund+renesas@ragnatech.se>
References: <20191009222734.1911060-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To support SEQ_TB/BT not all buffers given to the hardware will be
equal, the driver needs to keep track of different buffer types. Move
the tracking of buffers given to hardware into a struct so additional
tracking fields can be associated with each buffer.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-dma.c | 27 +++++++++++-----------
 drivers/media/platform/rcar-vin/rcar-vin.h |  9 ++++----
 2 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index af4f774149f08597..a9fffadc268e96ba 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -841,20 +841,20 @@ static void rvin_fill_hw_slot(struct rvin_dev *vin, int slot)
 	dma_addr_t phys_addr;
 
 	/* A already populated slot shall never be overwritten. */
-	if (WARN_ON(vin->queue_buf[slot] != NULL))
+	if (WARN_ON(vin->buf_hw[slot].buffer != NULL))
 		return;
 
 	vin_dbg(vin, "Filling HW slot: %d\n", slot);
 
 	if (list_empty(&vin->buf_list)) {
-		vin->queue_buf[slot] = NULL;
+		vin->buf_hw[slot].buffer = NULL;
 		phys_addr = vin->scratch_phys;
 	} else {
 		/* Keep track of buffer we give to HW */
 		buf = list_entry(vin->buf_list.next, struct rvin_buffer, list);
 		vbuf = &buf->vb;
 		list_del_init(to_buf_list(vbuf));
-		vin->queue_buf[slot] = vbuf;
+		vin->buf_hw[slot].buffer = vbuf;
 
 		/* Setup DMA */
 		phys_addr = vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
@@ -950,13 +950,14 @@ static irqreturn_t rvin_irq(int irq, void *data)
 	}
 
 	/* Capture frame */
-	if (vin->queue_buf[slot]) {
-		vin->queue_buf[slot]->field = rvin_get_active_field(vin, vnms);
-		vin->queue_buf[slot]->sequence = vin->sequence;
-		vin->queue_buf[slot]->vb2_buf.timestamp = ktime_get_ns();
-		vb2_buffer_done(&vin->queue_buf[slot]->vb2_buf,
+	if (vin->buf_hw[slot].buffer) {
+		vin->buf_hw[slot].buffer->field =
+			rvin_get_active_field(vin, vnms);
+		vin->buf_hw[slot].buffer->sequence = vin->sequence;
+		vin->buf_hw[slot].buffer->vb2_buf.timestamp = ktime_get_ns();
+		vb2_buffer_done(&vin->buf_hw[slot].buffer->vb2_buf,
 				VB2_BUF_STATE_DONE);
-		vin->queue_buf[slot] = NULL;
+		vin->buf_hw[slot].buffer = NULL;
 	} else {
 		/* Scratch buffer was used, dropping frame. */
 		vin_dbg(vin, "Dropping frame %u\n", vin->sequence);
@@ -980,10 +981,10 @@ static void return_all_buffers(struct rvin_dev *vin,
 	int i;
 
 	for (i = 0; i < HW_BUFFER_NUM; i++) {
-		if (vin->queue_buf[i]) {
-			vb2_buffer_done(&vin->queue_buf[i]->vb2_buf,
+		if (vin->buf_hw[i].buffer) {
+			vb2_buffer_done(&vin->buf_hw[i].buffer->vb2_buf,
 					state);
-			vin->queue_buf[i] = NULL;
+			vin->buf_hw[i].buffer = NULL;
 		}
 	}
 
@@ -1288,7 +1289,7 @@ int rvin_dma_register(struct rvin_dev *vin, int irq)
 	vin->state = STOPPED;
 
 	for (i = 0; i < HW_BUFFER_NUM; i++)
-		vin->queue_buf[i] = NULL;
+		vin->buf_hw[i].buffer = NULL;
 
 	/* buffer queue */
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
index 86e9bad44484092c..9031fe7f569b908e 100644
--- a/drivers/media/platform/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/rcar-vin/rcar-vin.h
@@ -162,9 +162,8 @@ struct rvin_info {
  * @scratch:		cpu address for scratch buffer
  * @scratch_phys:	physical address of the scratch buffer
  *
- * @qlock:		protects @queue_buf, @buf_list, @sequence
- *			@state
- * @queue_buf:		Keeps track of buffers given to HW slot
+ * @qlock:		protects @buf_hw, @buf_list, @sequence and @state
+ * @buf_hw:		Keeps track of buffers given to HW slot
  * @buf_list:		list of queued buffers
  * @sequence:		V4L2 buffers sequence number
  * @state:		keeps track of operation state
@@ -203,7 +202,9 @@ struct rvin_dev {
 	dma_addr_t scratch_phys;
 
 	spinlock_t qlock;
-	struct vb2_v4l2_buffer *queue_buf[HW_BUFFER_NUM];
+	struct {
+		struct vb2_v4l2_buffer *buffer;
+	} buf_hw[HW_BUFFER_NUM];
 	struct list_head buf_list;
 	unsigned int sequence;
 	enum rvin_dma_state state;
-- 
2.23.0

