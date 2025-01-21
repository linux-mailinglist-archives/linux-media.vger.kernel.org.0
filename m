Return-Path: <linux-media+bounces-25078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D26A18846
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 00:20:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2711A3A58FD
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 23:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76161F8F06;
	Tue, 21 Jan 2025 23:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="VCFZnvIf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SId+NmDF"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E91E1AF0BA;
	Tue, 21 Jan 2025 23:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737501637; cv=none; b=VSU+sDRJWC8sXAoo782a/mJiX08OQPUy49nLH6T7No+rT05CWt/DTXFlwjogQr1uSuyDfQFV3Mi78lLQL0WHkgZbwjB2m7GS2vQKcTc8U+MUMjalzsO7mH9umM6A3R5z5bcJBx/d1sX3AIFjr0wYoNj4S8vrWEq5WeuFF1XsxAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737501637; c=relaxed/simple;
	bh=K2bS8MzJYkXFINu9uSbNNTfr60ZpnXgjrQNNDMKJ+wU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oKidi3OFGx0oBl3sKA26xou/oS0zUP75kaVOwM1DMRrwo4su1LymV8yO8HunUHGRnvsf/ZSZ7ISE0u6QFxoodm2kTMKQIVW3AkqoUAKqsSrOScCehmqr+AlXHEbMt7y510gi2JyQdMhItCjDz9fAknWbIkuXIfIVwUd43O9KnP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=VCFZnvIf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SId+NmDF; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 76C3925401D1;
	Tue, 21 Jan 2025 18:20:33 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Tue, 21 Jan 2025 18:20:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737501633;
	 x=1737588033; bh=Wb4bs7iMgw67aUkI51rjiwF6ObYZ61CuG6g948PhLcs=; b=
	VCFZnvIfL6VkMOG6b2/Vdt8SE8hpgMJtd2jVSd2O8+pNyNd8GhuM++MWX6NmyLPq
	jddZWk3/sbUVG8//LXRQB+VlrNDm6/1i+C1Oli3svN0APuwh3CAZcihAgqmrQ3Aj
	ouWh2PDg+9I8aku796Mee75YSghgb4ZDeBul+HTMU8EBTKGaKTKtXx4NG9u+NzuP
	HvhLTcz65K0ywJi+AcS5zug6JMeYkrkvXLvoVQc2WQ+tykaUiIYkOgVx02lANKhl
	HkxCvoKOQbDKJXCyfVMqbjB8w0S8u9aFAGrGV0p9HPRUZA7gOK57CJQCe92CjNoS
	OlJ+TKH80nxv4Ftbmz9qZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737501633; x=
	1737588033; bh=Wb4bs7iMgw67aUkI51rjiwF6ObYZ61CuG6g948PhLcs=; b=S
	Id+NmDFkWh8T9u1fe1aGsXJrNdAddq0qWrkZWRkCbjV2QPpi4Uqp8/pTiHQxVNKu
	D6ix07xknbedVOO2k5r9WF3tURp1+iT5MJFCpKoaToRMOIanLETXUCxhA2k9iLn8
	yURzvk9UJPHsqFbQYf8eVvz2TuAbdVStNnL1yoQ91HrFjOv4DGEkyc6FwUEkrCy9
	E3uKfM5IXXNsxyxVBfmUeyw1Ny1fBsZKrYlKTKDxhp51vJH7S+HgS9EmcfalMu0L
	YLC6V9vcQpyIz+l0bK8OzAMDfYLl3lJU3/xzomCIArMmrBPatesT5LsSKdon27mk
	p44KTrOAsP2uwwA/GTNRA==
X-ME-Sender: <xms:wCuQZyuDhBM0IfPvszvml5lT-km3dPiBPuUpl9uW5QoUQ36zrQ7Y-w>
    <xme:wCuQZ3eX3tqaXUQOtmoRbG2fuJ51Dkr6B9LH_K_Tzn2i268xRaWICPCq5ju2lYquv
    vKSEBAuP4ouKAP5_bA>
X-ME-Received: <xmr:wCuQZ9y_7_fksojYRgPAvM1Yx6hTyfaHyU5t2OeEgD4PG8wmAikUhiVcJTrz95OT2diboNhl_VUKXMyOrU0Zz50c9w>
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
X-ME-Proxy: <xmx:wCuQZ9PEJ-Nvj2CaCC6DVHemJo2NzQbUb_cDpaj1_zcWwweBUo8NfA>
    <xmx:wCuQZy8kjBs-rWG93ypnTFqA8_7w3m4jym96_qdHxWVeOWXw7wnVag>
    <xmx:wCuQZ1U-aEHVJMwx_8j2Wf5-AlqFqhKB5q5kVnqCtF_k7RA_r34fRQ>
    <xmx:wCuQZ7d5XCA6Tlpkrse2_Ou3WW75yMjp_E-VsqC0WGMs1Cq1QtwxIQ>
    <xmx:wSuQZywJlThaUJuaaHaw2SildgftCIJFQGcAw9IXs30zzoPuf2k7Ooa0>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jan 2025 18:20:32 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/5] media: rcar-vin: Remove emulated SEQ_{TB,BT}
Date: Wed, 22 Jan 2025 00:19:23 +0100
Message-ID: <20250121231927.187463-2-niklas.soderlund+renesas@ragnatech.se>
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
 .../platform/renesas/rcar-vin/rcar-dma.c      | 55 +++----------------
 .../platform/renesas/rcar-vin/rcar-v4l2.c     |  7 ---
 .../platform/renesas/rcar-vin/rcar-vin.h      | 18 ------
 3 files changed, 7 insertions(+), 73 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 8773998101ff..692464723989 100644
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
@@ -1029,25 +1025,9 @@ static void rvin_fill_hw_slot(struct rvin_dev *vin, int slot)
 
 	prev = (slot == 0 ? HW_BUFFER_NUM : slot) - 1;
 
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
@@ -1056,16 +1036,12 @@ static void rvin_fill_hw_slot(struct rvin_dev *vin, int slot)
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
@@ -1073,15 +1049,12 @@ static void rvin_fill_hw_slot(struct rvin_dev *vin, int slot)
 
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
@@ -1162,16 +1135,6 @@ static irqreturn_t rvin_irq(int irq, void *data)
 
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
@@ -1322,8 +1285,6 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
 	case V4L2_FIELD_INTERLACED_TB:
 	case V4L2_FIELD_INTERLACED_BT:
 	case V4L2_FIELD_INTERLACED:
-	case V4L2_FIELD_SEQ_TB:
-	case V4L2_FIELD_SEQ_BT:
 		/* Supported natively */
 		break;
 	case V4L2_FIELD_ALTERNATE:
@@ -1336,8 +1297,6 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
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


