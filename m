Return-Path: <linux-media+bounces-57774-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APzyJK2jy2kUJwYAu9opvQ
	(envelope-from <linux-media+bounces-57774-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:36:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33137368160
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F15130D3E4A
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB5C3F7897;
	Tue, 31 Mar 2026 10:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AFYRF9lu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B423EF0C5;
	Tue, 31 Mar 2026 10:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952894; cv=none; b=kJs56cjN9IOsJid+xpqKElEBwWd7503JryV5H3jSic3EMU9al2n+F9ElWFCX8K5qtAfxZw/vJ9muCOdQy7fsc09ZsZyJbtotEhHenKLzC4hO91SPQM+90y098sZMTd4qMa+CrOtaROlbwV2M/gORaStAsMUcs02ICqmyGqqZ+Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952894; c=relaxed/simple;
	bh=zYg4t0QFqfPk2VEUXQT0ER5wde86B1SGB4VqvUVTbsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VlorXqm+RCdHO5VHfTHXA8YqleDVaTrCVdymB6H4ieCW5ZwE5l2dbg+QBNtx2N5glSVDkAca6jtYICVZjt2wbA7y0usnELk3pdskxDNZJD/p7x5QPGYCaEQ6E1iKuEREffQLv1rswwByDsVwkLLAkI3qIjsf1hBNzF3U6+jhPQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AFYRF9lu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 543D22451;
	Tue, 31 Mar 2026 12:26:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774952800;
	bh=zYg4t0QFqfPk2VEUXQT0ER5wde86B1SGB4VqvUVTbsI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AFYRF9lupazcQqRFnP69ibqx/oMe4UzZAZgIYcQvkN/LG70jYog0MPXawFLWu6k+6
	 1CP7LQl/zNQcOk+a/03Cxq1N/rmQYeXYHLQVHjk+TaJM20d50TdBuPZrGDYfUgqNvC
	 67zZ/E52mV8wkRax1bpllUOn0Nsnhbp+h5Hw/Dio=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 31 Mar 2026 12:27:42 +0200
Subject: [PATCH v2 12/15] media: rzg2l-cru: Rework rzg2l_cru_fill_hw_slot()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-b4-cru-rework-v2-12-f94b238b35d4@ideasonboard.com>
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
 Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4933;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=f5fTjpSCrbaWr/zOJLhzz9RqGJBdVk0RDnNW9WYx95w=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpy6GosxoxF8mNIsHRghxzX7kJg8213QQ9LJCKy
 HQu1ezeQR2JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCacuhqAAKCRByNAaPFqFW
 PL2rEACjdZFRKHltK4TPwqjMXWiihYbWzBT5q7vcByvQgcwv57uEn1sZjxyG1MuutPr/Tu9J2z3
 Xxa8BJeIdPGzb0nbv7bahhxI3IQvGdVAggAKeXlLD6M5tzKD0DGRGgSMvP+4DU/bqlEWQ+F7dTc
 QO9YM21v531h9mSz7KKTxL60PT8B503B0fclp08aWKJjktPAUIQZC7gkNH4/c+3VgWi9g1U0W3H
 lMKUaY7pH0YsVnni+QiHsegBQucfIRJCPuigFFC3AsgIGgn1o3OgGiDTH4UaWgXw4gGBGaR6Y8P
 mIBCR7nXX0BDIHjzwZH+H+skxdXL28RYb0MPktwVBeqFQoVsx/BI4gcvxwUYisorVMLLlhg9KVZ
 WNys6HszCu8osBrG2vQRevikukR56L87834Vp/xy3rxlwHgUbB2VyLnUNxbtQxeH7OyPZTErpF8
 s/+Zd3xyatoaShohh2Rgr1INsY6SpFZml0iiqgqG5N4dYPC9wybuU7/sGZYBdvPFB9eXU+omWtZ
 oLD4DxsUYIvFt/LaHHcdkyK1JZJ4dHQelmqcpFx43H43vkkQsrG+FvUXRES5zHa+tQo4D8I5nGl
 cPraMOJlaBFhFFA7lAcRyo8degWOs3TMWMOLY1QEeWD+z+btyDGkjNUbQG6L+kWyrTwQ9lEv6oe
 9WC09/C+cv15FjQ==
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
	TAGGED_FROM(0.00)[bounces-57774-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,protonmail.com,bp.renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 33137368160
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Daniel Scally <dan.scally+renesas@ideasonboard.com>

The current implementation of rzg2l_cru_fill_hw_slot() results in the
artificial loss of frames. At present whenever a frame-complete IRQ
is received the driver fills the hardware slot that was just written
to with the address of the next buffer in the driver's queue. If the
queue is empty, that hardware slot's address is set to the address of
the scratch buffer to enable the capture loop to keep running. There
is a minimum of a two-frame delay before that slot will be written to
however, and in the intervening period userspace may queue more
buffers which could be used.

To resolve the issue rework rzg2l_cru_fill_hw_slot() so that it
iteratively fills all slots from the queue which currently do not
have a buffer assigned, until the queue is empty. The scratch
buffer is only resorted to in the event that the queue is empty and
the next slot that will be written to does not already have a buffer
assigned.

Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 64 +++++++++++++---------
 1 file changed, 37 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index a5197196a408..f061bee51ea8 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -214,47 +214,52 @@ static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru,
 }
 
 /*
- * Moves a buffer from the queue to the HW slot. If no buffer is
- * available use the scratch buffer. The scratch buffer is never
- * returned to userspace, its only function is to enable the capture
- * loop to keep running.
+ * Move as many buffers as possible from the queue to HW slots If no buffer is
+ * available use the scratch buffer. The scratch buffer is never returned to
+ * userspace, its only function is to enable the capture loop to keep running.
+ *
+ * @cru: the CRU device
+ * @slot: the slot that has just completed
  */
 static void rzg2l_cru_fill_hw_slot(struct rzg2l_cru_dev *cru, int slot)
 {
-	struct vb2_v4l2_buffer *vbuf;
 	struct rzg2l_cru_buffer *buf;
+	struct vb2_v4l2_buffer *vbuf;
+	unsigned int next_slot;
 	dma_addr_t phys_addr;
 
-	/* A already populated slot shall never be overwritten. */
-	if (WARN_ON(cru->queue_buf[slot]))
-		return;
+	lockdep_assert_held(&cru->hw_lock);
 
-	dev_dbg(cru->dev, "Filling HW slot: %d\n", slot);
+	/* Find the next slot which hasn't a valid address programmed. */
+	for_each_cru_slot_from(cru, next_slot, slot) {
+		if (cru->queue_buf[next_slot])
+			continue;
 
-	guard(spinlock)(&cru->qlock);
+		scoped_guard(spinlock_irqsave, &cru->qlock) {
+			buf = list_first_entry_or_null(&cru->buf_list,
+						       struct rzg2l_cru_buffer, list);
+			if (buf)
+				list_del_init(&buf->list);
+		}
 
-	if (list_empty(&cru->buf_list)) {
-		cru->queue_buf[slot] = NULL;
-		phys_addr = cru->scratch_phys;
-	} else {
-		/* Keep track of buffer we give to HW */
-		buf = list_entry(cru->buf_list.next,
-				 struct rzg2l_cru_buffer, list);
-		vbuf = &buf->vb;
-		list_del_init(to_buf_list(vbuf));
-		cru->queue_buf[slot] = vbuf;
+		if (!buf) {
+			/* Direct frames to the scratch buffer. */
+			phys_addr = cru->scratch_phys;
+			cru->queue_buf[next_slot] = NULL;
+			rzg2l_cru_set_slot_addr(cru, next_slot, phys_addr);
+			return;
+		}
 
-		/* Setup DMA */
+		vbuf = &buf->vb;
+		cru->queue_buf[next_slot] = vbuf;
 		phys_addr = vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
+		rzg2l_cru_set_slot_addr(cru, next_slot, phys_addr);
 	}
-
-	rzg2l_cru_set_slot_addr(cru, slot, phys_addr);
 }
 
 static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 {
 	const struct rzg2l_cru_info *info = cru->info;
-	unsigned int slot;
 	u32 amnaxiattr;
 
 	/*
@@ -263,8 +268,14 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 	 */
 	rzg2l_cru_write(cru, AMnMBVALID, AMnMBVALID_MBVALID(cru->num_buf - 1));
 
-	for (slot = 0; slot < cru->num_buf; slot++)
-		rzg2l_cru_fill_hw_slot(cru, slot);
+	/*
+	 * Program slot#0 with the first available buffer, if any. Pass to the
+	 * function 'num_buf - 1' as rzg2l_cru_fill_hw_slot() calculates which
+	 * is the next slot to program.
+	 */
+	scoped_guard(spinlock_irq, &cru->hw_lock) {
+		rzg2l_cru_fill_hw_slot(cru, cru->num_buf - 1);
+	}
 
 	if (info->has_stride) {
 		u32 stride = cru->format.bytesperline;
@@ -695,7 +706,6 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
 	cru->active_slot = rzg2l_cru_slot_next(cru, cru->active_slot);
 
 	dev_dbg(cru->dev, "Current written slot: %d\n", slot);
-	cru->buf_addr[slot] = 0;
 
 	/*
 	 * To hand buffers back in a known order to userspace start

-- 
2.53.0


