Return-Path: <linux-media+bounces-57297-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHgkEu68xmnoNwUAu9opvQ
	(envelope-from <linux-media+bounces-57297-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:22:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5D7348410
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:22:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A1C3300D46D
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 17:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDFF3F7E65;
	Fri, 27 Mar 2026 17:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v/lOC5G2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0003F0740;
	Fri, 27 Mar 2026 17:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631453; cv=none; b=LKDbdvNOB2RdTHdepKMaZvglBnVL/FeHHO6LwBVFSPvLdMVWujye0WuGfYIDkfJS2kFHzJjRFMAdDUGyO2Ec4R0AQSRVrSRJozLprPxKsbjUJ78pFr+TSIW5MoiUwUaMlQsUjHwNPLlxObe42bwHYfoJNRh0Kb73ao2KUGXyc3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631453; c=relaxed/simple;
	bh=cl61fNPJBp++BWHDqrDv1ygEYOHC+TdkZIzydBRn42g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MiA9Jn6sVPTRl46nRaIPHFahYmjquSb1h2NNUjNACxeftdT+oQXhfig1cSyKzcbZ36oBcVho1Z+Ge4Itwno6puGxIPFRHFxH1ImmKonU6OlK4Mc7esMocThyQwB/TJ4khENFJ0HXZMmP8aEF23GJCu/CDsUsKQ8JVb4OLFhBi0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=v/lOC5G2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 229B0305E;
	Fri, 27 Mar 2026 18:09:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774631361;
	bh=cl61fNPJBp++BWHDqrDv1ygEYOHC+TdkZIzydBRn42g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=v/lOC5G2BhSRESFhRQGxB6Fhj0C/cRK7Mxx+DQimC3w2rGDyXBlXZUm3M6xqNLgD7
	 /CtXIEeGe+1/zJuqasOK4YNgxQw/IC6RL3BJnwIMHqBJlL98Bc7tTJWyLE+cYss3hA
	 TkksGesWMU4kPLAGAdI+lBq9b1jgXGgCODeVRPp4=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 27 Mar 2026 18:10:13 +0100
Subject: [PATCH 08/14] media: rz2gl-cru: Introduce a spinlock for hw
 operations
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-b4-cru-rework-v1-8-3b7d0430f538@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2854;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=E2wRecVvgJDLQ31Uuw0vGBwA55sVXQ5VxSxj1NSvhM8=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpxroK2p1jidtOCO7+ln3buUvnn28T5UjBleXhB
 JnHykw7ugKJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaca6CgAKCRByNAaPFqFW
 PMfPEACcy1Qczz8Sy8O1v061ZRR0AFRsJOERIDK8BhLKt/gM7JGlFBVb+efxUopJc53LO9qnOAo
 W/u2IxU0fXKxnTRkN27e/pXhF4/GMuo+Gxfz37VrKa7G81GtW6T7MBwTS8UU1DKcukhx1Wq2+Dd
 m01YKVs4VWXtXShryx6ZA0XT4UhF8wT7YwUWKH76sGyvM7mGAPru3fv3+9BTGH3DDIgEISrCOG2
 lTL3Ga0lSAC5BG94gA81pS28NvAW6hJGsAVaZRWdMXj7Qo32J88Tb2BmlmsI/r/u+MnHNFcr3Qd
 B5LbkXCmZObaYwtQHbgYja2iJNqA8rEukSE10F9jHTWb144FOuXWNV5hCGqrlhVkjDLWqPcY4eP
 fMKNN+QWsyyFueCBaQIXs68VARczIEYw4B56AxijWRn9RwWAoaWuvswqY2oSbPVPK3tc4IlBVyE
 7wS1rIDHrRru9z9J4zaomQBq8muqyrlQhNulM0GIP2kczYSVAy6fLAyTkYCIOFVf8jMmj4RKVc+
 7cq/VbFLaJDbSTS+peEiLXeUGEf5NJqCPECT0Cu5wH2AA+0X1nlDozSMFwYnjLX/3ZGqrRmyCnx
 H6Fbp7T+0XJcybv9QRQRc/MZkJUgJt2sT9VWPZQNrU0DR9uhQqpelOoa4R9cCsuWcx2JmgaN88Y
 8HCJGDhyk8IobFA==
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
	TAGGED_FROM(0.00)[bounces-57297-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 9F5D7348410
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

The CRU driver uses a single spinlock to protect the buffers queue and
the hardware operations.

This single spinlock is held for the whole duration of the interrupt
handler, causing all other driver's operations to freeze.

Under heavy system stress conditions with userspace not providing
buffers fast enough, this causes loss of frames.

Prepare to re-work the driver locking by introducing (but not using yet)
a new spinlock to protect the hardware registers programming.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 10 +++++++---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c |  1 +
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 3a200db15730..b46696a0012b 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -109,7 +109,6 @@ struct rzg2l_cru_info {
  * @v4l2_dev:		V4L2 device
  * @num_buf:		Holds the current number of buffers enabled
  * @svc_channel:	SVC0/1/2/3 to use for RZ/G3E
- * @buf_addr:		Memory addresses where current video data is written.
  * @notifier:		V4L2 asynchronous subdevs notifier
  *
  * @ip:			Image processing subdev info
@@ -118,6 +117,10 @@ struct rzg2l_cru_info {
  * @mdev_lock:		protects the count, notifier and csi members
  * @pad:		media pad for the video device entity
  *
+ * @hw_lock:		protects the slot counter, hardware programming of
+ *			slot addresses and the @buf_addr[] list
+ * @buf_addr:		Memory addresses where current video data is written
+ *
  * @lock:		protects @queue
  * @queue:		vb2 buffers queue
  * @scratch:		cpu address for scratch buffer
@@ -147,8 +150,6 @@ struct rzg2l_cru_dev {
 	u8 num_buf;
 
 	u8 svc_channel;
-	dma_addr_t buf_addr[RZG2L_CRU_HW_BUFFER_DEFAULT];
-
 	struct v4l2_async_notifier notifier;
 
 	struct rzg2l_cru_ip ip;
@@ -157,6 +158,9 @@ struct rzg2l_cru_dev {
 	struct mutex mdev_lock;
 	struct media_pad pad;
 
+	spinlock_t hw_lock;
+	dma_addr_t buf_addr[RZG2L_CRU_HW_BUFFER_DEFAULT];
+
 	struct mutex lock;
 	struct vb2_queue queue;
 	void *scratch;
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 27079c17a54c..a79b17e146bf 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -844,6 +844,7 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru)
 	mutex_init(&cru->lock);
 	INIT_LIST_HEAD(&cru->buf_list);
 
+	spin_lock_init(&cru->hw_lock);
 	spin_lock_init(&cru->qlock);
 
 	cru->state = RZG2L_CRU_DMA_STOPPED;

-- 
2.53.0


