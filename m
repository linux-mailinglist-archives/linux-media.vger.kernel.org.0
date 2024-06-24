Return-Path: <linux-media+bounces-14068-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 377A5915059
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 16:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2899283E81
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 14:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9985119AD87;
	Mon, 24 Jun 2024 14:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="IRsKQ6H1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jk4EMgrW"
X-Original-To: linux-media@vger.kernel.org
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A24B19AD7A;
	Mon, 24 Jun 2024 14:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719240214; cv=none; b=UY/7vUvWcVnmPmAn4t5j78JDDTUHnKJCeiWKhU9hMQj9+5AL0Lk0GBwZmZCzECSEeuFApuK6/3Ev2C3C26i3d+IHTkf4AcIi/AaGJmitdYmy3oMaJjW6xP12Saitd9WUlZimgaNFN3NLeRTehzxXdzc6Hl2flp7G5ffMcyNVwT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719240214; c=relaxed/simple;
	bh=1SKSoOMhg7m2wPI9pt+PWfCBpswdUm7hmP5RYsLmTfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mo2sgSXigcLWNC5nkUt7nDPOegQsoWSonJ7Mg2VgQL8LH7LjGngP2WIZXaQQ9klgUamX/iTZrVcNSjJcuBrdxVXo+ln/Sb4Uufu50Ba7bwCbOYKIBK+lmNk49AOFrWfDqRwJeJ9j4dJWh466crBEFolk4+dxtO+PcIW0be4Uwz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=IRsKQ6H1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jk4EMgrW; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id 59E8C138026D;
	Mon, 24 Jun 2024 10:43:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 24 Jun 2024 10:43:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1719240212;
	 x=1719326612; bh=e9kgzW91s3NM6KzJBaFLJbx250V/XTQ4VKPxIhZw0rU=; b=
	IRsKQ6H1gVpdYKNY/b+EBPAaKg7VXCRTRLa+NHtv+f4RJ51xrF7JA52eilFk7SGW
	EXHmXDKNVJEZWy78IBeNJo5M6Uw9GRMAAijw1xuaN3bEQb66LaUhoJx5WwIK7yHj
	MQ6CCDFwtbMjxXeIYM+CFy2n3iAXLRUTT6XrY35x2n5PR8zxovGi53eA+h8XKTki
	fJlPOsseUOS8blhONmEMCEeelIs5pAH05Agvv9K2KuiVPKbyYPk7HAIF9abOUmmB
	Dck8W2oia+FYxzbK0hkbUuVTC2uhFO+EsOVuUuQpT6fS+s/MLBWEjsF499YbdvnS
	j4Jo/ceAffYnsEhhcSPZZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719240212; x=
	1719326612; bh=e9kgzW91s3NM6KzJBaFLJbx250V/XTQ4VKPxIhZw0rU=; b=j
	k4EMgrWjYEo4nCijydeCSpXeY2/mUaB+4Jhh/ZapPTp/TdM/E7G78YKdtrSHFDY9
	bzaoGTOH2PWlJNOI+ZNm7HntkEOwmuc0IFnFd4ZkgOE4Uj1qOBYvPgkTnRUYn8Wg
	9Zn3mKx7T4zhS5Vgz/RK9iySLriwwupRAdM7GzoM1JsSMeHWy6x374IT6qpQAVld
	B/bK2+uxUiWkYiNMFl8CM32fo+/MjGxM9LFE+dEnBg2Mq59RHPUZGf3NYjyUcKWI
	eulVI790OKP1JzkSglxz+yNQlzyXaKq0NTYV/phz985KCmKi87513kAFGQBmy/uY
	60fbJktdGibICN602rZxw==
X-ME-Sender: <xms:FIZ5ZvSzg85xGwV7YkT-I5KGU2UAAlzRw2Nz6DluFu_A0fYY7NJEgw>
    <xme:FIZ5ZgzzpgYN-uwtXmiroz1cgtAejLLC4vBT6umKQTHGQu3MwWfehygglL_l0xF1E
    gsA3wS-Q3Xx6CqMkV4>
X-ME-Received: <xmr:FIZ5Zk2c4kEo1pBhAeQehi9jH9XgjqW9MEiugYIomMOeOPCmbYTEMRlSWpR9HdqOXr6CvcNSzNOaYImG_nQJEKqz0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeeguddgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueev
    uedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:FIZ5ZvAmyccxDs_EoXXk1Hi0iJZA7A06HFfjFlLzSkEJT96Ln5sNdQ>
    <xmx:FIZ5Zoj4JAvfCqTQ5xdXJAQGhJp-o_VaefJsfrZhnxjSpj-Nc2_Gmg>
    <xmx:FIZ5ZjqeToSNMRGEQAow4wErITPn9f8kY1-LHTX3K1FkzyPM-8NI2w>
    <xmx:FIZ5ZjgMt5OIG4UOKNdtd4JD1d-2pE1aGyUGWX07m2lLs16goiqKMQ>
    <xmx:FIZ5Zta8WkzqWhrjzUmgqcz_2TGgz0M-FyPBFnf_icrvzm3Xp_x5TYQp>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Jun 2024 10:43:31 -0400 (EDT)
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
Subject: [PATCH v4 5/5] arm64: dts: renesas: r8a779h0: Add family fallback for VIN IP
Date: Mon, 24 Jun 2024 16:41:08 +0200
Message-ID: <20240624144108.1771189-6-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624144108.1771189-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240624144108.1771189-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The usage of the V4M VIN bindings where merged before the bindings where
approved. At that time the family fallback compatible where not part of
the bindings, add them.

Fixes: 2bb78d9fb7c9 ("arm64: dts: renesas: r8a779h0: Add video capture nodes")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v3
- New in v4.
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 48 +++++++++++++++--------
 1 file changed, 32 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 400169fe4a1a..989f567a8ba1 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -945,7 +945,8 @@ msiof5: spi@e6c28000 {
 		};
 
 		vin00: video@e6ef0000 {
-			compatible = "renesas,vin-r8a779h0";
+			compatible = "renesas,vin-r8a779h0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef0000 0 0x1000>;
 			interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 730>;
@@ -973,7 +974,8 @@ vin00isp0: endpoint@0 {
 		};
 
 		vin01: video@e6ef1000 {
-			compatible = "renesas,vin-r8a779h0";
+			compatible = "renesas,vin-r8a779h0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef1000 0 0x1000>;
 			interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 731>;
@@ -1001,7 +1003,8 @@ vin01isp0: endpoint@0 {
 		};
 
 		vin02: video@e6ef2000 {
-			compatible = "renesas,vin-r8a779h0";
+			compatible = "renesas,vin-r8a779h0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef2000 0 0x1000>;
 			interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 800>;
@@ -1029,7 +1032,8 @@ vin02isp0: endpoint@0 {
 		};
 
 		vin03: video@e6ef3000 {
-			compatible = "renesas,vin-r8a779h0";
+			compatible = "renesas,vin-r8a779h0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef3000 0 0x1000>;
 			interrupts = <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 801>;
@@ -1057,7 +1061,8 @@ vin03isp0: endpoint@0 {
 		};
 
 		vin04: video@e6ef4000 {
-			compatible = "renesas,vin-r8a779h0";
+			compatible = "renesas,vin-r8a779h0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef4000 0 0x1000>;
 			interrupts = <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 802>;
@@ -1085,7 +1090,8 @@ vin04isp0: endpoint@0 {
 		};
 
 		vin05: video@e6ef5000 {
-			compatible = "renesas,vin-r8a779h0";
+			compatible = "renesas,vin-r8a779h0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef5000 0 0x1000>;
 			interrupts = <GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 803>;
@@ -1113,7 +1119,8 @@ vin05isp0: endpoint@0 {
 		};
 
 		vin06: video@e6ef6000 {
-			compatible = "renesas,vin-r8a779h0";
+			compatible = "renesas,vin-r8a779h0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef6000 0 0x1000>;
 			interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 804>;
@@ -1141,7 +1148,8 @@ vin06isp0: endpoint@0 {
 		};
 
 		vin07: video@e6ef7000 {
-			compatible = "renesas,vin-r8a779h0";
+			compatible = "renesas,vin-r8a779h0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef7000 0 0x1000>;
 			interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 805>;
@@ -1169,7 +1177,8 @@ vin07isp0: endpoint@0 {
 		};
 
 		vin08: video@e6ef8000 {
-			compatible = "renesas,vin-r8a779h0";
+			compatible = "renesas,vin-r8a779h0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef8000 0 0x1000>;
 			interrupts = <GIC_SPI 537 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 806>;
@@ -1197,7 +1206,8 @@ vin08isp1: endpoint@1 {
 		};
 
 		vin09: video@e6ef9000 {
-			compatible = "renesas,vin-r8a779h0";
+			compatible = "renesas,vin-r8a779h0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef9000 0 0x1000>;
 			interrupts = <GIC_SPI 538 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 807>;
@@ -1225,7 +1235,8 @@ vin09isp1: endpoint@1 {
 		};
 
 		vin10: video@e6efa000 {
-			compatible = "renesas,vin-r8a779h0";
+			compatible = "renesas,vin-r8a779h0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6efa000 0 0x1000>;
 			interrupts = <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 808>;
@@ -1253,7 +1264,8 @@ vin10isp1: endpoint@1 {
 		};
 
 		vin11: video@e6efb000 {
-			compatible = "renesas,vin-r8a779h0";
+			compatible = "renesas,vin-r8a779h0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6efb000 0 0x1000>;
 			interrupts = <GIC_SPI 540 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 809>;
@@ -1281,7 +1293,8 @@ vin11isp1: endpoint@1 {
 		};
 
 		vin12: video@e6efc000 {
-			compatible = "renesas,vin-r8a779h0";
+			compatible = "renesas,vin-r8a779h0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6efc000 0 0x1000>;
 			interrupts = <GIC_SPI 541 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 810>;
@@ -1309,7 +1322,8 @@ vin12isp1: endpoint@1 {
 		};
 
 		vin13: video@e6efd000 {
-			compatible = "renesas,vin-r8a779h0";
+			compatible = "renesas,vin-r8a779h0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6efd000 0 0x1000>;
 			interrupts = <GIC_SPI 542 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 811>;
@@ -1337,7 +1351,8 @@ vin13isp1: endpoint@1 {
 		};
 
 		vin14: video@e6efe000 {
-			compatible = "renesas,vin-r8a779h0";
+			compatible = "renesas,vin-r8a779h0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6efe000 0 0x1000>;
 			interrupts = <GIC_SPI 543 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 812>;
@@ -1365,7 +1380,8 @@ vin14isp1: endpoint@1 {
 		};
 
 		vin15: video@e6eff000 {
-			compatible = "renesas,vin-r8a779h0";
+			compatible = "renesas,vin-r8a779h0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6eff000 0 0x1000>;
 			interrupts = <GIC_SPI 544 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 813>;
-- 
2.45.2


