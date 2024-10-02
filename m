Return-Path: <linux-media+bounces-18989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFF698D15C
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 12:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F28A12849E7
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 10:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4848D1E766C;
	Wed,  2 Oct 2024 10:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="OkbXj0KA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZOoquUYd"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FFE1E7640;
	Wed,  2 Oct 2024 10:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727865275; cv=none; b=qayjG2hMDQqt5QRXgTC5kfVS1M/AfiCgsd76Xrc+bKNJEnV1nTRufE02BbBa9ZPh8sddvBYhe9EQbRbx/koBsmJn4J8kt1D0/HEbq00Ge7X0sq9hJFmVTfZbe86eZkMcra2aiQ2lpofhOOT86+ldAR+2jt2i+QhUp4CDmKiZegI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727865275; c=relaxed/simple;
	bh=G522Qyv90fhmHZNIjtHj6Ck/psTpCs7LS9y0AdeN9eU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iLY1rbpaPRcO8gDVF7362zkO+7di7h7FEEdWHyHiWr6RLbDaEcM+nmCFNg1oO5imfZUwjx/hW3GAEV9+gfcEhLZoRbYntLx7mRScUdsr8j2R97PT1/HSFxcyy1iB4Ab0Z7SxGlYjOtHjVuOZl2gt+9WkAy5P7PhkLikbvFeLwAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=OkbXj0KA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZOoquUYd; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EB6F91140227;
	Wed,  2 Oct 2024 06:34:32 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 02 Oct 2024 06:34:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1727865272;
	 x=1727951672; bh=T5Y+FAz9g0qInH3bNmjSjIsekBT/yx07ijPT/39sM60=; b=
	OkbXj0KAzn+EPq4SzT8ethS5nI8uOJKRsrrHtTgFMBifQzHyITXoHYTZ2tnzRVja
	vaKILx3vRtAHhU3NmcNk7oSRjqCg+yZvufiwORzOc9JjTYHblfV8Qa3HoTNApB9F
	8E787NZ0s2jAUQka3vaRxevpzNPNVio9v8GK9Q2/Xi1mtReyrbVb9B1Z0JfaBYK1
	ivj/g61AhY7IR4xQm5xwwzGphDfW6aIg377voU9gQUr6nZp/av9JW6O5tIuKof5d
	4TXfZQrhUzJ1bQn6VQCRqipjzpnDxEsvUevKtUPLg0ziiIUhw6jp7b+oYEOXLqi6
	S4Gf+Fi1CemN9Uk2xPAPzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727865272; x=
	1727951672; bh=T5Y+FAz9g0qInH3bNmjSjIsekBT/yx07ijPT/39sM60=; b=Z
	OoquUYdrEF1SkaeDyD/EwUefJdYk5wn08Pqb1ji4k+uM6thjMDtuxV/eS8gr7IF6
	N9YUFcDS5phwwh0JPQ6zE6p34XliF2xU1IjooNZPSb37cPe+9HI8TVtco73lNz5p
	KduGh6Mz/D4cZesFux+oChdWFh9DTnQWh3TnHrWYVMGMj5KNTd1J6BIb4gbUaWmq
	Hhy++TtuqrZ6SVChGAIClh4DH37aDhuaWPHRYN3TndO44C8DVe+dxmLuKpPUbgYb
	eGt05tb54tE0boa1qjFkevtahspDirFnxHgfzz3MCEey4r1R/axRSq3g4c7ohDhh
	4hcteO5HGHi+7ViWBwT8w==
X-ME-Sender: <xms:uCH9ZquXV7qdIZYu6TcVs-RoNfBb65yTbRmHra16LbDVsD3LK1VrMQ>
    <xme:uCH9ZvdRKW28ZJ67oazJczP4rBj6ybN3hZcgr4lFlFIJdjdbl3sxSN6LiTY2QVUCs
    vvaBISwuEmV_aZ-o04>
X-ME-Received: <xmr:uCH9ZlwoUFOJp_h5Np0DYKPMD0KwnFmXVvCdYe-WuX7RnsmPoAoQz2a5jQs5v2dibSaqODeI8c6ce8M99hZ-lPkkFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdduledgvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffle
    efgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhn
    ohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgrkhgrrhhirdgrihhluh
    hssehikhhirdhfihdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggv
    rhdrsggvpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsoh
    hnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:uCH9ZlNDF79a0S6sQ81j-60HhCe2Ubx03bwFLkWfZvvaYGEHaXXEIQ>
    <xmx:uCH9Zq8ALIpEFxUei5R_byQFlUoORJ4j7qtacJmMeaxLLLXxL7C-Gw>
    <xmx:uCH9ZtUglEEfnVjNK1Sa8irPas5NORNyIUizJgTlbEXQIoQsofaVNA>
    <xmx:uCH9Zjfqim4MBZfJzEd9sMHMd-Zp9uxCI2dsDlRHHJxuGBg8MYPEsA>
    <xmx:uCH9ZlXmsY7gIP7jweQ3zUWrSB0G8zP4kDGOof_M7oRPsrWVm_qc-tOI>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Oct 2024 06:34:32 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v3 2/3] media: rcar-isp: Add family compatible for R-Car Gen4 family
Date: Wed,  2 Oct 2024 12:33:17 +0200
Message-ID: <20241002103318.24289-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241002103318.24289-1-niklas.soderlund+renesas@ragnatech.se>
References: <20241002103318.24289-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the Gen4 family compatible. This will be used instead of a SoC
specific compatible for the new Gen4 SoC V4M. Two Gen4 boards (V3U and
V4H) have already been added prior and their bindings need to be kept
for backward compatibility.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
* Changes since v2
- Drop comma after sentinel.
- Rewrite comment about compatibility with old DTB files.

* Changes since v1
- Reworked to add a family compatible instead of V4M specific one.
---
 drivers/media/platform/renesas/rcar-isp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
index 4512ac338ca5..acc30bcb13ef 100644
--- a/drivers/media/platform/renesas/rcar-isp.c
+++ b/drivers/media/platform/renesas/rcar-isp.c
@@ -431,7 +431,9 @@ static int risp_probe_resources(struct rcar_isp *isp,
 static const struct of_device_id risp_of_id_table[] = {
 	{ .compatible = "renesas,r8a779a0-isp" },
 	{ .compatible = "renesas,r8a779g0-isp" },
-	{ /* sentinel */ },
+	/* Keep above for compatibility with old DTB files. */
+	{ .compatible = "renesas,rcar-gen4-isp" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, risp_of_id_table);
 
-- 
2.46.1


