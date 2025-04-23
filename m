Return-Path: <linux-media+bounces-30842-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9238BA9956B
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 18:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 780A75A6A5B
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 16:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33B42853E8;
	Wed, 23 Apr 2025 16:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="W/cuh8pL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="S47ea/z0"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B30284B37;
	Wed, 23 Apr 2025 16:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745426018; cv=none; b=ky7ClrUczgti4NwGPzIkzs29hlhcMJqEtjHYW5l6NzqES3lQzxL/iZkp0wTg2LSuWpm+1r0xLuim7BDCHDr164lu03uQM3xQTwy4QmDnLecxtmEPgOtfaQ+SVBF4u1gORYPuRTcOYNw0vlBe43SBJuqJQEPOrcoe2m0oYTotDwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745426018; c=relaxed/simple;
	bh=JvJ+dVGzBFTxkM9zzx6hWnZ6YtVrHe1rpgiOMgICesQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AfbI582bRc/ZoKU229IZz3TXOw3dYkxJ16OrioKdtQeNSFT3JMx5cmfwP9I6GM1TtaKFNblIPhHy2T41U3PsTzk0/L+97+Mr7ipoFrr2G6hVa2x2xuE0wxn4t2RGh7efT1f6eS4V+WyEzihsc9oxIIHjHQLT8dxbTWPCwnaB9qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=W/cuh8pL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=S47ea/z0; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 890E5114020C;
	Wed, 23 Apr 2025 12:33:35 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 23 Apr 2025 12:33:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745426015;
	 x=1745512415; bh=RBhJ3jl1l4OPWyLNqsWX455oRjTRFh5VzCm5x5HXYTc=; b=
	W/cuh8pLeFR2VhwXDfmDUB6RdetS8dx1qfg3mgo4jgByn3ZdJDkYOhW4JWpPGdA/
	VH6D91RJWr3gqjVHtuLvlrXPRQFtoYr2AIUdWTUNBnW69XyCk2NXRcNyXC84XtEU
	0vUcIabACIkRrteZAYixS0YRL3wSHuyMGWwwCdM8o3JkJtMRk1fTr03+vsj/66lb
	gDmeX73b59HF2jv8QjSrayfLiH7hI1bjx0Lr+oFCP0kNch6qdIsoLvGhBCOn2KSi
	P19fEBph6Xi0c0fcSUYi2KH5pHjJkeXGUsadsY6gEXiXeNlCwLcBbmh3MBN1+5UR
	bVcJiHfBxiCPAFFABny+3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745426015; x=
	1745512415; bh=RBhJ3jl1l4OPWyLNqsWX455oRjTRFh5VzCm5x5HXYTc=; b=S
	47ea/z0SkVMB6WjrHnX2p7OBjz+rswmF3hpgAUKZAJ0aNhdT2yihysE1HpRyPIo1
	RKIDJVtQ6PNHx6A+J/qkyCJvniK/6RGuxr2AJNb10nKWWsRECT79xI/oNNwx/CpE
	qu2U9WDr/rYJPEjsqbokJ1SiOO3zeq1tYb5MDPRmA8AhE2IkXijsa0QS6qUsxeXC
	8ochetozuS+Kzpl5Vi+wWLKq+80JgLOV/cieALcriTKANRoDMtXt0tc4pmBMpk+K
	3O2UfuO8MH7aq0sTLdztUWOgGE4DlUCpHPLfaW94jH9Gtsn23mVhDEhk8P1Wxkhx
	GNnnIf1MyRoDJNFkRQ6yw==
X-ME-Sender: <xms:XxYJaDwCi5UXM2pcqyEaUkvfTcSdACS4Ox6pGGyV_Qe4eKTfKw-sYw>
    <xme:XxYJaLT3d-9KCb-pOURUnkqa2iANq0_iL2B5UoGDu14QYVkJe09M4b_U30WUhypIL
    TE_VyVbtO2oanIW6yM>
X-ME-Received: <xmr:XxYJaNWH8CfDsUU879A6R2oAltAwggifV2gCvGbIGlLz6SSP8LAb5EKOEJsHSxT4r-rsVdcdrejs9FqwFcOgtQMG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeejtdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffgge
    ffleefgeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhm
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
X-ME-Proxy: <xmx:XxYJaNifsk7NNgH1gcpDZU1PmgHNNpslsy6DVHBOy2CS0jDy5tgtRg>
    <xmx:XxYJaFDjDeWMe7SMJ5ZpReAlDMT_tpHZVCi0sf6tuWQZYTKGBU-9nQ>
    <xmx:XxYJaGJFym82pvy-KReKc6ZEkAP7FxlzZy-sp4z_ZxeKJo2iRF8hXA>
    <xmx:XxYJaEAoa7icyLLKfLIMgDboX5Rf61GjS47QXVQejOLwBggeU5oQcA>
    <xmx:XxYJaOJ277GU4oWWqsK-ebsMN3YhYmlrIpd76nc_4IvRxO3D79xEI54s>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Apr 2025 12:33:34 -0400 (EDT)
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
Subject: [PATCH v3 3/7] arm64: dts: renesas: r8a779g0: Add ISP core function block
Date: Wed, 23 Apr 2025 18:31:09 +0200
Message-ID: <20250423163113.2961049-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423163113.2961049-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250423163113.2961049-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All ISP instances on V4H have both a channel select and core function
block, describe the core region in addition to the existing cs region.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 30 +++++++++++++++++------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 1760720b7128..6dbf05a55935 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -2277,13 +2277,20 @@ du_out_dsi1: endpoint {
 		isp0: isp@fed00000 {
 			compatible = "renesas,r8a779g0-isp",
 				     "renesas,rcar-gen4-isp";
-			reg = <0 0xfed00000 0 0x10000>;
-			interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&cpg CPG_MOD 612>;
+			reg = <0 0xfed00000 0 0x10000>, <0 0xfec00000 0 0x100000>;
+			reg-names = "cs", "core";
+			interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 475 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "cs", "core";
+			clocks = <&cpg CPG_MOD 612>, <&cpg CPG_MOD 16>;
+			clock-names = "cs", "core";
 			power-domains = <&sysc R8A779G0_PD_A3ISP0>;
-			resets = <&cpg 612>;
+			resets = <&cpg 612>, <&cpg 16>;
+			reset-names = "cs", "core";
 			status = "disabled";
 
+			renesas,vspx = <&vspx0>;
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -2361,13 +2368,20 @@ isp0vin07: endpoint {
 		isp1: isp@fed20000 {
 			compatible = "renesas,r8a779g0-isp",
 				     "renesas,rcar-gen4-isp";
-			reg = <0 0xfed20000 0 0x10000>;
-			interrupts = <GIC_SPI 474 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&cpg CPG_MOD 613>;
+			reg = <0 0xfed20000 0 0x10000>, <0 0xfee00000 0 0x100000>;
+			reg-names = "cs", "core";
+			interrupts = <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "cs", "core";
+			clocks = <&cpg CPG_MOD 613>, <&cpg CPG_MOD 17>;
+			clock-names = "cs", "core";
 			power-domains = <&sysc R8A779G0_PD_A3ISP1>;
-			resets = <&cpg 613>;
+			resets = <&cpg 613>, <&cpg 17>;
+			reset-names = "cs", "core";
 			status = "disabled";
 
+			renesas,vspx = <&vspx1>;
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.49.0


