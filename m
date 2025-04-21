Return-Path: <linux-media+bounces-30592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB64A94FF8
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 13:13:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30A5A3A9759
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 11:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D099263C6C;
	Mon, 21 Apr 2025 11:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="RVkIAl0T";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GzYzRs8R"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE90261370;
	Mon, 21 Apr 2025 11:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745233980; cv=none; b=L3gT1L7lsjpaOoCkJmQ+9HPt4Nr1D3oG63b1V7wwVQ48tAGlQjX0U5H7iy0UMwktZMfa63rjLz2sfnqXE3hnKjiIyhGGoZj2OCdUZWr57wqS42ciNkkdes+jECqcaaiWvu9KhPAL3xCYnMowZu8Sv+0hNxF0F45r3XmurWl5xig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745233980; c=relaxed/simple;
	bh=1AdI5HPZhnjAsDRQZCFomB4ULy9ywmZC8tYgekREVf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WImtxV1haoNoAjbbbzgY3gSeWKG8pxdWK5zmx8uH/2b0KUTt8tY8mOdNSeAcdyvs+EuqbtaDFjsctSNLLvaimka40CBV9HmofcmbTwJoTnKKOSSZuiLJuRfa4u6hIcrdprN/bf7kzICcLL8Ozlef7FWGJyZM4y3pIlXPQP7Dzf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=RVkIAl0T; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GzYzRs8R; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 7514B13801D9;
	Mon, 21 Apr 2025 07:12:57 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 21 Apr 2025 07:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1745233977;
	 x=1745320377; bh=eIwHjesGkNa7/Iw5XWSXmI+Z7/8YZCobAuZIgt3TFPs=; b=
	RVkIAl0TOZoJRd0/FRRLiVej8yeZIRoprdNxSTxS1UiwJdNXmC2t/0e2rfXEjRb2
	oWccF10W3UkTFPJNwKL1/gW4WrnoHTw6iTsNFMYdyq9VScBbSAhrVXIeUyftWTnZ
	iU+/ZYB58c+CGJgYWN7hDHswZYxiN7bFszMKjILetRoz4qegazrNiz+Z3H2YVGeg
	MlFShfd7Mi2f8gKTOMXgumH7x7MnAiojzlh9DH1uRjZU0AovLucQNoJnlBWhE8XO
	Zf7Ly32xTMKHQcMTBJo2FIWNFVkUCsJfgGTGJRKxiyvO+yuP6rnJcVi80CqFoWf2
	249UKrEX6ZGRefIVxIvJkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745233977; x=
	1745320377; bh=eIwHjesGkNa7/Iw5XWSXmI+Z7/8YZCobAuZIgt3TFPs=; b=G
	zYzRs8RkNr84nSMLXVEiH/6IEX5BMhlqjxhJErggCErHZmbgomxrIfPDvAB+EJKv
	c5h/fTFtUORriJ05n1XY19vWOBmYOBlABIKMu9ssT9jyOHzRnf/QBfH5JMYjTH+/
	Mnl3vthstTnBhx9TpKv7oNaSIn2DG3XWbjSqQ6pu4S7vJkz7t8TduY6aPEXnQsV6
	YCNay2dDCZbaVFwA2v+kJpLypdZLebFvPq5YzcO5V644MLocvH9vnWHS14lVnXKH
	f4CCGR+IojistyiQiOGicLUTXPpGLVmePTSHuEVvKb58kHCVLX9AwOsJmgVHoa/A
	h1XC0WQ+b9HhvqODvouhQ==
X-ME-Sender: <xms:OSgGaM8VTSNF9gKJvQiRrytjD7EtIod2TqP4rmNnKMx5kghLJu95BQ>
    <xme:OSgGaEtfNC7b9HfOEalLhBvb23kLN3v39fQVeCbjn1Zvt1cloun0fQM136y67VOlo
    9jdQnGu9m1eR1gW32k>
X-ME-Received: <xmr:OSgGaCBNbpSp_1Y2QLg6Qsdlgddu1IgoxE_drL0MTHHtP8peEhmMn7ilQYnNAPEiBibM2S-vd6NQTOjTe9PsRWeQFg>
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
X-ME-Proxy: <xmx:OSgGaMcCpWqOY-mVYSp8_ViBUG6bLBDsx7O87UZCZ1UdlAtclzAJfg>
    <xmx:OSgGaBO9eAZdcwewfgPnYmPqThnZfaV4ZzMHOyiNduFpZTkOUnBkiw>
    <xmx:OSgGaGkvsoNx_TIvzmjMhNAze5ykeAqG7VuLbTDcvXyck6jNkNjqcA>
    <xmx:OSgGaDsX4F5rMGgVpkySkKwjLnERrdDPk3c2sMKJOlQrRo-jahl_Lw>
    <xmx:OSgGaGEbHVFk05abMIoz44VvXxPL5-kJrygKGi38JGkz8l2DsjOBew2M>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Apr 2025 07:12:56 -0400 (EDT)
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
Subject: [PATCH v2 2/7] arm64: dts: renesas: r8a779a0: Add ISP core function block
Date: Mon, 21 Apr 2025 13:12:35 +0200
Message-ID: <20250421111240.789510-3-niklas.soderlund+renesas@ragnatech.se>
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

All ISP instances on V3U have both a channel select and core function
block, describe the core region in addition to the existing cs region.

The interrupt number already described intended to reflect the cs
function but did incorrectly describe the core block. This was not
noticed until now as the driver do not make use of the interrupt for the
cs block.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 60 +++++++++++++++++------
 1 file changed, 44 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index f1613bfd1632..95ff69339991 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -2588,13 +2588,20 @@ du_out_dsi1: endpoint {
 		isp0: isp@fed00000 {
 			compatible = "renesas,r8a779a0-isp",
 				     "renesas,rcar-gen4-isp";
-			reg = <0 0xfed00000 0 0x10000>;
-			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 612>;
+			reg = <0 0xfed00000 0 0x10000>, <0 0xfec00000 0 0x100000>;
+			reg-names = "cs", "core";
+			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "cs", "core";
+			clocks = <&cpg CPG_MOD 612>, <&cpg CPG_MOD 16>;
+			clock-names = "cs", "core";
 			power-domains = <&sysc R8A779A0_PD_A3ISP01>;
-			resets = <&cpg 612>;
+			resets = <&cpg 612>, <&cpg 16>;
+			reset-names = "cs", "core";
 			status = "disabled";
 
+			renesas,vspx = <&vspx0>;
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -2672,13 +2679,20 @@ isp0vin07: endpoint {
 		isp1: isp@fed20000 {
 			compatible = "renesas,r8a779a0-isp",
 				     "renesas,rcar-gen4-isp";
-			reg = <0 0xfed20000 0 0x10000>;
-			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 613>;
+			reg = <0 0xfed20000 0 0x10000>, <0 0xfee00000 0 0x100000>;
+			reg-names = "cs", "core";
+			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "cs", "core";
+			clocks = <&cpg CPG_MOD 613>, <&cpg CPG_MOD 17>;
+			clock-names = "cs", "core";
 			power-domains = <&sysc R8A779A0_PD_A3ISP01>;
-			resets = <&cpg 613>;
+			resets = <&cpg 613>, <&cpg 17>;
+			reset-names = "cs", "core";
 			status = "disabled";
 
+			renesas,vspx = <&vspx1>;
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -2756,13 +2770,20 @@ isp1vin15: endpoint {
 		isp2: isp@fed30000 {
 			compatible = "renesas,r8a779a0-isp",
 				     "renesas,rcar-gen4-isp";
-			reg = <0 0xfed30000 0 0x10000>;
-			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 614>;
+			reg = <0 0xfed30000 0 0x10000>, <0 0xfef00000 0 0x100000>;
+			reg-names = "cs", "core";
+			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "cs", "core";
+			clocks = <&cpg CPG_MOD 614>, <&cpg CPG_MOD 18>;
+			clock-names = "cs", "core";
 			power-domains = <&sysc R8A779A0_PD_A3ISP23>;
-			resets = <&cpg 614>;
+			resets = <&cpg 614>, <&cpg 18>;
+			reset-names = "cs", "core";
 			status = "disabled";
 
+			renesas,vspx = <&vspx2>;
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -2840,13 +2861,20 @@ isp2vin23: endpoint {
 		isp3: isp@fed40000 {
 			compatible = "renesas,r8a779a0-isp",
 				     "renesas,rcar-gen4-isp";
-			reg = <0 0xfed40000 0 0x10000>;
-			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 615>;
+			reg = <0 0xfed40000 0 0x10000>, <0 0xfe400000 0 0x100000>;
+			reg-names = "cs", "core";
+			interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "cs", "core";
+			clocks = <&cpg CPG_MOD 615>, <&cpg CPG_MOD 19>;
+			clock-names = "cs", "core";
 			power-domains = <&sysc R8A779A0_PD_A3ISP23>;
-			resets = <&cpg 615>;
+			resets = <&cpg 615>, <&cpg 19>;
+			reset-names = "cs", "core";
 			status = "disabled";
 
+			renesas,vspx = <&vspx3>;
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.49.0


