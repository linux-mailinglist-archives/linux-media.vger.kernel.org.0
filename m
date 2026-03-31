Return-Path: <linux-media+bounces-57771-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id V684I3yjy2mDJwYAu9opvQ
	(envelope-from <linux-media+bounces-57771-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:35:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F37E3368124
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CEBF93090E9C
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A6AD3F23BE;
	Tue, 31 Mar 2026 10:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vjrdCgvP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599393EF0A8;
	Tue, 31 Mar 2026 10:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952888; cv=none; b=WUzU5VJh+KgWRIf7R9FRyNQJssBaUHseTd3hPa1Z2G/WJwUlQuyTC/lxmvb5JoIxeWlkSDplvWM3EsI9AEngpQrC7xkQ7c75BIydpPJCCMiwI/fnMcn5WCOc5jhZvSsQYEJx119yozcq09JIvjrNrsgpvohnjHritkFrFVhOyYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952888; c=relaxed/simple;
	bh=aGgOUtZpPu8D2p+9E0s/7/z6ls6yAIaHNWmJOB1YDNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bq/xcm/r/CwJkR4wgZFLgUgwjdG1UT0xK44F3zRnp8a0H2HGprEwITVzT8yJ1w7AxEEWdarwRc5qfGfUbaNqdt0+/GdlG7f5ufYfvtCsGJvQ8+VIj4h1oWQdFXiuyAinwA5jtWpMahoknSK1mP8JOKiTumJNw6emacGeZ2vSEM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vjrdCgvP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78CBFA98;
	Tue, 31 Mar 2026 12:26:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774952798;
	bh=aGgOUtZpPu8D2p+9E0s/7/z6ls6yAIaHNWmJOB1YDNc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vjrdCgvPgnaiROsvYgs+jvlHYm6ZrKOWskd/8HOCJSLD2KpltZLh9li37QdxvZZPN
	 4i63cbGrlthM/oR0S9nmw7u/WvbCLFph/IwQEtAQ9xJRVeLdG6BhqMYQ7pNr1Y/vW0
	 KpoAV0EXhfB/CwKdoifX64GbZsspN5KsSe3yWHCs=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 31 Mar 2026 12:27:38 +0200
Subject: [PATCH v2 08/15] media: rz2gl-cru: Introduce a spinlock for hw
 operations
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-b4-cru-rework-v2-8-f94b238b35d4@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2978;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=G5LkoSyKo5n6vye2zZ26xv3NhIWc1wpfN9tFY4VYBSw=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpy6GoU43Z4hcFMylGwczQLk42Rh6/PX0yTENXZ
 bGZwrzWFsCJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCacuhqAAKCRByNAaPFqFW
 PO4nD/4wV4X/XuXpV3ae8NRfxYr0BdeEEwalGKNsEhjHRZjhaqJEaLgDFePnI3v26vYp6zUVm8N
 y5+s7zkgmWP8df33YhcZTmJmRdBzhQ8lOKeohHQjf+Mc9W/3b5XKdafSXDtc9cPcC7awasGwSUD
 EJ0KKur/VyvRcKFc/1lZEDXnognV75HFF6aQ21WVKqePixUv9EC0miCtFGnbO7eToMNdApRgT3m
 jq1OGsemQlyjPp6KqRBhHmAYSAjgteT36vlNa49fAsfmf6AqAxNi5x8sWaneDW/5Up67HsV2TwM
 NLJepP6nbdKpZHbJBC6Y0KmjdWcb4V1OhGAYwLGuRc8px4XNX1EsfVPfT/HZM32YteDu6RdSDgL
 N/M0Puf2+Uq0x9PCUCkD/BkzooBm1JTgooSLerOomWtgKwrqRjzMWq5oWntGPygoyOYYPE00pHf
 tX/XDyw/jxRFsSVYkPk36xahKMDeWFzTIhLs1Mb2a/fSW+uAeMPc5Mrq6LPlyj4iVsYeKBhkkGF
 Gm20EAY/PoxMcZgKTqGyvTbKOquoD6fn0qd35A2yTWdX7O+doTwuJj+5Kuv8it5vdG3gyBhihY7
 fKsZfa6ERSR8YInqn1z3ud8g7xVlZXokopAllZ0vI7IoDw0yHyMt3Tm/X8uc018oaqTMW3IOUbB
 CTevOK1Eg0VU7wA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57771-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: F37E3368124
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
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 10 +++++++---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c |  1 +
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index be4a9a4953d1..12d574182eb8 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -111,7 +111,6 @@ struct rzg2l_cru_info {
  * @v4l2_dev:		V4L2 device
  * @num_buf:		Holds the current number of buffers enabled
  * @svc_channel:	SVC0/1/2/3 to use for RZ/G3E
- * @buf_addr:		Memory addresses where current video data is written.
  * @notifier:		V4L2 asynchronous subdevs notifier
  *
  * @ip:			Image processing subdev info
@@ -120,6 +119,10 @@ struct rzg2l_cru_info {
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
@@ -149,8 +152,6 @@ struct rzg2l_cru_dev {
 	u8 num_buf;
 
 	u8 svc_channel;
-	dma_addr_t buf_addr[RZG2L_CRU_HW_BUFFER_DEFAULT];
-
 	struct v4l2_async_notifier notifier;
 
 	struct rzg2l_cru_ip ip;
@@ -159,6 +160,9 @@ struct rzg2l_cru_dev {
 	struct mutex mdev_lock;
 	struct media_pad pad;
 
+	spinlock_t hw_lock;
+	dma_addr_t buf_addr[RZG2L_CRU_HW_BUFFER_DEFAULT];
+
 	struct mutex lock;
 	struct vb2_queue queue;
 	void *scratch;
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index c49131587679..b6616d54f8a3 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -843,6 +843,7 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru)
 	mutex_init(&cru->lock);
 	INIT_LIST_HEAD(&cru->buf_list);
 
+	spin_lock_init(&cru->hw_lock);
 	spin_lock_init(&cru->qlock);
 
 	cru->state = RZG2L_CRU_DMA_STOPPED;

-- 
2.53.0


