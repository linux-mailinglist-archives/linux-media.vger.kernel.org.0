Return-Path: <linux-media+bounces-14655-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 810C2927AF9
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 18:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3D69B24346
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 16:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592731B3756;
	Thu,  4 Jul 2024 16:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="racjBV36";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eOZne/yv"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640491B3730;
	Thu,  4 Jul 2024 16:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720109802; cv=none; b=FTFwDGxEqQomYC6YEXLoLx8ZcJgy2hSSzfekOOAuiWi2gsfjNiaQLMXXOadxIiQygqGgk0RODAPrR249AIDySEuCIPiXdh/b37x+KxPMJ5FMOpx+GdznqPSeu7JWhMiwEGj6qmpxRh22Y4HrhGYYGPMpgviAmQHJ8q9wOX5zq2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720109802; c=relaxed/simple;
	bh=cFNZbZPIMFu9nMO98oL6mBCAVGwSkpL3Nz3gANNm6ZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lWaHtsnkvag17gf1cBaE6Jt5sOzvuy4FdrUUzUe6qkWIrSvPzJkRwnXCeZHL/RMeas2pW5i2cbXUXcKeH2iac4Wh/FMgQLwOYwGybdyu39rSXda1qMxN7qxB1xWmvhzC4BqktI/kw8qhr521wONezZ0VK+qNsGQ4PLRzVnJlL6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=racjBV36; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eOZne/yv; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 8C962114029E;
	Thu,  4 Jul 2024 12:16:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 04 Jul 2024 12:16:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1720109799;
	 x=1720196199; bh=QQp6fhejztrpddK+xkG5edyRGe/rDF2i+vDszpez9pI=; b=
	racjBV360gtJCqNrn3G3I1rt0d7G65M6ANV3aq44pMilx5nsj9t0pQnkEuSWgkc1
	4x85Fr97Nbg/zB33GkKfiNsre4sya3xP1ZNEwHd0hzetaWdNiSyUGpooPZcSPyIg
	tCAVlnJ/XoOHp68ldZ3QbZUtiSH2XOVRKvbaJSritQeNs44BXH1Rfj2r6HG3DtWh
	om9FfZ5u1Y7/qBWLv0nDCSZGLgO8yAviVcrW/S/lTTAU2cnhGblCz9FkiGiqtAEA
	FXlZkwNa4owPiGZbYL8pOpcunGA4Q0IFEThLTn/PAum3nURbLBpm9kv9YvNDCYUu
	aNJBMSqgDkRjeKeMjiC+vQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720109799; x=
	1720196199; bh=QQp6fhejztrpddK+xkG5edyRGe/rDF2i+vDszpez9pI=; b=e
	OZne/yvh2LUkkfbc8Qhoo/ts950F4D1Qeg3JdpsYUw4fNIMii0d1chxMmv5LCQ5+
	jecpacshpoW5XqsHj42+m9LlcMSQgMcRBszF0a7//Q7GEOYxgaLLRcmZ5hrSkfWF
	SxCKXvKuta7QAB5AXKLlKKJujvrag7i/5gROpMX1KP6g/c4Ps8K5oBKXy0h0eBSq
	TudJAFLZknV+st96gQ0LkZrkffbrCv5KWgnKNlvFuZZGlDrp88wNj4jp4Y6OjMYR
	TaUIJI1yixUpYSXkJ/D1/oceDviC+dyXhlDsebm4P3giHXT9S6UeTxlWwDc45vAf
	Shv6eIa4qgYZHLl4g5psQ==
X-ME-Sender: <xms:58qGZhIhX8jxEhxMt9F0iwa7hZfQ84QCX80YZL8_9f3Yb2zG9Xs-7w>
    <xme:58qGZtJcxSgvY47ZBv-pgQdAym4kkNLXsJtOQn6OUntTTpk2T0zJGVwI6UyWCRbDn
    _aEmkkGspAOmgYydJM>
X-ME-Received: <xmr:58qGZpuJZVLiUMSy2Z6I_cL_mXLXsvxTHuVZcPih9A709anLKE_hFiwm5f_y2XNknUMfwbIunkJ-VU3P4b5C0rrAdg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudelgdeljecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhl
    rghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvg
    hsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeu
    tdefhfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghr
    lhhunhgusehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:58qGZiZFpNisqchEKrIs8M_mHpDjO7c0RQ79P36HD_XJMYk7gT4KKg>
    <xmx:58qGZoZZXcPWVnU6EHk9XP2Qa2QvuwLUqB7lhrA-ToBcJtzeghrp1g>
    <xmx:58qGZmAenEmzsGNgH8xuVsNTOiSDAYb974N1ilCgF6ssx8Q8324EfA>
    <xmx:58qGZmbA4E3jcICwXYv5_JfGJyTn-8xPUfXkCBcujfjU1yF1kHktlg>
    <xmx:58qGZlRZhbb1bjnyCiAkxZayPwyxmt_uUW9T5_L5I4h60Yo78DeuZ49U>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Jul 2024 12:16:38 -0400 (EDT)
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
Subject: [PATCH v5 3/6] arm64: dts: renesas: r8a779a0: Add family fallback for VIN IP
Date: Thu,  4 Jul 2024 18:16:17 +0200
Message-ID: <20240704161620.1425409-4-niklas.soderlund+renesas@ragnatech.se>
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
Add this fallback to the V3U DTSI.

There is no functional change, but the addition of the family fallback
in the bindings produces warnings for V3U for DTS checks if they are not
added.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v4
- New in v5.
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 96 +++++++++++++++--------
 1 file changed, 64 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 395f8d43ce2d..9870455714da 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -1176,7 +1176,8 @@ msiof5: spi@e6c28000 {
 		};
 
 		vin00: video@e6ef0000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef0000 0 0x1000>;
 			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 730>;
@@ -1204,7 +1205,8 @@ vin00isp0: endpoint@0 {
 		};
 
 		vin01: video@e6ef1000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef1000 0 0x1000>;
 			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 731>;
@@ -1232,7 +1234,8 @@ vin01isp0: endpoint@0 {
 		};
 
 		vin02: video@e6ef2000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef2000 0 0x1000>;
 			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 800>;
@@ -1260,7 +1263,8 @@ vin02isp0: endpoint@0 {
 		};
 
 		vin03: video@e6ef3000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef3000 0 0x1000>;
 			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 801>;
@@ -1288,7 +1292,8 @@ vin03isp0: endpoint@0 {
 		};
 
 		vin04: video@e6ef4000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef4000 0 0x1000>;
 			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 802>;
@@ -1316,7 +1321,8 @@ vin04isp0: endpoint@0 {
 		};
 
 		vin05: video@e6ef5000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef5000 0 0x1000>;
 			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 803>;
@@ -1344,7 +1350,8 @@ vin05isp0: endpoint@0 {
 		};
 
 		vin06: video@e6ef6000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef6000 0 0x1000>;
 			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 804>;
@@ -1372,7 +1379,8 @@ vin06isp0: endpoint@0 {
 		};
 
 		vin07: video@e6ef7000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef7000 0 0x1000>;
 			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 805>;
@@ -1400,7 +1408,8 @@ vin07isp0: endpoint@0 {
 		};
 
 		vin08: video@e6ef8000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef8000 0 0x1000>;
 			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 806>;
@@ -1428,7 +1437,8 @@ vin08isp1: endpoint@1 {
 		};
 
 		vin09: video@e6ef9000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ef9000 0 0x1000>;
 			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 807>;
@@ -1456,7 +1466,8 @@ vin09isp1: endpoint@1 {
 		};
 
 		vin10: video@e6efa000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6efa000 0 0x1000>;
 			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 808>;
@@ -1484,7 +1495,8 @@ vin10isp1: endpoint@1 {
 		};
 
 		vin11: video@e6efb000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6efb000 0 0x1000>;
 			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 809>;
@@ -1512,7 +1524,8 @@ vin11isp1: endpoint@1 {
 		};
 
 		vin12: video@e6efc000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6efc000 0 0x1000>;
 			interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 810>;
@@ -1540,7 +1553,8 @@ vin12isp1: endpoint@1 {
 		};
 
 		vin13: video@e6efd000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6efd000 0 0x1000>;
 			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 811>;
@@ -1568,7 +1582,8 @@ vin13isp1: endpoint@1 {
 		};
 
 		vin14: video@e6efe000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6efe000 0 0x1000>;
 			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 812>;
@@ -1596,7 +1611,8 @@ vin14isp1: endpoint@1 {
 		};
 
 		vin15: video@e6eff000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6eff000 0 0x1000>;
 			interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 813>;
@@ -1624,7 +1640,8 @@ vin15isp1: endpoint@1 {
 		};
 
 		vin16: video@e6ed0000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ed0000 0 0x1000>;
 			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 814>;
@@ -1652,7 +1669,8 @@ vin16isp2: endpoint@2 {
 		};
 
 		vin17: video@e6ed1000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ed1000 0 0x1000>;
 			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 815>;
@@ -1680,7 +1698,8 @@ vin17isp2: endpoint@2 {
 		};
 
 		vin18: video@e6ed2000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ed2000 0 0x1000>;
 			interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 816>;
@@ -1708,7 +1727,8 @@ vin18isp2: endpoint@2 {
 		};
 
 		vin19: video@e6ed3000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ed3000 0 0x1000>;
 			interrupts = <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 817>;
@@ -1736,7 +1756,8 @@ vin19isp2: endpoint@2 {
 		};
 
 		vin20: video@e6ed4000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ed4000 0 0x1000>;
 			interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 818>;
@@ -1764,7 +1785,8 @@ vin20isp2: endpoint@2 {
 		};
 
 		vin21: video@e6ed5000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ed5000 0 0x1000>;
 			interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 819>;
@@ -1792,7 +1814,8 @@ vin21isp2: endpoint@2 {
 		};
 
 		vin22: video@e6ed6000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ed6000 0 0x1000>;
 			interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 820>;
@@ -1820,7 +1843,8 @@ vin22isp2: endpoint@2 {
 		};
 
 		vin23: video@e6ed7000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ed7000 0 0x1000>;
 			interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 821>;
@@ -1848,7 +1872,8 @@ vin23isp2: endpoint@2 {
 		};
 
 		vin24: video@e6ed8000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ed8000 0 0x1000>;
 			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 822>;
@@ -1876,7 +1901,8 @@ vin24isp3: endpoint@3 {
 		};
 
 		vin25: video@e6ed9000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ed9000 0 0x1000>;
 			interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 823>;
@@ -1904,7 +1930,8 @@ vin25isp3: endpoint@3 {
 		};
 
 		vin26: video@e6eda000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6eda000 0 0x1000>;
 			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 824>;
@@ -1932,7 +1959,8 @@ vin26isp3: endpoint@3 {
 		};
 
 		vin27: video@e6edb000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6edb000 0 0x1000>;
 			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 825>;
@@ -1960,7 +1988,8 @@ vin27isp3: endpoint@3 {
 		};
 
 		vin28: video@e6edc000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6edc000 0 0x1000>;
 			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 826>;
@@ -1988,7 +2017,8 @@ vin28isp3: endpoint@3 {
 		};
 
 		vin29: video@e6edd000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6edd000 0 0x1000>;
 			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 827>;
@@ -2016,7 +2046,8 @@ vin29isp3: endpoint@3 {
 		};
 
 		vin30: video@e6ede000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6ede000 0 0x1000>;
 			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 828>;
@@ -2044,7 +2075,8 @@ vin30isp3: endpoint@3 {
 		};
 
 		vin31: video@e6edf000 {
-			compatible = "renesas,vin-r8a779a0";
+			compatible = "renesas,vin-r8a779a0",
+				     "renesas,rcar-gen4-vin";
 			reg = <0 0xe6edf000 0 0x1000>;
 			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 829>;
-- 
2.45.2


