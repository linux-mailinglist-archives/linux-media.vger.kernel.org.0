Return-Path: <linux-media+bounces-25081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFB6A1884D
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 00:20:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1079F1889DD7
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 23:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C1A1F91C8;
	Tue, 21 Jan 2025 23:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="PojkuYwF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pJv7ue2k"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2F51F91C2;
	Tue, 21 Jan 2025 23:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737501643; cv=none; b=A70I6QKgSjGBedWdDgIiupTY9dBXYylbaQfJjSjP5CwQdMLM3Eo8horTHihp+oYMTnD3G9bNwoKwdydFJ3DnJVt9JmlWP7BkvYecM+7prAFXPUNgA5VdrHq78sX1v8HcRTAWNY1cw2BUiDW6U7CUICDP8nd6liP4N/Wr+nWCao4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737501643; c=relaxed/simple;
	bh=LM/LRajhwMmmMTNuLwnRMQBwdVvbcNs9QtOHa8rXecc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Apr8OID+T+PzGDSfrXJ6RBDTdq2vba4ZYasOkA1Vu69qCPsrjIFrk4p3SrnJgd/tfUo6em+9TizTcVkL3ooMzJR2l4Dw2K/FCMUQmiDaivj4DISEp2kES+TwNkNLuO3jNz4I+xTO3qBdKT8eRuWtYBKfeTxSHacPUusUS9TdzBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=PojkuYwF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pJv7ue2k; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id B75FE114021A;
	Tue, 21 Jan 2025 18:20:40 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 21 Jan 2025 18:20:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737501640;
	 x=1737588040; bh=NoNCXQvWj1vOGhZGtRjqb+6hmuC+ymSbkR84ozzyHGk=; b=
	PojkuYwFLVU1V8YU/FanBhXPNtiZaXbQKI6THKo/H+av8voEQtZr0YZXStDAa7te
	XBNpRpBAfrWSnquLG0+8VBPdn0lUF3Fm6Htst/WgDUrG69RYU3BrquRhE5Z+iwc+
	mPKqOkXynWUH7R9ttJA7osh5Ro8wWnxTKmDXQZNxxOadwDWDUt604DhHhJ0QQdid
	QD5wD2lrwyrtjDypkTQmmuhHLRLl4j3IAcTx+MUbbinsxWeR0OnNb+tbyJ2RJ0IR
	nDDYfpmWcl/fQQHefWoQPCA3pcJqTN/Ask+TUzqFD0CHfoTuNr01wAW6eU/TGwpm
	bbFdTd3wpzYu6qyVuniKIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737501640; x=
	1737588040; bh=NoNCXQvWj1vOGhZGtRjqb+6hmuC+ymSbkR84ozzyHGk=; b=p
	Jv7ue2k43X95uL/NyRu15/lIJtsagu8ZyJM7hlvb3IWImO6WJ8lAQbQ9Ar7fVMh0
	8Ba5SD6qHLEJ/CA+00IqRtgYRoW3Q4aV5/y8J2oUW9tha4tkNa37Sew6SIsaGJ/9
	NKgQMKaK+1n7ptr/abi7F7RqqDMciQrDswQtmGTJA8o35iwnZXn5MZWk7GcJe421
	kalNl0FL4mTeAJQDNnzkMzSwzK/E1dTP5U11BdkE8UM4Juyo4Nnuj23N/oVZ19PU
	EBrcBjAF0ryhQ7ylE+S3clm4urbzraPbGAvtfcULRpsm1r4KAVukZVRkujDM2/Tw
	bkjApoV+twQtBQXWiV0UA==
X-ME-Sender: <xms:yCuQZ1RaKW0hjnz6wQF6xapc46Z0RtXQQ21uGb7DYWBpqmkkijAdew>
    <xme:yCuQZ-wJKQeqmvVMbtNJiQYQQulLqE0jPjI6Q1deNBui3Oq0vSMQ4FKFgT6WlE0xr
    4--Sz32xQyGE3Erb4M>
X-ME-Received: <xmr:yCuQZ62ZU7BIuehms6Nv3d4Ouc6wKpQHgMqyNOlgIZkogTf0D3Trg8OKahaL6bpjEFpRTCM0aQOHIRXiYzbop0nPnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejfedgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffle
    efgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsrghkrghrihdrrghi
    lhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmtghhvghhrggsse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdorhgv
    nhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugi
    dqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghh
    rdhsvg
X-ME-Proxy: <xmx:yCuQZ9BICSbLY70lb1rfmzNjuZON2VcF2Hf2dyLCTyTll9_I7hb2fA>
    <xmx:yCuQZ-ikYkUIvEgqmH16rjAqGVhmmA1sFFlWNVuxhGCA_Of-lB5F-g>
    <xmx:yCuQZxpD7-Ew5AMQ76YO-CJO2pGc4RD2ypg6cEA0fMFejrynLWPQlA>
    <xmx:yCuQZ5h_vgM284DFh_Xy7ngsGzaZMqzDTLYwr9UI-jGTuy004aSp1A>
    <xmx:yCuQZ5X8sSOWgt0n8zFNC04Om-iHWNNsfARAky9LMQFSNyjIunmyZw55>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jan 2025 18:20:39 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 4/5] media: rcar-vin: Simplify the shutdown process
Date: Wed, 22 Jan 2025 00:19:26 +0100
Message-ID: <20250121231927.187463-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250121231927.187463-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250121231927.187463-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When shutting down capture extra care was needed to try and complete a
buffer that was involved in the emulated support for SEQ_{TB,BT}. This
was needed as a buffer might be queued once to the driver, but two times
to the hardware using different offsets.

As support for SEQ_{TB,BT} is now removed this shutdown process can be
greatly simplified. And in addition the state keeping of the VIN device
can be reduced to a single boolean value instead of keeping track of
this SEQ_{TB,BT} stopping dance.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/renesas/rcar-vin/rcar-core.c     |  4 +-
 .../platform/renesas/rcar-vin/rcar-dma.c      | 75 ++++++-------------
 .../platform/renesas/rcar-vin/rcar-vin.h      | 18 +----
 3 files changed, 26 insertions(+), 71 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index b8e35ef4d9d8..cfbc9ec27706 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1080,7 +1080,7 @@ static int __maybe_unused rvin_suspend(struct device *dev)
 {
 	struct rvin_dev *vin = dev_get_drvdata(dev);
 
-	if (vin->state != RUNNING)
+	if (!vin->running)
 		return 0;
 
 	rvin_stop_streaming(vin);
@@ -1092,7 +1092,7 @@ static int __maybe_unused rvin_resume(struct device *dev)
 {
 	struct rvin_dev *vin = dev_get_drvdata(dev);
 
-	if (vin->state != RUNNING)
+	if (!vin->running)
 		return 0;
 
 	/*
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index e4600e615238..6f503eaa43be 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -1025,8 +1025,7 @@ static void rvin_fill_hw_slot(struct rvin_dev *vin, int slot)
 
 	prev = (slot == 0 ? HW_BUFFER_NUM : slot) - 1;
 
-	if ((vin->state != STOPPED && vin->state != RUNNING) ||
-	    list_empty(&vin->buf_list)) {
+	if (list_empty(&vin->buf_list)) {
 		vin->buf_hw[slot].buffer = NULL;
 		phys_addr = vin->scratch_phys;
 	} else {
@@ -1067,8 +1066,6 @@ static int rvin_capture_start(struct rvin_dev *vin)
 	/* Continuous Frame Capture Mode */
 	rvin_write(vin, VNFC_C_FRAME, VNFC_REG);
 
-	vin->state = RUNNING;
-
 	return 0;
 }
 
@@ -1109,9 +1106,9 @@ static irqreturn_t rvin_irq(int irq, void *data)
 	if (!(int_status & VNINTS_FIS))
 		goto done;
 
-	/* Nothing to do if capture status is 'STOPPED' */
-	if (vin->state == STOPPED) {
-		vin_dbg(vin, "IRQ while state stopped\n");
+	/* Nothing to do if not running. */
+	if (!vin->running) {
+		vin_dbg(vin, "IRQ while not running, ignoring\n");
 		goto done;
 	}
 
@@ -1392,6 +1389,8 @@ int rvin_start_streaming(struct rvin_dev *vin)
 	if (ret)
 		rvin_set_stream(vin, 0);
 
+	vin->running = true;
+
 	spin_unlock_irqrestore(&vin->qlock, flags);
 
 	return ret;
@@ -1424,44 +1423,21 @@ static int rvin_start_streaming_vq(struct vb2_queue *vq, unsigned int count)
 
 void rvin_stop_streaming(struct rvin_dev *vin)
 {
-	unsigned int i, retries;
 	unsigned long flags;
-	bool buffersFreed;
 
 	spin_lock_irqsave(&vin->qlock, flags);
 
-	if (vin->state == STOPPED) {
+	if (!vin->running) {
 		spin_unlock_irqrestore(&vin->qlock, flags);
 		return;
 	}
 
-	vin->state = STOPPING;
-
-	/* Wait until only scratch buffer is used, max 3 interrupts. */
-	retries = 0;
-	while (retries++ < RVIN_RETRIES) {
-		buffersFreed = true;
-		for (i = 0; i < HW_BUFFER_NUM; i++)
-			if (vin->buf_hw[i].buffer)
-				buffersFreed = false;
-
-		if (buffersFreed)
-			break;
-
-		spin_unlock_irqrestore(&vin->qlock, flags);
-		msleep(RVIN_TIMEOUT_MS);
-		spin_lock_irqsave(&vin->qlock, flags);
-	}
-
 	/* Wait for streaming to stop */
-	retries = 0;
-	while (retries++ < RVIN_RETRIES) {
-
+	for (unsigned int i = 0; i < RVIN_RETRIES; i++) {
 		rvin_capture_stop(vin);
 
 		/* Check if HW is stopped */
 		if (!rvin_capture_active(vin)) {
-			vin->state = STOPPED;
 			break;
 		}
 
@@ -1470,32 +1446,25 @@ void rvin_stop_streaming(struct rvin_dev *vin)
 		spin_lock_irqsave(&vin->qlock, flags);
 	}
 
-	if (!buffersFreed || vin->state != STOPPED) {
-		/*
-		 * If this happens something have gone horribly wrong.
-		 * Set state to stopped to prevent the interrupt handler
-		 * to make things worse...
-		 */
-		vin_err(vin, "Failed stop HW, something is seriously broken\n");
-		vin->state = STOPPED;
-	}
+	if (rvin_capture_active(vin))
+		vin_err(vin, "Hardware did not stop\n");
+
+	vin->running = false;
 
 	spin_unlock_irqrestore(&vin->qlock, flags);
 
-	/* If something went wrong, free buffers with an error. */
-	if (!buffersFreed) {
-		return_unused_buffers(vin, VB2_BUF_STATE_ERROR);
-		for (i = 0; i < HW_BUFFER_NUM; i++) {
-			if (vin->buf_hw[i].buffer)
-				vb2_buffer_done(&vin->buf_hw[i].buffer->vb2_buf,
-						VB2_BUF_STATE_ERROR);
-		}
-	}
-
 	rvin_set_stream(vin, 0);
 
 	/* disable interrupts */
 	rvin_disable_interrupts(vin);
+
+	/* Return unprocessed buffers from hardware. */
+	for (unsigned int i = 0; i < HW_BUFFER_NUM; i++) {
+		if (vin->buf_hw[i].buffer)
+			vb2_buffer_done(&vin->buf_hw[i].buffer->vb2_buf,
+					VB2_BUF_STATE_ERROR);
+	}
+
 }
 
 static void rvin_stop_streaming_vq(struct vb2_queue *vq)
@@ -1541,8 +1510,6 @@ int rvin_dma_register(struct rvin_dev *vin, int irq)
 
 	spin_lock_init(&vin->qlock);
 
-	vin->state = STOPPED;
-
 	for (i = 0; i < HW_BUFFER_NUM; i++)
 		vin->buf_hw[i].buffer = NULL;
 
@@ -1645,7 +1612,7 @@ void rvin_set_alpha(struct rvin_dev *vin, unsigned int alpha)
 
 	vin->alpha = alpha;
 
-	if (vin->state == STOPPED)
+	if (!vin->running)
 		goto out;
 
 	switch (vin->format.pixelformat) {
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index f13ef379d095..934474d2334a 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -61,18 +61,6 @@ enum rvin_isp_id {
 	(((unsigned int)RVIN_CSI_MAX) > ((unsigned int)RVIN_ISP_MAX) ? \
 	 (unsigned int)RVIN_CSI_MAX : (unsigned int)RVIN_ISP_MAX)
 
-/**
- * enum rvin_dma_state - DMA states
- * @STOPPED:   No operation in progress
- * @RUNNING:   Operation in progress have buffers
- * @STOPPING:  Stopping operation
- */
-enum rvin_dma_state {
-	STOPPED = 0,
-	RUNNING,
-	STOPPING,
-};
-
 /**
  * struct rvin_video_format - Data format stored in memory
  * @fourcc:	Pixelformat
@@ -173,11 +161,11 @@ struct rvin_info {
  * @scratch:		cpu address for scratch buffer
  * @scratch_phys:	physical address of the scratch buffer
  *
- * @qlock:		protects @buf_hw, @buf_list, @sequence and @state
+ * @qlock:		Protects @buf_hw, @buf_list, @sequence and @running
  * @buf_hw:		Keeps track of buffers given to HW slot
  * @buf_list:		list of queued buffers
  * @sequence:		V4L2 buffers sequence number
- * @state:		keeps track of operation state
+ * @running:		Keeps track of if the VIN is running
  *
  * @is_csi:		flag to mark the VIN as using a CSI-2 subdevice
  * @chsel:		Cached value of the current CSI-2 channel selection
@@ -220,7 +208,7 @@ struct rvin_dev {
 	} buf_hw[HW_BUFFER_NUM];
 	struct list_head buf_list;
 	unsigned int sequence;
-	enum rvin_dma_state state;
+	bool running;
 
 	bool is_csi;
 	unsigned int chsel;
-- 
2.48.1


