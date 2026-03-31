Return-Path: <linux-media+bounces-57776-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HmBEamjy2kUJwYAu9opvQ
	(envelope-from <linux-media+bounces-57776-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:36:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D97CC368150
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2AEA0309E03A
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E14C23F87E4;
	Tue, 31 Mar 2026 10:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QMEmwKSt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7213F7AA1;
	Tue, 31 Mar 2026 10:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952897; cv=none; b=s/4tTS5poWTRC0y4pHHTso2vyhrQ7DVJSZIhFmlcMrpTAkys23ZwIHEBkQUp48DPJwmFAPZrXQ7AbzBIeqpL38GFtS83l0rZSwN/mx3jQRHf+KdJVkKUvsFHSIWZmQM7ablBUxIboCfcK6UHfCV+ZrkzsnIev+F44/6g32LztQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952897; c=relaxed/simple;
	bh=qH4nCv8vXyo9/IPFH82Fal0ZJSpo50I0muPguZaT6k8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CiUXYGNHp+DAdI3sm3IYHZhH81+5q4RDk9DA/0rAe6UExhCgWaHV7zJbbEokKrsgW54rlos0gnkMzgqO9rngbxSE8UL0IWfLfFXf+e6/5bnP3WKBIjpmLVdpbXjLzcvmZzFjUiYEDkhFchpFv3+RQe9TcaPC34dsFMxZNhGPlPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QMEmwKSt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1AB8A25B5;
	Tue, 31 Mar 2026 12:26:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774952801;
	bh=qH4nCv8vXyo9/IPFH82Fal0ZJSpo50I0muPguZaT6k8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QMEmwKStJs7VvCRgcSozLd5YmmMmw/gpj4qNtlQ9+v0qsiHPC727VIisQnghe00Yg
	 jjDYKgkVnCctR5aBAp0H/yZ3r04Suj3xlxJZ40Reu6CzxW3uuOjuxXbIyNrWdd8niO
	 LCthb62CIiHClodMJzQlXp2vZsUIHQUF+ajWg0z0=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 31 Mar 2026 12:27:43 +0200
Subject: [PATCH v2 13/15] media: rzg2l-cru: Remove the 'state' variable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-b4-cru-rework-v2-13-f94b238b35d4@ideasonboard.com>
References: <20260331-b4-cru-rework-v2-0-f94b238b35d4@ideasonboard.com>
In-Reply-To: <20260331-b4-cru-rework-v2-0-f94b238b35d4@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6353;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=QxY8Z5F5lVXBXuCYF7kEh7KCYBVT9AiINb5jhs28FgY=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpy6Gplhmal/K0mu4J6lIZ26gzwG5S5mO6+UTEM
 EEcGQdCdGaJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCacuhqQAKCRByNAaPFqFW
 PGmbEACCItw5KabMCeXY6r3/MGulNUId0apEf8AnqTYnaKk/4y1rXBtQWbKiY2Rm+DUSUPsdeqI
 rh6pEDGpEPOLqeNhXdqn+GuA2tThDo5jHL6711pcbcIzwFk9NRQE0PtHTHi0p9NUPLxPM1TcVe4
 r1UmALurtVs6WMzAGVNj4J27uX4CiCIk8NfmNLZ+gwono5Nb9aV8/YEE+GYgZqN/e7srjvpC1bE
 8HL8Tc3kU4bPMzyiCwckpMnmi7zM6CI3WKsT9cPVWWVkAAWjSIySw7qXGPn3goKIZhe6vI7rdWE
 wRbNoUHFHjkQt4G0zLNBy4oertyAULRsS82U2BbWeqfwEPI5/k4/WpzwB8WvBHRMb5yOHTcMwMD
 gxM/wJp0c0rurNiIJMUKDfmSHWR17Uk3arddjgaQ5gsdZJO3VzY7IM4cYumzcgUAc7rJgd2UDuK
 PkTWaJiCO1OPwVq+UxofMywdgtQZxLenEReLFjMz/6/+p0Vp/gL+hNXMHe7cVfV5QiLoS/tsNOD
 AmA56I/kNgNdg0GbF4ee6e+yxr9XM2VKfhM/8SPoYiCev0a/1BN61dP6JZ3nBMmGb2jXFY5Vya1
 5lSO9fKVKdLT28bxqmcPqntiJoaiXifGnuiC2hKRIt4EM4qGm/rqg31mR7f0Y9yR05W/mSa8TcP
 hv2FohSzKHlnCfw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57776-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,protonmail.com,bp.renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D97CC368150
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

The cru driver uses a 'state' variable for debugging purpose in the
interrupt handler. The state is used to detect invalid usage conditions
that are not meant to happen unless the driver has a bug in handling the
stop and start conditions.

Remove the state variable which seems to be a debugging leftover.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 15 -----
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 71 +---------------------
 2 files changed, 3 insertions(+), 83 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 25f17069585c..5bf334e173d2 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -38,20 +38,6 @@ enum rzg2l_csi2_pads {
 
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
@@ -174,7 +160,6 @@ struct rzg2l_cru_dev {
 	struct vb2_v4l2_buffer *queue_buf[RZG2L_CRU_HW_BUFFER_MAX];
 	struct list_head buf_list;
 	unsigned int sequence;
-	enum rzg2l_cru_dma_state state;
 
 	struct v4l2_pix_format format;
 };
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index f061bee51ea8..721057edca6b 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -398,8 +398,6 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 	if (icnms)
 		dev_err(cru->dev, "Failed stop HW, something is seriously broken\n");
 
-	cru->state = RZG2L_CRU_DMA_STOPPED;
-
 	/* Wait until the FIFO becomes empty */
 	for (retries = 5; retries > 0; retries--) {
 		if (cru->info->fifo_empty(cru))
@@ -587,8 +585,6 @@ static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
 
 static void rzg2l_cru_stop_streaming(struct rzg2l_cru_dev *cru)
 {
-	cru->state = RZG2L_CRU_DMA_STOPPING;
-
 	rzg2l_cru_set_stream(cru, 0);
 }
 
@@ -600,8 +596,6 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
 	u32 amnmbs;
 	int slot;
 
-	guard(spinlock_irqsave)(&cru->hw_lock);
-
 	irq_status = rzg2l_cru_read(cru, CRUnINTS);
 	if (!irq_status)
 		return IRQ_RETVAL(handled);
@@ -610,20 +604,9 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
 
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
 
@@ -636,20 +619,6 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
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
@@ -677,49 +646,18 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
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
@@ -788,7 +726,6 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
 		goto out;
 	}
 
-	cru->state = RZG2L_CRU_DMA_STARTING;
 	dev_dbg(cru->dev, "Starting to capture\n");
 	return 0;
 
@@ -861,8 +798,6 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru)
 	spin_lock_init(&cru->hw_lock);
 	spin_lock_init(&cru->qlock);
 
-	cru->state = RZG2L_CRU_DMA_STOPPED;
-
 	for (i = 0; i < RZG2L_CRU_HW_BUFFER_MAX; i++)
 		cru->queue_buf[i] = NULL;
 

-- 
2.53.0


