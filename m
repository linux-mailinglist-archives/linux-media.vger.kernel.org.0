Return-Path: <linux-media+bounces-16830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6344A95F432
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 16:45:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18E50282E68
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 14:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D930193065;
	Mon, 26 Aug 2024 14:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="aB1yCiJw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kBWv/ZNI"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329BB18FDDC;
	Mon, 26 Aug 2024 14:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724683480; cv=none; b=gbVlzOhEIURk4Vu1/KXLspxXoU/gZ+iV0R6N3PazfZS+9qhR4IbGJmd5itJq9kU3RNbiy2eN+x3Ti9a28lGj23KiDW7+J7FJpy9ztzeGDZNXNIgj0VkNMxCKvnMWOa3LcgagQ6MrU/yNAG8bH8Pmi4hl4DF5y8EGAz83SX8YTSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724683480; c=relaxed/simple;
	bh=IrLcXoDBcEDdwhWabg0mmSVT2C2masBDOJpsqxxMvMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HrhUVIi5Xl0b1zyzb/7d2SR8vtDTyvi8RB2UJNGY56OEksmLAiq2S3n5A6/42rhtj+JZdfJtn1l1rgnofOEfgq280+jRZP9DFHHmPE/HUjZe33Cmw1g0+XkymaxuBjR4mW9j6KJoHxE37aE/jAl0hvTJP1Vx0DFblBP9+W9Hi28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=aB1yCiJw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kBWv/ZNI; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 7ED96114C014;
	Mon, 26 Aug 2024 10:44:38 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 26 Aug 2024 10:44:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724683478;
	 x=1724769878; bh=yf608CTS1tXlXioRRoDglAiefGxq3jsuKBQNyuK6Vpo=; b=
	aB1yCiJwxVnihzij6GHv9tuKSXN5jngYwcTCapk61dgWuZRniV9mrO1l5dke1oOL
	wOAPNJEG6u3BQ2/4lMc+meyjqoB34vtywYYVXAKLnTQLipSkjpvtfEOkvZUUdGc0
	PxJnHuYZlVxcoS9TOJCbEd//skVKnKm2wzmwKUJoGJhMqmFE4ZeVQ9f37nTEjp35
	YX2dMqa/SzUtd2ti7+qWB0Bv9A/UZC7JkyYcJ3fG6XAeIGPH7ncPt1mmRi6fkxgd
	Dfk92Co3BLYXEXTl4S91uOjSihs91+OhBt6WhygGu3/o1qeaIwUFcDKyD7qlGLQa
	Jab+YWAQ5y3RiFcE8QbU1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724683478; x=
	1724769878; bh=yf608CTS1tXlXioRRoDglAiefGxq3jsuKBQNyuK6Vpo=; b=k
	BWv/ZNI45bfliIL5HXAfdbYFWOl3+PrshBUpSC4Ozb9Yg2nl/B55jqMX/s2/YGEq
	p1f3o5VXyYcihmhsesn1RhLemKfl4sWcxnLsPTiu7K6zgnRSJ+DiUKe/nQC3/muc
	AlZXOvDwiFOeMIj5awjfAoyJEcLBROTCSdq0sxO+L4Js1Hq1loRM7abCa86K2L1l
	HhqDtZUGrdbdBeIizdj+rSDNDTJN1n3h/WcIhKWNbql16hkawECbEl1zRW/G1hHu
	MJwERhDPTnHTDgm2PyhZyS9G42aebZukC7wEnVSK4BZHe88dlW7xmZNIaIW+I0IP
	KQfE5k91/BuAGwug8NK2A==
X-ME-Sender: <xms:1pTMZsBuZjidrBQOjGhtqpJFzUsFvIxliGIIYsDJ0wFh08B5d3_Dzg>
    <xme:1pTMZujDE-yiKdN3mmUE65fMjFca7YTrBpzdnWEadz4vG6ZcRwT_Ujy1k8bo6Kwy0
    P4edimPVlovJjEWQzo>
X-ME-Received: <xmr:1pTMZvkxrQddHb3EeEtEHsW96PY_CY46qOYOPcJ2sCMxCjx9UfcKFYWQnYu6R6Ic1gAHspj4miyAi-rvmY8l6nrlsA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddvkedgjeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffle
    efgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtse
    hiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepkhhriiihshiithhofhdrkhhoiihlohifshhkihdoughtse
    hlihhnrghrohdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprh
    gtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdr
    ohhrgh
X-ME-Proxy: <xmx:1pTMZixpEyRwpRcc_PSRuZ9UqyjcuiFbKFSDaUKbqaN9RxSqDT4CPA>
    <xmx:1pTMZhQUlSX0fh3myuCqUSOrbxMjtenm2Xxc8x4lyfrWq9HulrEpIw>
    <xmx:1pTMZtYg2ktDYj5M14sIxj6FmxR8sQT_AxIqHMmVnB-O4DAsp1kUiQ>
    <xmx:1pTMZqTQRZEDmhBmken2yh65ReOUi2XMOnbtkcnF6wAgEGe3JCT4tg>
    <xmx:1pTMZmLTeN6iiMotOIbTLGUMf0H6Zo3ba0oiVsXGllqAOjjph27byUmX>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Aug 2024 10:44:37 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 4/6] media: rcar-isp: Add family compatible for R-Car Gen4 family
Date: Mon, 26 Aug 2024 16:43:50 +0200
Message-ID: <20240826144352.3026980-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se>
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
---
* Changes since v1
- Reworked to add a family compatible instead of V4M specific one.
---
 drivers/media/platform/renesas/rcar-isp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
index 4512ac338ca5..6504c7025a40 100644
--- a/drivers/media/platform/renesas/rcar-isp.c
+++ b/drivers/media/platform/renesas/rcar-isp.c
@@ -429,8 +429,11 @@ static int risp_probe_resources(struct rcar_isp *isp,
 }
 
 static const struct of_device_id risp_of_id_table[] = {
+	/* Keep to be compatible with old DTS files. */
 	{ .compatible = "renesas,r8a779a0-isp" },
+	/* Keep to be compatible with old DTS files. */
 	{ .compatible = "renesas,r8a779g0-isp" },
+	{ .compatible = "renesas,rcar-gen4-isp" },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, risp_of_id_table);
-- 
2.45.2


