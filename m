Return-Path: <linux-media+bounces-30593-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 961C9A94FF0
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 13:13:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BABCA16CFD0
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 11:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC605263C82;
	Mon, 21 Apr 2025 11:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="BHbWJg6F";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GmPHySyO"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A14262814;
	Mon, 21 Apr 2025 11:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745233982; cv=none; b=s0z6rThRygtUh2b1TXxCopAeK5J32JgGt1//5Vubx0ssoyAZ5FN2hfa/VxB6Ge4nTfYLqmDBLtujcp4sMkxLCMMqxUfaXrdgd9rrilTybCjrpotdk3HTA0Ws5GMQ77J78sRdNsto9s+PffiEyDyLccS8o8i6+Y5xh8ibj06zr/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745233982; c=relaxed/simple;
	bh=JvJ+dVGzBFTxkM9zzx6hWnZ6YtVrHe1rpgiOMgICesQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fbzpqmn+TOpBX0cF0EoburCaRPeeplqnRkklNHYcqsf/p5ab73Xor25SL+Cho4JIAUCvckt2YGz38aWTk/zAtI4ytHfzOwnA39mPGJDI9v5hoMpj7VmFJsyYgfK9rUkmEsDmYZItZMIpfj0gIuoLsCxLy4Ve0q1XQXFV/Y13Qb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=BHbWJg6F; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GmPHySyO; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 6B32F13801E6;
	Mon, 21 Apr 2025 07:12:59 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 21 Apr 2025 07:12:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1745233979;
	 x=1745320379; bh=RBhJ3jl1l4OPWyLNqsWX455oRjTRFh5VzCm5x5HXYTc=; b=
	BHbWJg6FLBSluNmxp2Wk/LRkR3ABCvAQDVI19QIV9JHXhcUKF5n6lSlgT/fITA/j
	44/eTzwE3fRu71fvVnV3IjA2iAj6lukOaxJYh2gocK7+hM9vL6lMnxJsYTqM2bmI
	kL8JfS4BPkCfV0U4PW9sZqrVDQa2q9PNvrtyJSLP1kBDq3L/XHxSGKxa6rTuQ5mN
	FpCDxBb8jxZU41uwY0JRnvBUpVUM72ExO0dyRZFREcOQju21Bc+1d8KK6X7MiQpj
	foBHGRXZPV+t0EzlTLNBvyvz6VUWj6VjspGzTZuKkL9RwHXoyubAuFkwXmJnuLKx
	yhT8sAKtBhCD35Xbmfnr3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745233979; x=
	1745320379; bh=RBhJ3jl1l4OPWyLNqsWX455oRjTRFh5VzCm5x5HXYTc=; b=G
	mPHySyOVCSDN2rf1/ePJK4Pwom92qNJIT8AVZ6RAC70nE+JQv6FCh45TXa81Mj3h
	Noek7fZ1rkZrC10uFRlFY3mq3bCIhnIFOZvpiIz4ni1/4h9yrvKSfU9196+ilJjy
	Q65Ya5wPmNnuDBk9H5MfkW5i33T0yq4NQ7IaHCKwWd+NZP0IrunGX66ztqOGUlE3
	D/DpOvsgEpLnNUgMdSf040XXudUoYg97hJWvcs14epiYXYq1BZhPWzWHhfDCIxF5
	PvrQnD+fv+pRa3YOKIIeVyBc/v5tyF9M8UR68GSmI8BI2tmngNt1WnS1wUuWcz/C
	oAOganL2lYHG6qrus13CA==
X-ME-Sender: <xms:OygGaJVlcoRNMQj1mGAuNF87cLO7UX0IJbmfgT81KQa6RV7XWpoqBA>
    <xme:OygGaJk6S09WkqtkHgkrFln4-hwbnCrN0KHK454U_N6SGV9lkHQflwKxXejLEPTTs
    v75fj4R3okbRz_mOdw>
X-ME-Received: <xmr:OygGaFbBGQQvMdkLAGzWAoRiqK5z2gdz3rotgD2z1G5wnfXdnXIOC-32Q8Zn1TD9nPcVb44Hct8e6kkWl0aPsrSIsA>
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
X-ME-Proxy: <xmx:OygGaMUB1vZuVNfWwZLvx-j_Jo-_1xdsNBpmqIc8_MElVjAGjk059w>
    <xmx:OygGaDmDlRKv_4rEqJQEvCIoeJ9bwOMlgyS2Z4tZH7uMSv_P4OR5LA>
    <xmx:OygGaJexACVgEsNG37PXlr259j-TuHLvB6lbwEchLAspN396sq5BJg>
    <xmx:OygGaNHYqnwMEdveK200WqjxoIJmonGrOjpKFP8p2XZ759pvEhr11g>
    <xmx:OygGaH97Ly2bffsl238cgytxCBcdSQH3ysH9E9IcECo53NQVX1_5KmHc>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Apr 2025 07:12:58 -0400 (EDT)
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
Subject: [PATCH v2 3/7] arm64: dts: renesas: r8a779g0: Add ISP core function block
Date: Mon, 21 Apr 2025 13:12:36 +0200
Message-ID: <20250421111240.789510-4-niklas.soderlund+renesas@ragnatech.se>
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


