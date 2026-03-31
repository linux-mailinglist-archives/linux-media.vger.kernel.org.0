Return-Path: <linux-media+bounces-57767-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMZxGvujy2kUJwYAu9opvQ
	(envelope-from <linux-media+bounces-57767-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:37:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA1C3681C0
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C82EB31520FC
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7533F0760;
	Tue, 31 Mar 2026 10:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eY1+SUQr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B789A3EF67D;
	Tue, 31 Mar 2026 10:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952883; cv=none; b=U7leGt7EYf6AEGV4Ihtx7tilp1B4eDzNu+NQYv0AKcpvqITWwp5qmGd8SFqAT/egIArFZHlkAEDmr549iOidmjoqvgWZhhElWDhjemE5l/ey/k3NmkIoQlP8UFHrHZaw+M2cWyqoek4hN5mrPOTZdejYusdqkYk+W0+nLbpirSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952883; c=relaxed/simple;
	bh=ZTPtU/WiOSe7/sBWtLZCZ64MDdsRSjGNL46f0Wq93vo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AqKcT/PsfNmHbWe1ecgb/BKCpQnnlb0nV9trDbZd+IfBx9LzGqVCEGoTcLrGvCgGJWJAd2tKuU7Biv6DssfeyBrnkbg1byCHD20ft0IaCuFyQaFo5BrYUJMw3jsrv51g4arY1jySRYhPiIUC2Th7DCCqhEriR8bbFtFKgeHBJ60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eY1+SUQr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FB311E63;
	Tue, 31 Mar 2026 12:26:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774952795;
	bh=ZTPtU/WiOSe7/sBWtLZCZ64MDdsRSjGNL46f0Wq93vo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eY1+SUQrdsVMXzNnAYDSc97EEhnTBltfKcJgcT4+ylRCxa5yajuo0QypoMK3dMdZC
	 eHTFMhE3YV2FSPmfqbcNdd4dFqDAzxM3ZNFjFSkEFYPil/4+/RFiPJgbs0MwpLXK4Y
	 IO+lhMT+g2Vz8lRXzRHmpSn3h3lCEWPQRZYh1nc4=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 31 Mar 2026 12:27:34 +0200
Subject: [PATCH v2 04/15] media: rzg2l-cru: Use proper guard() in irq
 handler
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-b4-cru-rework-v2-4-f94b238b35d4@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4764;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=ugYj0aCV/XEn8nFgHcFfBuYSP9CMP9DN4nB/mzlgRr8=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpy6Gnp2ape08nZlm4JuPUDn5Wd0eCNJxGmJYit
 4xH8N9RCaqJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCacuhpwAKCRByNAaPFqFW
 PApkD/9ckOIrv1KS4wbcBXkyoAcR2SBnLBxF46H+CWJp6l+VgfIosnbYlt3fAtEwbWEOp85eGeh
 Qo2fmBpKgGqZ3FQaybLig3ebVL+5+p/QctlShFDXpWRp9zGJBLx3hcuoQpyDJPJnXiCoR2KtRUO
 yTAj6Mnn16uXzjiOlaK8IhegKTBc9YDYk4eeHw9jIkrSTUwcXpZoBYy2dk6SMhkipya8sBdPd8G
 cVgz0weQqxmXoLU8EJ+bUZQ0SjLKB+OiW4UMks0sTczpXT/gwDFVsnGcxOOsLxw6bfYVsHL0AW4
 wDs3/HeOp7DoQpF1ALwFcmrbM2ZD1J5PAL+rWrpKo4X+wMfiSXYtJU4wn7/2cpCLE0tQclx9GzK
 hQi3qk+iTHi2VuCVIJBW3k4yyjKUF9YKZnyFtO2I8tF2dDW3vmg/vu3DVZBoExHYbozDvn/yX9B
 ihFtlapZpUZ2+CicGbDjW4HOCa7kuQhsXvVIVxjezUNYsze8DXu0lBHDA3ISS5d1I5rzsp4VEXc
 F2Cek9ey9ZN1jYvoFrHWGu2mq/ADZiseW6LZ9hB5dx/4nu5uS44nsGug41NhobRlWj6p8UwyJcK
 gAkHsQW7oreExqZ70d3QoSnVHjyomdLT37EIvpS2bUmHbkxHSkk8VQFypF3LYkDavxcm73ASaIE
 UQ+cGvIvTJ5GDJw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57767-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,protonmail.com,bp.renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	SURBL_MULTI_FAIL(0.00)[ideasonboard.com:query timed out];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 1EA1C3681C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

The irq handler uses a scoped_guard() that covers the whole function
body.

Replace it with a more appropriate guard() and reduce the indentation.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 104 ++++++++++-----------
 1 file changed, 52 insertions(+), 52 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 0739169f4439..75928b0f48be 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -670,70 +670,70 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
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


