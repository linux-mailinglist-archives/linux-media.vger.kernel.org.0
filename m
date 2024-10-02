Return-Path: <linux-media+bounces-18988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 661BD98D159
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 12:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E40FD1F22DF3
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 10:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78AB21E765A;
	Wed,  2 Oct 2024 10:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="e9HRFfYf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SoB+Wt7f"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32CE1E631A;
	Wed,  2 Oct 2024 10:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727865273; cv=none; b=WDyW4QRsUXR0Zm8uwtQFQQrCexg42E12N5XD1Rwnjw4ZTKSCbz5w98COWv/G9pas6ZJlnir9Ax/7HB9j7rc4/oNVtB/lSeyjb06Ae88Rn735aSArOf2M+AE4RN7HrI+nXg7rajEnGjtKjJXFkJ6+XBMy0HQb+72MIxXe3lK954M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727865273; c=relaxed/simple;
	bh=oHP/9C6D3SxZfswTb+Ht0cIqCEjkglWb2uqhxk1ayFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=id1DKX9XOAMkcVW9ESr9hTi0Z5DuZxz/fIyUUnjNyFnCmpbRDXiFCFGkREKlrpx6kYQ8gFs2uJwn2xOJxlRbyhwDtWBr2GMr9G5C5phUXa7XTDu6ucDGD0d+v7hvFuTzQtihrvOiIh6AAxGWh0z2eKJPim9ESaU6MHaGtMfeVQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=e9HRFfYf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SoB+Wt7f; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D9943114008A;
	Wed,  2 Oct 2024 06:34:30 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 02 Oct 2024 06:34:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1727865270;
	 x=1727951670; bh=xkFItGIS2j/G71D6w64y5hV3nd5psafurBVr6ecStGI=; b=
	e9HRFfYfHmeZ3igk0d3KbR7A/DMIYE2djrINkqzUHGWQFmXGSpPP9072oU8CdnKc
	jr+iYICUo/BP9Z0uSgLeWH9JCDmpvwnt3My5PvJDqQeq/V29cNgQ7mJAxD5Qbqel
	DM21LfxGEbwb7qaqe/R3NlixRls0Vvd+wQAv6W7I/xSO56fYKspnjfmLQ23ppsuT
	aU9yDPQKkz+W/L06yO2siUnfZBAA5ZB9FnNsLn0FLHk/dYx3fntbq5FpNN+bbeUM
	gkZEjG4RRXuN71ZlpepQnbRrP/RVFedsqMtMpgTPKT3dciYhsYN2VSI1juKodeKY
	DDo3u3L/XRMv7iNQsW59Hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727865270; x=
	1727951670; bh=xkFItGIS2j/G71D6w64y5hV3nd5psafurBVr6ecStGI=; b=S
	oB+Wt7fKydyXYJ6ovNZXXX21Z0bvFX0/jgc5rpzkNz/AJA08mexZ4YIXSjGNQldD
	wmVi16K4PUdt33V+8doInl39ZzUP2xAOmyU2F5ptMoShZ8E6NRUn06Z9U3PZjleG
	Ipp6lkbOoDb9vuBLNSJ8SGleyj+MrQSzSeTJlkD+Zqkd8JvytFEDJKIbl6XtS9/p
	y6/rb8Z/qbug23PSkCsSgyYoMq6++m/Md1Bdr4KjY2wsgGDo/qHk8QxYYXbZcWYb
	RZRZFAu/RN8mY/dpFjSw1LeezyieXFDPSr/Xx6SgwPinrYqaZrQV5S/R6aKqI1FC
	TDTWQdp8BHVLYUHoCQRQQ==
X-ME-Sender: <xms:tiH9ZjjQ-BAuMWleoKZ6yi-RZqn5xkZgzhtglZcBHzyh_CJC8mqBAA>
    <xme:tiH9ZgAUmZCc7g12eMd-ZXS8uI56goHNKZQqVUmS4rsQwJoOVmvmip8RHP3BJJgxE
    Q3ceVSMId4Fca7qHIw>
X-ME-Received: <xmr:tiH9ZjHchYCPoOidfSJeCX5bU1VIa7PRQ7HXIQb5N4-dP03VpsvLxNFMz44xJ-wWNysTUlATxQG2Ma4yekl4raphlQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdduledgvdejucetufdoteggodetrfdotf
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
    ohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgrkhgrrhhirdgrihhluh
    hssehikhhirdhfihdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggv
    rhdrsggvpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsoh
    hnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:tiH9ZgQz4rwR1QZR1He_jhqEhqx6mn34b733aHZ2B4-Pdl5sTaADYw>
    <xmx:tiH9ZgwVGWKOx7qsistujAbhTuF9Uq1XV5KgSPsOalWnUDSs8vkC-w>
    <xmx:tiH9Zm5ajZ0mKbVwsk8cYg_gM7yWvU76gRsSiyIWhH4kVenqVp896g>
    <xmx:tiH9Zlzmc0gPc7y09NmdFoDEqq-l0lPUxpdmKYmiax5rwDK-Stqs9g>
    <xmx:tiH9Zq7kBpTI2SnxDtjM5kT1A1Xwiv3KoWSAH7nZegrrp7dobXzIOYhT>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Oct 2024 06:34:30 -0400 (EDT)
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
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 1/3] dt-bindings: media: renesas,isp: Add Gen4 family fallback
Date: Wed,  2 Oct 2024 12:33:16 +0200
Message-ID: <20241002103318.24289-2-niklas.soderlund+renesas@ragnatech.se>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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
2.46.1


