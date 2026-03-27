Return-Path: <linux-media+bounces-57299-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMpSJr+8xmnoNwUAu9opvQ
	(envelope-from <linux-media+bounces-57299-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:22:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AADA3483E5
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:22:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E726C310E168
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 17:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB0303FAE03;
	Fri, 27 Mar 2026 17:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RPZs3fi6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA203F65FB;
	Fri, 27 Mar 2026 17:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631456; cv=none; b=pCn+TrIJ2SMfwtdaQ0kRSbZjuo3D7fzHr1qe/Rl3IrVSix2beMCWAmE6l/VLBMqg4SU7Bqh5TTpPn2UeCB5EltSKcZfGoDxxu8cEsoYkfdRWbweMDI9mf/KYpAK/v/VEVjlilahfvYofYGH3KXN68GyALtidFeY+8mTGCgmBWBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631456; c=relaxed/simple;
	bh=ceaSnwh8NoSX8ekOEAuahaszMYRXyaQyRiTjVZJgMzA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QEcivTeSDk1tuJWu7EkQfvS4Lf+m4TZs0yc3w7vFXSLL986uJG7fZjuoQnDJPv7vwimzTFXwCWLpm4o6a+rtltJ7GTTDEZLnhfuiW+Cx7AjAAyrlvIjah+BgPKV5wlpQmxdBDAWkmYoc24wfQlFmKnxvCxXeHPeWDuAY9sWwBjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RPZs3fi6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DD0F3064;
	Fri, 27 Mar 2026 18:09:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774631362;
	bh=ceaSnwh8NoSX8ekOEAuahaszMYRXyaQyRiTjVZJgMzA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RPZs3fi6lFIyNsg/wyNa6lhS6VZ3MbF3qzh1hPQTEloA7bbIxM/jWPb176SPBt17W
	 81twPZr2V5h3G7BqL+ocKfXbHhe8JlDXktgbOHE7PQkoXZ10awDQlKvPsclCLqre9L
	 x/U+F49cozUYxnKQ9EdGzpJ+CFeW3tpscn6WoxJE=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 27 Mar 2026 18:10:15 +0100
Subject: [PATCH 10/14] media: rzg2l-cru: Manually track active slot number
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-b4-cru-rework-v1-10-3b7d0430f538@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4536;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=OwCS22/wqDTWTDo8qWv/0SBvFxPmMPCRk9TtT/IQsPk=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpxroKPIG67klLC5uJJ/NgMgN1f49X9AEQB2jAn
 WF72R4nQJmJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaca6CgAKCRByNAaPFqFW
 PEKwD/4wSrS3gA7f3LHQ7gdbhPlCeO2OCBsxmSvBwiyf2zrI/35xVGBwiXhPQzkUxW+pnui+TRg
 /nyGjRVtsBzJJ2b1TDhwlE1Ae9xv023i9aJy5LhEcY23sCyUUGfO3bGkFn9WU1swjnxN29CJC82
 lLyQQ2jlxyfHqlMeP/mhcX5ibmJOinfsRqIyIrPXl4vvm38VGTkMezhzTjfyvFumbb3Ev/KpbYN
 u8c6xYqELZYGySYMxNhsuzz1G1DXkUKWb7DV4fikUNvMZFQBRkbiKdHqU5Gb8urrHjYrhp8HlWs
 H6EnUu1uCg+2dzy8XXHLIkFXodHbtXTQXCNUZEGgV9kMhHrznbKajWSjGKJ9KYuUCwkU7A6xGpp
 HUDMXiDAY4ORb91ptYqjCUWupZKz0zdW3hBxxc/WLsh/yevyuP2ZLgnEE/BY/oUrNRW9gRemMw+
 BMU18AVirfZdSLxcpy+iwOY1ptKi0R2a8rKYltAtd8nah4W4dAzTtek83IlIz5Q0gERlGm8wZkR
 GR4UQWUTfrt499G2zB9CSFhaUAHwC4m1s650D0nu9LB0wovtLiks/nEy1wnkIe5lxIB/jaAT/Va
 1DXYHN0RHg5MPcQw3VLU6Pi2FpBEebBGnZT75ymXcckUjOB/46o/8KGoaHW8xagU7P8dci5nxPP
 XvYr83Mcf1BTTSA==
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
	TAGGED_FROM(0.00)[bounces-57299-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 4AADA3483E5
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
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  7 +++--
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 35 ++++------------------
 2 files changed, 10 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index b46696a0012b..bc66b0c8c15e 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -108,6 +108,7 @@ struct rzg2l_cru_info {
  * @vdev:		V4L2 video device associated with CRU
  * @v4l2_dev:		V4L2 device
  * @num_buf:		Holds the current number of buffers enabled
+ *
  * @svc_channel:	SVC0/1/2/3 to use for RZ/G3E
  * @notifier:		V4L2 asynchronous subdevs notifier
  *
@@ -117,9 +118,10 @@ struct rzg2l_cru_info {
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
@@ -160,6 +162,7 @@ struct rzg2l_cru_dev {
 
 	spinlock_t hw_lock;
 	dma_addr_t buf_addr[RZG2L_CRU_HW_BUFFER_DEFAULT];
+	unsigned int active_slot;
 
 	struct mutex lock;
 	struct vb2_queue queue;
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 9406a089ec9f..17e0153052e1 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -637,31 +637,6 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
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
@@ -693,9 +668,8 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
 		return IRQ_HANDLED;
 	}
 
-	slot = rzg3e_cru_get_current_slot(cru);
-	if (slot < 0)
-		return IRQ_HANDLED;
+	slot = cru->active_slot;
+	cru->active_slot = (cru->active_slot + 1) % cru->num_buf;
 
 	dev_dbg(cru->dev, "Current written slot: %d\n", slot);
 	cru->buf_addr[slot] = 0;
@@ -762,6 +736,9 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
 		goto assert_aresetn;
 	}
 
+	cru->active_slot = 0;
+	cru->sequence = 0;
+
 	/* Allocate scratch buffer */
 	cru->scratch = dma_alloc_coherent(cru->dev, cru->format.sizeimage,
 					  &cru->scratch_phys, GFP_KERNEL);
@@ -772,8 +749,6 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
 		goto assert_presetn;
 	}
 
-	cru->sequence = 0;
-
 	ret = rzg2l_cru_set_stream(cru, 1);
 	if (ret) {
 		return_unused_buffers(cru, VB2_BUF_STATE_QUEUED);

-- 
2.53.0


