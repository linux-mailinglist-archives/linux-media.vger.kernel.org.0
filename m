Return-Path: <linux-media+bounces-14658-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C01D6927B02
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 18:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E363C1C22571
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 16:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291601B3721;
	Thu,  4 Jul 2024 16:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="HS+cx+HE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GhZKUpli"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5334B1B3F17;
	Thu,  4 Jul 2024 16:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720109808; cv=none; b=J436BtIpj0jUCSrL7kCF6jcl6/BX5iItfK5z2tadLrbo4VZ97HKrAYnJm5MbLj8Hx+ly7xrwqXhJovm45P8mrcP5k5s22ZQW1ZV1i1KKZ2EvQzufJm3pdkNlc9GqQmT7bx9yNYj3IvHbpJ+wPhlGJjPBpOaaW5XceGT5HMdbMpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720109808; c=relaxed/simple;
	bh=+d7HMkjW9WDhJDT1G9OhF0hge75yUsaQQm731fUYkRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZMipTtc4ltqC/XLjivziIaAPMXoU9bu74R9lFJeEARmU4//fll7YNfbrofPtbcBDhfFLwEdw0wN+OCej0as90Xy6tQcWoVefmCr+Cg4c4xmLKmiGSYSOiEqPpmqKL/GDWolpPyhRQB4odhljEP9WOelXPRcVBhKyIm4qrzsZQqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=HS+cx+HE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GhZKUpli; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 6F4FB1140240;
	Thu,  4 Jul 2024 12:16:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 04 Jul 2024 12:16:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1720109805;
	 x=1720196205; bh=u7gSQRCqHUrGHv3OfHBAFAbGwvtHobx02/VutSbBKuw=; b=
	HS+cx+HEM+VA0Ryn1QKl8/mEFeMRvNxZ4VYRCH1xUrMMZSeq5kMr2CqqSZ4cV02H
	pkNHwh4xB+AC6K2t/0GAH6Ka72kWG9BcbhHOKWd7j8zdVoeK6R83kC8rHT/QkMf2
	xEgG8pXE+oXks3O7X2l1E5fooldpeuD7VQgRSjXP6SvYDOOG/vVb78t76fg+ySXs
	VGZUxzbRDEc7y8gNpfL9qxrAe699obvuSXGvcsZuOrvmOH8tYagYBbu8+RrMBvE9
	UcHs85F8oFaa/X5N4C8h7j76V6b/r140n/IqIznkg1Q/9gpSiyA0aPAc1mu1R+I5
	xR18jf5okMa2mrr0AGvXng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720109805; x=
	1720196205; bh=u7gSQRCqHUrGHv3OfHBAFAbGwvtHobx02/VutSbBKuw=; b=G
	hZKUpli/G9FcJZfcsAcU3uC0oIH6waSldpDBrmn2moKmESz+FpYrFJ6RMMQ32HCl
	tJ+LXEqrwG6bt3DasHqvoI1htofJQHiNPSIzJ9HIVxqV1iPV133AREzA+Dq2kRYQ
	7eX4CPcrS04rGFep00p2jqVQLRIHaiBP5SyWAbViN11i3pc3pzDwxmpMmO5QwJSM
	ejqfQTAAOTcK0xNRLfqrbyalzTcXKh1WDcffWzl5tYHLhhRnjDGw//WsyKY675Fn
	afMe0s/Gtdn8UV/VWMwpVhzbmuN5EGIoUmO24kjY7YZRHMEwP/g3QPJ7kZyYWCC3
	6gUuPscD/rh3wgXxxjw4g==
X-ME-Sender: <xms:7cqGZrV3KK14QrOb4AYB_FGTkO_Fnzhf0dOUyyw9-8-lmS_DIG6mjA>
    <xme:7cqGZjmyma5MiiMq1NrUIDaPDHhlylNDgiuLpbolkm1ZFK7P8IvUgi-INW8hcv5GO
    rnSHwlE1ucSiexL_A4>
X-ME-Received: <xmr:7cqGZnZwfB_UM6r3vyEk-Nb-Boibxa2cevg5IxLhdqz3HHTjuJT9DXhutLAfs_6ARTSKEe6ibRAimV50SYXS0P3RJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudelgdeljecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhl
    rghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvg
    hsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeu
    tdefhfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghr
    lhhunhgusehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:7cqGZmVSsXp-Y3fIF4WWORuPBvSM0bUXoEjpQJeVSSLhrD7DoLt-hw>
    <xmx:7cqGZlmX5lSEbw8zq2anpoPSUAc0LXf1ML7lJ6VZVIfU9IS3Lvckjw>
    <xmx:7cqGZjcDG4fkebbaONWTQzB7dA796tWwAejwKpiQtBpoVGxYovzIcw>
    <xmx:7cqGZvFZteY8KK8YCOwjiAY2o3fI8gp8dxYBGYQaKI6FgR54_glVBA>
    <xmx:7cqGZuexdeDQUGt7e_gSsirmu4cDJ3fyf1f5koyyupGRfukdbYznfzz9>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Jul 2024 12:16:44 -0400 (EDT)
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
Subject: [PATCH v5 6/6] arm64: dts: renesas: r8a779h0: Add family fallback for VIN IP
Date: Thu,  4 Jul 2024 18:16:20 +0200
Message-ID: <20240704161620.1425409-7-niklas.soderlund+renesas@ragnatech.se>
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

The usage of the V4M VIN bindings where merged before the bindings where
approved. At that time the family fallback compatible where not part of
the bindings, add them.

Fixes: 2bb78d9fb7c9 ("arm64: dts: renesas: r8a779h0: Add video capture nodes")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
* Changes since v3
- New in v4.
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 48 +++++++++++++++--------
 1 file changed, 32 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 8f5763b5f267..b9f49288a115 100644
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


