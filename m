Return-Path: <linux-media+bounces-35001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A16CADB937
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 20:59:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B5713B2BC2
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 18:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0727328A721;
	Mon, 16 Jun 2025 18:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ISlyWYTH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OynJDX+q"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8032728A1EA;
	Mon, 16 Jun 2025 18:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750100320; cv=none; b=LOY24F32blCkbGxsXtOWVbu6TEIkxNGGjKYAKxmmTmkv1vtCzNXEPuNwLCFfLcu1C/1vpBoZjk8OvF1KhoxmxVLLYwLwjcnAW1kSriKB5yd3wxhKZa6GVgDbljquvexcR/r0mkRaY0aI+e17qHXjE+vZGVFGTb4UbHxfiiP1Q2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750100320; c=relaxed/simple;
	bh=8/3kpwgl1nPXMO09fd/PTQcu/r04UTaiOnNHiwPTx6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KIrOQyENmDP2iQHOLwQ6KFBql6UDl0x/V23HZeMRPV8KZO3d/oyaJkCzk7o4NIeHg9DM/yzDezHVL14m/4KBsNVmricytRT9tsJ3+uGMzdoJVUuTmkfpdF6IOu6cZ4LgvSXNaPQCidTm8h4NvNM6H+wcwG23XbQm8/rJuwqnZDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ISlyWYTH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OynJDX+q; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id A1DFC1380397;
	Mon, 16 Jun 2025 14:58:37 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 16 Jun 2025 14:58:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1750100317;
	 x=1750186717; bh=CBlTK1NcwXwVEcjMtr0ZJRAk5aP5Rj0Kevz6K7/iAgg=; b=
	ISlyWYTHLSbGoEItgZTIUA0814TsuGX4UBngSG4yDzbg+ziUvV1pBTa137/94Qoh
	kBe0un47VLCiaOpaCLYFJ2mRqw2gxT6RMuTNEvMLFUjeEh1fyo+Ai+TN4F3RwOfz
	b6c6hF0bin+xwocTLfL9KVOv7JEkVSG/WS6mTJ9mFAwHQnBNMzNLq//YLV8etqQ0
	Jc5wO4886LkzcMdnC58PNjfim5TeYmAI9WfopvE2jooFHpqlqhy07qWCL65TEI64
	tQ+BgZagMKcCFoPtOj8L7K+WPxbFiyHqm51QlSyYkaR0fYnSETCmUlvYstw0+3vK
	e4SpWB9F0J0Qt5SDm6wK2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750100317; x=
	1750186717; bh=CBlTK1NcwXwVEcjMtr0ZJRAk5aP5Rj0Kevz6K7/iAgg=; b=O
	ynJDX+qnyMNd2fQq/jerwqs+skqBuFiTXGn8D4dMs7k+WUxTXFVO3PaBxmO1T7R5
	6OXGEbtp23GFP8NKmIk30Do3FADfaFcglDQjm4cprN/2yi0Nzcihtwv3NGIa3zxC
	whJxy8x17MihLhwlWHKgqCoz5pXH1lowz9h1CuHq007oCvvJvaAfEB+dJlGJ1lcI
	fGDmC53IrjEckR/6VHxBqvnwfdaQzHBKbIohP2DbcSUgBjmIT/bXtbIUJiW8nDCI
	g06NXuyv0HAhomPpSdmGk/WVeuuhJI6cdVr3HmuMwqMlnG3I4e0rRtbNvotFeFhx
	Tg1446qRE+U5XZCQdTFbA==
X-ME-Sender: <xms:XGlQaHHPTm-8jzdlWLCe8X_zbrpP1GWt6Im4ODtr22qbMsN8iwgwJA>
    <xme:XGlQaEX1D7UPd6VxmPryg9eaBaITLfqcVaCjkt41fyICAquv1ZfLiTcsHK3BACsRR
    UQixQF7FHzaKQDJY0g>
X-ME-Received: <xmr:XGlQaJLEI1cSXqFzeul1JbyKnbNxTnQW_auP4k8v4gpZas-2rOMaFxNfhzqwyIcFq0s_gQtQISRpiZcWdpUTtaNNaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvjeefiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlih
    guvghrrdgsvgdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhn
    thgvlhdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvg
    grshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqd
    hsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgv
    rhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrd
    hsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdprhgtphht
    thhopehlrghurhgvnhhtrdhpihhntghhrghrthdorhgvnhgvshgrshesihguvggrshhonh
    gsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:XGlQaFFKUVRFxjpBgi2KDLYymv5ePD282m8GirJl0ZisSv-3qGEDUg>
    <xmx:XGlQaNUuUex9uBUeeuvgglGCly7RDlswVt7XRv2MkROH7AkakYUPmg>
    <xmx:XGlQaAPr5vGNcqtTy07uPJi36hzWMF5ri8id3Brny-X6JYlTo8VshQ>
    <xmx:XGlQaM1T2ClH4ABFgK6pZHtMQhhlLs447e8WYIA5ryXGb_MFpPHWdQ>
    <xmx:XWlQaPj_tbRTzUfKUE-8w_Y2992ArYimlZKaW8qmnhlpI79Cezkvh9lN>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jun 2025 14:58:36 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 3/3] media: rcar-vin: Generate FRAME_SYNC events
Date: Mon, 16 Jun 2025 20:57:22 +0200
Message-ID: <20250616185722.980722-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616185722.980722-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250616185722.980722-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable the VSYNC Rising Edge Detection interrupt and generate a
FRAME_SYNC event form it. The interrupt is available on all supported
models of the VIN (Gen2, Gen3 and Gen4).

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/platform/renesas/rcar-vin/rcar-dma.c  | 17 +++++++++++++++++
 .../media/platform/renesas/rcar-vin/rcar-v4l2.c |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 19ff190f0fb2..b619d1436a41 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -13,6 +13,7 @@
 #include <linux/interrupt.h>
 #include <linux/pm_runtime.h>
 
+#include <media/v4l2-event.h>
 #include <media/videobuf2-dma-contig.h>
 
 #include "rcar-vin.h"
@@ -114,10 +115,14 @@
 #define VNFC_S_FRAME		(1 << 0)
 
 /* Video n Interrupt Enable Register bits */
+#define VNIE_VFE		BIT(17)
+#define VNIE_VRE		BIT(16)
 #define VNIE_FIE		BIT(4)
 #define VNIE_EFE		BIT(1)
 
 /* Video n Interrupt Status Register bits */
+#define VNINTS_VFS		BIT(17)
+#define VNINTS_VRS		BIT(16)
 #define VNINTS_FIS		BIT(4)
 #define VNINTS_EFS		BIT(1)
 
@@ -889,6 +894,8 @@ static int rvin_setup(struct rvin_dev *vin)
 
 	/* Progressive or interlaced mode */
 	interrupts = progressive ? VNIE_FIE : VNIE_EFE;
+	/* Enable VSYNC Rising Edge Detection. */
+	interrupts |= VNIE_VRE;
 
 	/* Ack interrupts */
 	rvin_write(vin, interrupts, VNINTS_REG);
@@ -1040,6 +1047,16 @@ static irqreturn_t rvin_irq(int irq, void *data)
 	rvin_write(vin, status, VNINTS_REG);
 	handled = 1;
 
+	/* Signal Start of Frame. */
+	if (status & VNINTS_VRS) {
+		struct v4l2_event event = {
+			.type = V4L2_EVENT_FRAME_SYNC,
+			.u.frame_sync.frame_sequence = vin->sequence,
+		};
+
+		v4l2_event_queue(&vin->vdev, &event);
+	}
+
 	/* Nothing to do if nothing was captured. */
 	capture = vin->format.field == V4L2_FIELD_NONE ||
 		vin->format.field == V4L2_FIELD_ALTERNATE ?
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
index 9b1e3a9d3249..62eddf3a35fc 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
@@ -489,6 +489,8 @@ static int rvin_subscribe_event(struct v4l2_fh *fh,
 				const struct v4l2_event_subscription *sub)
 {
 	switch (sub->type) {
+	case V4L2_EVENT_FRAME_SYNC:
+		return v4l2_event_subscribe(fh, sub, 2, NULL);
 	case V4L2_EVENT_SOURCE_CHANGE:
 		return v4l2_event_subscribe(fh, sub, 4, NULL);
 	}
-- 
2.49.0


