Return-Path: <linux-media+bounces-30841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFEEA99557
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 18:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8B64188D589
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 16:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F5B2853ED;
	Wed, 23 Apr 2025 16:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="a6K4tj9W";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="goJTvfw3"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E842641D1;
	Wed, 23 Apr 2025 16:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745426016; cv=none; b=m9+yFfhibj8GwgY4wbk66Zm9r7X8IqlQfFpmUg6fd8jenuM2nJTPQXg5I0Hx15/NAP/VmhN/U4QAKIUKJLUn4vPssvndfSjnB/sZwystQLOWKDe2/yLU8q4b0IbQ9RyJE2iw1AYIhL3rGFEpspcwrd9C9MB8hF7VzgNPsKBoijQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745426016; c=relaxed/simple;
	bh=1AdI5HPZhnjAsDRQZCFomB4ULy9ywmZC8tYgekREVf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SMvtElZcRx/4l6WwZJwPt0iQ9ZNnzXsal2Tjdz5szGHS1TAgfZ/qWgYdh9ILh95EV8ECHZ0JVVbN3Hf4zmqsDD5N6NRPgdmjKMeQuCAwPqrN9FmwBumjxPwTVx6v+6k0X1jJGhRgNCwwVNr/xRb0jjy+2k3zdjeZylq6ed3/4hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=a6K4tj9W; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=goJTvfw3; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 856D713801C0;
	Wed, 23 Apr 2025 12:33:33 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 23 Apr 2025 12:33:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745426013;
	 x=1745512413; bh=eIwHjesGkNa7/Iw5XWSXmI+Z7/8YZCobAuZIgt3TFPs=; b=
	a6K4tj9WmTQhkjk/kAMFrFpoa/7R9F2cRIU2aaGe6nehzMtGTcm1Z/qEUWj5m0Nx
	kKpYR3espuUtQRkkgadDWWc85H9gPqm2hsBhPAyBlGwAfuViTLYL8aYAVbh7wWOU
	6wBtH6r5URLAzk8XC8WSHHRSwiAoChYh2p9OEMUWva4XfA/6J78nOHUcXL4iIRKv
	/bhnS/AqWZg34kEE0uBlMK9uQESNThTrUDjLxBM21zEXQnAdX6JK0brAEAZyGx/7
	/xfivWWbXayfNE1wOR+CpcNpvT7hzVRP8Mpnj+Mzdy9hZCH5h0Yqm5KLIJsaej8P
	6CPmRX0QBIT6Hv3iADl/Rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745426013; x=
	1745512413; bh=eIwHjesGkNa7/Iw5XWSXmI+Z7/8YZCobAuZIgt3TFPs=; b=g
	oJTvfw3nhOEONSiUqZWIW4ENbFmc02OcWaAJ7Kl7/W+8yWNEIxdy6s1PwMN28NrD
	VzqcAbIIAI+9hv+B2/B0Ld9PxzOKtvkLskp90M+ZSpyGhLynR8X8qK8QgyuMSb/K
	eLFQIQKhW0EVw+X1008QZddld352X8f17/zkOzwJaUAVl/1OswzhxyFDsnQfAoTx
	H3XA/2P1HtK18NSUXDzZ7/i0iM8hi9BlM/LxzRyCyuUj7tGZHU6ljLA8yG7hFjEb
	wekIa8YMxqBufQiJCnZY4SWe4r5huw4yuJcW1NLaKWtbizmo7q5ZVlDX/Evmja22
	zrZd7/bggStbVjqQaR4yA==
X-ME-Sender: <xms:XRYJaEBkR5ZCEAKRPt2HS72ar59CZ0MWivKnN3lvQf6xHmVQ177EbA>
    <xme:XRYJaGhLbVN7oVHYWuCRy5dLxmeROPUiU2_s8EQVypigHwAJato0T-cwGth0Lsjn9
    N1SqmvGHXeNDpJUcoU>
X-ME-Received: <xmr:XRYJaHnjiGLVzQ3aVuuGSfzHXI_ZKdVt6WxIgAuJ9EfsocrfwvrFEoT07Lfwmp1f-BmwJZyq7kFwgaqCNdsi0z9V>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeejtdelucetufdoteggodetrf
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
X-ME-Proxy: <xmx:XRYJaKz8FtdLTlE-Jqq29MYmaPirB14RrM7dDL7X6XEuZuKaKBDcWg>
    <xmx:XRYJaJThn46TmQ8nDhX_Y4q32LQzSU1T7Aw72eENceIuUFdchcQ5Yw>
    <xmx:XRYJaFagFCwXYwhy94t1WiOmx7g69iRXjJpmjAEF1lZwP9Me_kSkbw>
    <xmx:XRYJaCQauyLKLvB289deuLQzvA8J4M5ZdPDC0d0yD3MebA4KRAaNQA>
    <xmx:XRYJaHZ82RLjW5LMIE-IUQrf-YckS-pur-R1kAEZsyB_AbMHRQQEcMLn>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Apr 2025 12:33:32 -0400 (EDT)
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
Subject: [PATCH v3 2/7] arm64: dts: renesas: r8a779a0: Add ISP core function block
Date: Wed, 23 Apr 2025 18:31:08 +0200
Message-ID: <20250423163113.2961049-3-niklas.soderlund+renesas@ragnatech.se>
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


