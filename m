Return-Path: <linux-media+bounces-30591-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FFCA94FEB
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 13:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC5573A7D23
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 11:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B072638A6;
	Mon, 21 Apr 2025 11:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="UO2tVGVc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RJ8iPVir"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452A6262814;
	Mon, 21 Apr 2025 11:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745233978; cv=none; b=Qn7gUB0wws0uyuc+Xo6js+n/sGWBTiIeFJNagG3GitbYekNIWMx3aXRJeAy7CDR+6CAti51ruEzzw1SUjowNJJpKxnxy8yq1XgYHMWrnT9wUrXK3i0+OXy25424gvyZUhby5aztSrLhdlVVjMbAB1X9xun7nkAnEuRuhMO+nRB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745233978; c=relaxed/simple;
	bh=8/yRv2HWWa07V39LUUcdlsWv7eGjKcnB6iMUuXdTvac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qOCO3a/reYkjyYJ7wa0qyA2Wm8QCC0zHytZtn/t37T6+m8ZCMxLebN0tzWBHn0Io+6CFDSLSYMJuR3pLjMuacMgn9AmyB3nwZeyZCzzpCz0YFRU6xhCUtZqGN8E61v7tM0UAomUIcVoSZqkhVfLiTGYrap5MEhA4HvdaSh4RM4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=UO2tVGVc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RJ8iPVir; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 4918313801E6;
	Mon, 21 Apr 2025 07:12:55 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 21 Apr 2025 07:12:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1745233975;
	 x=1745320375; bh=p+v+VUA92xSxDbJ0eRxcGXhZK6SrcTs/OQA0JC0aLOA=; b=
	UO2tVGVcHLZC12zlccZTuVznYX52QmRLGAA/iMLGk81embabXLOuf9R+CLoEhfd3
	US+x/slmzpQmdv+s30GC8+cgotpkfaTTl1KP2zVD6fiYJgj4uMGwoGUUTImv6SYh
	jNiYb5S6vKg62ayRE1l7g2ycrsiqQL7CYQuBreVdu4RL4vvZVSmyhJGtQToFY9g/
	lEPGzndrLYgD4RtdIo4Zq3d61XTNyyATgtFZQ0GV7xvhPUwkMNLvr6ufgnuztpRI
	VfNBSmsvscLx+ZENPM3r9lsOceS/QCUlHnQQMsnFuDr9oRnBAqqd+ahiTJjWeU6n
	7tZ7mfk7ESaEAIaTJVYJCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745233975; x=
	1745320375; bh=p+v+VUA92xSxDbJ0eRxcGXhZK6SrcTs/OQA0JC0aLOA=; b=R
	J8iPVir6mwJ8McIL/BbcmMM463El3Cdtls5INZe58J1RuI/RPVx9EPYpj41xKzNx
	NphcUBUeJJNKGSgXWyVGZ1UN/TZEFIPLWELXYCEPhihxm99PMjWYXhWNJKLIb4GM
	X4dgVc730CMFEYw3d7/q+aU6T0qOoPFPR2EtyRyLBi+MlFG8XmkQ6HJ1bGyZbbhk
	GquBfPDw75gC7aU7Tvg2PxcXNRb3IFK3fK2D7abdOAgRE4al+CaKJ9pF33btc22Z
	DfNNo2j5ICcJCmESJbZDSh6bqfQErsvbVYzPnqtmMFI1730F5TbrApgxyVuZB75G
	75S6lg9tgD2iGqRzO2QDA==
X-ME-Sender: <xms:NigGaAd3MA3KxTyeAFbsspT4dHq3B4YNgM6xIh5QPNZyREqrikweYg>
    <xme:NigGaCMU_Tw0mBii8VVwoPSGHVPzQ6gxtTV6c6lVXAGmGXcjOttOoUTywTuK07Gp2
    vscSr19Xd57edo4W_s>
X-ME-Received: <xmr:NigGaBhdfTmn4v9MtwcaRfmu9fCABqlcdZ6YGFsmAkdfeP6oFtI_70j9MCk5Ktcpdt8x7A1h_2i8S-iQ5uy8qqHowQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedtjedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffgge
    ffleefgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprh
    gtphhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgr
    sgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegt
    ohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnh
    gvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehhvhgvrhhkuhhilhesgihsgegr
    lhhlrdhnlhdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnth
    gvlhdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggr
    shhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiug
    gvrghsohhnsghorghrugdrtghomh
X-ME-Proxy: <xmx:NigGaF-fBwOq0w1tpOYmUKrcZSr0bLq15LZlbcRxI9rvoUpmpWDLTw>
    <xmx:NigGaMv5Ra1LZRRL8i9UmsYKVPFRFx6KQdsEhbUsEx7rBW9WbKM2Tg>
    <xmx:NigGaMFZQnfG08gGrvVgMel7nd41UvmM3LPeVBtoqbn-ucIGaF6png>
    <xmx:NigGaLMubfKD9Lljhy-Zc0qpTPQzXSBN8GdF_WVaYmVWU4d9MCnM4Q>
    <xmx:NygGaHniCTxMgzlMssB6HuzFGy9GiN541TT0wIcHyDIzakQGpkQw6rF6>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Apr 2025 07:12:54 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 1/7] dt-bindings: media: renesas,isp: Add ISP core function block
Date: Mon, 21 Apr 2025 13:12:34 +0200
Message-ID: <20250421111240.789510-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421111240.789510-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250421111240.789510-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some R-Car ISP instances have in addition to the channel selector (CS)
an ISP core (CORE )to perform operations on an image stream. The core
function is mapped to a different memory region and have a separate
interrupt then CS, extend the bindings to allow describing this.

On the same SoC different instances of the ISP IP may have, or not have,
the CORE functionality. The CS function on all instances on the SoC are
the same and the documentation describes the full ISP (CS + CORE) as a
single IP block. Where instances not having the CORE function simple
lacking the functionality to modify the image data. There dependencies
on the CS functionality while operating the CORE functionality.

In order for the ISP core to function in memory-to-memory mode it needs
to be feed input data from a Streaming Bridge interface. This interface
is provided thru the VSP-X device. Add an optional new property
"renesas,vspx" to provide a phandle to describe this relationship.

While adding mandatory reg-names and interrupt-names breaks existing
bindings the driver itself remains backward compatible and provides CS
functionality if a single unnamed reg and interrupt property is present.
Furthermore all existing users of the bindings are updated in following
work to add these new mandatory properties.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Extend the commit message to make it explicit that different ISP
  instances on the same SoC (same compatible value) can have, or not
  have, a CORE function block attached.
- Update documentation for renesas,vspx property.
- Update example to cover all new properties.
---
 .../bindings/media/renesas,isp.yaml           | 63 ++++++++++++++++---
 1 file changed, 55 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,isp.yaml b/Documentation/devicetree/bindings/media/renesas,isp.yaml
index c4de4555b753..927be02347e5 100644
--- a/Documentation/devicetree/bindings/media/renesas,isp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
@@ -25,19 +25,55 @@ properties:
           - renesas,r8a779h0-isp # V4M
       - const: renesas,rcar-gen4-isp # Generic R-Car Gen4
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: cs
+      - const: core
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: cs
+      - const: core
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: cs
+      - const: core
 
   power-domains:
     maxItems: 1
 
   resets:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  reset-names:
+    minItems: 1
+    items:
+      - const: cs
+      - const: core
+
+  renesas,vspx:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle to the companion VSPX responsible for the Streaming Bridge
+      functionality. The Streaming Bridge is responsible for feeding image
+      and configuration data to the ISP when operating in memory-to-memory
+      mode.
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -103,10 +139,14 @@ properties:
 required:
   - compatible
   - reg
+  - reg-names
   - interrupts
+  - interrupt-names
   - clocks
+  - clock-names
   - power-domains
   - resets
+  - reset-names
   - ports
 
 additionalProperties: false
@@ -119,11 +159,18 @@ examples:
 
     isp1: isp@fed20000 {
             compatible = "renesas,r8a779a0-isp", "renesas,rcar-gen4-isp";
-            reg = <0xfed20000 0x10000>;
-            interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&cpg CPG_MOD 613>;
+            reg = <0xfed20000 0x10000>, <0xfee00000 0x10000>;
+            reg-names = "cs", "core";
+            interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "cs", "core";
+            clocks = <&cpg CPG_MOD 613>, <&cpg CPG_MOD 17>;
+            clock-names = "cs", "core";
             power-domains = <&sysc R8A779A0_PD_A3ISP01>;
-            resets = <&cpg 613>;
+            resets = <&cpg 613>, <&cpg 17>;
+            reset-names = "cs", "core";
+
+            renesas,vspx = <&vspx1>;
 
             ports {
                     #address-cells = <1>;
-- 
2.49.0


