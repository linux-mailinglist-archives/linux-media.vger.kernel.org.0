Return-Path: <linux-media+bounces-28295-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B34BA62F25
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 16:28:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A284C176C07
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 15:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B53C2046AC;
	Sat, 15 Mar 2025 15:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ox3iSCLh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RwHsV2iG"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FE620469B;
	Sat, 15 Mar 2025 15:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742052516; cv=none; b=jwbI2l72ko5jf6vziHwQ/G1NbP2+DEa8QoaoIYAMWBuBifCs7SxPL//Rrp3rAX5rmB7vWHSyHQadvSx9LHROAfuLqz2YpENjaNWmftOiA/pS+liXofry3ZUpOFUnUD8h5Svxu3QoEI0LVxBbXJ+O4vUw5COyj1bAnN2xpbBq7oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742052516; c=relaxed/simple;
	bh=/OLYdWKDal+YXCh3KXDuSDz2eGgvUifD1QwTkxHnf7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iC3w0Dgt7G1ijJgdPdjGgoX/liMxwg8pjHHyqH/2kVzkjU+BbuGM2tanLRGbXq0FrwDLC14x9vqdl6R5rgvi1uOp9n0i304Ohd74Fwii8ROgIWHPhwAcFpK5joUCcywXqBJjWhHyZbx9bYZpJUoCyRXxu6khXkDddznh2btuhqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ox3iSCLh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RwHsV2iG; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 53CF5254012D;
	Sat, 15 Mar 2025 11:28:34 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sat, 15 Mar 2025 11:28:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742052514;
	 x=1742138914; bh=HXzdZMDDZ3hBct+Nskf68ierHLOCfN5fT4fh1DN6rjQ=; b=
	ox3iSCLh8sCyGUaI/U9KXlkhCv5nLzdvvTUNGKsO3zAJJrQb6HZ7lT9mT1JddxOF
	ZoGwPDaluCy2p08mjtm+9CEi4EOqr3PtEwwGdYE2oxCDZvPszRhSTQF5ENZAyD8S
	Y/7S6kN/1hVElKXcF1fq2G0lzY8VqkB4bBaemtXYndbcINikVowOIcvf1gcN+WTu
	zcgwxpOIb9i33J2k308a0zxdot32BNkNbroEtu9Ng5L71bVgdg48r1b82pwHTd3Q
	hbFWI0kCXUjrsIQh33h3XKE8Ns8m6y/Ak/Yg8ShrNmBnjI9CyFiKHa7+e4a3FbXk
	81F9c4mrNN74DiMHZPgGKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742052514; x=
	1742138914; bh=HXzdZMDDZ3hBct+Nskf68ierHLOCfN5fT4fh1DN6rjQ=; b=R
	wHsV2iGf+YxNr/wVy9OTKGyhCWpqBornDyGi1eeDxlI9IVYsD11SEdH+ZktPcRZN
	hM8nUKvEO4B9nxATC5n6A34WMNghhQv7N71YP4FZE1LTahqpI8fNI33dPH1E4TBr
	pZg+TpLyhrqNa/0g1U0pl/VI23t/eiSm5W6se0og6Meh3SMTLyDScyjrcen7ZddY
	S6+SCgBJeSGmzPz7CjyG8uWCen5Oq3XWjXzt6oGDUf2oO9fTjGMTD9ewZqp2bP1n
	QVVk8KBZH8YkSDno0TJLPiHwRR4B2KgyjMngkIR5OUH1Yqudnz7c7kTvFPDky328
	PSaUDprCHZx/8UVZ209bw==
X-ME-Sender: <xms:oZzVZ_grWJqvjODji6tZf-bL5n0CtTJvtiksM2goYj9zw2sLs4xxdg>
    <xme:oZzVZ8Ckoc-Z492d8OzcxlBoxsMPXtz5oi02Awjeipy5iiMMnaSBHB0c6IJaX3CT4
    GCOYwaye-8IA0hOcQg>
X-ME-Received: <xmr:oZzVZ_H9N_rvpqXMKwtPSWdQK6YqwROQQ79AuqpFUVb_XxdC1pge7IYU_QX3GSNAH9y6gPednBYRHb8_oFn5Gbr2sQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeegtdekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:oZzVZ8QRDTWbNwY4ahDQpLa-smi7TcfGAJz_uPwGQyMwoLaRFT7zyA>
    <xmx:oZzVZ8xseumhMSBscZWFYVBf9xqIFTGiJZm1ax9NBrflBMEtV84CJQ>
    <xmx:oZzVZy431hsYN4HmAGpKlV-wAY_UYK2esNXnKyAb2VTdFUnALHm0rw>
    <xmx:oZzVZxxkzoSwn2QIqVMxaOhDub_dBc2uOdWy9J_uH4DAMhPgOiZfng>
    <xmx:opzVZ4iyLZPP71i1-b7G88F3r8s2SoKlT4kCUJGvZMDcBO1Jy2Or6DTC>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 15 Mar 2025 11:28:33 -0400 (EDT)
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
Subject: [PATCH 3/7] arm64: dts: renesas: r8a779g0: Add ISP core function block
Date: Sat, 15 Mar 2025 16:27:04 +0100
Message-ID: <20250315152708.328036-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
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
2.48.1


