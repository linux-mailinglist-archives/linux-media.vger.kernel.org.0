Return-Path: <linux-media+bounces-28294-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 194A1A62F22
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 16:28:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5157517513F
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 15:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D73202972;
	Sat, 15 Mar 2025 15:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="h+pQGPxK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VfE1qU92"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02D8204685;
	Sat, 15 Mar 2025 15:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742052514; cv=none; b=Y1d4uvDfIFQhBk/9NiEIwt1GK2RXKK5HXDGStG3HQ7v0U8AmrPOKrUfPWAo1yISg8hdQvIGMKu5uiUy5ZBhGnjAWdv4ee23j57WHtCxRd6PYQ3JLZ1oeylhzLAVnIPbqPU6NV6D7iLp6oLFQWlmN/VcJRYqtQMBWxmKgj9KqFEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742052514; c=relaxed/simple;
	bh=cnUKJpEz9ZU3hIHVN2qzoZ7pmkb9+e8itx+pPAvDbJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ljw7Quto+DnJOPS+0d5k0WeONDZ0dxt5poIOFTlVdmvEsfzUEk/luF0hKktEdjeMCt94WpRnA722djhb40iiI1z2UpGCNqq3IhTVIw7aXgnH3kWdzBvm/b8/MB40rLu4xiBMqVhzkr0LPyumDqDVUApNJ8Jwo4r+5xhihiO358c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=h+pQGPxK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VfE1qU92; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id B9433114014F;
	Sat, 15 Mar 2025 11:28:31 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Sat, 15 Mar 2025 11:28:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742052511;
	 x=1742138911; bh=2JIX5B+MeRnAEtCWvK98vRgifU2O/xa5n/YO4FmUC9E=; b=
	h+pQGPxKzatLIScbK0fsoMFbBSZ8ptClYjHPYcxKnWn/2mbqb8Ij5QghsOs6WUWk
	WhuCpaXDiUY4OT3XPHHlCVujjOzm4uhcVpuWrFGDe9O4M9S0hspRjRY9DWhitekv
	zj/JpCr51/Dz5tQ+f9PVOIY29VGy/Qdeqn7JU+BGpdJ/L4HmJ/RxbXlmHTr6N25y
	U25h55z9dhfx3YLlQfDyPeHHc5B7dyniQ+tpgksmw6T4A5ZMAvSHqTH6bv3cPATq
	pQ2qdOmpkn27Xp5wfeoUTfIpwoMt2uzRQrYQ/h1UZ27pFQp9Nxv7eK1jpPuQfIo9
	QidMCyeim5ut2ZBt9yeabg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742052511; x=
	1742138911; bh=2JIX5B+MeRnAEtCWvK98vRgifU2O/xa5n/YO4FmUC9E=; b=V
	fE1qU92/Lp1juCAoRWNbga9gbihNiBqd4P/tRsmR8inv0QE+3X5yImAaE51PDCrK
	mEx2sl+ubXwan6MisqVR0bXd9uIGsctLaFkuJB+2dJ2u7gV8mRGkuT+UFAp1SS3d
	qOWhRiVaB8TN64a1RRvDRqVezp0uA7wQ/L3bbRCeQsxRTdgkXZv6Att8d4T/TFgm
	lV+UvAY+6EJT2CJTQXFDMc9QDaZOeCPQ1W7jQCAmgIxiSBgq8Q7prrynx4eXoxaj
	kBYSVYhWympoKIg0+BmRSVDuwHypNEFGOHMksrvH8GjgIFCyiSiwil2XGAjqNxk9
	AxcLJ4Rr/ZaNDENKGfknw==
X-ME-Sender: <xms:n5zVZ8vuujCuFO-lOKjwBSeWK_IiNZQZjx1OIF-GOLGcpq09Yhd_Mg>
    <xme:n5zVZ5cqPCfCw5PeKFgdH5cNP9i8FydWROiF3HnUx4X6Xlphv3sfHWg6K7RH3gEWr
    FvZaZ-FDjJ1-UWIoXI>
X-ME-Received: <xmr:n5zVZ3wkdu85OMZPjd-2WFdCzCSPKdc0wehfhLP3sbWqv_9QNdg4CMHGAhE1vCpQ2PnMAwKH_Y3Ik5j9fdG7ZEyIbw>
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
X-ME-Proxy: <xmx:n5zVZ_NcSIml_WgnPs7rm9bJ48n_I7pKc70FHb5yzm0sHdv4ykpjWA>
    <xmx:n5zVZ8-pmR0o-v4TpF2sjo_tmVbFyRR1-em8-DPBA_EtCeR0_EGDJQ>
    <xmx:n5zVZ3XjtzZ6P93cg8DSTlw5H_E2LP-iVsHyIJiX5fIdfGtAMgpQjQ>
    <xmx:n5zVZ1eIIBuB6eVFT41kXDYgZiQ_YDHxYp0XSRDMDZrr315yi5Mr4g>
    <xmx:n5zVZ2cnnjpwTKpNDCVflnqwJc9ZwARlcWUSZ7xnmy9HF7C18T7SUixt>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 15 Mar 2025 11:28:30 -0400 (EDT)
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
Subject: [PATCH 2/7] arm64: dts: renesas: r8a779a0: Add ISP core function block
Date: Sat, 15 Mar 2025 16:27:03 +0100
Message-ID: <20250315152708.328036-3-niklas.soderlund+renesas@ragnatech.se>
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

All ISP instances on V3U have both a channel select and core function
block, describe the core region in addition to the existing cs region.

The interrupt number already described intended to reflect the cs
function but did incorrectly describe the core block. This was not
noticed until now as the driver do not make use of the interrupt for the
cs block.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
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
2.48.1


