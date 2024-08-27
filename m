Return-Path: <linux-media+bounces-16927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC71960BB8
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 15:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E15401C23069
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 13:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9709D1BF329;
	Tue, 27 Aug 2024 13:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="v3CwZxQl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VoTVBkWA"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DE71BD51F;
	Tue, 27 Aug 2024 13:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724764827; cv=none; b=UCFhFq4iEYlT2Gv9oebgoYp3WrvbzSRRnzAe7DEmy/Mj0NyGbKmgQV4y/As84C8Fmn2QYg+Rbm0UN8/zfR8TgxfGGnIimtf/Wp+tE3lI6EvxkRioWkPqaNEqEdjHfcz9elJN+I+qb5r9Gq0kyq1v9YUWdR+qHonPdpxjv707Owk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724764827; c=relaxed/simple;
	bh=7UxS1hPQxQR9nUMp6ykXKyo7pY6hl4Dyt3Ro51TG7GQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hK8qzsipFIIuPtDBDIRfDWKy7Ml9BUac/HX0Z970pmdNXOwOAiQ3e3oGo+eoQjDDjCVgOJzOKtUR8VJ2CAsr8sS3pnBkPO4kWMqHgAT7qU1Pe9mlmKoJ2EHIaRonXpLJ2t8GGNGrAhBf3pf+k5tEEFx6Q5H18ulS6wluzYztFwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=v3CwZxQl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VoTVBkWA; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 160D31151BE9;
	Tue, 27 Aug 2024 09:20:25 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 27 Aug 2024 09:20:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724764825;
	 x=1724851225; bh=uodwgnkCmqnik37Iq1ZIadiVdMaQjxcMZowiT6dHstc=; b=
	v3CwZxQlIJSnjwztv7NL+fXt6EK1/BHhELcRxXjM2FjlLVUx5qwwsiCb63oy3JrN
	eZ+siAozyUF9d637Vy8W9WgrPjxT5Ku68Bzd5uH8dmN4L17+FrXoYsGset6TCMrB
	I3M7pDLHzP6hBFwrKw3M3ZvD7c+XnmZO4WguDMOoKmCk3Qbzo/HGBiX8/pQZoQR5
	koJUEDM87v9TSmVhnZMcLVHy/21J6EheICiERJ4knjNz5LUoyVcktnLIfawf+uvU
	O/hzOKxVOVhrRfJtM9SJZhJkBinnDb9FwvT3VuUPxfnJH3N+4IDocLbVeSZZFdqr
	yjTfj9cL9VlSHB3f1zUIKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724764825; x=
	1724851225; bh=uodwgnkCmqnik37Iq1ZIadiVdMaQjxcMZowiT6dHstc=; b=V
	oTVBkWAlzEbM3O1CdoYRg7TcRQFeoAJPyb+TVI9lZSARacYNsiy4llYyPkqvMRbt
	0pKPfK8pOgNV9dnJP80d6PF17tiGE6XM2HAdIbz9iHPnHk0JjRj/EYdoOKyeZs5d
	pQF9F9IhdM2Er2NGrdmEuVtWXSukyx/QenpvL+oNcaqbA9erZwzNJApcln8ZX1GK
	q6T0ukjCDKUT9KgBzV6dMDzZHiJxgCKNm0X3ZwnSOUgcRnxr6Cm9pyKAcQSNMl5L
	horKVN0yNY1d3GXdlPGZt5bNAZkqsRCkdJCCRDZH3CsK47DLSelmr4vH+68DRJsz
	KZzbZWCyGzg3DoeLRoeZQ==
X-ME-Sender: <xms:mNLNZg_s45uxPtjbLYMcr5HaB0rNJhJaXnz8G5UiCQMWzLHAwZvqkw>
    <xme:mNLNZosY6w2azXxSmSeqEDX_pVvVQ99tCo25s2TD9WmbZkvZ_g7JKqmhvP328kGSR
    YbbAt8k05Uz829Czzw>
X-ME-Received: <xmr:mNLNZmCtqkbYrndV9_MajMgccZmTXJnyBGbvtJxzUkJ4v5dZlbAOcVuyKP8wzMcZY5mkx6gvSwNtAPoRhI3f9bNR8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeftddgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffle
    efgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhn
    ohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgkhhhsehlihhnuh
    igfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirges
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsthgrghhinhhg
    sehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqrhgvnhgvsh
    grshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:mNLNZgd-08eWWT5FRR9BxaCbcfzUt7o79cSNZHW3ExaATCTxUi43Sw>
    <xmx:mNLNZlO3_pRfoxC7Nwv_v9IIkUEtpS2Hxs8Wn8QDi3vim9dMGQCbuQ>
    <xmx:mNLNZqk8k8SPi_SBscQYbIGeGVw3UZDZyRYdfgAmtPfTvK1Ji7lsVQ>
    <xmx:mNLNZns7mud0TcmxZ13qVbG6cRwnj7SBWdjak37zSJOXEPneWwYXNA>
    <xmx:mdLNZqnLBSsfbstmYNgW6Gc2hx-xUdxiVpVVWjHl0eKo1aSO7RaSVZ51>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Aug 2024 09:20:24 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: i2c: maxim,max96712: Add compatible for MAX96724
Date: Tue, 27 Aug 2024 15:18:40 +0200
Message-ID: <20240827131841.629920-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240827131841.629920-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240827131841.629920-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The MAX96712 and MAX96724 are almost identical and can be supported by
the same driver, add a compatible for MAX96724.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
* Changes since v1
- Group in series together with driver change.
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 6c72e77b927c..26f85151afbd 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -25,7 +25,10 @@ description: |
 
 properties:
   compatible:
-    const: maxim,max96712
+    items:
+      - enum:
+          - maxim,max96712
+          - maxim,max96724
 
   reg:
     description: I2C device address
-- 
2.46.0


