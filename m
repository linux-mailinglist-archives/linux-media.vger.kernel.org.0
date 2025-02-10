Return-Path: <linux-media+bounces-25945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D37A2F61A
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 18:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A04443A36ED
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 17:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678C21F463E;
	Mon, 10 Feb 2025 17:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="SmkszRat";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KQ1+PLqz"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5732566C8;
	Mon, 10 Feb 2025 17:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210208; cv=none; b=mI7bHA2WEz9+J6drV4FqO1k1OO2txE8A8h+9ClclO8BRX1NBGwbR+iyHNldN2jebZBPaEje4PPDF+4rdsPnTUZwxAC1lLAH9s/xUnnOr/poeLdyGOAGsmI5WaQ2MXjERvJZ/i5XQr4yQUzpeNWUtJUioCyu3oDakVeuuYyQ/AwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210208; c=relaxed/simple;
	bh=RF3miZ49pe0vcIdpcavO9YqSEAMJxrSv5R1Ncv7F6Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K7aBqIXyIN4Vc8OOVpd6ojfUU9cXTie/21oRBqFwQ7bC50cnibXVUJ8DCZBWGohbxKF66PYV2lnQzOCLvGBRATLRmzqIaYq4akD6LBv+OGFU/ZCUeNBEmDfNqM/zM3WdITfFdAFj9vXN5fRzX9aFAwfldRxx98cSIQM8z55WoW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=SmkszRat; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KQ1+PLqz; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 5BF53138097E;
	Mon, 10 Feb 2025 12:56:45 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Mon, 10 Feb 2025 12:56:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1739210205;
	 x=1739296605; bh=qUnZh0YAnsGSR1WSxEryTHZVAxOVNWRSgPqukKSsZL8=; b=
	SmkszRatIpOnXKoUExuZrxHVs0Q+a86lHpS3p2V/XM/kmx/ZOaZUCZO/TGSoN/je
	AzOCGyABpm9hEbUol3VKYARzoIjCgWIsLtzS/mqjeESWY2DNyvtPLCZ0f/D15Skw
	KNDRyI7WE0xGyDckiNYStz95FmLwLsTzBY7hIXpQ83FVXObnxW0/zxHKRiXF1FTG
	g/17OtlpTWJfimG7n3A/zaaUarUcIz4GrUIQvvy9dQpI5HiqRNSYy5VLOoQ5eY2J
	K8H1eM0VrQnVvXI2gNdCkGhHI4qd5SPy63cC+Hno1JS9k99cOWArxTEiJxTW0NJA
	btQH3u+AGgcMUzXnoQr2LA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739210205; x=
	1739296605; bh=qUnZh0YAnsGSR1WSxEryTHZVAxOVNWRSgPqukKSsZL8=; b=K
	Q1+PLqzj68vsxgS4YJLmmiwdeQeWmc5nZrvnsN/MV9t23hb+BBXhzdzYfmLGeL9z
	3xrJxyo/3Vrcf9zmYLXnCopP+HCMXzr5Ap/MCHPQQHi8gQLjvGOvWKTOUcK6Lh2b
	KUtvLLAaGx7oTIjO6oWCcrtIUCLQpJRbNlFFmIU4BzLKl8rjfY26TtzBIVoK/lFa
	IofYdiLm6cYQ0uBuj6XwoCbEaHMrK5Mn408s01HnKGo37aY2dbDBUh9Gq0EwlV4J
	cQQxO2QeetHeOmRsP42ujEPsnnP9rLjZhpiNuUpBwN1QZt6DfEV4UNAn7ZWZCUdf
	LSlUH90nRM1av4hPJ5XPA==
X-ME-Sender: <xms:3D2qZ4tmOo1YJPT1YG-sD47oo0rn-fU8LB1Fv7jr6FNi9G3dWTeS8A>
    <xme:3D2qZ1enGPRIuAyKoEwHlUdVgeGrs-p_T-nIUtR3_-YkwDrdOv8YKlmI1DKRo1-3Y
    G-rXKeSOLUzwTQu4So>
X-ME-Received: <xmr:3D2qZzzCa8JLQs4APoiOWJAGx9xd4_QoCbnI6hxKEe8hBXWg79zRnY_Mp0MmTp8yj6TtIphnoDdlB7YRpAF8PuFepg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefkeejvdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:3D2qZ7MHl_Qz6VKRgOnMLdtR4XzXQNVST_l8xThtowS1tWot0VIxsg>
    <xmx:3D2qZ4_dgGRVwyU1XRSjrIdY0t2iL66g2eP0eoPWnQJMkWoKAJn-PQ>
    <xmx:3D2qZzVsp1SAmjpfLie4VuWdfvXotEzkycfL6HAiBJWPZaRKG3kf3w>
    <xmx:3D2qZxdC-p8uKiNlG3StxS-JjW5hlQw-69tf-MfSmaYFjjLEHPy2DQ>
    <xmx:3T2qZ4yECpOm45cV0OEqAa-kDi0tr9qa6YnP6EXhrA1RzRaAJBjVvzW3>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Feb 2025 12:56:44 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 1/5] media: rcar-vin: Remove emulated SEQ_{TB,BT}
Date: Mon, 10 Feb 2025 18:56:11 +0100
Message-ID: <20250210175615.1686529-2-niklas.soderlund+renesas@ragnatech.se>
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

When the driver was converted from soc_camera software support for
V4L2_FIELD_SEQ_TB and V4L2_FIELD_SEQ_BT were added. This was done by
capturing twice to the same VB2 buffer, but at different offsets.

This turned out to be a bad idea and it never really worked properly in
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
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
* Changes since v2
- Fix commit message.

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


