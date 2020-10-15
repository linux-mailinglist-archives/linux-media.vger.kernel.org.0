Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50BAC28FB7E
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 01:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731088AbgJOXO3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Oct 2020 19:14:29 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:65386 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730870AbgJOXO3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Oct 2020 19:14:29 -0400
X-Halon-ID: 240a1678-0f3c-11eb-9f83-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2fef.dip0.t-ipconnect.de [79.202.47.239])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 240a1678-0f3c-11eb-9f83-005056917a89;
        Fri, 16 Oct 2020 01:14:14 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/5] rcar-vin: Use scratch buffer when not in running state
Date:   Fri, 16 Oct 2020 01:14:04 +0200
Message-Id: <20201015231408.2399933-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015231408.2399933-1-niklas.soderlund+renesas@ragnatech.se>
References: <20201015231408.2399933-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In its early stages the VIN driver did not use an internal scratch
buffer. This lead to a unnecessary complex start and stop behavior,
specially for TB/BT. The driver now always allocates a scratch buffer to
deal with buffer under-runs, use the scratch buffer to also simplify
starting and stopping.

When capture is starting use the scratch buffer instead of a user-space
buffers while syncing the driver with the hardware state. This allows
the driver to know that no user-space buffers is given to the hardware
before the running state is reached.

When capture is stopping use the scratch buffer instead of leaving the
user-space buffers in place and add a check that all user-space buffers
are processed by the hardware before transitioning from the stopping to
stopped state. This allows the driver to know all user-space buffers
given to the hardware are fully processed.

This change in itself does not improve the driver much but it paves way
for future simplifications and enhancements. One direct improvement of
this change is that TB/BT buffers returned to user-space wile stopping
will always contains both fields, that was not guaranteed before.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-dma.c | 30 +++++++++++++++-------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index 692dea300b0de8b5..ca90bde8d29f77d1 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -905,7 +905,7 @@ static void rvin_fill_hw_slot(struct rvin_dev *vin, int slot)
 				vin->format.sizeimage / 2;
 			break;
 		}
-	} else if (list_empty(&vin->buf_list)) {
+	} else if (vin->state != RUNNING || list_empty(&vin->buf_list)) {
 		vin->buf_hw[slot].buffer = NULL;
 		vin->buf_hw[slot].type = FULL;
 		phys_addr = vin->scratch_phys;
@@ -998,12 +998,6 @@ static irqreturn_t rvin_irq(int irq, void *data)
 		goto done;
 	}
 
-	/* Nothing to do if capture status is 'STOPPING' */
-	if (vin->state == STOPPING) {
-		vin_dbg(vin, "IRQ while state stopping\n");
-		goto done;
-	}
-
 	/* Prepare for capture and update state */
 	vnms = rvin_read(vin, VNMS_REG);
 	slot = (vnms & VNMS_FBS_MASK) >> VNMS_FBS_SHIFT;
@@ -1313,14 +1307,32 @@ static int rvin_start_streaming(struct vb2_queue *vq, unsigned int count)
 static void rvin_stop_streaming(struct vb2_queue *vq)
 {
 	struct rvin_dev *vin = vb2_get_drv_priv(vq);
+	unsigned int i, retries;
 	unsigned long flags;
-	int retries = 0;
+	bool buffersFreed;
 
 	spin_lock_irqsave(&vin->qlock, flags);
 
 	vin->state = STOPPING;
 
+	/* Wait until only scratch buffer is used, max 3 interrupts. */
+	retries = 0;
+	while (retries++ < RVIN_RETRIES) {
+		buffersFreed = true;
+		for (i = 0; i < HW_BUFFER_NUM; i++)
+			if (vin->buf_hw[i].buffer)
+				buffersFreed = false;
+
+		if (buffersFreed)
+			break;
+
+		spin_unlock_irqrestore(&vin->qlock, flags);
+		msleep(RVIN_TIMEOUT_MS);
+		spin_lock_irqsave(&vin->qlock, flags);
+	}
+
 	/* Wait for streaming to stop */
+	retries = 0;
 	while (retries++ < RVIN_RETRIES) {
 
 		rvin_capture_stop(vin);
@@ -1336,7 +1348,7 @@ static void rvin_stop_streaming(struct vb2_queue *vq)
 		spin_lock_irqsave(&vin->qlock, flags);
 	}
 
-	if (vin->state != STOPPED) {
+	if (!buffersFreed || vin->state != STOPPED) {
 		/*
 		 * If this happens something have gone horribly wrong.
 		 * Set state to stopped to prevent the interrupt handler
-- 
2.28.0

