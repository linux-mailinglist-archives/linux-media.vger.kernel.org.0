Return-Path: <linux-media+bounces-25161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A99DA196ED
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 17:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 271E73ACA8D
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 16:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B031215169;
	Wed, 22 Jan 2025 16:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="epEZeppa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="d6aSftuQ"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47429212D69;
	Wed, 22 Jan 2025 16:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737564872; cv=none; b=O04z2wcqPRih35OtdNacKEIrtA6px0LF5ys9j/ZVMSl5WS9P2UzT3w5XNMfDJ4pIEDdAtSBZppa4IZb9N8wUVxpQ0l4ilfuaYScUI7m1gjs4Ia7YHPAt0A+cV+KgazdLruSM6v3elzI/bNoZLePuh7rS/Um5TXwVpzQ/lXbubUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737564872; c=relaxed/simple;
	bh=0ffhfe7j1z96gXGZcR91aAXClEdlI4aafUo56wT+HzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R8zOH1mos4qSgsG0c/+rM41Yw8IcZWJ5ZC8d1wHbNk+BB800b14zMxI4nPNhIyH+gvpOiGcqYnBMGYQdwq5Hh9+3ax2AqSDnAJF3nQTQOCkUx9S2UqEKj+GkfCHormQyX8KKiSE5ZKhqjEohoWq3O8zY7bYB2reXXsLW62eEnBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=epEZeppa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=d6aSftuQ; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 24ACA11401B9;
	Wed, 22 Jan 2025 11:54:29 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 22 Jan 2025 11:54:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737564868;
	 x=1737651268; bh=2t2S7t73E2EBQ9LEr1nhthtf9luzDytLcjmC8IJlibM=; b=
	epEZeppaHKaebUfg/o29B73a34LYzLUIPHthTS0e71/il94GNNZ2rPPYAER6qmjM
	AAv3FarD7dCg3Extp0DTLACxRPr7SQh2XQOVCynt3MxBiqeC8ng4KaFYoZ0yDRYo
	rSTmeWq+V4I55ejqjh7JQq5MJN62s3hsC4UekDqEqZglWoJY9IcGxEoZGPtbo4e0
	9MvCI6dKxpBKbBJaY973sQVa4g9jQaBQ9tr9zioXG80gxmUP3IkvwyX9zF+MxnM5
	4+9tvINi3enn0hIuV5JsH16+j7PG/obs9w4q1Pq7IjwN5eEHqP0y4yZ+29nSkTsP
	WIfpELd3V+NUHOIvyKwHxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737564868; x=
	1737651268; bh=2t2S7t73E2EBQ9LEr1nhthtf9luzDytLcjmC8IJlibM=; b=d
	6aSftuQyaSLmZ+hl53n6Q5NcbIu0Kp3Ym/4iPvS1c4x7bsfVAZsbZ6byV855rpGy
	vKKYP7QdVjjUZOVyS9RVAxZTkMBeBgvI7wIoASaPHLQmTm461FFrsI7oGSvmpiST
	KEZZf6Hob5IT5tWYKULIpEV8KR4lzYcEPBso2lEgL2+zPBgY2D2VSTSXw89mpvgQ
	gRliHbygFdMQUOoIaGekl9jO7kNy8ShaqPI6Y0GX+dEvaVihTzbA8RQ2lbqUnd2J
	VL5EhDQk/sm+l6DcERFoYwCW+GhUfuwyRg+YMsi8az54bCATgTS7W0RF1u4KV6zz
	K/o4wbIqNne52fUByjjUg==
X-ME-Sender: <xms:xCKRZ6_cLyU6SWb_EoZgl19s6FxeqFOSsV1vYZXysZXIWvZbymOg0A>
    <xme:xCKRZ6tM8FC1RGDgmPG0woqUjsBnQED2Fiyr8I4frbNtQbVWaLBeIYvZNyGj3wa4Y
    NeG7oLb0bYlyIQumKQ>
X-ME-Received: <xmr:xCKRZwCfNko84pqo9altfqB7_-FJmcnJPLMx6YWqL0rN5IgFPABK7-3BmSGC9_Q1WEkd5v5JL_IQ4CuzzG1qnjb0AQ>
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
X-ME-Proxy: <xmx:xCKRZycf_4Ri7ESoV2DwYNbT_U8RDj1J3ZPdllzWCsPwqBDkagnJUQ>
    <xmx:xCKRZ_MR1ZxKIZEeVNxDFMeaeSHy38ghlpPuXCbmR1IW_t9TlJuFRg>
    <xmx:xCKRZ8mSw_totkV5jnSeOHFJyv3vIK19Ps5_Czlg3lUE_kJBcntjFQ>
    <xmx:xCKRZxunD_p0U2X8kCcbSURqGSEpOlHu5m0stExIFVjIp3zZI7rPmw>
    <xmx:xCKRZ7DLmRuWbEsRELy96RRthTVkmp13e2LqzK7IyTvrtXgDYxji4p95>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jan 2025 11:54:28 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 1/5] media: rcar-vin: Remove emulated SEQ_{TB,BT}
Date: Wed, 22 Jan 2025 17:53:49 +0100
Message-ID: <20250122165353.1273739-2-niklas.soderlund+renesas@ragnatech.se>
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

When the driver was converted from soc_camera software support for
V4L2_FIELD_SEQ_TB and V4L2_FIELD_SEQ_BT where added. This was done by
capturing twice to the same VB2 buffer, but at different offsets.

This trend out to be a bad idea and it never really worked properly in
all situations. As the hardware can't support this mode natively remove
trying to emulate it in software. It's still possible to capture TOP or
BOTTOM fields separately or both ALTERNATING. If user-space wants the
same  fields in the same buffer the same hack to capture twice to the
same buffer can be done.

Removing this error prone emulated support pave ways in future work to
simplify the internal buffer handling and making it less fragile, while
enabling adding support for other features the hardware actually
supports.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Remove 'prev' variable in rvin_fill_hw_slot() which is no longer used,
  but set.
---
 .../platform/renesas/rcar-vin/rcar-dma.c      | 58 +++----------------
 .../platform/renesas/rcar-vin/rcar-v4l2.c     |  7 ---
 .../platform/renesas/rcar-vin/rcar-vin.h      | 18 ------
 3 files changed, 7 insertions(+), 76 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 8773998101ff..a16adc6fd4dc 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -642,8 +642,6 @@ void rvin_scaler_gen3(struct rvin_dev *vin)
 	case V4L2_FIELD_INTERLACED_TB:
 	case V4L2_FIELD_INTERLACED_BT:
 	case V4L2_FIELD_INTERLACED:
-	case V4L2_FIELD_SEQ_TB:
-	case V4L2_FIELD_SEQ_BT:
 		clip_size |= vin->compose.height / 2;
 		break;
 	default:
@@ -727,8 +725,6 @@ static int rvin_setup(struct rvin_dev *vin)
 	case V4L2_FIELD_INTERLACED_BT:
 		vnmc = VNMC_IM_FULL | VNMC_FOC;
 		break;
-	case V4L2_FIELD_SEQ_TB:
-	case V4L2_FIELD_SEQ_BT:
 	case V4L2_FIELD_NONE:
 	case V4L2_FIELD_ALTERNATE:
 		vnmc = VNMC_IM_ODD_EVEN;
@@ -1021,33 +1017,14 @@ static void rvin_fill_hw_slot(struct rvin_dev *vin, int slot)
 	struct rvin_buffer *buf;
 	struct vb2_v4l2_buffer *vbuf;
 	dma_addr_t phys_addr;
-	int prev;
 
 	/* A already populated slot shall never be overwritten. */
 	if (WARN_ON(vin->buf_hw[slot].buffer))
 		return;
 
-	prev = (slot == 0 ? HW_BUFFER_NUM : slot) - 1;
-
-	if (vin->buf_hw[prev].type == HALF_TOP) {
-		vbuf = vin->buf_hw[prev].buffer;
-		vin->buf_hw[slot].buffer = vbuf;
-		vin->buf_hw[slot].type = HALF_BOTTOM;
-		switch (vin->format.pixelformat) {
-		case V4L2_PIX_FMT_NV12:
-		case V4L2_PIX_FMT_NV16:
-			phys_addr = vin->buf_hw[prev].phys +
-				vin->format.sizeimage / 4;
-			break;
-		default:
-			phys_addr = vin->buf_hw[prev].phys +
-				vin->format.sizeimage / 2;
-			break;
-		}
-	} else if ((vin->state != STOPPED && vin->state != RUNNING) ||
-		   list_empty(&vin->buf_list)) {
+	if ((vin->state != STOPPED && vin->state != RUNNING) ||
+	    list_empty(&vin->buf_list)) {
 		vin->buf_hw[slot].buffer = NULL;
-		vin->buf_hw[slot].type = FULL;
 		phys_addr = vin->scratch_phys;
 	} else {
 		/* Keep track of buffer we give to HW */
@@ -1056,16 +1033,12 @@ static void rvin_fill_hw_slot(struct rvin_dev *vin, int slot)
 		list_del_init(to_buf_list(vbuf));
 		vin->buf_hw[slot].buffer = vbuf;
 
-		vin->buf_hw[slot].type =
-			V4L2_FIELD_IS_SEQUENTIAL(vin->format.field) ?
-			HALF_TOP : FULL;
-
 		/* Setup DMA */
 		phys_addr = vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
 	}
 
-	vin_dbg(vin, "Filling HW slot: %d type: %d buffer: %p\n",
-		slot, vin->buf_hw[slot].type, vin->buf_hw[slot].buffer);
+	vin_dbg(vin, "Filling HW slot: %d buffer: %p\n",
+		slot, vin->buf_hw[slot].buffer);
 
 	vin->buf_hw[slot].phys = phys_addr;
 	rvin_set_slot_addr(vin, slot, phys_addr);
@@ -1073,15 +1046,12 @@ static void rvin_fill_hw_slot(struct rvin_dev *vin, int slot)
 
 static int rvin_capture_start(struct rvin_dev *vin)
 {
-	int slot, ret;
+	int ret;
 
-	for (slot = 0; slot < HW_BUFFER_NUM; slot++) {
+	for (unsigned int slot = 0; slot < HW_BUFFER_NUM; slot++) {
 		vin->buf_hw[slot].buffer = NULL;
-		vin->buf_hw[slot].type = FULL;
-	}
-
-	for (slot = 0; slot < HW_BUFFER_NUM; slot++)
 		rvin_fill_hw_slot(vin, slot);
+	}
 
 	ret = rvin_setup(vin);
 	if (ret)
@@ -1162,16 +1132,6 @@ static irqreturn_t rvin_irq(int irq, void *data)
 
 	/* Capture frame */
 	if (vin->buf_hw[slot].buffer) {
-		/*
-		 * Nothing to do but refill the hardware slot if
-		 * capture only filled first half of vb2 buffer.
-		 */
-		if (vin->buf_hw[slot].type == HALF_TOP) {
-			vin->buf_hw[slot].buffer = NULL;
-			rvin_fill_hw_slot(vin, slot);
-			goto done;
-		}
-
 		vin->buf_hw[slot].buffer->field =
 			rvin_get_active_field(vin, vnms);
 		vin->buf_hw[slot].buffer->sequence = vin->sequence;
@@ -1322,8 +1282,6 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
 	case V4L2_FIELD_INTERLACED_TB:
 	case V4L2_FIELD_INTERLACED_BT:
 	case V4L2_FIELD_INTERLACED:
-	case V4L2_FIELD_SEQ_TB:
-	case V4L2_FIELD_SEQ_BT:
 		/* Supported natively */
 		break;
 	case V4L2_FIELD_ALTERNATE:
@@ -1336,8 +1294,6 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
 		case V4L2_FIELD_INTERLACED_TB:
 		case V4L2_FIELD_INTERLACED_BT:
 		case V4L2_FIELD_INTERLACED:
-		case V4L2_FIELD_SEQ_TB:
-		case V4L2_FIELD_SEQ_BT:
 			/* Use VIN hardware to combine the two fields */
 			fmt.format.height *= 2;
 			break;
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
index 756fdfdbce61..a5763f1c5784 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
@@ -161,9 +161,6 @@ static u32 rvin_format_bytesperline(struct rvin_dev *vin,
 		break;
 	}
 
-	if (V4L2_FIELD_IS_SEQUENTIAL(pix->field))
-		align = 0x80;
-
 	return ALIGN(pix->width, align) * fmt->bpp;
 }
 
@@ -194,8 +191,6 @@ static void rvin_format_align(struct rvin_dev *vin, struct v4l2_pix_format *pix)
 	case V4L2_FIELD_INTERLACED_BT:
 	case V4L2_FIELD_INTERLACED:
 	case V4L2_FIELD_ALTERNATE:
-	case V4L2_FIELD_SEQ_TB:
-	case V4L2_FIELD_SEQ_BT:
 		break;
 	default:
 		pix->field = RVIN_DEFAULT_FIELD;
@@ -504,8 +499,6 @@ static int rvin_remote_rectangle(struct rvin_dev *vin, struct v4l2_rect *rect)
 		case V4L2_FIELD_INTERLACED_TB:
 		case V4L2_FIELD_INTERLACED_BT:
 		case V4L2_FIELD_INTERLACED:
-		case V4L2_FIELD_SEQ_TB:
-		case V4L2_FIELD_SEQ_BT:
 			rect->height *= 2;
 			break;
 		}
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index f87d4bc9e53e..d5763462809a 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -77,23 +77,6 @@ enum rvin_dma_state {
 	SUSPENDED,
 };
 
-/**
- * enum rvin_buffer_type
- *
- * Describes how a buffer is given to the hardware. To be able
- * to capture SEQ_TB/BT it's needed to capture to the same vb2
- * buffer twice so the type of buffer needs to be kept.
- *
- * @FULL: One capture fills the whole vb2 buffer
- * @HALF_TOP: One capture fills the top half of the vb2 buffer
- * @HALF_BOTTOM: One capture fills the bottom half of the vb2 buffer
- */
-enum rvin_buffer_type {
-	FULL,
-	HALF_TOP,
-	HALF_BOTTOM,
-};
-
 /**
  * struct rvin_video_format - Data format stored in memory
  * @fourcc:	Pixelformat
@@ -237,7 +220,6 @@ struct rvin_dev {
 	spinlock_t qlock;
 	struct {
 		struct vb2_v4l2_buffer *buffer;
-		enum rvin_buffer_type type;
 		dma_addr_t phys;
 	} buf_hw[HW_BUFFER_NUM];
 	struct list_head buf_list;
-- 
2.48.1


