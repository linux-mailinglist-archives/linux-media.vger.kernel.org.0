Return-Path: <linux-media+bounces-57302-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oECaIEG9xmnoNwUAu9opvQ
	(envelope-from <linux-media+bounces-57302-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:24:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1B5348460
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:24:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BD9A313B544
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 17:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F8D3FE348;
	Fri, 27 Mar 2026 17:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ni68RzW3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A783FCB02;
	Fri, 27 Mar 2026 17:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631461; cv=none; b=RjHPbML5D/8KRFahJOEsB54YufUS7iX0GZzwARLlP8AZVc+Tnpyh0W3sdwGDhuzXFuSLl+OAfAOVEK1E2N3XjPLEq5WNzZl/ecGtUkQVBJj1p+F4fKrmae7ebfzssHzWBsw7KFsvX1MWvGTJyUghU1FC1sjS8tpJx+dz5r11v94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631461; c=relaxed/simple;
	bh=Qb3tqpAyzwaVkziy1vZhmQ0Ppg+QtpMKLAkSM/eIhH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fX69XmFJBYISzz9LxLswRXgtwUeSjqUqZIeeXgqVgYOA0qD2FtVqMurIo7wudw9AC1ev8Su/TMl09w1QIl6SvENKAdd57rUtZpmKO7ISi+NlFoydTz3nyY0MojyiS9kMZFkyK+p/f1wAW1aMs9h8d07Fhmn4ZHHDgswnsZm1/+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ni68RzW3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B96631A3;
	Fri, 27 Mar 2026 18:09:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774631364;
	bh=Qb3tqpAyzwaVkziy1vZhmQ0Ppg+QtpMKLAkSM/eIhH0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ni68RzW3iR7xS1qMv9ZRB5yi8vGxzay/OWzV9WqrlIKI5cGbS5wdtdK00hdmKos24
	 Fl1FLkITYZLguHnQI/11BaODiBkopb8De42vO287wpJ265bQGu7st0dOiET8tRQHYw
	 Mb7YqrrmhYkzOJecL8VCo+9GG3TAm8NrE48Ji3P8=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 27 Mar 2026 18:10:18 +0100
Subject: [PATCH 13/14] media: rzg2l-cru: Remove the 'state' variable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-b4-cru-rework-v1-13-3b7d0430f538@ideasonboard.com>
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
In-Reply-To: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6649;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=LZozLAu666sEG2pxrWd3ABjylrlsRX+4kPnVmBg/vqE=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpxroKRRpdLYUvHR9vNvJEoiKOCFH1tBUYc1kBA
 8H+7HcBoE6JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaca6CgAKCRByNAaPFqFW
 PA+WD/9JUIUeS+qIhCFEWM9lENKO+jjkDPaQp8T3dik011UiR2RN8jMn3eZf4HmJl5FslDR2wvG
 LYlzpUIR5e9CdmEvVbpcimcf0K+8ovHka/a9abqoCjFhAMwhAWbA+jy95uzUnE3U2LMcrzW60PC
 cjyIjwhlhlAZxkgyNovqNqyoMiMVGzNVduTVGR2487n0vxy32N/ik5ibfL9RCNoufRAtta96g0l
 lfKb/Q9e7uDnT+syT3weexXjcKntXfRnL4vPLzajbYfeWdjzbwUdktwRDNzeKxusg9cPnjZy14Y
 GQ+cBdLLfSQ/HpjszGH5hR5qfsPoObkUDHIdHBheQXRZVrukILXlfWqoMfBFBMtCdgVgoerQJB5
 lzoiQYmn75YnFk01JEB26uqvY+FiXJxYlXfXLSV2uFQrKN8s1WEdLFL9htaEAXKKTXiKQw2W+xx
 2NVmbYvugZZ2EB2svaUvzngckGihUjF1YHmIBkgTE97vtCUUMyKdmVKOCDQB7cwQFws7JEXiRQn
 YQrq5ZcpbzXhI+2d4qW6GSb+f5XyFiu0VOgQYpx1jC6Uq1L8f2eO4hljVNb3aAEBnjnDJkz64Qs
 gj23ujkE/zdig0HDJFe8Mhkuw+DJQ/hxFC1L/LdzV4r7yIIGkavwrsx56A2OVJMcrF9j10UFHGZ
 mtDOztBS7RvB+DA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57302-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,protonmail.com,bp.renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 2A1B5348460
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

The cru driver uses a 'state' variable for debugging purpose in the
interrupt handler. The state is used to detect invalid usage conditions
that are not meant to happen unless the driver has a bug in handling the
stop and start conditions.

Remove the state variable which seems to be a debugging leftover.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 15 -----
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 74 +---------------------
 2 files changed, 3 insertions(+), 86 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index bc66b0c8c15e..56359491739e 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -36,20 +36,6 @@ enum rzg2l_csi2_pads {
 
 struct rzg2l_cru_dev;
 
-/**
- * enum rzg2l_cru_dma_state - DMA states
- * @RZG2L_CRU_DMA_STOPPED:   No operation in progress
- * @RZG2L_CRU_DMA_STARTING:  Capture starting up
- * @RZG2L_CRU_DMA_RUNNING:   Operation in progress have buffers
- * @RZG2L_CRU_DMA_STOPPING:  Stopping operation
- */
-enum rzg2l_cru_dma_state {
-	RZG2L_CRU_DMA_STOPPED = 0,
-	RZG2L_CRU_DMA_STARTING,
-	RZG2L_CRU_DMA_RUNNING,
-	RZG2L_CRU_DMA_STOPPING,
-};
-
 struct rzg2l_cru_csi {
 	struct v4l2_async_connection *asd;
 	struct v4l2_subdev *subdev;
@@ -173,7 +159,6 @@ struct rzg2l_cru_dev {
 	struct vb2_v4l2_buffer *queue_buf[RZG2L_CRU_HW_BUFFER_MAX];
 	struct list_head buf_list;
 	unsigned int sequence;
-	enum rzg2l_cru_dma_state state;
 
 	struct v4l2_pix_format format;
 };
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 45b58e2183bf..30424e2b6cc0 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -399,8 +399,6 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 	if (icnms)
 		dev_err(cru->dev, "Failed stop HW, something is seriously broken\n");
 
-	cru->state = RZG2L_CRU_DMA_STOPPED;
-
 	/* Wait until the FIFO becomes empty */
 	for (retries = 5; retries > 0; retries--) {
 		if (cru->info->fifo_empty(cru))
@@ -588,8 +586,6 @@ static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
 
 static void rzg2l_cru_stop_streaming(struct rzg2l_cru_dev *cru)
 {
-	cru->state = RZG2L_CRU_DMA_STOPPING;
-
 	rzg2l_cru_set_stream(cru, 0);
 }
 
@@ -601,8 +597,6 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
 	u32 amnmbs;
 	int slot;
 
-	guard(spinlock_irqsave)(&cru->hw_lock);
-
 	irq_status = rzg2l_cru_read(cru, CRUnINTS);
 	if (!irq_status)
 		return IRQ_RETVAL(handled);
@@ -611,20 +605,9 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
 
 	rzg2l_cru_write(cru, CRUnINTS, rzg2l_cru_read(cru, CRUnINTS));
 
-	/* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOPPED' */
-	if (cru->state == RZG2L_CRU_DMA_STOPPED) {
-		dev_dbg(cru->dev, "IRQ while state stopped\n");
-		return IRQ_RETVAL(handled);
-	}
-
-	/* Increase stop retries if capture status is 'RZG2L_CRU_DMA_STOPPING' */
-	if (cru->state == RZG2L_CRU_DMA_STOPPING) {
-		if (irq_status & CRUnINTS_SFS)
-			dev_dbg(cru->dev, "IRQ while state stopping\n");
-		return IRQ_RETVAL(handled);
-	}
+	/* Calculate slot and prepare for new capture. */
+	guard(spinlock_irqsave)(&cru->hw_lock);
 
-	/* Prepare for capture and update state */
 	amnmbs = rzg2l_cru_read(cru, AMnMBS);
 	cru->active_slot = amnmbs & AMnMBS_MBSTS;
 
@@ -637,20 +620,6 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
 	else
 		slot = cru->active_slot - 1;
 
-	/*
-	 * To hand buffers back in a known order to userspace start
-	 * to capture first from slot 0.
-	 */
-	if (cru->state == RZG2L_CRU_DMA_STARTING) {
-		if (slot != 0) {
-			dev_dbg(cru->dev, "Starting sync slot: %d\n", slot);
-			return IRQ_RETVAL(handled);
-		}
-
-		dev_dbg(cru->dev, "Capture start synced!\n");
-		cru->state = RZG2L_CRU_DMA_RUNNING;
-	}
-
 	/* Capture frame */
 	if (cru->queue_buf[slot]) {
 		cru->queue_buf[slot]->field = cru->format.field;
@@ -678,49 +647,18 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
 	u32 irq_status;
 	int slot;
 
-	guard(spinlock)(&cru->hw_lock);
-
 	irq_status = rzg2l_cru_read(cru, CRUnINTS2);
 	if (!irq_status)
 		return IRQ_NONE;
 
-	dev_dbg(cru->dev, "CRUnINTS2 0x%x\n", irq_status);
-
 	rzg2l_cru_write(cru, CRUnINTS2, rzg2l_cru_read(cru, CRUnINTS2));
 
-	/* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOPPED' */
-	if (cru->state == RZG2L_CRU_DMA_STOPPED) {
-		dev_dbg(cru->dev, "IRQ while state stopped\n");
-		return IRQ_HANDLED;
-	}
-
-	if (cru->state == RZG2L_CRU_DMA_STOPPING) {
-		if (irq_status & CRUnINTS2_FExS(0) ||
-		    irq_status & CRUnINTS2_FExS(1) ||
-		    irq_status & CRUnINTS2_FExS(2) ||
-		    irq_status & CRUnINTS2_FExS(3))
-			dev_dbg(cru->dev, "IRQ while state stopping\n");
-		return IRQ_HANDLED;
-	}
-
+	guard(spinlock)(&cru->hw_lock);
 	slot = cru->active_slot;
 	cru->active_slot = rzg2l_cru_slot_next(cru, cru->active_slot);
 
 	dev_dbg(cru->dev, "Current written slot: %d\n", slot);
 
-	/*
-	 * To hand buffers back in a known order to userspace start
-	 * to capture first from slot 0.
-	 */
-	if (cru->state == RZG2L_CRU_DMA_STARTING) {
-		if (slot != 0) {
-			dev_dbg(cru->dev, "Starting sync slot: %d\n", slot);
-			return IRQ_HANDLED;
-		}
-		dev_dbg(cru->dev, "Capture start synced!\n");
-		cru->state = RZG2L_CRU_DMA_RUNNING;
-	}
-
 	/* Capture frame */
 	if (cru->queue_buf[slot]) {
 		struct vb2_v4l2_buffer *buf = cru->queue_buf[slot];
@@ -730,9 +668,6 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
 		buf->vb2_buf.timestamp = ktime_get_ns();
 		vb2_buffer_done(&buf->vb2_buf, VB2_BUF_STATE_DONE);
 		cru->queue_buf[slot] = NULL;
-	} else {
-		/* Scratch buffer was used, dropping frame. */
-		dev_dbg(cru->dev, "Dropping frame %u\n", cru->sequence);
 	}
 
 	cru->sequence++;
@@ -789,7 +724,6 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
 		goto out;
 	}
 
-	cru->state = RZG2L_CRU_DMA_STARTING;
 	dev_dbg(cru->dev, "Starting to capture\n");
 	return 0;
 
@@ -862,8 +796,6 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru)
 	spin_lock_init(&cru->hw_lock);
 	spin_lock_init(&cru->qlock);
 
-	cru->state = RZG2L_CRU_DMA_STOPPED;
-
 	for (i = 0; i < RZG2L_CRU_HW_BUFFER_MAX; i++)
 		cru->queue_buf[i] = NULL;
 

-- 
2.53.0


