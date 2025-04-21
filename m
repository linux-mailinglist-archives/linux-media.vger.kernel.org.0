Return-Path: <linux-media+bounces-30594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0287AA94FF3
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 13:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F2AE16CB0B
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 11:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2129B2627F9;
	Mon, 21 Apr 2025 11:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="IhbcfYU2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AjlDg4t3"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C11263C7F;
	Mon, 21 Apr 2025 11:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745233984; cv=none; b=eYqshdTR12gp9lSYydndvitUGcLvE7VNyj0U+fwP5Re3dDD2q9U88wHYtQmfGNk3HTlefDINB/aN5znqDgwk62J/umBVTqTjruLfwpJs6Lx0VKGgyOkXC4PgCf0VDwv9fuaHuB479pt3aMwsAt+nIq9UolNF1YyuDqrmzCA4Vl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745233984; c=relaxed/simple;
	bh=hlE5kLFWhC1Bh5l3z8p8PMugJauNrd1tg4is9OZXcgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e021hzzAPQ7NoQkBLsCwDG51zkI3RY9FWpSEICMJ3qnGA8vmQZLiUqEK96SdtO3+XGlf2hUdbxGBU5GsQmkMoKTr6FsgXJlIedZVle3kek7EXdLNeD20diP6tv1uhlKfj8kp/9eNqS5LbZBsowYki3WScX1+nag3vPX8HZ4m+AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=IhbcfYU2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AjlDg4t3; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 98DF413801D9;
	Mon, 21 Apr 2025 07:13:01 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Mon, 21 Apr 2025 07:13:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1745233981;
	 x=1745320381; bh=dkX7c3Y1Cqr8D/gMu40JL+eiEeh2sJkSt3MAzWtiCdc=; b=
	IhbcfYU25KTiwSIDoh0XiOGiBpEZ/h/yufhUTlvXahVHrlZxGL2WUHAnZUyj9NAt
	UCg/99FJaabEw7UkOKKHYz5Trgc1w+BSoMiHthtLS6FvPn85G6xrDyNrmfwkCcyV
	44+8xTXioRkwiXXas89vdvWRzB5GfZbF/Mt7+7ilmKQYbbxDwRtg+DYmlA9I3q85
	4rCKbehfsMKawN1bMO1/tnJFNwMJuVc53nYUONFSpkgCXEf1deTcWnE0ce8PyQnn
	/4gz9JDY+qXGG2I/uueSuVGGT/Xe9ZK8Lqz+Kvr253bhF9bHxhCcYlsvLSWkEfXI
	8OvGmD9VvKKpKV5FAEtfLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745233981; x=
	1745320381; bh=dkX7c3Y1Cqr8D/gMu40JL+eiEeh2sJkSt3MAzWtiCdc=; b=A
	jlDg4t3+6rKf8MRCzV2IlCU5tvUkrDG4QICuRfV3dN7ldVKvela7oFxB9vh92q3n
	atOHgQ+fYoxU9qrilANXdNJbo7weFAtIo5H4F2+dHH61o4D5Y7a2elakr3tbSlxy
	xgL3USelGKXJ3kCXwz+F2dZcEMkNF2FavLim28u5ytOo6DUXMJ4UEyhumnLqocmT
	4+AtGcQm3EBZYqxs8hEo+BvRU21REM/w8SYxpJJRl4FA3Jb9lP2dm+04ET4LQjNZ
	9eaTd00cJQb7qabZs1LXjgKPu0gyAZ6SeoR/hBkaQOx0trudDZvp4f7pFggx8Zfa
	L2pCND5xZZ9gsgDj01wrw==
X-ME-Sender: <xms:PSgGaArGkc_y3dqGrDR7B73m3AkSXo2bomrdZRCRPUjQkakAxQLaFw>
    <xme:PSgGaGpqLN6Do6VKreRfenrCcKUrMGZwVEzah7GGZGiT81FRcCwibbJDLfdmQtWfe
    gyreTSiFUf3tKf57G4>
X-ME-Received: <xmr:PSgGaFPjnH2ZbFwsZxHL5hkPkn9TRqf0En1MSORJZ4yfRWueD8fChRC8x0da6ifNrYmprWeQRVib15ySSCtvD8ZW_A>
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
X-ME-Proxy: <xmx:PSgGaH7IcD_Uz-JwF8XYa9Y34Qajspq_-WMt2RidEinmIjGmqqyc6g>
    <xmx:PSgGaP5VkqsIZ-zgwazsikQQfxuHX-Bh_BZSBwQBE6bD-SBa4A1kJw>
    <xmx:PSgGaHhtn5GPu3cqfNQ_6XC8jGNDbXk0XKAgywDLMf700_VzW46X2A>
    <xmx:PSgGaJ79eKrnRRYWjfTGlrogX7EQbGZYv9KmP5QnSKplZUu9sEjotQ>
    <xmx:PSgGaChSm_dteA3gDtO80_R4w-qxfK6Tj3pIBK47w2yUtAd5LH2EtaLt>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Apr 2025 07:13:00 -0400 (EDT)
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
Subject: [PATCH v2 4/7] arm64: dts: renesas: r8a779h0: Add ISP core function block
Date: Mon, 21 Apr 2025 13:12:37 +0200
Message-ID: <20250421111240.789510-5-niklas.soderlund+renesas@ragnatech.se>
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

The first ISP instance on V4M has both a channel select and core
function block, describe the core region in addition to the existing cs
region. While at it update the second ISP to match the new bindings and
add the reg-names and interrupt-names property.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 8524a1e7205e..ed1eefa3515d 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -1968,13 +1968,20 @@ du_out_dsi0: endpoint {
 		isp0: isp@fed00000 {
 			compatible = "renesas,r8a779h0-isp",
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
 			power-domains = <&sysc R8A779H0_PD_A3ISP0>;
-			resets = <&cpg 612>;
+			resets = <&cpg 612>, <&cpg 16>;
+			reset-names = "cs", "core";
 			status = "disabled";
 
+			renesas,vspx = <&vspx0>;
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -2053,10 +2060,14 @@ isp1: isp@fed20000 {
 			compatible = "renesas,r8a779h0-isp",
 				     "renesas,rcar-gen4-isp";
 			reg = <0 0xfed20000 0 0x10000>;
-			interrupts = <GIC_SPI 474 IRQ_TYPE_LEVEL_LOW>;
+			reg-names = "cs";
+			interrupts = <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "cs";
 			clocks = <&cpg CPG_MOD 613>;
+			clock-names = "cs";
 			power-domains = <&sysc R8A779H0_PD_A3ISP0>;
 			resets = <&cpg 613>;
+			reset-names = "cs";
 			status = "disabled";
 
 			ports {
-- 
2.49.0


