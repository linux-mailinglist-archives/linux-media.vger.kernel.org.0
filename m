Return-Path: <linux-media+bounces-25080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 351C4A1884B
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 00:20:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D16CF1889B66
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 23:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECBD71F91C4;
	Tue, 21 Jan 2025 23:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="JOB6FRNM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Zupmjs+d"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8CA1F8F19;
	Tue, 21 Jan 2025 23:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737501641; cv=none; b=Yvi7DvB6+T2FWMgm4TuhaaBbfhxIpEXJ3Ctp2qqLAFFAirNd/kj6c1v9sKWFtQAvlS40h2Y+5y7IZmsA7w4D8HBbn5UmswlJ5tM1h0KXXaaaaDE3vaeG9tp29yxfyLOdJougCBEmN+gdMNPt0ieRsAOR0IuvhB/NmFh7YWuNVQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737501641; c=relaxed/simple;
	bh=wgLET5XRPhH5ZNlcx7oKR5eUKV/qFA83ewcnUixD/CQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A/LhQbs7x8FVhIWWTYmh0bNogFT/v6LL6/7YXl2engm9KSz3yByt6jGvcd4CinWfpeGwvTgN51jcXX7BheNrWVHn5HIa19PW5arEyxniSnnI9mNlJGdtK2twVndWudd6nIwwFIuft69LP5lK4+5Eb1zd6RV8dJAyK6YnqQvrcjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=JOB6FRNM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Zupmjs+d; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id 78F321140211;
	Tue, 21 Jan 2025 18:20:38 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Tue, 21 Jan 2025 18:20:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737501638;
	 x=1737588038; bh=DXK1AN1sb9iE43Xv9F8P0x/+risgcqCwFS1l9oqkXNA=; b=
	JOB6FRNMrAgJ9BXIYTQotpcmmovIuVTIDTvcTx901b+RIihvsJ9vvWc8lVBZX2Zh
	RsrKx3r1MiswC0xjf96wgbTsBdbIIoeaNNK4sY2rCaWmwcC3yBd/v4833htlrGlH
	A02A0yCOh8b4MwBCZc6qNgpI51Qw0FvGmUzQw2P8dbDMlAZb8nFACkdyHlEs2OKG
	ZPLubSCkj99MDrTKvwdnfNG49D5NkMuZTmL9AS75KJy9nIXi/Ref0U3fGHmIgRIy
	pGBdvsZeYvBMTOaNm6IdPxrxQbNYETM6iNPQodFruOgzovvxdJTOADPNoaf/t2cl
	98yRGChIRTDsY3S0tTByWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737501638; x=
	1737588038; bh=DXK1AN1sb9iE43Xv9F8P0x/+risgcqCwFS1l9oqkXNA=; b=Z
	upmjs+dzZ6dfqS4uyJwLA2vnH0xNEEd+rrutCdkJsQxbAPk2DT7mHIBzpIvyclVG
	a1Pp5FcOaUAzfFP69PlUr7SiYbdLlFDTwUUL/laGVjkWFdtmOprHMcKmIkTv22zj
	x/pWcd3sPXzNDiNImDfe1KjdG+BFHLazlActE4yWYHsyPJ1Itd4eSvnLhC2YyXHf
	3feQjMaYSMR9lMJZo82PwhsuHkX9N9d7NZ/VaAVsIyZi0OoB8o1kqmuG1TP7NdQ9
	NSTgFkYVxApuChc3EwEy3DOt7hyh7KdiEtwA4qt8F2ml74r4L4Is82EhY6e0ylA6
	Rz31dput89Zr4+g5DN/9g==
X-ME-Sender: <xms:xiuQZzq9ImVSmH7sOMYl_L8dGBwex6QyJBhoqNk-YGsX94hkiF8cgg>
    <xme:xiuQZ9rJOkuo9w9HMCBE0ysZksTE1LMAREx8C9E2j9IJGA0CGJQUFle5MaXQ9ne8Q
    HP-rMEOnhR1fKFDoMI>
X-ME-Received: <xmr:xiuQZwMmuvHgjJIKYjl6DFAuvHU8S7iHFT_3-0L3kw84UUV8clZt-ob5I41sO_bgxVZUTRWzv8UQ2VGdxR44RtGffA>
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
X-ME-Proxy: <xmx:xiuQZ25NEBQn88rQYKfzIMI2fZXCE9ukvaNXmQBrB04Lxbqw4IjG6A>
    <xmx:xiuQZy6QLTJ5o1sR_OOiO7uetcvNueSvQC1bMYxT6gVaZqN1_QF--Q>
    <xmx:xiuQZ-hTPpzhPkA40rQgJMDb1T919zrflDt6S3_wWzZrW8WZzxl0tg>
    <xmx:xiuQZ067aYIp2LHbGzvTev1sNZNyfoGLQeFi9bl4cPA6Nass3bZKbw>
    <xmx:xiuQZ_vkAR2gq0TkpOrdC2OdlojZAfJ3kkIFbCmiJr4fCLmQP-KbyZkx>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jan 2025 18:20:37 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/5] media: rcar-vin: Remove superfluous starting state
Date: Wed, 22 Jan 2025 00:19:25 +0100
Message-ID: <20250121231927.187463-4-niklas.soderlund+renesas@ragnatech.se>
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

The STARTING state is superfluous and can be replaced with a check of
the sequence counter. The design idea is that the first buffer returned
from the driver have to come from the first hardware buffer slot.
Failing this the first 3 buffers queued to the device can be returned
out-of-order.

But it's much clearer to check the sequence counter to only return the
first buffer if it comes from hardware slot 0 then it is to carry around
an extra state just for this. Remove the unneeded state and replace it
with a simpler check.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 5 ++---
 drivers/media/platform/renesas/rcar-vin/rcar-vin.h | 2 --
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 692464723989..e4600e615238 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -1067,7 +1067,7 @@ static int rvin_capture_start(struct rvin_dev *vin)
 	/* Continuous Frame Capture Mode */
 	rvin_write(vin, VNFC_C_FRAME, VNFC_REG);
 
-	vin->state = STARTING;
+	vin->state = RUNNING;
 
 	return 0;
 }
@@ -1123,14 +1123,13 @@ static irqreturn_t rvin_irq(int irq, void *data)
 	 * To hand buffers back in a known order to userspace start
 	 * to capture first from slot 0.
 	 */
-	if (vin->state == STARTING) {
+	if (!vin->sequence) {
 		if (slot != 0) {
 			vin_dbg(vin, "Starting sync slot: %d\n", slot);
 			goto done;
 		}
 
 		vin_dbg(vin, "Capture start synced!\n");
-		vin->state = RUNNING;
 	}
 
 	/* Capture frame */
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index 4cb25d8bbf32..f13ef379d095 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -64,13 +64,11 @@ enum rvin_isp_id {
 /**
  * enum rvin_dma_state - DMA states
  * @STOPPED:   No operation in progress
- * @STARTING:  Capture starting up
  * @RUNNING:   Operation in progress have buffers
  * @STOPPING:  Stopping operation
  */
 enum rvin_dma_state {
 	STOPPED = 0,
-	STARTING,
 	RUNNING,
 	STOPPING,
 };
-- 
2.48.1


