Return-Path: <linux-media+bounces-57773-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGXbH6Wjy2kUJwYAu9opvQ
	(envelope-from <linux-media+bounces-57773-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:36:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E99A1368143
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A6A230EF4BB
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0094F3F65FB;
	Tue, 31 Mar 2026 10:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CmOsHh9m"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B86E3F54A4;
	Tue, 31 Mar 2026 10:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952891; cv=none; b=WQ2FxWHJuIBKOjDmwP64j+0FSL7HmRFeuWfs6tfF90RjrPy4/wRDdUKxZDmp5PDKWkVqyhcA8y672JalJgxkalIlY2+sVGAGeWMQJgPb1jgPqYCk4+5xuW8jCZ5TEe7Eov5FuUCh37Hd4KYpvBpUU49WIuTcl8NAaYb13HX8s/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952891; c=relaxed/simple;
	bh=qf2g31u0bwndi66xXFxx/Ola4B6Cn4PwKIM7cuvAdwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h5psKo992CvknllZkKv0r+PLXSUsgxdOOd5fARsl06idun1bnJVcSJQG6o7NigH3s9eZQ6z25Kql2RnvPwMZkbnkr3Ez2pr/O2IjRctpGTBAIkQxr4I/rzJ3FsHA4vuGJC8yCneJfqFJ7XZ5ztItZo6U0aYPWoUUcUB8lOWbXDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CmOsHh9m; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DFD97244D;
	Tue, 31 Mar 2026 12:26:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774952799;
	bh=qf2g31u0bwndi66xXFxx/Ola4B6Cn4PwKIM7cuvAdwQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CmOsHh9m2Nlyfl0gHLXBPcDwx/z0LTvsaMl1kw1RkQvQGNr2JUIqoyfYQqpnoNUGH
	 0JghC3cNu1w75vJDKHeYTdSdTMLQ1U7GS6CRABsGQxo+K3sh3EIv6P0yj+Zlj0/Y6x
	 rrhnKmmV8Uv6TAqtEPGVhNBOQGaNKRwlOQ+2I0GA=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 31 Mar 2026 12:27:40 +0200
Subject: [PATCH v2 10/15] media: rzg2l-cru: Manually track active slot
 number
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-b4-cru-rework-v2-10-f94b238b35d4@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4125;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=m18J3ltumDy3/Y8d2cVSeJ5oXxXGhI1khmxc8wX8oLs=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpy6Go182ZGIhwgGHPJTW/t5PlAJ8CAWk0Vkj2U
 TlyiKah4ImJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCacuhqAAKCRByNAaPFqFW
 PJKZD/9hzzFdxisXpgSZaUT7zKFqo2J1li92mpcLBZITZVzDQxpkQ3+Z+8kQyKM9fQdaLn1vFT8
 QRHXqgcblTKIPzG5Qw1TJB1x9CrgpxCETSO6NqDJKy0rZJYhw73uwVhNNKXD/1WB4vXo8aXTAbr
 m6Cp5I4DlE6m1N+Z5AAlrOzZYtHkKkPZsJ8PSwf1y7ihzDAfg7NYlsDjzRbuJ7ilYNvNSAZ3QOm
 /6XaQImYeuNpcD6Uo6Ed01tJaXNbakpq5IdkeZIVDvIpMjMHl0hjuFmZ1L2k7HRlUJ50+x+FF7D
 JRSFfFQ3l0ucKcBu2ETXjQOQHn9qNwJCGd23jIkbEqHNsSKgRynaPGMMfpMzQCAo3LRlkSC2oJz
 lMPgGOlu11fdC6yUMMG4h7wUBHv0oiZJAn5mrXYSAm0AV6gspRFD4Q++YWEhU5EK6du5yech40x
 byUeSXwOn31Ic1OGOcdJMyRQdPynMjFjmI3H9RqsvT67ux0hgyk5T9t+g6gTock60qLdgtf3GAC
 Th67042xGtlyl1P+DSiKoL/9+29wzKtdQ1jVdnXsiRztLyWeP/n9lov3F/MNRJzYhFc5quSInEs
 D8WlVH9jmbel3rmM7Hax4Pqq0gWjmNCQSsxiYjChjf2lZZgkPU6tEjqgxTiaoUlhi1IBBCdR0JD
 Po9HCp+voZB+PQQ==
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
	TAGGED_FROM(0.00)[bounces-57773-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: E99A1368143
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

The CRU cycles over the hardware slots where the destination address for
the next frame has to be programmed.

The RZ/G2L version of the IP has a register that tells which is the
last used slot by the hardware but, unfortunately, such register is not
available on RZ/G3E and RZ/V2H(P).

The driver currently compares the value of the AMnMADRSL/H register
which report "the memory address which the current video data was
written to" and compares it with the address programmed in the slots.

This heuristic requires a bit of book keeping and proper locking. As the
driver handles the FrameEnd interrupt, it's way easier to keep track
of the slot that has been used by ourselves with a driver variable.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  6 +++--
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 31 +++-------------------
 2 files changed, 7 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 12d574182eb8..25f17069585c 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -119,9 +119,10 @@ struct rzg2l_cru_info {
  * @mdev_lock:		protects the count, notifier and csi members
  * @pad:		media pad for the video device entity
  *
- * @hw_lock:		protects the slot counter, hardware programming of
- *			slot addresses and the @buf_addr[] list
+ * @hw_lock:		protects the @active_slot counter, hardware programming
+ *			of slot addresses and the @buf_addr[] list
  * @buf_addr:		Memory addresses where current video data is written
+ * @active_slot:	The slot in use
  *
  * @lock:		protects @queue
  * @queue:		vb2 buffers queue
@@ -162,6 +163,7 @@ struct rzg2l_cru_dev {
 
 	spinlock_t hw_lock;
 	dma_addr_t buf_addr[RZG2L_CRU_HW_BUFFER_DEFAULT];
+	unsigned int active_slot;
 
 	struct mutex lock;
 	struct vb2_queue queue;
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 5769dbcbd084..b02940369a18 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -634,31 +634,6 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
 	return IRQ_RETVAL(handled);
 }
 
-static int rzg3e_cru_get_current_slot(struct rzg2l_cru_dev *cru)
-{
-	u64 amnmadrs;
-	int slot;
-
-	/*
-	 * When AMnMADRSL is read, AMnMADRSH of the higher-order
-	 * address also latches the address.
-	 *
-	 * AMnMADRSH must be read after AMnMADRSL has been read.
-	 */
-	amnmadrs = rzg2l_cru_read(cru, AMnMADRSL);
-	amnmadrs |= (u64)rzg2l_cru_read(cru, AMnMADRSH) << 32;
-
-	/* Ensure amnmadrs is within this buffer range */
-	for (slot = 0; slot < cru->num_buf; slot++) {
-		if (amnmadrs >= cru->buf_addr[slot] &&
-		    amnmadrs < cru->buf_addr[slot] + cru->format.sizeimage)
-			return slot;
-	}
-
-	dev_err(cru->dev, "Invalid MB address 0x%llx (out of range)\n", amnmadrs);
-	return -EINVAL;
-}
-
 irqreturn_t rzg3e_cru_irq(int irq, void *data)
 {
 	struct rzg2l_cru_dev *cru = data;
@@ -690,9 +665,8 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
 		return IRQ_HANDLED;
 	}
 
-	slot = rzg3e_cru_get_current_slot(cru);
-	if (slot < 0)
-		return IRQ_HANDLED;
+	slot = cru->active_slot;
+	cru->active_slot = (cru->active_slot + 1) % cru->num_buf;
 
 	dev_dbg(cru->dev, "Current written slot: %d\n", slot);
 	cru->buf_addr[slot] = 0;
@@ -769,6 +743,7 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
 		goto assert_presetn;
 	}
 
+	cru->active_slot = 0;
 	cru->sequence = 0;
 
 	ret = rzg2l_cru_set_stream(cru, 1);

-- 
2.53.0


