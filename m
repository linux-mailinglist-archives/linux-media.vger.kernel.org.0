Return-Path: <linux-media+bounces-25164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF0AA196F2
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 17:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9C601686D1
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 16:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BCBA215176;
	Wed, 22 Jan 2025 16:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="DAOdgQzD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CYwI+x3q"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC2E21516A;
	Wed, 22 Jan 2025 16:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737564879; cv=none; b=Kxv7Jbw7YDmTNIkmxJOU55RjWSO0GNN4CkF8nIGysqYoBH4ENIWMMQozEGZC1FKHpjDBJ1nd0GDcJvU3O/OgpxdQk81loj2SF5nQtC7k6KB9Ae68u62ydfEdBibvxjAGfp590qsy41e8c3Kq1CqkpM7n2h2QKZXdu+aowQD7hHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737564879; c=relaxed/simple;
	bh=Ccuo2mq1LuQHr+e4TdiNKfknAXdbMf65XTiKxzE7ETM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BWRclesl2pdgeq9blL/7gekp9oNrNJK5XU/EBtEe87nrraxFBfy5dyrAG7TrE6kOqAwxdlWzLGgTkymaV8YLRp/1exjOW07R5/3aCx+cEBY2LacJ6cUYF7F1bq/krfvz+t4a5DxB5l0O+tkknzgK4FtP3wFzGK/rV4eRExGXFRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=DAOdgQzD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CYwI+x3q; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id 6070111401B0;
	Wed, 22 Jan 2025 11:54:36 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Wed, 22 Jan 2025 11:54:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737564876;
	 x=1737651276; bh=pXJn8/bP39TGwdBaVhH4ZLOX2mEgUTU+HWoOeLKZnKA=; b=
	DAOdgQzDPnM/OE9eBU4jC+XsT8HyF3jJ5AQG2mOqwJmMJp0o483suIWMpsGfY60N
	xsUHAN6QnYo2mPqH014V97IqyYtWEOpalTw2vDXw23wp230BuZrwvTOftbTioKa+
	Ct/uL3U44ddgpThCwQIR1nxslo+wxWIymXIh97TdqmAvCfABNz2txqKQ95cpFO7e
	z8YQNDIgzXOlIgwoVsKm7ZFPtbDOE5LKmngiSG/1g9oiNAj54qUjd+MvuU5M64Wv
	516Eflva/Ac9OcS9/2WzgUEq+Orkwa3LIJB+X4xD/B4e+fjS/F3v2rlnyv8A2EYA
	CJ5NZYAbxmUUP3Dqh7QnTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737564876; x=
	1737651276; bh=pXJn8/bP39TGwdBaVhH4ZLOX2mEgUTU+HWoOeLKZnKA=; b=C
	YwI+x3qTGT/GlP7cwX9fciKTryi/aZcalXkkAGzGQptdV8o/usXOvMH/3fvm6Fdp
	ba8V0KMWRUsdbed11dMd4M1KMsyOtNKleAX/Tfj0EBCu/8rPp71MTI2h7JXyDbRi
	QBNfCx9Q8Jpo/ztlwUGk+KZqMcLwmO/1YgFmLqIFBmpRtt6QMxLDFi9/7whB4XTA
	FcY+PHXhHDPEhwox0US6xCBnGQq8sRd4AWJUyLdcTQlWd4gdJMQo7nGqs7AwpnFt
	nmAVAJl5iM5QR+2gJDLx9P1mk4n6TEqfH8KT8Qh5N94OnjPRr1+uGKTrITjUh1Ao
	cHEU20HSAR6HvyuiycQ6Q==
X-ME-Sender: <xms:yyKRZ9IG5z79twBYuiNIbprOxzjUl0Nxtzyv5N2UWwKwr4Lf1Rn5Ow>
    <xme:yyKRZ5KvDAYwdzsQEFU-yXEzYi5v9NTHbLmiOLObEnPqRQY0d1sxPctA-H7QK1Rfa
    F4cgJTz0y7QZbhHBr0>
X-ME-Received: <xmr:yyKRZ1tFHGc3qn7huqAhXWWHRYwEvMjxHf3UhV2z3ZyXwn-aphI7wNXNdTawFBdvZkdPXuxuhBDpyoGh5oO7JFa6BA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejfedgvddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgr
    ihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhr
    vghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuh
    igqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggt
    hhdrshgv
X-ME-Proxy: <xmx:zCKRZ-a1IGxD5XN1pGWR6U-kJJcP9BSxZzhlCexeTpBxsUhcJMafog>
    <xmx:zCKRZ0bbpc38e34CyIcwPQaBgbHLM-CsPqt2QXXm1fLo9-KV5odCew>
    <xmx:zCKRZyDdDexENfhGTOm2znCFJWiJSGr7Yfe0HAORODzxRrxqqkDEow>
    <xmx:zCKRZyZ4rwJwRBwM9AkCgd0mekcY0UlsBNfHGRDNnPVUGoZ8Luh3Ww>
    <xmx:zCKRZ5PES0lO8oHtuQVO-uYRNyXSIqAsewQjs_Ae1vJpv591HvQ9XLho>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jan 2025 11:54:35 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 4/5] media: rcar-vin: Simplify the shutdown process
Date: Wed, 22 Jan 2025 17:53:52 +0100
Message-ID: <20250122165353.1273739-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250122165353.1273739-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250122165353.1273739-1-niklas.soderlund+renesas@ragnatech.se>
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
index ba55ccf648de..3eb6b5fcac89 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -1022,8 +1022,7 @@ static void rvin_fill_hw_slot(struct rvin_dev *vin, int slot)
 	if (WARN_ON(vin->buf_hw[slot].buffer))
 		return;
 
-	if ((vin->state != STOPPED && vin->state != RUNNING) ||
-	    list_empty(&vin->buf_list)) {
+	if (list_empty(&vin->buf_list)) {
 		vin->buf_hw[slot].buffer = NULL;
 		phys_addr = vin->scratch_phys;
 	} else {
@@ -1064,8 +1063,6 @@ static int rvin_capture_start(struct rvin_dev *vin)
 	/* Continuous Frame Capture Mode */
 	rvin_write(vin, VNFC_C_FRAME, VNFC_REG);
 
-	vin->state = RUNNING;
-
 	return 0;
 }
 
@@ -1106,9 +1103,9 @@ static irqreturn_t rvin_irq(int irq, void *data)
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
 
@@ -1389,6 +1386,8 @@ int rvin_start_streaming(struct rvin_dev *vin)
 	if (ret)
 		rvin_set_stream(vin, 0);
 
+	vin->running = true;
+
 	spin_unlock_irqrestore(&vin->qlock, flags);
 
 	return ret;
@@ -1421,44 +1420,21 @@ static int rvin_start_streaming_vq(struct vb2_queue *vq, unsigned int count)
 
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
 
@@ -1467,32 +1443,25 @@ void rvin_stop_streaming(struct rvin_dev *vin)
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
@@ -1538,8 +1507,6 @@ int rvin_dma_register(struct rvin_dev *vin, int irq)
 
 	spin_lock_init(&vin->qlock);
 
-	vin->state = STOPPED;
-
 	for (i = 0; i < HW_BUFFER_NUM; i++)
 		vin->buf_hw[i].buffer = NULL;
 
@@ -1642,7 +1609,7 @@ void rvin_set_alpha(struct rvin_dev *vin, unsigned int alpha)
 
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


