Return-Path: <linux-media+bounces-57772-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAcnBqWjy2kUJwYAu9opvQ
	(envelope-from <linux-media+bounces-57772-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:36:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE6A368142
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3831730935BB
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E7B3F54D0;
	Tue, 31 Mar 2026 10:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KEYgUoMk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1FE3F23B7;
	Tue, 31 Mar 2026 10:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952891; cv=none; b=nJsQk+wsTYP6aZEOcEzkeToXRkNW2EDTgFR9JAV11ahGl61J1rVQn6tSPE/Q3kgfQSH194V2Q42gnNEdWAqufuMpxQsVIXu4HCh3pafkUYH7U2tX8iY/vvtulvdjo3z8b1eOFdWgrKRF/AzyQO8HC/UyVDV72xDDEGJFjGkqnX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952891; c=relaxed/simple;
	bh=JhuvxZr5sOH3KpmF7NBUOHr84t3EAFBS+blvT4gf1HA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XaMrK1LoCp30agVUOUcZKq5SKHEpiYe2hegfswDxwhJYe0/TXbJZS6mXl/pMEXPfIUWzNgAdpGG38igI33FxzG+pjY1TFBagSojRYcrs5YiusFR7ou7gxBMvt0o0mb767AaJeFPDZe89p4qjgH9g1kPv+UGi41SS4v/ipXSol7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KEYgUoMk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 322EF10D4;
	Tue, 31 Mar 2026 12:26:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774952798;
	bh=JhuvxZr5sOH3KpmF7NBUOHr84t3EAFBS+blvT4gf1HA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KEYgUoMkcCRATyWsWnOP1NgW+/G2Xa9S0G72h5bkuux/A/or0TMmJ2D+FBYcXOIxx
	 Ki+DTfAk0kf8EodlUnGE2zzSZBjLPV6Qi3DNHPKm4JROLlnbpzWca6WG3yQ55n8vxB
	 nUN3twSn9AzO+wNGN0kcOvPdc5xNQegmja2E/fbQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 31 Mar 2026 12:27:39 +0200
Subject: [PATCH v2 09/15] media: rzg2l-cru: Split hw locking from buffers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-b4-cru-rework-v2-9-f94b238b35d4@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2812;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=scr6dlZ/9btOO7noH9KKzQJ8vft4/mEPKUiwqiSn9to=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpy6GoBoiLzHaTKCfZp6UMZ3P/1emKcjg0kBLsx
 ZD3/uLmoTyJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCacuhqAAKCRByNAaPFqFW
 PLw+D/4rDkfzcKD1rX1G9wPGiMT+DA8+b/dZlB6k5EUYls7T1i/9IY5fKJc9LjXur4b0GsYcCuH
 zNs0MrSDgT53WNpSzUPP73Nf8UjuTKiATrFMcdik1Yn5+Zq4y/sgpDdZKftfpVdwUk/BWZ1MWvw
 Ws4NP9JIRneDBkzEmx9LhU3DLFzRld7tLglbZsJkMc1T6fUwsTfb4V/A9FAdTC+IvBaGqMQPPnw
 i6HhJ2vME9TSEMpTmc4nL8GIs9cj8p00C2WtvWAmtb9mabipqVKG/Lfa2DA/5DZB+doRGa5jIHw
 73BHK2r5EHNcyfXR2kc2z2qzs+K7FbiIThprLqrQx1FEQXBniVGdJ4l17N6XJPZxPaxGNEQIyvO
 +3AYHO+qpXMfSLuVJYXUZXzv1JFkX7+qnxntnm8Vwiyd+TZlmL81tO9YJ6jlRNJckGvYfTqCzUc
 8WRE8Zv3cRkid9jqp7q0gtsi1gA4NRSe6ykQ2porvGjeXZpK6ATpcY18IRsrdr3P7BKPQJ6SJLd
 8xL1Hg2HI3wzJsAzRqwBVsqnj4Z8vcrTecdWDJiGx/Xo+0oLSVWDO5XIwI8md4VEbZxvxtkgcra
 XV8GFjHNMJKPL34wh8rKqe4SmoDUhZbYGU6uK4tlJV+EVkahGEGcO6mFX+I1oXZdaexCVTTkZ2A
 Vm89n+GgAHdHh3A==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57772-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7FE6A368142
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

Split the locking between a spinlock dedicated to protect the hardware
slots programming (hw_lock) and one lock (qlock) to protect the queue of
buffers submitted by userspace.

Do not rework the locking strategy yet but start simply by splitting the
locking in two.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 30 ++++++++++++----------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index b6616d54f8a3..5769dbcbd084 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -111,19 +111,21 @@ static void return_unused_buffers(struct rzg2l_cru_dev *cru,
 	struct rzg2l_cru_buffer *buf, *node;
 	unsigned int i;
 
-	guard(spinlock_irq)(&cru->qlock);
-
-	for (i = 0; i < cru->num_buf; i++) {
-		if (cru->queue_buf[i]) {
-			vb2_buffer_done(&cru->queue_buf[i]->vb2_buf,
-					state);
-			cru->queue_buf[i] = NULL;
+	scoped_guard(spinlock_irq, &cru->hw_lock) {
+		for (i = 0; i < cru->num_buf; i++) {
+			if (cru->queue_buf[i]) {
+				vb2_buffer_done(&cru->queue_buf[i]->vb2_buf,
+						state);
+				cru->queue_buf[i] = NULL;
+			}
 		}
 	}
 
-	list_for_each_entry_safe(buf, node, &cru->buf_list, list) {
-		vb2_buffer_done(&buf->vb.vb2_buf, state);
-		list_del(&buf->list);
+	scoped_guard(spinlock_irq, &cru->qlock) {
+		list_for_each_entry_safe(buf, node, &cru->buf_list, list) {
+			vb2_buffer_done(&buf->vb.vb2_buf, state);
+			list_del(&buf->list);
+		}
 	}
 }
 
@@ -203,6 +205,8 @@ static void rzg2l_cru_fill_hw_slot(struct rzg2l_cru_dev *cru, int slot)
 
 	dev_dbg(cru->dev, "Filling HW slot: %d\n", slot);
 
+	guard(spinlock)(&cru->qlock);
+
 	if (list_empty(&cru->buf_list)) {
 		cru->queue_buf[slot] = NULL;
 		phys_addr = cru->scratch_phys;
@@ -341,7 +345,7 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 	unsigned int retries = 0;
 	u32 icnms;
 
-	scoped_guard(spinlock_irq, &cru->qlock) {
+	scoped_guard(spinlock_irq, &cru->hw_lock) {
 		/* Disable and clear the interrupt */
 		cru->info->disable_interrupts(cru);
 	}
@@ -559,7 +563,7 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
 	u32 amnmbs;
 	int slot;
 
-	guard(spinlock_irqsave)(&cru->qlock);
+	guard(spinlock_irqsave)(&cru->hw_lock);
 
 	irq_status = rzg2l_cru_read(cru, CRUnINTS);
 	if (!irq_status)
@@ -661,7 +665,7 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
 	u32 irq_status;
 	int slot;
 
-	guard(spinlock)(&cru->qlock);
+	guard(spinlock)(&cru->hw_lock);
 
 	irq_status = rzg2l_cru_read(cru, CRUnINTS2);
 	if (!irq_status)

-- 
2.53.0


