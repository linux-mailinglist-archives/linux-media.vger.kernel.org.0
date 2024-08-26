Return-Path: <linux-media+bounces-16827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 484F295F429
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 16:44:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71D28B21864
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 14:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD73186298;
	Mon, 26 Aug 2024 14:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="G5XvwONI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="T/7ObE9B"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDEF18D633;
	Mon, 26 Aug 2024 14:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724683476; cv=none; b=BzH2uQkTiV9Wzz1wlSY5tSL5N1bOLOnh3fR3kQJPAk2uh04isyavTy8666U4NdbgvRh7UyBel4i1pkhdpjUvrMRcZuWsxOtSbHE2kD+SYSlvy7JCDz9JM3vWJQIHa3GD5kLARlUGHbG12n8a3ifC5/jtKYW5ZkIlzqC9fBCy/Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724683476; c=relaxed/simple;
	bh=+8aa664SuBHe1Huyceo+fjt7fClt3Qn0VVlWPeRhZ/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nrhX8QWmvyl24tms6nGYVUCJkgN6o5J3bwpsv/Ab7s3IuuWsRYM5vIYr/ioumwMGxnXZwJ3mWymDev2noOeAGz6N2ZZDE254prqGKq8C7peVGw0vLLe5Q8vYR2eCLmqWbAIwXWTqoP6BWOKSQI4gu/W+9k5OgogeSRlNGC27ngs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=G5XvwONI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=T/7ObE9B; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 79A77114C014;
	Mon, 26 Aug 2024 10:44:32 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 26 Aug 2024 10:44:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724683472;
	 x=1724769872; bh=TXPbe5b7RzaBzLfhukzDjYRtEBsCgERphubj+qeOZE8=; b=
	G5XvwONIXZDgMSxJxhpDCY/Pp2vpLA7DX+rGXct8dxK8E8sdjDD2paHrmNtAT3G3
	5GfeDIWFzQg761JfsnnGX25KDjL3Syo5YILhaeLCPCToBa/CcRxDnHIrIJSbj8rt
	W5h5ez4UMqV33DOojuhAbRhoF20nvdQaLCg1zwhdmXs+Yin1eT/g5Rm/BaknQW0/
	DdztHQb45KgqeplVQVhVqtCsMPXcRcnFn2J8j+WEgSOxfJYzEgSTgT4t2gdVeNfm
	IKa8C+BOj2XcRsKnYfwnU1MFoylWvPbOHMyFsTirozOjZW3Wqua++viEzr3hoQpR
	zDgpNpFkY6rhbkBeNYwIzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724683472; x=
	1724769872; bh=TXPbe5b7RzaBzLfhukzDjYRtEBsCgERphubj+qeOZE8=; b=T
	/7ObE9BscFi/SjozRzk5U8QHkD7ecftEBqn1X4QJcUq5MfPXK6qXaI9KSSx0oM06
	lEEhl5LP+SzDSIphzMNTynX0EjIA4OFtkoLGO3W7JRjVM+jTWuowUgzvLoB58wN3
	X3MUG+IvGCIBd0OqD5xUNqs+gbTtdWsX+pBQVtx3Ry2vpXLEt1LAEYDLoJ1sMsqQ
	J6vo4KLuODP1xRg2qvFH9bIRXS12+BwcCqG7vjRyO9W5JaHsos/Y7kcNurOd5iEi
	IoGDzboHB4cdu3gn2sj+8HHPs39N/l8CPt+aFdfIVMy7HSu+LMgRtZ5OAOF+MM5Y
	MCO/KLtZvVfD7nOynQiKg==
X-ME-Sender: <xms:0JTMZoXiI3iE1pnxv8su4Bgh7kABrTF-3CMbtitCAOu8AfBvSBNMGw>
    <xme:0JTMZskMXdXT8d0_l4KDoxzgAsJgmKcNQElOWgFTcmmM_fG3g9E62oVQqfY6fqyw2
    DF-OwESelWH4DB_A1c>
X-ME-Received: <xmr:0JTMZsZfx4B2YeNF6EXAdvAJQ17CG94T08A1mJulAypKuUHVjtD327klmgY15A-KFIENximno-yrPUWEb7qDBcd3Rg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddvkedgjeekucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:0JTMZnUXWzhxMjZl91zNaLgsgMgtsPd7Gtz-TeMQzFvSOyB5LryheQ>
    <xmx:0JTMZinf-ydbbCsEbLWMkw6qbLAjU0Oq4bCWq3E9ubhv5rbVCAZjJA>
    <xmx:0JTMZsd2bxnha-GTgKEc-wXQrHPFvDNzd_O2N0CwrWuzSuEaF-MWHg>
    <xmx:0JTMZkHuPX13zhj2YvkBE89fdmS0I3CQ7VfIpN4fiDTGjyn7htOKig>
    <xmx:0JTMZreNrC3QsOtPLlfdVnJ6GtfXtoBaXYAFXYcZ2G4x1WHv6Wk_iYNH>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Aug 2024 10:44:31 -0400 (EDT)
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
Subject: [PATCH v2 1/6] dt-bindings: media: renesas,isp: Add Gen4 family fallback
Date: Mon, 26 Aug 2024 16:43:47 +0200
Message-ID: <20240826144352.3026980-2-niklas.soderlund+renesas@ragnatech.se>
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

The ISP Channel Selector IP is the same for all current Gen4 devices.
This was not known when adding support for V3U and V4H and a single SoC
specific compatible was used.

Before adding more SoC specific bindings for V4M add a family compatible
fallback for Gen4. That way the driver only needs to be updated once for
Gen4, and we still have the option to fix any problems in the driver if
any testable differences between the SoCs are found.

There are already DTS files using the V3U and V4H compatibles which
needs to be updated to not produce a warning for DTS checks. The driver
also needs to kept the compatible values to be backward compatible , but
for new Gen4 SoCs such as V4M we can avoid this.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- New in v2.
---
 Documentation/devicetree/bindings/media/renesas,isp.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,isp.yaml b/Documentation/devicetree/bindings/media/renesas,isp.yaml
index 33650a1ea034..730c86f2d7b1 100644
--- a/Documentation/devicetree/bindings/media/renesas,isp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
@@ -22,6 +22,7 @@ properties:
       - enum:
           - renesas,r8a779a0-isp # V3U
           - renesas,r8a779g0-isp # V4H
+      - const: renesas,rcar-gen4-isp # Generic R-Car Gen4
   reg:
     maxItems: 1
 
@@ -116,7 +117,7 @@ examples:
     #include <dt-bindings/power/r8a779a0-sysc.h>
 
     isp1: isp@fed20000 {
-            compatible = "renesas,r8a779a0-isp";
+            compatible = "renesas,r8a779a0-isp", "renesas,rcar-gen4-isp";
             reg = <0xfed20000 0x10000>;
             interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
             clocks = <&cpg CPG_MOD 613>;
-- 
2.45.2


