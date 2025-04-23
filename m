Return-Path: <linux-media+bounces-30843-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BDEA9956C
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 18:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B30B3B4ACD
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 16:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0992857F8;
	Wed, 23 Apr 2025 16:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="uEuoLMVT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PzC9dT3N"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559AE285405;
	Wed, 23 Apr 2025 16:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745426020; cv=none; b=KOhQjXmJfR8K3mW/XVVS1+XVsMFU2i89kbQb5JzoR2/XI3WbaHEXiBfnUXu5L3gKVPSC4qeg8KlGW8rEkL3k8t30LEJ3xWNEyYj7DElZhyUjXO0g7GxvP/XmYFxV6p+CZvrjqp3jqj81sBTCj1EUIS+aidbO9O5Y+AV9MCeuoUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745426020; c=relaxed/simple;
	bh=hlE5kLFWhC1Bh5l3z8p8PMugJauNrd1tg4is9OZXcgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CsdWc+ZpFWvLrUCjQHgWKy86pGJbOejAnS5ivlct1bTIM9VnlSTehWz5VLWi3t60BOmJCwlAAkdCFc11StiDgvKxQhJLc5iADkHdxfQvrQ76Ip0qUx2JfwPNTK2wzDha28RjZ2tcoHdh81EaQBXfTE9WNKzKMIdEgGRPxcLNeYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=uEuoLMVT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PzC9dT3N; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 7317F13801B8;
	Wed, 23 Apr 2025 12:33:37 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 23 Apr 2025 12:33:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745426017;
	 x=1745512417; bh=dkX7c3Y1Cqr8D/gMu40JL+eiEeh2sJkSt3MAzWtiCdc=; b=
	uEuoLMVTnZuDUgViUdiKbB3i30pgcu+xQPyFZsQ80QkURdKQZawx4u6ywZ4RS97b
	mZIMh9ZAtNoBDTz3/v7r78PrxcNa34FuUl/6Z6AolXMBhzSH+ldZz7S1SDLN+Sa8
	AYxcLuQO2ttK02jmOiPEB4yTq7G8InAuKt17nCAFg52jwR31nNYJ/pOS3S/Jylww
	pBpj7ViFRTf3rPNJjaeEVLpDhP+fENcg1OssXDPgjB78cDu/4zWeidzjTSbYH4RR
	QP33j3rRcBIAtfbmRebLT1gg+OuHUZYl7MiX78Ly58hnfeRyDUgESm7ZH+rvooJH
	1Acg96GXNqlqtAKSXm9PDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745426017; x=
	1745512417; bh=dkX7c3Y1Cqr8D/gMu40JL+eiEeh2sJkSt3MAzWtiCdc=; b=P
	zC9dT3NxFsqdyrDmiuD+Xwh1UqBWpPrFpmqeD6Yudi18ff0xKGnAyxC++suq/S/6
	AVuXV+SQayD6vD17558y29LqGMDpqK+l2ssLsB4r5ctg23rFnLlKm4puhW2HSzVM
	ZY784qB3iBNUCmjmm48ryVLYA703HwGz9MAh7pnyVJrn9160Iz6NpNC2TRXWiaLa
	xWYWCMcgk3P17TGYd3X+jTn+dz7bRf9v7optdKU3knKAqB2RlDDMIPgGtizLKUm8
	n+wbFbCPDd3SgWxeEdmdqp493fdZbGRWnvuYj/B38vsIao+xqt5KxnuKre8yla61
	uWZTswNbFfeJeHw3BafzQ==
X-ME-Sender: <xms:YRYJaKCc1h5iHD4gCScIanUO03nrV8m8TQnU4RTUIz47W93o9roSmQ>
    <xme:YRYJaEiMjl1B3IOZNMcLdKuaTd6E9C3t4naH-1FWEoRWlZs3WswaPY2m_j0H6fxcu
    ewZn67cSk7UHH7ZscM>
X-ME-Received: <xmr:YRYJaNnCeqHOWbH-aznrohEhh_u_lSMb8EuyZayW7okcAExcfUR6ZG1-H_XTXDEViZxjhPNzZyVdqzw9CTMAflrT>
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
X-ME-Proxy: <xmx:YRYJaIxYQx885xDHT1H5z64-iTDf4znC3rX8HjAg-nauwlgPiBk2FA>
    <xmx:YRYJaPQ_jhblJG3nHFn8mhZ6M7H87hwzFDBSB39oRq13Xe1uYJuN_g>
    <xmx:YRYJaDYP3XUts5RR3aeB5b6-k3jAOo-dTaA0lilB7VHPIvtm9orodg>
    <xmx:YRYJaISPLxdtecHZuTiGAudNTO_PXIXar0y4KFFo39OJmt1jHZE2AA>
    <xmx:YRYJaFYqPz2ofpAlR5c5iv0svqCA3UeZdVa-GbeIHWkg8DlFsOuxUMlh>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Apr 2025 12:33:36 -0400 (EDT)
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
Subject: [PATCH v3 4/7] arm64: dts: renesas: r8a779h0: Add ISP core function block
Date: Wed, 23 Apr 2025 18:31:10 +0200
Message-ID: <20250423163113.2961049-5-niklas.soderlund+renesas@ragnatech.se>
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


