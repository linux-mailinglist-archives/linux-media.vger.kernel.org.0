Return-Path: <linux-media+bounces-57300-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNkrHSC9xmnoNwUAu9opvQ
	(envelope-from <linux-media+bounces-57300-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:23:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C55348421
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:23:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CCB7312E35C
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 17:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C053FBEA0;
	Fri, 27 Mar 2026 17:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jZUu3Pf5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EB13FB055;
	Fri, 27 Mar 2026 17:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631458; cv=none; b=ZkNJh34Ac7mSXa4hHOTafC4qSoq367cU0wS4olN40QTP0KHYj2nbrtFeqPLHasHt5H69uX5Ul/vyVqetFBkzvtgsXCepObpnBuI7OQtnjU30FlEWMzf1g90cwne5xwqu4pmKsV8OuXR9nEM0J7h9BSKA7ize+RwxHP5gWAkIHiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631458; c=relaxed/simple;
	bh=iN2Wy6geSH+knCf6TG3v9TkTqs3wsC8eIVZNoXgi0Ac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y8R8fJAE4av9FEmRnD9utH8sEi1BMt+8SHgfkBgUxxtlEZC9lbfhbslC2vddXT8SmZLlQNPhaQ9f83G92DJMEJTcf8LollgHMdbMqgEeI3RDcPMO6bTllL9zfPGUvgvy6ysd4Y7+wVL+pTkgSDDW73VPOY9iB/jSP0hT3Ed73+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jZUu3Pf5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F04803076;
	Fri, 27 Mar 2026 18:09:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774631363;
	bh=iN2Wy6geSH+knCf6TG3v9TkTqs3wsC8eIVZNoXgi0Ac=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jZUu3Pf5E5Ad6usCvlz7iR9Cf6OTiXjgLdEyfqmLq5AyvLVfd4prc58GxruI+snmO
	 9AuHw8CQYvN7soIbZGNIl48Z8+zvGvaANgecSKufm5umCw1cnKSxFyKW4K+/W11sbL
	 13RAPNvK2vBnBbavwpvVOCvM2rITKdo1bDMvNdBc=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 27 Mar 2026 18:10:16 +0100
Subject: [PATCH 11/14] media: rz2gl-cru: Return pending buffers in order
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-b4-cru-rework-v1-11-3b7d0430f538@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5723;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=tXe3D3lbbO6/HkgUeaXe9Bvy9iek0BebayovSWN6yA4=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpxroKCioQmaQZEn09224oaCFUE43UzmphvK9Ve
 6BEje2xk1eJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaca6CgAKCRByNAaPFqFW
 PDzdEADAdwJB+EAVCwYj7qONQl3RNFSCCDqdeGutgNyHTSj4L4do3tNM8VKc6qOXSi6je2GStRo
 9HHsKw1T7JG2N+olYi69xyStTf5NVSP8wjQaR/q0wSAMIl7gYoSmdQXiKy6kMxiwTsc9tSVxeA4
 Aq2fXBsKaJRcnwvZNZSDSyy8cGiZAeeS5dd+shj4K8QY3WJdBDrPD+q3Q7q5rmugOAtC7iGSXha
 UPZl0HWUbBIODYFpmpmHARGBOHThRx7uDW/UXKEIe1uNHvpmb7Kl+02/YFQuzwVHfDCcuvfd8pG
 GKR/TFbOPuQAWuhqcs5Uc4xx7rP2N54WP7yWLaCfLNX1JdNoB372zZXCPN00qfpmDB2MJqtolxQ
 ClG1sKeJd1lW+Guut07SIfcLVhJANiqfSc5YoE56ZCRR+LDutqKmT5ZD1sfqGFSReeUEByirDdl
 bSjaUVuDpXBP9hSj4oZnSa9sZWuLloXk97vCh2jCgw1FtLv38KrOUr5GuIDQeSFStxkkzLIEPas
 QaCuvqmaSotIAMCZpU7960i1eJWhw2v1mb+d5IG7Ia+COxUrbfa4ZeDtZ3PlKzkpyhsTxtJU50W
 1WWpwvhFwejB7C00g8Rk/P5HbdX2N16DFYz90gfeXz9MYJjOMZnyGOXv/+M0DbIniB4Qq8+btlw
 pqmGlHMDf6V3gvw==
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
	TAGGED_FROM(0.00)[bounces-57300-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: F3C55348421
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
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 68 +++++++++++++++-------
 1 file changed, 47 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 17e0153052e1..a6b606c63f90 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -43,6 +43,24 @@ struct rzg2l_cru_buffer {
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
@@ -106,28 +124,36 @@ __rzg2l_cru_read_constant(struct rzg2l_cru_dev *cru, u32 offset)
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
@@ -591,16 +617,16 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
 
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
@@ -669,7 +695,7 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
 	}
 
 	slot = cru->active_slot;
-	cru->active_slot = (cru->active_slot + 1) % cru->num_buf;
+	cru->active_slot = rzg2l_cru_slot_next(cru, cru->active_slot);
 
 	dev_dbg(cru->dev, "Current written slot: %d\n", slot);
 	cru->buf_addr[slot] = 0;
@@ -743,7 +769,7 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
 	cru->scratch = dma_alloc_coherent(cru->dev, cru->format.sizeimage,
 					  &cru->scratch_phys, GFP_KERNEL);
 	if (!cru->scratch) {
-		return_unused_buffers(cru, VB2_BUF_STATE_QUEUED);
+		rzg2l_cru_return_buffers(cru, VB2_BUF_STATE_QUEUED);
 		dev_err(cru->dev, "Failed to allocate scratch buffer\n");
 		ret = -ENOMEM;
 		goto assert_presetn;
@@ -751,7 +777,7 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
 
 	ret = rzg2l_cru_set_stream(cru, 1);
 	if (ret) {
-		return_unused_buffers(cru, VB2_BUF_STATE_QUEUED);
+		rzg2l_cru_return_buffers(cru, VB2_BUF_STATE_QUEUED);
 		goto out;
 	}
 
@@ -788,7 +814,7 @@ static void rzg2l_cru_stop_streaming_vq(struct vb2_queue *vq)
 	dma_free_coherent(cru->dev, cru->format.sizeimage,
 			  cru->scratch, cru->scratch_phys);
 
-	return_unused_buffers(cru, VB2_BUF_STATE_ERROR);
+	rzg2l_cru_return_buffers(cru, VB2_BUF_STATE_ERROR);
 
 	reset_control_assert(cru->presetn);
 	clk_disable_unprepare(cru->vclk);

-- 
2.53.0


