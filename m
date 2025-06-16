Return-Path: <linux-media+bounces-35000-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C04ADB933
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 20:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34DDF166F9A
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 18:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE0828A1F5;
	Mon, 16 Jun 2025 18:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="faDYVJOI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="U/CBU7IW"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34304289E38;
	Mon, 16 Jun 2025 18:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750100317; cv=none; b=fK/dUFmuH+k1FDlyRbUj3ba6nPusjtWSUdGjejf1XDfMB2LNtgOMFscwStnleJL3yb8Bwl/KAlWc4HSVOb9n8llgMiTqvjhzY6gDUkz/C9t2e2l1cYiS261AXmzt3CUZLZKQcwPXGZlNRsIDO0kKGhF8UKnva9xDCZtVodox55U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750100317; c=relaxed/simple;
	bh=fp7k0Eu4zr5HIsAn2D7maSlX3jOFNWn4nN+HaopU02k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rvmvdu5LqGC3oJVT4C19ihJwLMuvW60K51+Vlea+0EZcSRLWirWp7neNvFbPdOn7c99CsYgBYqIk3/8R6GjxFzWFUqIE+kSUwPV9qKwqjanP+44Ibw5SZjrIgbja+Yjwkj92oikbcd/iT+tv9UcUQscMz8jcMFskRV2jzZu5Vhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=faDYVJOI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=U/CBU7IW; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 4F9861380109;
	Mon, 16 Jun 2025 14:58:33 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 16 Jun 2025 14:58:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1750100313;
	 x=1750186713; bh=xNoR0XdSng3gARyJWZQvehUw6CyacJ/aimazB5nzGzQ=; b=
	faDYVJOI6LZbdWJSE5IW71Co+SpTZ6iP6MbAhxmWkI//Yfk3l8QeE5QsPgk8rwaC
	/7AKTn/1Cea1PM344iJ62Js2krHVJ/YJxwJKSkUpGpq0MRVFl58GN6EsKjiN8SBM
	eer/4fGoFxbxWsPYSvIOkehGq3X6o+dq5MPhScMfo7rmWar1wZH/ay+jYkXaOztQ
	9cqZG2fdWxcG+hBW/8bj7o5NIglj6pA7EG73tR+4F+M+WWcPScVBaQsTl0jCyq7a
	VNDDkYJYi6pOpfgNCw8J3Try97aH2OaK55dpA9+G7XF/JKDuB/45q0SCG3xEEFg+
	LOnwHAOisG2Wd8xSHQLNwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750100313; x=
	1750186713; bh=xNoR0XdSng3gARyJWZQvehUw6CyacJ/aimazB5nzGzQ=; b=U
	/CBU7IW/tlmUP+EfowmCclSfZEtiO1vkc9KDu4ZAZgogNW1RfLa9AmYcm8/+hDTp
	B9OnaA0X1RRhWXik39vjI72/hwXNq1b4ZRh1BId/Lo2xbpjStjvH2NJMgv100QbM
	+3aqjHxYdqx5gyeJyxh3QUzJw20CRmgTvEiX7j3rQplgq0WaH/lTsnkS15SBhyDo
	j8RjsGFJe7JUE4BvzvCm+nZ+CVro1y0ORbI+DHyRl4hloia8l8wT/H4Q1/Nv42w+
	JyCIyVN6sN9llPSFK4VM3+44hE1D1vpQG/Es/+6anLmoZbmrnlXTN0xUs9A5SA7k
	vAdTZkS5sWxH0qKBwNULQ==
X-ME-Sender: <xms:WGlQaIo9D-MDhPREeHhgmwk8LDN17tOLaiM_JmLzh2egZgRZBkvdhw>
    <xme:WGlQaOpL9Q0gcRgNUUhUKrLYF6Vmcww_L2BmkESlLWS7ydksfdcWAlGKJX__E4ehV
    W8XS1MuhVrsvhp44ns>
X-ME-Received: <xmr:WGlQaNPmvTJiWTf_oZBIfeZauhnChIRUHR0WLFoxexSxO-4g9UlXSfEP8XQ0kr_pVWXoaMlasdb-t5fAbLW29Mk3JQ>
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
X-ME-Proxy: <xmx:WGlQaP5FpEFIBqAurM25089grZib22ijSFewPe66edd2hWJkoOdOOw>
    <xmx:WGlQaH7FP5AezOLiVcg2zA9BOmJ5Qgh8v5gHBxt915iKl03XJyTFUg>
    <xmx:WGlQaPjmpIv6Ivv3Hkfd46uepOtCmsMm-aq5X_G9D917c33NsOKsHQ>
    <xmx:WGlQaB659guI9E_bplmBpCalqBo1ddlBWn259-qRgxTsgdyWg-pBLw>
    <xmx:WWlQaC2gNWqmY9Fb8bHpKTwC8tFeym_vNC8jDWQ8UAeqIlDLj9gXzBwR>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jun 2025 14:58:32 -0400 (EDT)
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
Subject: [PATCH v2 1/3] media: rcar-vin: Fold interrupt helpers into only callers
Date: Mon, 16 Jun 2025 20:57:20 +0200
Message-ID: <20250616185722.980722-2-niklas.soderlund+renesas@ragnatech.se>
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

The call sites using the interrupt helper functions have all been
reworked to only one for each. Fold each of them into the only call
sites left.

This fixes a possible interrupt loss in case an interrupt occurs between
reading VNINTS_REG in rvin_get_interrupt_status() and reading it again
in rvin_ack_interrupt().

While at it rename the variable holding the current interrupt status to
make the code easier to read.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
* Changes since v1
- Extend commit message per Laurent's suggestion to indicate the
  possible fix of interrupt loss.
- Fix spelling of each.
---
 .../platform/renesas/rcar-vin/rcar-dma.c      | 27 +++++--------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index d4faa5a4e757..e1dae46b06d4 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -903,21 +903,6 @@ static int rvin_setup(struct rvin_dev *vin)
 	return 0;
 }
 
-static void rvin_disable_interrupts(struct rvin_dev *vin)
-{
-	rvin_write(vin, 0, VNIE_REG);
-}
-
-static u32 rvin_get_interrupt_status(struct rvin_dev *vin)
-{
-	return rvin_read(vin, VNINTS_REG);
-}
-
-static void rvin_ack_interrupt(struct rvin_dev *vin)
-{
-	rvin_write(vin, rvin_read(vin, VNINTS_REG), VNINTS_REG);
-}
-
 static bool rvin_capture_active(struct rvin_dev *vin)
 {
 	return rvin_read(vin, VNMS_REG) & VNMS_CA;
@@ -1040,22 +1025,22 @@ static void rvin_capture_stop(struct rvin_dev *vin)
 static irqreturn_t rvin_irq(int irq, void *data)
 {
 	struct rvin_dev *vin = data;
-	u32 int_status, vnms;
+	u32 status, vnms;
 	int slot;
 	unsigned int handled = 0;
 	unsigned long flags;
 
 	spin_lock_irqsave(&vin->qlock, flags);
 
-	int_status = rvin_get_interrupt_status(vin);
-	if (!int_status)
+	status = rvin_read(vin, VNINTS_REG);
+	if (!status)
 		goto done;
 
-	rvin_ack_interrupt(vin);
+	rvin_write(vin, status, VNINTS_REG);
 	handled = 1;
 
 	/* Nothing to do if nothing was captured. */
-	if (!(int_status & VNINTS_FIS))
+	if (!(status & VNINTS_FIS))
 		goto done;
 
 	/* Nothing to do if not running. */
@@ -1400,7 +1385,7 @@ void rvin_stop_streaming(struct rvin_dev *vin)
 	rvin_set_stream(vin, 0);
 
 	/* disable interrupts */
-	rvin_disable_interrupts(vin);
+	rvin_write(vin, 0, VNIE_REG);
 
 	/* Return unprocessed buffers from hardware. */
 	for (unsigned int i = 0; i < HW_BUFFER_NUM; i++) {
-- 
2.49.0


