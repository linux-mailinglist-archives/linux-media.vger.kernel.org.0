Return-Path: <linux-media+bounces-57775-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MP1ZHgiky2mTJwYAu9opvQ
	(envelope-from <linux-media+bounces-57775-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:38:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BAC3681CF
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DE553099819
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452A73EF0CD;
	Tue, 31 Mar 2026 10:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iQGePsos"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026DF3EC2FD;
	Tue, 31 Mar 2026 10:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952894; cv=none; b=mBuUac0ksQIXLqo/JAwdCPO4+zOecJ3Ipjtnm2rGjZTtOS4Zu98+3d16PBX3ZP6IWFdf5FxOQM3fJxYQZKOuNm4nF86sYcsRyk6T5++hajg55Pt/BlD9zI6Ygdyfswea5eitJr1ZXnZq1PZV+pcF13b5Hh7v4yCWgNNGs53r1VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952894; c=relaxed/simple;
	bh=OoieGw6jzWNZjHjstsNnv/QsL4XDmWs/j7EO8XzjtSo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JS1hadBd8prfwToBr81cxxgpUluDnCoEQQvmFb6q2zTfbSly6G1dxHPBbKxaSk4FzKpCSDXMrW2cLvYDe95CK7lTXENnWNyoDAxwZEi4kgsS89PS1M28M7KFUjAlIpnhmHvWe/vgze8/98LDFoaZ4Y7ultL9a9JffHgnGUTaPDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iQGePsos; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98B0D2450;
	Tue, 31 Mar 2026 12:26:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774952800;
	bh=OoieGw6jzWNZjHjstsNnv/QsL4XDmWs/j7EO8XzjtSo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iQGePsoslXEfV9B6gn1ETnNOOkDFNWbO3xG5SNN1u9T9iUjP4Jbb47dVXL5erq8n1
	 T5q/hWPUnX4O03JNyXYiO6Oev4FPOAqS4yC+S6lJqjoOlHPw25e2xHL696ua0k5Bo7
	 i5ckkcL5neZGkYyn7c9AtEoL4XU/Dn9j+jfRY0go=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 31 Mar 2026 12:27:41 +0200
Subject: [PATCH v2 11/15] media: rz2gl-cru: Return pending buffers in order
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-b4-cru-rework-v2-11-f94b238b35d4@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5845;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=A1FzSvYw84JOw3sSlYJVCkdw3sLrXGqFAB1yi5yUc3I=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpy6Go1zOuIloedcTIvyR5AgDpl0oGZIEbtnsU6
 nE4JdnWgnCJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCacuhqAAKCRByNAaPFqFW
 PFL0EACR4FfZHLbd4Csa8W8W8eHjDhRMWxGfg7EE2Kx0rY+C7bQtT4WgwcZ2euuR9qTU7zaoNKf
 Ib+vUwcNYuLxeLbbnSzEHsDUlDihex3vIGlKudxCwswAaGWiA5b/xVcbP0zhgvcX5IcUd1HD0RE
 TzsG6oezx/3mqiC/Xu62u6An8CD92+c74SiGUpnqm4vAeMvHI5mXXpI2jWYyb0Tg/ap8ggwNrf/
 WNiI8nImHraBblvdp6bBdHVgTqUSHpTJOxbp/s1k6UEhSiILG02V5Xv7nPRCIA3QB4Cju1S7QkX
 RQjj1dyAqdpa/MAJ7pqoabafAPtSvMKxyMTLdoj4qODM1R9ujs8tzCCSJPi+3UitYmWpr+fJedh
 z6BvkhiZw9oxPvyKnQb3zL7KA2Rfz/i0kbj9sEUVpTIK+MxvyB9QXXLkYYp4YwZ7BCqzVeO2nqA
 wbXAK2PzblX0mpdHKq3H0wR5uhXQLgI/thH/lsRU0UNY1fgdWAhmR2rQ12dbG/ls4YR8gbB8/11
 F5UyZ9I905ULU1HZ/uu1mrcVYVgUfMDhwydUYIuGdQBgyOP6p+nhAEjmnd4culYdKRdJUwXPXbW
 MBOzMsqHftawFOn0t6eokeQXm14MgNG+0UnPKjOL/Xr1n9CCdJUbFukRCGCqfoUWPLN++0821SZ
 RoO4mPx02EBVMeg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57775-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C0BAC3681CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

Buffers are programmed into slots in queueing order.

When returning pending buffers we can't simply start from the first slot
but we should actually iterate slots starting from the one is use. The
rzg3e_cru_irq() handler already uses 'active_slot', make rzg2l_cru_irq()
use it as well to know where to start iterating from.

As the pattern of iterating over slots in order will be used for slots
programming in the next patches, provide an helper macro to do that.

While at it, rename return_unused_buffers() to rzg2l_cru_return_buffers().

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 68 +++++++++++++++-------
 1 file changed, 47 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index b02940369a18..a5197196a408 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -42,6 +42,24 @@ struct rzg2l_cru_buffer {
 #define to_buf_list(vb2_buffer) \
 	(&container_of(vb2_buffer, struct rzg2l_cru_buffer, vb)->list)
 
+/*
+ * The CRU hardware cycles over its slots when transferring frames. All drivers
+ * structure that contains programming data for the slots, such as the memory
+ * destination addresses have to be iterated as they were circular buffers.
+ *
+ * Provide here utilities to iterate over slots and the associated data.
+ */
+static inline unsigned int rzg2l_cru_slot_next(struct rzg2l_cru_dev *cru,
+					       unsigned int slot)
+{
+	return (slot + 1) % cru->num_buf;
+}
+
+/* Start cycling on cru slots from the one after 'start'. */
+#define for_each_cru_slot_from(cru, slot, start)			\
+	for (slot = rzg2l_cru_slot_next(cru, start);			\
+	     slot != start; slot = rzg2l_cru_slot_next(cru, slot))
+
 /* -----------------------------------------------------------------------------
  * DMA operations
  */
@@ -105,28 +123,36 @@ __rzg2l_cru_read_constant(struct rzg2l_cru_dev *cru, u32 offset)
 	 __rzg2l_cru_read_constant(cru, offset) : \
 	 __rzg2l_cru_read(cru, offset))
 
-static void return_unused_buffers(struct rzg2l_cru_dev *cru,
-				  enum vb2_buffer_state state)
+static void rzg2l_cru_return_buffers(struct rzg2l_cru_dev *cru,
+				     enum vb2_buffer_state state)
 {
 	struct rzg2l_cru_buffer *buf, *node;
-	unsigned int i;
 
 	scoped_guard(spinlock_irq, &cru->hw_lock) {
-		for (i = 0; i < cru->num_buf; i++) {
-			if (cru->queue_buf[i]) {
-				vb2_buffer_done(&cru->queue_buf[i]->vb2_buf,
-						state);
-				cru->queue_buf[i] = NULL;
-			}
+		/* Return the buffer in progress first, if not completed yet. */
+		unsigned int slot = cru->active_slot;
+
+		if (cru->queue_buf[slot]) {
+			vb2_buffer_done(&cru->queue_buf[slot]->vb2_buf, state);
+			cru->queue_buf[slot] = NULL;
 		}
-	}
 
-	scoped_guard(spinlock_irq, &cru->qlock) {
-		list_for_each_entry_safe(buf, node, &cru->buf_list, list) {
-			vb2_buffer_done(&buf->vb.vb2_buf, state);
-			list_del(&buf->list);
+		/* Return all the pending buffers after the active one. */
+		for_each_cru_slot_from(cru, slot, cru->active_slot) {
+			if (!cru->queue_buf[slot])
+				continue;
+
+			vb2_buffer_done(&cru->queue_buf[slot]->vb2_buf, state);
+			cru->queue_buf[slot] = NULL;
 		}
 	}
+
+	guard(spinlock_irq)(&cru->qlock);
+
+	list_for_each_entry_safe(buf, node, &cru->buf_list, list) {
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+		list_del(&buf->list);
+	}
 }
 
 static int rzg2l_cru_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
@@ -588,16 +614,16 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
 
 	/* Prepare for capture and update state */
 	amnmbs = rzg2l_cru_read(cru, AMnMBS);
-	slot = amnmbs & AMnMBS_MBSTS;
+	cru->active_slot = amnmbs & AMnMBS_MBSTS;
 
 	/*
 	 * AMnMBS.MBSTS indicates the destination of Memory Bank (MB).
 	 * Recalculate to get the current transfer complete MB.
 	 */
-	if (slot == 0)
+	if (cru->active_slot == 0)
 		slot = cru->num_buf - 1;
 	else
-		slot--;
+		slot = cru->active_slot - 1;
 
 	/*
 	 * To hand buffers back in a known order to userspace start
@@ -666,7 +692,7 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
 	}
 
 	slot = cru->active_slot;
-	cru->active_slot = (cru->active_slot + 1) % cru->num_buf;
+	cru->active_slot = rzg2l_cru_slot_next(cru, cru->active_slot);
 
 	dev_dbg(cru->dev, "Current written slot: %d\n", slot);
 	cru->buf_addr[slot] = 0;
@@ -737,7 +763,7 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
 	cru->scratch = dma_alloc_coherent(cru->dev, cru->format.sizeimage,
 					  &cru->scratch_phys, GFP_KERNEL);
 	if (!cru->scratch) {
-		return_unused_buffers(cru, VB2_BUF_STATE_QUEUED);
+		rzg2l_cru_return_buffers(cru, VB2_BUF_STATE_QUEUED);
 		dev_err(cru->dev, "Failed to allocate scratch buffer\n");
 		ret = -ENOMEM;
 		goto assert_presetn;
@@ -748,7 +774,7 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
 
 	ret = rzg2l_cru_set_stream(cru, 1);
 	if (ret) {
-		return_unused_buffers(cru, VB2_BUF_STATE_QUEUED);
+		rzg2l_cru_return_buffers(cru, VB2_BUF_STATE_QUEUED);
 		goto out;
 	}
 
@@ -785,7 +811,7 @@ static void rzg2l_cru_stop_streaming_vq(struct vb2_queue *vq)
 	dma_free_coherent(cru->dev, cru->format.sizeimage,
 			  cru->scratch, cru->scratch_phys);
 
-	return_unused_buffers(cru, VB2_BUF_STATE_ERROR);
+	rzg2l_cru_return_buffers(cru, VB2_BUF_STATE_ERROR);
 
 	reset_control_assert(cru->presetn);
 	clk_disable_unprepare(cru->vclk);

-- 
2.53.0


