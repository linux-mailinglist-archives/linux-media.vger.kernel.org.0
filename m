Return-Path: <linux-media+bounces-57766-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QATAAOejy2kUJwYAu9opvQ
	(envelope-from <linux-media+bounces-57766-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:37:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 865773681A2
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3EA6A314DD70
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A354F3F0741;
	Tue, 31 Mar 2026 10:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UAvfsgcR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA623EE1F1;
	Tue, 31 Mar 2026 10:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952882; cv=none; b=ehwPNKxRmTMC25u3EdQy0luXaQBIokGd/3xUOU7MyJPDtl86VFskh+LmeBI6MNT/1LwuCnZdjEc9rCEg89pXod5XoNr98oI38lHQ2o/vI0vhA4RbM21ebaVtpWU65NVgB9hbiIrRWLFhEPADiIeIREb+GeSHJW1JGtOoP4HJTHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952882; c=relaxed/simple;
	bh=KVv0I4gT3T6DEvh83auSr/5g+T2D21BfsE9EbJ4sjXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xp2FDrEuThQ0q9U31JwTGXRwV2eIIYlFXHvFDudPhCXQOxbHqas2YqSRpwKZwB5t2Em4W7hQBukwbm4NPFAjI7R354KCrNEVdk7P+aK0+P4NyrbCRG7sLmCNmpUinRmKpw6ReC6GafWBeE0AhL0c8eWGtUE2HeWan0VAcXd4X48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UAvfsgcR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E2C771E5A;
	Tue, 31 Mar 2026 12:26:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774952794;
	bh=KVv0I4gT3T6DEvh83auSr/5g+T2D21BfsE9EbJ4sjXY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UAvfsgcRkcj5NVxWuYS0Uws0reTt0h9EPpOWbdLrBwaJssea25YExzsQfr/j/38eN
	 S1xcBHQ8spAOPbzxvKUPseK6BgdhhSzeER9Zk33kudqfDYp/sxtGSL3ctsqUiemsoy
	 OUmnNw8xU5eo14wgwFuxLQpf0a4Ax+n3D0/Uw2xU=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 31 Mar 2026 12:27:33 +0200
Subject: [PATCH v2 03/15] media: rzg2l-cru: Modernize locking usage with
 guards
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-b4-cru-rework-v2-3-f94b238b35d4@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5377;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=sVM6fsVV9v0o37r6Zx0mwuIFdFQHSaVtywq2yH1u6/c=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpy6GnDzSbOP4Yh+T/30y/q1PakaShGS4w8RB9f
 i7AUfdP/vSJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCacuhpwAKCRByNAaPFqFW
 PKJmEACwEIG2a/S3hJCH+HofCwLXTS746tVQ61GuBQKvE5NRtVyFEupe48J3DctBdmKJNpIq9Sa
 HTibygbw7k7cChW6zyztjzQJnt9rZKQoarW06d8Xlq5VkKGxbL0Ql741z4BrFYkmn1xwPKh8x0j
 z8KP2ilZA5XT3w+socPO3iGZMdiEXG6fbqM+Z343qXYOyREeFGTA/DKMHaWVxLhCIxTDPPYz0RK
 0eC+IdPZCKmnyU5CPT8aM89L+Y8C6aGdEOtxDMBmO5+VIgAwTxMYLyVR1RvHw322hicuAfaZLfs
 BIyIr9CHx/dt9wW2e9vF/q34bmewPnbwvFdSZj8whxMTIMBr/k6QS4lfHcRZspiSIGFIu3Ey2wM
 8Uyo95XiiI1JqoQlbGUnqwWoYe/8yeH2ETVcVl28X4YBOBOtN19A2GSOoUdzzmPhMcLUXrtUeRc
 RzA/sejm5kPT61K7ilrXy+ldvy3X0PZuiJiiPiwLgq4ClWQ0OGrpJ3OK2LptBDXG9hkCt8Nmgiq
 N3SYdNpyVINE9B/DlyoUJqSzIsJSS5Rbddd0loW+5wTm/i1mACieTxnuO8p5FgHRW09jx5O70+T
 gJqiv9IPQ5yy4WVjyvVcGoKaYAOoKiemNW8sw2YbIGroKD6GxSoIil21oXy5h1gcwj6pbpbLy/U
 xRFODZuOIz6ecvA==
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
	TAGGED_FROM(0.00)[bounces-57766-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 865773681A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

Use more modern lock guard constructs to express the locking sequences
in the rzg2l driver. Also include spinlock.h and mutex.h that were
previously missing.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  2 ++
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 31 +++++++---------------
 2 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 3a200db15730..be4a9a4953d1 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -9,7 +9,9 @@
 #define __RZG2L_CRU__
 
 #include <linux/irqreturn.h>
+#include <linux/mutex.h>
 #include <linux/reset.h>
+#include <linux/spinlock.h>
 
 #include <media/v4l2-async.h>
 #include <media/v4l2-dev.h>
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 98b6afbc708d..0739169f4439 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -110,10 +110,10 @@ static void return_unused_buffers(struct rzg2l_cru_dev *cru,
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
@@ -126,7 +126,6 @@ static void return_unused_buffers(struct rzg2l_cru_dev *cru,
 		vb2_buffer_done(&buf->vb.vb2_buf, state);
 		list_del(&buf->list);
 	}
-	spin_unlock_irqrestore(&cru->qlock, flags);
 }
 
 static int rzg2l_cru_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
@@ -165,13 +164,9 @@ static void rzg2l_cru_buffer_queue(struct vb2_buffer *vb)
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
@@ -465,7 +460,6 @@ void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru)
 int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 {
 	struct v4l2_mbus_framefmt *fmt = rzg2l_cru_ip_get_src_fmt(cru);
-	unsigned long flags;
 	u8 csi_vc;
 	int ret;
 
@@ -475,7 +469,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	csi_vc = ret;
 	cru->svc_channel = csi_vc;
 
-	spin_lock_irqsave(&cru->qlock, flags);
+	guard(spinlock_irqsave)(&cru->qlock);
 
 	/* Select a video input */
 	rzg2l_cru_write(cru, CRUnCTRL, CRUnCTRL_VINSEL(0));
@@ -492,7 +486,6 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	/* Initialize image convert */
 	ret = rzg2l_cru_initialize_image_conv(cru, fmt, csi_vc);
 	if (ret) {
-		spin_unlock_irqrestore(&cru->qlock, flags);
 		return ret;
 	}
 
@@ -502,8 +495,6 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	/* Enable image processing reception */
 	rzg2l_cru_write(cru, ICnEN, ICnEN_ICEN);
 
-	spin_unlock_irqrestore(&cru->qlock, flags);
-
 	return 0;
 }
 
@@ -573,16 +564,15 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
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
 
@@ -591,14 +581,14 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
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
@@ -621,7 +611,7 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
 	if (cru->state == RZG2L_CRU_DMA_STARTING) {
 		if (slot != 0) {
 			dev_dbg(cru->dev, "Starting sync slot: %d\n", slot);
-			goto done;
+			return IRQ_RETVAL(handled);
 		}
 
 		dev_dbg(cru->dev, "Capture start synced!\n");
@@ -646,9 +636,6 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
 	/* Prepare for next frame */
 	rzg2l_cru_fill_hw_slot(cru, slot);
 
-done:
-	spin_unlock_irqrestore(&cru->qlock, flags);
-
 	return IRQ_RETVAL(handled);
 }
 

-- 
2.53.0


