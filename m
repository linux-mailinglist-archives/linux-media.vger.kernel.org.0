Return-Path: <linux-media+bounces-25948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98141A2F619
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 18:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F4E93A2F6D
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 17:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707F12566F2;
	Mon, 10 Feb 2025 17:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="VtF8KSgm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="l+ErpjX8"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0E52566E2;
	Mon, 10 Feb 2025 17:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210214; cv=none; b=aX1xwp54cSnBscN2kW8SKM30OmuH335CmyliY0nk4zcEUUktFYJgwso0Av7vfdhcX9KLDT0LLoCrKDjJtQvSaOV0/xi6Op1Yu4VgFKf1gnAsE8HMYzAUoPSJrNFeLZye2xz0c+f2W37P/77sH05foJ6B538SKOsTeOPcP2oxJ6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210214; c=relaxed/simple;
	bh=43csYOVOJq5a1sK5zONrF7t6naHregr/2lfLrGBWw6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JU93MSQNHw1hVWj3VLLPaNg+ZFLtVXefL8Wj7kVWZ4MDFTiwH4oMJShhu/3p+yXy1RuMy9SAIXwD8aBIeIBW5virJBN64w5oK0+W9gGUEE4n+saA+kzkJ1xHAygXE/s7HM/m6n+3QQ7h/nj50UQGyrS1NzwLfEHn26sJiWPcQOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=VtF8KSgm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=l+ErpjX8; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id B399E13809AF;
	Mon, 10 Feb 2025 12:56:51 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Mon, 10 Feb 2025 12:56:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1739210211;
	 x=1739296611; bh=HsdG9KkcdTzgBNoNWGlPU+eXaZWfTVKwtTMyGjfU0d4=; b=
	VtF8KSgm+diRaI6qsNFFVwRumyfut4rSiI3Gsg/A6Dw1H7tIt3KpWUQ9Te3dw+qj
	MlhNzFZJheLh7FF7sS612Kn+j3PBPZu0XlH7OWYW2QdF0u6U3Byn++05ZFfMmQde
	ZvmrVauuvzvnvJJn9sZsDXAfGzlEtdfBPOeJUXtU5ymIorrRrzI9myEpjzOD9hH1
	P1yvhWKBUhI9pTX4RDsoc9jgfY7SBHXF6UN/4fML51mCyLDiOSD4a9dZI70d2eIJ
	m9aq50Ldx7cX59ZiFzg56o/HklFjrp0qaecFexNITDFyx0w9hCHTZ+w5QZ8xJhwk
	NLXzm1WslZNbAa+FRgEbvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739210211; x=
	1739296611; bh=HsdG9KkcdTzgBNoNWGlPU+eXaZWfTVKwtTMyGjfU0d4=; b=l
	+ErpjX8DZHbSVCzV0Fgwqh475N15L9cy8uhmRmonqZz6wIS5YNT9kllU3fi8DyoU
	8t+BIYC3fxwI/R20KBZwftg8DfEmt9VE6AUCTbN0s6kJFqo92efZGJfHz3sU6V7T
	K8ZFFDUPKReaIxznP7W8+dekH5EzwYCGg9IPqYbGov7KZTsYJnppKgQ1qtjjrc0I
	6/UIhYy2+oVNOWlMKBLg2RJADNPA8zIlInl3wywMymYn3fcVs9rFDq09EyLqbx0V
	DIHjLQZ/7wkx15I1AtGn0ShlyAtn1JLxqNnyi+RW1dq4+FmBJESZY204+WHGMX6g
	09Ajrb+TEDVtXK/zdpLdw==
X-ME-Sender: <xms:4z2qZxPTOzkoALaLu6BCQ3sWZ6nuLocYK6sdCM9mFQkEZ1Fmwt7PPg>
    <xme:4z2qZz8NlnVyXwQUfcWv5lYeZG32FyPyDL1tgwDborhUeHZUlqRuFeKTd5Y2YWbqU
    NYcJzOeZ-Uxxk5So2g>
X-ME-Received: <xmr:4z2qZwSWPrAbRzXTeU09SfK8FzUA0fMMxiAQXuJIgeNAzmXgbPYSgw0Ydfw2vHAi8sRvssvU3KUQ00PtfymbCkOHQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefkeejvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgr
    ihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhr
    vghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuh
    igqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggt
    hhdrshgv
X-ME-Proxy: <xmx:4z2qZ9vjAE6ZcDQAJteZ-DLn30NPHzcMeVtNjxMKSBHF920Nfa6bxA>
    <xmx:4z2qZ5eKPzfUQGjqh127tX4W82Diu1mnEt5Ywux-XapSHWV2RPYGLQ>
    <xmx:4z2qZ51IrNKkPouSKEuh5eP5dul3uA1DZ4ucexv4B8dCHqvvXXBXEg>
    <xmx:4z2qZ1-K8QWBTunSZ-fVIK6JGpLblOXnvrj2e961LbUp3ImuYr79sA>
    <xmx:4z2qZxQj4G-Oba6JZHCCnSp7pa3u0Re6WE9Pfke7y4t9sN4HeJLrkee5>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Feb 2025 12:56:50 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 4/5] media: rcar-vin: Simplify the shutdown process
Date: Mon, 10 Feb 2025 18:56:14 +0100
Message-ID: <20250210175615.1686529-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210175615.1686529-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250210175615.1686529-1-niklas.soderlund+renesas@ragnatech.se>
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
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
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


