Return-Path: <linux-media+bounces-57292-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yATKLGe8xmnoNwUAu9opvQ
	(envelope-from <linux-media+bounces-57292-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:20:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1842134837D
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:20:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1191530E3EF3
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 17:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2CF937882E;
	Fri, 27 Mar 2026 17:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DqEtW8NE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4434378821;
	Fri, 27 Mar 2026 17:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631446; cv=none; b=r7BZSVCJXJUpRStegQWbWic9okfVZ1ic7d75eqpOWcka3atBo+slWltgKOKYxiabgz/fA6Uydp/4QMgYA+FPiJhpoNzTQ4VLyFwpSoXWNoZcsdJ3uLiPlgpYUSpGoHe7mMtrCxBNZuSNRt9NIKvCGzBhpkpbSCmiDRiT6UDw/DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631446; c=relaxed/simple;
	bh=a8k3H7vZ9QOrPOBqIcGdLUleWexFOI1HoCBd5CaHisA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nRUGVSXajbnaXjiDrTA0hcCwuEEiup3Vt2kVixtKgMJLAkUHwRmLXuclJlfD0pcxaFDE4QBv1ZaSsXxUqi9co1k4R3M483p++ccAPz2AthvWK0RKdto8Dfak3fWK8QwWlYzIgonVku+gG2AdCdoyM/iIq9oD8gMPY0Qmm/VbatE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DqEtW8NE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AAC323026;
	Fri, 27 Mar 2026 18:09:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774631359;
	bh=a8k3H7vZ9QOrPOBqIcGdLUleWexFOI1HoCBd5CaHisA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DqEtW8NEdbtdMfOResH6o7yEIloTBVRP96rQ42bEXIoRyw51O7DSRynynM0Jt92Js
	 hL+QcoXzQ7cDQFxNTg1etOUrpz/ryzrncH/bDDDw54y1Art2w++dzA78Y/pnAxKgeP
	 2u1iFVc3F3dRokoqyCO9WVYlVZ2MKeUsGdMJ1UD8=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 27 Mar 2026 18:10:09 +0100
Subject: [PATCH 04/14] media: rzg2l-cru: Use proper guard() in irq handler
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-b4-cru-rework-v1-4-3b7d0430f538@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4506;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=ATRTxSt143KObiy2/iwP7rOhh1jLna5JlBP7Bra3N1Q=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpxroJY93sZQXMvc6cia/Xr6dAfl1jjS4O2i9Iz
 h4ILolFg4qJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaca6CQAKCRByNAaPFqFW
 PKAsEADAVLSzdAZXfV+LD0y7i5nwjxfvrUjL8bqmm0SBUtXx4XyYSlliVcE+kjRaUP1kjBvdhBK
 sQ/tDkVK526qpJq0XvAkUnQ4hJcWlDjEl6uFfae/BUCvf8iCAgveYualUkWVVSpPqyhvPxnwR+W
 A9r2KO/1Gup4zcedVSHN+p1BqqpJs8H28tuDZgCtH9yYDWXKJA4XX3Y3DS5F/d4nGclyXbVzkZM
 /c/R23Ja8LTxZ0/ZrBVYTULxzZ1Sz99RYBuTEWztJYMvXmu2u5hgBGNy072sgXcG7/A7IKMmZ52
 ARi9vIDVYhO91cVuSLHiw/ip9bHU0RFNI1CEoEbabAkczbHBYfT2Ldc1ABcueAAFrxP8YA0MEC6
 GSoileW9DXmTtPvVIySfksp9iSYXWmp925zyte+dFvfn2H6CIYO5FhQNVZeMsAFzKy3pZt04Flk
 4h+2jqmVnPgvkPCf1QTLSW6jEQd/dTEjwi74F8crqbGvj5R92n5oGyQ5N9/qbH2L68n0XK2oy8X
 9NeRpXZEIxhc40BTTv4YacwTDLIZGaPtRzObyDFSgstE66R0r+UmEflUewvwf716EBlF/8rpsaO
 /W6+Oki/dtvh+gU66JUbT3RPNglkPjatKgiZ9Gm7RKFETB1b8lpyUoutYN/CIPwU+/ls/kiC4HU
 ni7Hn2/WHY7Dbww==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57292-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 1842134837D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

The irq handler uses a scoped_guard() that covers the whole function
body.

Replace it with a more appropriate guard() and reduce the indentation.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 104 ++++++++++-----------
 1 file changed, 52 insertions(+), 52 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 2d7ac9f37291..b041c72837c6 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -671,70 +671,70 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
 	u32 irq_status;
 	int slot;
 
-	scoped_guard(spinlock, &cru->qlock) {
-		irq_status = rzg2l_cru_read(cru, CRUnINTS2);
-		if (!irq_status)
-			return IRQ_NONE;
+	guard(spinlock)(&cru->qlock);
 
-		dev_dbg(cru->dev, "CRUnINTS2 0x%x\n", irq_status);
+	irq_status = rzg2l_cru_read(cru, CRUnINTS2);
+	if (!irq_status)
+		return IRQ_NONE;
 
-		rzg2l_cru_write(cru, CRUnINTS2, rzg2l_cru_read(cru, CRUnINTS2));
+	dev_dbg(cru->dev, "CRUnINTS2 0x%x\n", irq_status);
 
-		/* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOPPED' */
-		if (cru->state == RZG2L_CRU_DMA_STOPPED) {
-			dev_dbg(cru->dev, "IRQ while state stopped\n");
-			return IRQ_HANDLED;
-		}
+	rzg2l_cru_write(cru, CRUnINTS2, rzg2l_cru_read(cru, CRUnINTS2));
 
-		if (cru->state == RZG2L_CRU_DMA_STOPPING) {
-			if (irq_status & CRUnINTS2_FExS(0) ||
-			    irq_status & CRUnINTS2_FExS(1) ||
-			    irq_status & CRUnINTS2_FExS(2) ||
-			    irq_status & CRUnINTS2_FExS(3))
-				dev_dbg(cru->dev, "IRQ while state stopping\n");
-			return IRQ_HANDLED;
-		}
+	/* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOPPED' */
+	if (cru->state == RZG2L_CRU_DMA_STOPPED) {
+		dev_dbg(cru->dev, "IRQ while state stopped\n");
+		return IRQ_HANDLED;
+	}
 
-		slot = rzg3e_cru_get_current_slot(cru);
-		if (slot < 0)
-			return IRQ_HANDLED;
+	if (cru->state == RZG2L_CRU_DMA_STOPPING) {
+		if (irq_status & CRUnINTS2_FExS(0) ||
+		    irq_status & CRUnINTS2_FExS(1) ||
+		    irq_status & CRUnINTS2_FExS(2) ||
+		    irq_status & CRUnINTS2_FExS(3))
+			dev_dbg(cru->dev, "IRQ while state stopping\n");
+		return IRQ_HANDLED;
+	}
 
-		dev_dbg(cru->dev, "Current written slot: %d\n", slot);
-		cru->buf_addr[slot] = 0;
-
-		/*
-		 * To hand buffers back in a known order to userspace start
-		 * to capture first from slot 0.
-		 */
-		if (cru->state == RZG2L_CRU_DMA_STARTING) {
-			if (slot != 0) {
-				dev_dbg(cru->dev, "Starting sync slot: %d\n", slot);
-				return IRQ_HANDLED;
-			}
-			dev_dbg(cru->dev, "Capture start synced!\n");
-			cru->state = RZG2L_CRU_DMA_RUNNING;
-		}
+	slot = rzg3e_cru_get_current_slot(cru);
+	if (slot < 0)
+		return IRQ_HANDLED;
 
-		/* Capture frame */
-		if (cru->queue_buf[slot]) {
-			struct vb2_v4l2_buffer *buf = cru->queue_buf[slot];
-
-			buf->field = cru->format.field;
-			buf->sequence = cru->sequence;
-			buf->vb2_buf.timestamp = ktime_get_ns();
-			vb2_buffer_done(&buf->vb2_buf, VB2_BUF_STATE_DONE);
-			cru->queue_buf[slot] = NULL;
-		} else {
-			/* Scratch buffer was used, dropping frame. */
-			dev_dbg(cru->dev, "Dropping frame %u\n", cru->sequence);
+	dev_dbg(cru->dev, "Current written slot: %d\n", slot);
+	cru->buf_addr[slot] = 0;
+
+	/*
+	 * To hand buffers back in a known order to userspace start
+	 * to capture first from slot 0.
+	 */
+	if (cru->state == RZG2L_CRU_DMA_STARTING) {
+		if (slot != 0) {
+			dev_dbg(cru->dev, "Starting sync slot: %d\n", slot);
+			return IRQ_HANDLED;
 		}
+		dev_dbg(cru->dev, "Capture start synced!\n");
+		cru->state = RZG2L_CRU_DMA_RUNNING;
+	}
 
-		cru->sequence++;
+	/* Capture frame */
+	if (cru->queue_buf[slot]) {
+		struct vb2_v4l2_buffer *buf = cru->queue_buf[slot];
 
-		/* Prepare for next frame */
-		rzg2l_cru_fill_hw_slot(cru, slot);
+		buf->field = cru->format.field;
+		buf->sequence = cru->sequence;
+		buf->vb2_buf.timestamp = ktime_get_ns();
+		vb2_buffer_done(&buf->vb2_buf, VB2_BUF_STATE_DONE);
+		cru->queue_buf[slot] = NULL;
+	} else {
+		/* Scratch buffer was used, dropping frame. */
+		dev_dbg(cru->dev, "Dropping frame %u\n", cru->sequence);
 	}
 
+	cru->sequence++;
+
+	/* Prepare for next frame */
+	rzg2l_cru_fill_hw_slot(cru, slot);
+
 	return IRQ_HANDLED;
 }
 

-- 
2.53.0


