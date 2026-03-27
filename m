Return-Path: <linux-media+bounces-57301-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNaALLO9xmnoNwUAu9opvQ
	(envelope-from <linux-media+bounces-57301-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:26:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA23348508
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:26:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 236663041BCD
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 17:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5703378D9F;
	Fri, 27 Mar 2026 17:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IvS+Gw28"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0AC3FB7EB;
	Fri, 27 Mar 2026 17:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631459; cv=none; b=X2m/pondBa2qSf0Lq4ZLR9fE4E21nO3ihHMdfunNQ6HeXguxG/ZPVqaXNexIZdjlD1Tw1TYgpBIvunT+BC9kY/IyayT6PJ4ZnRAlN8IAghdZAmukI/WvlPJFbS76cg/4a+DL2lszfU6Ai7uUtmCnM5EWIbx4H0KY6JXpEl36/sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631459; c=relaxed/simple;
	bh=stnYVSqBIs3TCyw3XnxM+KWKwzzvVsoFPE1+nZnHlY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cKEq1om7i55Pl6zn/pnx5DKR4tpLHDgOa1NR8n0fAsxkas8Ga7hVzwIoGme6rBvtZff78gzqo0jddpeYlGaXF/tBZf4dcLEL2gopFTVak+XtI6n9t4fwFnxWwnSK+IBJQveY3y3SSC6Nn5oNHwXGARrKt07HLLT15rsV577uCHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IvS+Gw28; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91FCB307F;
	Fri, 27 Mar 2026 18:09:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774631364;
	bh=stnYVSqBIs3TCyw3XnxM+KWKwzzvVsoFPE1+nZnHlY0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IvS+Gw28St5nn1kmeCR6uCZsfOchivkT+trRBn5vHasU+EQBkGIV8BhlzBbXGnk/C
	 Cg0+CJhsm/bbLUeLSTMOjo9aHdRDpmXuSWlhSfYBPG8dLVCB9i0y66IP8RmDEIPnIl
	 IJvm0FKm1isSb+50zo3Uf1mv7GOz9/mB8LmBlWEM=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 27 Mar 2026 18:10:17 +0100
Subject: [PATCH 12/14] media: rzg2l-cru: Rework rzg2l_cru_fill_hw_slot()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-b4-cru-rework-v1-12-3b7d0430f538@ideasonboard.com>
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
 Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4915;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=y/KNXji9b3BMk21cTyXg4JVTlo63mcVF5HC/4y5ov2Y=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpxroKUnwMmKOV3cwFF5zqtNf5GxhNKsgor6OeD
 e8IJfcVt7WJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaca6CgAKCRByNAaPFqFW
 POaRD/9jpXM0xYqYQDQUriFgnVaIDnvgFSL/46U4sho3u/zWCU0mYnjMsJT6QPG/RRKMxkyY11x
 forv50kpcfKon8FZQ2T0hFNUC4owMI6/0A374AmK/Ora2MO/lezgrYMncxLXQJ/cwXdV82jrjZl
 3XkjPbKflqa5HA+VrMXpEKAYYJdSwH3+9GjzDVANi7zlBfLgt1dOBO+qoexBwqVv5v3izyOvy0u
 56/HU2SKR2aI3kdeuk0xU7/uq2nLp7KaKHvA4nFQ3T4FbKb+SSqkpTZYYMj3rk/LK/6TBvX3iWO
 wN2itGPy6HwrKvZVUzFRujow7OYOkMoW4jNQQwHdJam1w+6GtHLEkWpBzYY4QX5VjwiG8IrQZqU
 VfvGT5b1IY9MQsrF5LF7vxmxtBsx/xlA+7Qfo6ytcMAJ7b0OBJPfiYNGl+kz26FemXuDO49ocs4
 8sKGg3rQhP6PwsdF9sj86wdoRPFlLX+8B/ZE17rZAInpb/+R5uOkt3pfXyYj3gNXiHz6aVQA3pH
 Pj5bNRZ5o8LJHyVaBLcqrKU0qCx36fGKGfuQAI7jmCtUgYWXH9sedcGEvR0TuiZNZ3XAyayN4/q
 rkHy/HQO1xzuyZOSqn5zUlXAH07pe0EWtJHQgFImDdQ0M0Qhuv6L+vgK0YIz2oku6hdW4fFIARG
 RkNPw8EwiXk4Bhg==
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
	TAGGED_FROM(0.00)[bounces-57301-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,protonmail.com,bp.renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
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
X-Rspamd-Queue-Id: 0BA23348508
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
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 62 ++++++++++++----------
 1 file changed, 35 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index a6b606c63f90..45b58e2183bf 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -215,49 +215,52 @@ static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru,
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
 
 	lockdep_assert_held(&cru->hw_lock);
 
-	/* A already populated slot shall never be overwritten. */
-	if (WARN_ON(cru->queue_buf[slot]))
-		return;
+	/* Find the next slot which hasn't a valid address programmed. */
+	for_each_cru_slot_from(cru, next_slot, slot) {
+		if (cru->queue_buf[next_slot])
+			continue;
 
-	dev_dbg(cru->dev, "Filling HW slot: %d\n", slot);
+		scoped_guard(spinlock_irqsave, &cru->qlock) {
+			buf = list_first_entry_or_null(&cru->buf_list,
+						       struct rzg2l_cru_buffer, list);
+			if (buf)
+				list_del_init(&buf->list);
+		}
 
-	guard(spinlock)(&cru->qlock);
+		if (!buf) {
+			/* Direct frames to the scratch buffer. */
+			phys_addr = cru->scratch_phys;
+			cru->queue_buf[next_slot] = NULL;
+			rzg2l_cru_set_slot_addr(cru, next_slot, phys_addr);
+			return;
+		}
 
-	if (list_empty(&cru->buf_list)) {
-		cru->queue_buf[slot] = NULL;
-		phys_addr = cru->scratch_phys;
-	} else {
-		/* Keep track of buffer we give to HW */
-		buf = list_entry(cru->buf_list.next,
-				 struct rzg2l_cru_buffer, list);
 		vbuf = &buf->vb;
-		list_del_init(to_buf_list(vbuf));
-		cru->queue_buf[slot] = vbuf;
-
-		/* Setup DMA */
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
@@ -266,8 +269,14 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
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
@@ -698,7 +707,6 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
 	cru->active_slot = rzg2l_cru_slot_next(cru, cru->active_slot);
 
 	dev_dbg(cru->dev, "Current written slot: %d\n", slot);
-	cru->buf_addr[slot] = 0;
 
 	/*
 	 * To hand buffers back in a known order to userspace start

-- 
2.53.0


