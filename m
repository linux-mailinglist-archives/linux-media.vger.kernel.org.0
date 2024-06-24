Return-Path: <linux-media+bounces-14065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9077F91504A
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 16:43:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4BD61C21FA2
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 14:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB52619B3FF;
	Mon, 24 Jun 2024 14:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="gNdmtEqB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="u35wyZSR"
X-Original-To: linux-media@vger.kernel.org
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082D719ADA1;
	Mon, 24 Jun 2024 14:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719240209; cv=none; b=d6mi2uwsqUim9NRLYGEWzZHxwLWnH4dhvcg1eIEa7hGGDIQHLywm4bGZhMEOkQKDMS69feCNc35PLecXLq03WxQEuZd26KqkMvJ2ASksZ3S7vqV2D5oh2utz0VSo2u56Zj+ltX6Oqc7U0QkjyOBTp76aeTtaSvI0Y6qKvhmHTwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719240209; c=relaxed/simple;
	bh=exY4V0Gl+IkDqR1auic5c0VQqVAdz798oQn083bEtyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MVqGlBfFYZbSgVkTW+Ot4hXDbwjVioj8881Wg5g03If7ENqE4f7gpsOTbjhCLGNWHiIk6DOefEZYgeJfArZAi+sLfdiB8UYoE/3NppGDQHLwYdqg3PF9w9leICUGsKzo4H4ZqzKGGVdY/hB3PgigPM08O8GL2lcS+z+xRmsb080=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=gNdmtEqB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=u35wyZSR; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.nyi.internal (Postfix) with ESMTP id 15DAE13801FE;
	Mon, 24 Jun 2024 10:43:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 24 Jun 2024 10:43:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1719240206;
	 x=1719326606; bh=80Ulbm7+vQnIXOF3lXFnfSnxLm7KSRf8/o3wQaRyFXs=; b=
	gNdmtEqByceWy7LAXG6mT0dXtJmi4lVXkBSiSn/HUmzfXvJmexd5b6o43vYW+LEw
	1d7aPcbrqzgEDOTyayK3GFeri2YAqQ9EFLaAm6CgymVSx/qQvToOqhUsU2rkZPpe
	+lI5DjuEZBVeTNoMmAUY/qBZKDzYHG+CBR83QpdjbcFdPczSVcm1Y/+5q3KeIkJD
	2qX8rgLzYObAkU5dfzPZTERlLuNwDW8aVkGw2RCyzPmn1eerPxZ2EZA6I5crmBzv
	EIvNtgPNbeL23e/MbmT6k0wKp0lWvT+XARz3roJHMgRZEPfC2SxecHxUBOXItCR6
	6nsWKuf9sLdAg4hzIJi3HQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719240206; x=
	1719326606; bh=80Ulbm7+vQnIXOF3lXFnfSnxLm7KSRf8/o3wQaRyFXs=; b=u
	35wyZSRc+645TfID5zUNDichWnp1Y1FQ7dhJJqZGSzoVYwu3kSN/sHEzIrlKsYQo
	JMeCor1G1dLDap7R6O8XTSxTGXB0obRzlVH8q/iGQHONbLegAH/BKzxXovxu+vjW
	mK0a9gRg1CppAvTDKOaOQ6YlPP6J6ePwENxm3VPEjzXCPItfxm0SiG9ai8s+G10M
	JVT2lD+DFhAlDL+JaMFl1WzJO23jlUIghOXZ6aNUF2DhBFtpFlesu5mh/U2JdBa4
	dntTmlGWaEPUY4ThTzJcrUc9DtVhOt+EI3Skx0sUqnZKw//mAKLXvkkneJTyava/
	XhjRrIsOd4XsssiTeSQKw==
X-ME-Sender: <xms:DYZ5Zv4kf7qmcr02weOhN3SaIpeBUiQHcIMF-IemzeqoPJz2XSq4OQ>
    <xme:DYZ5Zk4QfUmsqsJxHlTP7GA8hAXC-wo_lJqfGAGk73A8LGiD9SJoK06p2ag4ekffI
    tcG3PfhLw5wINw0ts0>
X-ME-Received: <xmr:DYZ5ZmddLkrKIR_b4gtHX2ZxQ7KUr3-73l2cuLiqS5WjtU4cKhDJ0gPRJi-LNjZRi9w6-C5zfePEpdXkcGKnRaRkew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeeguddgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueev
    uedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:DYZ5ZgK7f-8ObEz43cTpsTwd3kvCHtuCQLJDa-BYHwTc-kjXQNwtZw>
    <xmx:DYZ5ZjIwghnEUgB_74APo17yWUb1tbq5FLImKCWQCkhywBU0KVo9wQ>
    <xmx:DYZ5ZpwNuh77t30AlWAwhJkmSLnNMcdNNoCZfuZ3JZMZCOCDGc8B2w>
    <xmx:DYZ5ZvKE34O88SCVyknfuteM7AvQWvfMiTXglvuzdjgdhrIRwXub-A>
    <xmx:DoZ5ZgAzfaW7kZLL-B2ctTeleuxWpTQX46kGYvYNx5WRHna8jiTBvgnL>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Jun 2024 10:43:25 -0400 (EDT)
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
Subject: [PATCH v4 2/5] arm64: dts: renesas: r8a779g0: Add family fallback for VIN IP
Date: Mon, 24 Jun 2024 16:41:05 +0200
Message-ID: <20240624144108.1771189-3-niklas.soderlund+renesas@ragnatech.se>
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

To make it easier to support new Gen4 SoCs a family fallback compatible
similar to what is used for Gen2 have been added to the VIN bindings.
Add this fallback to the V4H DTSI.

There is no functional change, but the addition of the family fallback
in the bindings produces warnings for V4H for DTS checks if they are not
added.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v3
- New in v4.
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 48 +++++++++++++++--------
 1 file changed, 32 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index aaeebf736f3f..850eb2869e9f 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -1189,7 +1189,8 @@ msiof5: spi@e6c28000 {
 		};
 
 		vin00: video@e6ef0000 {
-			compatible = "renesas,vin-r8a779g0";
+			compatible = "renesas,vin-r8a779g0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef0000 0 0x1000>;
 			interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 730>;
@@ -1217,7 +1218,8 @@ vin00isp0: endpoint@0 {
 		};
 
 		vin01: video@e6ef1000 {
-			compatible = "renesas,vin-r8a779g0";
+			compatible = "renesas,vin-r8a779g0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef1000 0 0x1000>;
 			interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 731>;
@@ -1245,7 +1247,8 @@ vin01isp0: endpoint@0 {
 		};
 
 		vin02: video@e6ef2000 {
-			compatible = "renesas,vin-r8a779g0";
+			compatible = "renesas,vin-r8a779g0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef2000 0 0x1000>;
 			interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 800>;
@@ -1273,7 +1276,8 @@ vin02isp0: endpoint@0 {
 		};
 
 		vin03: video@e6ef3000 {
-			compatible = "renesas,vin-r8a779g0";
+			compatible = "renesas,vin-r8a779g0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef3000 0 0x1000>;
 			interrupts = <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 801>;
@@ -1301,7 +1305,8 @@ vin03isp0: endpoint@0 {
 		};
 
 		vin04: video@e6ef4000 {
-			compatible = "renesas,vin-r8a779g0";
+			compatible = "renesas,vin-r8a779g0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef4000 0 0x1000>;
 			interrupts = <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 802>;
@@ -1329,7 +1334,8 @@ vin04isp0: endpoint@0 {
 		};
 
 		vin05: video@e6ef5000 {
-			compatible = "renesas,vin-r8a779g0";
+			compatible = "renesas,vin-r8a779g0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef5000 0 0x1000>;
 			interrupts = <GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 803>;
@@ -1357,7 +1363,8 @@ vin05isp0: endpoint@0 {
 		};
 
 		vin06: video@e6ef6000 {
-			compatible = "renesas,vin-r8a779g0";
+			compatible = "renesas,vin-r8a779g0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef6000 0 0x1000>;
 			interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 804>;
@@ -1385,7 +1392,8 @@ vin06isp0: endpoint@0 {
 		};
 
 		vin07: video@e6ef7000 {
-			compatible = "renesas,vin-r8a779g0";
+			compatible = "renesas,vin-r8a779g0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef7000 0 0x1000>;
 			interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 805>;
@@ -1413,7 +1421,8 @@ vin07isp0: endpoint@0 {
 		};
 
 		vin08: video@e6ef8000 {
-			compatible = "renesas,vin-r8a779g0";
+			compatible = "renesas,vin-r8a779g0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef8000 0 0x1000>;
 			interrupts = <GIC_SPI 537 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 806>;
@@ -1441,7 +1450,8 @@ vin08isp1: endpoint@1 {
 		};
 
 		vin09: video@e6ef9000 {
-			compatible = "renesas,vin-r8a779g0";
+			compatible = "renesas,vin-r8a779g0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef9000 0 0x1000>;
 			interrupts = <GIC_SPI 538 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 807>;
@@ -1469,7 +1479,8 @@ vin09isp1: endpoint@1 {
 		};
 
 		vin10: video@e6efa000 {
-			compatible = "renesas,vin-r8a779g0";
+			compatible = "renesas,vin-r8a779g0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6efa000 0 0x1000>;
 			interrupts = <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 808>;
@@ -1497,7 +1508,8 @@ vin10isp1: endpoint@1 {
 		};
 
 		vin11: video@e6efb000 {
-			compatible = "renesas,vin-r8a779g0";
+			compatible = "renesas,vin-r8a779g0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6efb000 0 0x1000>;
 			interrupts = <GIC_SPI 540 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 809>;
@@ -1525,7 +1537,8 @@ vin11isp1: endpoint@1 {
 		};
 
 		vin12: video@e6efc000 {
-			compatible = "renesas,vin-r8a779g0";
+			compatible = "renesas,vin-r8a779g0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6efc000 0 0x1000>;
 			interrupts = <GIC_SPI 541 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 810>;
@@ -1553,7 +1566,8 @@ vin12isp1: endpoint@1 {
 		};
 
 		vin13: video@e6efd000 {
-			compatible = "renesas,vin-r8a779g0";
+			compatible = "renesas,vin-r8a779g0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6efd000 0 0x1000>;
 			interrupts = <GIC_SPI 542 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 811>;
@@ -1581,7 +1595,8 @@ vin13isp1: endpoint@1 {
 		};
 
 		vin14: video@e6efe000 {
-			compatible = "renesas,vin-r8a779g0";
+			compatible = "renesas,vin-r8a779g0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6efe000 0 0x1000>;
 			interrupts = <GIC_SPI 543 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 812>;
@@ -1609,7 +1624,8 @@ vin14isp1: endpoint@1 {
 		};
 
 		vin15: video@e6eff000 {
-			compatible = "renesas,vin-r8a779g0";
+			compatible = "renesas,vin-r8a779g0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6eff000 0 0x1000>;
 			interrupts = <GIC_SPI 544 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 813>;
-- 
2.45.2


