Return-Path: <linux-media+bounces-14654-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B21927AF2
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 18:16:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C2841F239EC
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 16:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0628E1B3737;
	Thu,  4 Jul 2024 16:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="t+pFxruZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="enp0ujVl"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A851B29DA;
	Thu,  4 Jul 2024 16:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720109800; cv=none; b=WzJHjOg5We5LstZrfZYZiHLeCinxd7xm1z2+LWD8BeaZjdnE1u7oAVp54dojhXkeoZYGpDoZVtBWTKfc7dtFMPZWSOXJSq8bdgLLyh+CGFF6Hkj66uUchSzdLTkdMbHpmIPPbkWjGC/qec3A+27HMlwor3FQ6Wtkv/cfLvAMGm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720109800; c=relaxed/simple;
	bh=R9bFzSop0Ub8guMmdB76YN8NjXxd91OECXzknfpY+yo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WMdQ1PW1TPZKhmYmnjW9uHSpe60KQiF0tG5sgqmQh51SgT82wlB/vv4YSxW5430bjjgLiBXQ5g15nyXlbVNv5baT4D63obZEfBdM3kY4bClE6YGj1I89R81qcc3DIbjubMJ0jEP89kYZfgqqUFdnYm+jQa9MRtWBVoS/Y0HWQBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=t+pFxruZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=enp0ujVl; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 966BF1140191;
	Thu,  4 Jul 2024 12:16:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 04 Jul 2024 12:16:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1720109797;
	 x=1720196197; bh=xMSUMB00Ox26WHhEJ8sxtyMcguhgqa/Je4Y1xoJPXuc=; b=
	t+pFxruZRD8FZzj6SlyoxTFauOGBlrE3+l8yWjdp8SlSlXQ0W6lV7I/9JYWBlJEs
	7R2AbhO0i4Rkwc8E5UHeJ83dNTM0GcSm2L2IB/0HBQUWAZKbdrb9EOFZ59xWauo5
	zionWFOt6h1K54bpyM6A2lDgEpBTL/WIrlFB6Rcza3QmvjWThcUnYNdgSoPDezFc
	WJpEeE+2b5oT5s7dMYN8PDNVEApmBe6xzYF1gKTZM0LtXsmRqqamUrwD49KSGnGq
	Crv05Cj552YvVWnk/ubgGt0MilT90hbXKYFohmOE9YvBMxMYuTIctLsrpYnVPY15
	50D4wcH3TP3XwXLD8c8iMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720109797; x=
	1720196197; bh=xMSUMB00Ox26WHhEJ8sxtyMcguhgqa/Je4Y1xoJPXuc=; b=e
	np0ujVlfsJG/ht3CtZ6jNTaOnCGhz3ckttcKivjpPqwNFbPX+SIp+08lPIcew26L
	GlIWe+I+uMQd5J5eLKXij6RUvx1GtyYW0K+xms/z9jEujS6tmv89ue66ftSr/a9w
	98l0qhud+emgXlG5UFmWOhOFNJPBL6TUi8ChskGNevLvhwclE/RoCB/xdOpN5vO8
	CcIDFUMuMsg+zInwF70yGL7rinwVIPQOPdO64xSSuB8hL4zUdhF+qyIvOC3Taq44
	D3SfAItny00bz5UiwO30mmDWEVCzyisCE+KKUwRlC4D9XdRLCjk5IJVRj3TLbfzK
	rIhWv20lbhAB2wGIM89cw==
X-ME-Sender: <xms:5MqGZuIl3ys6vNps6ddkBwsjqLTipysNCQ4-ICbRQAXYz4cHtMRE9Q>
    <xme:5MqGZmJJWlpBiFaFNI1baLUF9TP_l5YouNoW28mtvAudLUAiHlRpMhPDNLFj1_37t
    4Y6Weli2DW0kRnaEcU>
X-ME-Received: <xmr:5MqGZuuiFzC-Bv1EGGZbeWUgh1OFGsOAiBMeTSSK2uCt_wMVid1pB6h7_wiSBzSCCAFSMGo3rAkrN8USuQdukjdt4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudelgdeljecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhl
    rghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvg
    hsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeu
    tdefhfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghr
    lhhunhgusehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:5MqGZjbs9vUOh9tYfwRRM_AOooq_OcusvPOlmpOSZsrTNUxAc2y6dA>
    <xmx:5MqGZlbbZmTJRcsIEW9zu0G6e6tLY7dtlrn0eXgi7E2FI7oGuDdahg>
    <xmx:5MqGZvBDCXFy5_VqG6kF8TjI1wyR3EPYYlIJZV5cVGTU0rsVKfpiHQ>
    <xmx:5MqGZrYe2acOIgB5CUDwt5Pea342-XVF3xxkvdWziePzS1wlKWcUaw>
    <xmx:5cqGZiTvMn-WlnrSiWtZEd4mQhfRObefiHkrJkxk35gMyN6sFG1vHbDh>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Jul 2024 12:16:36 -0400 (EDT)
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
Subject: [PATCH v5 2/6] arm64: dts: renesas: r8a779g0: Add family fallback for VIN IP
Date: Thu,  4 Jul 2024 18:16:16 +0200
Message-ID: <20240704161620.1425409-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704161620.1425409-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240704161620.1425409-1-niklas.soderlund+renesas@ragnatech.se>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
* Changes since v3
- New in v4.
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 48 +++++++++++++++--------
 1 file changed, 32 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index c5fc414928c9..9e75b3f4d317 100644
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


