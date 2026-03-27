Return-Path: <linux-media+bounces-57293-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAB1L0W8xmnoNwUAu9opvQ
	(envelope-from <linux-media+bounces-57293-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:20:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8DE348374
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 96E5230D81B2
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 17:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF5F3C5544;
	Fri, 27 Mar 2026 17:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v3V8GpDl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2D038B7DE;
	Fri, 27 Mar 2026 17:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631447; cv=none; b=JRoJMJF75UNF+yfFT8RRkTNivS6C7GT0zcZiCwXl78n9m3EKzqq4Dnzq2FM9UjXawjHY+HhQOa+bAv5YFRZEZBgmuqSRwz7BfDGmmtAyNHl+jFsM0e4NMwHszR8Q8XukSqs6bpOqFwyK1cbTTpI0k2zhWup+Sxm8q/cvOXXTRYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631447; c=relaxed/simple;
	bh=MxvJxr3tjV6KouUxD2dM4s/fwnpeEv5SUNCOEJn7yEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aPgAVKpKqM56icO3KXe4zBUpDUlzuzyjKI3U9+JuWcK+UhCSQNxJvJJMk7BJJz0wone7PncpOu/x9HjWZ7vFVD/ZzjQ+hMN+QMR/tcd1fVuQLZuZrzbNWCsH9YcsMscOqwN/8azFbUg+SaJoIXBskyvKon0+0u62swc5ZlRbyKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=v3V8GpDl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 146A52F85;
	Fri, 27 Mar 2026 18:09:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774631358;
	bh=MxvJxr3tjV6KouUxD2dM4s/fwnpeEv5SUNCOEJn7yEM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=v3V8GpDlH1fSVZ2TMvzlOEZC2H0pnThpOlEn0lm1ITi0V2iBeRxnmyg/6hiURhEGy
	 l9OxspKHtS+1oQHNoRrMerE1t2HOpviLpnHfXBWoVVinL4C2MS1Bjke035oO9Sm9lM
	 ilrFbQ2DT2B1LIjdMfJyL9dxJo6bROZkXoJZJwVI=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 27 Mar 2026 18:10:08 +0100
Subject: [PATCH 03/14] media: rzg2l-cru: Modernize spin_lock usage with
 cleanup.h
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-b4-cru-rework-v1-3-3b7d0430f538@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4664;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Kpy40z4eXxLX6E90WDM9lgvUSvCSjh+mGWRH1VWJQ6c=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpxroJprL+CuO4cNzJ9I7F1LdJJgUKLrrUE3KbQ
 QrW5cXQnzWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaca6CQAKCRByNAaPFqFW
 PKowD/9M0GhE7CH5Xau+NbCq7FFFb6nPiD1QJj5y5qLpqN1Nx4EF/lOtUQJvcvBOD44kzsiPsVX
 mow/4E0bkzHhhMD2Ur2oY01ia0l7I7KndONglXy5wg5C7Smo+xRoPbOiaEGDBg0mAz+AQzAqmE+
 AR1P9/zpeW6OmRSFqdyobsS00F1IyLKH07de6aO0eDmL+SdEluBUajpQjsKWrkg5/+aF35N+Eyz
 hFz/CyQSk21EpBEBPalIrIW9YEvQNLYjZZkS/YyczNAQrIPZhwsQXFFL99a0uD8lLe+7n20j8UA
 C4kHpeJ9gZidgCvAq1Je8Q8wL9REtfK+sXMUqCpLCGsIefSyZwduyaRxJNLcRB836QCRAMbgu/G
 ZOhPj3GIOEqAq0mBuSmUiTrFyAZ2TAC4bad4HaN+LnEMYuIrwxyQByN1zE0fUxnhH8x1SfO9oP+
 77jJQ0DE+fAelQHs3Kq9b2p5HiUliibdbMWpRAgvYkal42w/Fvrsw6hsz0DrU2jRjkX1N9gC6A7
 fUvIE72oGkcFblDvh7cVxN6Wa75KkdTj0dQyiNi4G7YyNd9YrEZTRDpNRTh9wKtabrchJ+aMCAt
 87WYOkXv02rcNTRVjr7kpM+kTvgSy72Y5JZ61vVae0N5tzePJm8IcSA9XEdJs/QKfJSFZYUfs+Y
 VO6M+iQBDnf9tTQ==
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
	TAGGED_FROM(0.00)[bounces-57293-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 5A8DE348374
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

Use more modern constructs from cleanup.h to express the locking
sequences in the rzg2l driver.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 32 +++++++---------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 98b6afbc708d..2d7ac9f37291 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -11,6 +11,7 @@
  * Copyright (C) 2008 Magnus Damm
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/pm_runtime.h>
@@ -110,10 +111,10 @@ static void return_unused_buffers(struct rzg2l_cru_dev *cru,
 				  enum vb2_buffer_state state)
 {
 	struct rzg2l_cru_buffer *buf, *node;
-	unsigned long flags;
 	unsigned int i;
 
-	spin_lock_irqsave(&cru->qlock, flags);
+	guard(spinlock_irqsave)(&cru->qlock);
+
 	for (i = 0; i < cru->num_buf; i++) {
 		if (cru->queue_buf[i]) {
 			vb2_buffer_done(&cru->queue_buf[i]->vb2_buf,
@@ -126,7 +127,6 @@ static void return_unused_buffers(struct rzg2l_cru_dev *cru,
 		vb2_buffer_done(&buf->vb.vb2_buf, state);
 		list_del(&buf->list);
 	}
-	spin_unlock_irqrestore(&cru->qlock, flags);
 }
 
 static int rzg2l_cru_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
@@ -165,13 +165,9 @@ static void rzg2l_cru_buffer_queue(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vb->vb2_queue);
-	unsigned long flags;
-
-	spin_lock_irqsave(&cru->qlock, flags);
 
+	guard(spinlock_irqsave)(&cru->qlock);
 	list_add_tail(to_buf_list(vbuf), &cru->buf_list);
-
-	spin_unlock_irqrestore(&cru->qlock, flags);
 }
 
 static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru,
@@ -465,7 +461,6 @@ void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru)
 int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 {
 	struct v4l2_mbus_framefmt *fmt = rzg2l_cru_ip_get_src_fmt(cru);
-	unsigned long flags;
 	u8 csi_vc;
 	int ret;
 
@@ -475,7 +470,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	csi_vc = ret;
 	cru->svc_channel = csi_vc;
 
-	spin_lock_irqsave(&cru->qlock, flags);
+	guard(spinlock_irqsave)(&cru->qlock);
 
 	/* Select a video input */
 	rzg2l_cru_write(cru, CRUnCTRL, CRUnCTRL_VINSEL(0));
@@ -492,7 +487,6 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	/* Initialize image convert */
 	ret = rzg2l_cru_initialize_image_conv(cru, fmt, csi_vc);
 	if (ret) {
-		spin_unlock_irqrestore(&cru->qlock, flags);
 		return ret;
 	}
 
@@ -502,8 +496,6 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	/* Enable image processing reception */
 	rzg2l_cru_write(cru, ICnEN, ICnEN_ICEN);
 
-	spin_unlock_irqrestore(&cru->qlock, flags);
-
 	return 0;
 }
 
@@ -573,16 +565,15 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
 {
 	struct rzg2l_cru_dev *cru = data;
 	unsigned int handled = 0;
-	unsigned long flags;
 	u32 irq_status;
 	u32 amnmbs;
 	int slot;
 
-	spin_lock_irqsave(&cru->qlock, flags);
+	guard(spinlock_irqsave)(&cru->qlock);
 
 	irq_status = rzg2l_cru_read(cru, CRUnINTS);
 	if (!irq_status)
-		goto done;
+		return IRQ_RETVAL(handled);
 
 	handled = 1;
 
@@ -591,14 +582,14 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
 	/* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOPPED' */
 	if (cru->state == RZG2L_CRU_DMA_STOPPED) {
 		dev_dbg(cru->dev, "IRQ while state stopped\n");
-		goto done;
+		return IRQ_RETVAL(handled);
 	}
 
 	/* Increase stop retries if capture status is 'RZG2L_CRU_DMA_STOPPING' */
 	if (cru->state == RZG2L_CRU_DMA_STOPPING) {
 		if (irq_status & CRUnINTS_SFS)
 			dev_dbg(cru->dev, "IRQ while state stopping\n");
-		goto done;
+		return IRQ_RETVAL(handled);
 	}
 
 	/* Prepare for capture and update state */
@@ -621,7 +612,7 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
 	if (cru->state == RZG2L_CRU_DMA_STARTING) {
 		if (slot != 0) {
 			dev_dbg(cru->dev, "Starting sync slot: %d\n", slot);
-			goto done;
+			return IRQ_RETVAL(handled);
 		}
 
 		dev_dbg(cru->dev, "Capture start synced!\n");
@@ -646,9 +637,6 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
 	/* Prepare for next frame */
 	rzg2l_cru_fill_hw_slot(cru, slot);
 
-done:
-	spin_unlock_irqrestore(&cru->qlock, flags);
-
 	return IRQ_RETVAL(handled);
 }
 

-- 
2.53.0


