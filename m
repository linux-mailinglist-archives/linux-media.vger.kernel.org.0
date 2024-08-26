Return-Path: <linux-media+bounces-16829-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A66395F42D
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 16:44:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65A361C21D66
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 14:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81B518FC83;
	Mon, 26 Aug 2024 14:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="uzjVjyQl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="tUfJrHsg"
X-Original-To: linux-media@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBF11917E6;
	Mon, 26 Aug 2024 14:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724683478; cv=none; b=tmPYebHEzHzaM4X18+JLPI5FW+xoQ8XQ1KLHO0ceGVEzPCzw1QBb/HccJikAdpg3QgcllS/i+dcKWdEILKVXWxPPvb8bVYLoE5f62VbhWU/wnij99JK6IDtcyg4n02dKrjMn4HZkTbSI3XXWd0LLHWo8tE97YbJWPToHjVGOC0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724683478; c=relaxed/simple;
	bh=h3zBuH7cFf7KPUYiVtfF+R7nok7vhwlmcV4SgCXnoNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oj60YAHa3IA9O2iOTa/lU1CoDVzIRI9U7BFYXvHiRistIQgCv+XCh8mHtprL2WbFb2wKdx2sA/4qNYa5Lmim2qD7jqKFhilxlzQWwvdWk++j5o9xSdw62bykqcxa607I1BCJWTJK+FV2V+n6KvaTRATX8myIsc3Gl7AlIY9ZuDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=uzjVjyQl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=tUfJrHsg; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.nyi.internal [10.202.2.46])
	by mailfout.nyi.internal (Postfix) with ESMTP id 750B6138FF74;
	Mon, 26 Aug 2024 10:44:36 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 26 Aug 2024 10:44:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724683476;
	 x=1724769876; bh=aXHXlYrrWIk0p0HfqQdIzxND2XlGe4S2zSgOp1be3pA=; b=
	uzjVjyQlouG6rR1a3eOH/DYx2rBouGPZbPRQq6IJ6r571NlwlBtKPu40c6ZgvNhJ
	vjKvIbNoIFAgwn0bEoi4/Dujh4invFQhLOGV1KM1cmCW/ZgrFAtOTRGHglk4b1OG
	T/5PiFQvSN43qmUJVAz6o4P/j9nJLp2g9B2dYsZ54pbbaGUcZc2kzQI1RLyLoFmW
	EJEfi2JCLbKcVPBxawC2a7CgRAqRcdHTAE8i+ERmN6dkewhFN/xEDF33OL97NPSR
	09RUCuPRtqZDFeQBNuGrbquQ2hfcRL9UxYHEigNFmVGx6Mej6RPrjrWdgothHF86
	CWpTrfuePs5G4KcIARPgVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724683476; x=
	1724769876; bh=aXHXlYrrWIk0p0HfqQdIzxND2XlGe4S2zSgOp1be3pA=; b=t
	UfJrHsgLSIYegS8X9v6NF878ZEMGMQ9dYFQB9VMHERJsMj5rsKL/FV4otcuxT4/D
	8h7YwHpoGfPQ1r+p9uQ8BVn4Bbob5/+UbsmI6zAjRxCxA41s5wbx74IGSjFlgAan
	es7ThlYwQ+AU2bsUuDj4U/gGdmVoUnUcylTNoSaPknmfOvnZvyUlhIhYQBbJw8Rv
	V+odi6wRkpyAdwV51ji6tgpQ8d1yTAIehYOGiXiw4rvPAInm9tXBFiQFzl8EQta2
	DBFtSziD3ErvBiNZBGhP62/LoAwo2gqPWUltyRBspe4OaEIhTs31+LNv20CkDBWw
	RrUvIUwwTkg4VTRypl2ZA==
X-ME-Sender: <xms:1JTMZqn-41b2vhEz90Y-RRK7YQpN3-hDW29Pynr59DVu-bALATRrBQ>
    <xme:1JTMZh1goW9WU6QVhsIhb-5DMZokVLg4vLuh-G3ytvba4gS262sUmZmLzT7O4Yl0m
    6a2DnydXoXN7Ps4ZAs>
X-ME-Received: <xmr:1JTMZopSLDwMziU0jCGD3w17aFiTPHrPzAB2cB8gIv1IYn_vh_HoYsQFrx1dcqL6ji2oUD9caCr0HR4BftM1ArQhgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddvkedgjeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffle
    efgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtse
    hiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepkhhriiihshiithhofhdrkhhoiihlohifshhkihdoughtse
    hlihhnrghrohdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprh
    gtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdr
    ohhrgh
X-ME-Proxy: <xmx:1JTMZumMInkWmcx5Qhc9lGcmfnpP46YrtCXOkJa5vy3bzWA-IRbtOw>
    <xmx:1JTMZo0ZX8_FVfIMnNRJOgsG2wcFRn3jauWePD_hX083Dc-Xq-FPMg>
    <xmx:1JTMZlsrVREgPmDL_NcyeASIM7HeqzQFRHNwKx7N7u1ulwgTcNqKrQ>
    <xmx:1JTMZkXJuDqO9og1FdQC3U8oHnHfIpVW2MTaFSnz3gVe14dGm3gexQ>
    <xmx:1JTMZhspo2lMXjk8TMmjtWl2_ia8OvlgH8Qxeij_YMyDi4T7gjxT5LSa>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Aug 2024 10:44:35 -0400 (EDT)
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
Subject: [PATCH v2 3/6] arm64: dts: renesas: r8a779a0: Add family fallback for CSISP IP
Date: Mon, 26 Aug 2024 16:43:49 +0200
Message-ID: <20240826144352.3026980-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To make it easier to support new Gen4 SoCs add a family fallback
compatible similar to what was done for VIN on Gen4.

There is no functional change, but the addition of the family fallback
in the bindings produces warnings for V3U for DTS checks if they are not
added.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- New in v2.
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index bf23cc1dc7be..1f4ab27acc33 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -2501,7 +2501,8 @@ du_out_dsi1: endpoint {
 		};
 
 		isp0: isp@fed00000 {
-			compatible = "renesas,r8a779a0-isp";
+			compatible = "renesas,r8a779a0-isp",
+				     "renesas,rcar-gen4-isp";
 			reg = <0 0xfed00000 0 0x10000>;
 			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 612>;
@@ -2584,7 +2585,8 @@ isp0vin07: endpoint {
 		};
 
 		isp1: isp@fed20000 {
-			compatible = "renesas,r8a779a0-isp";
+			compatible = "renesas,r8a779a0-isp",
+				     "renesas,rcar-gen4-isp";
 			reg = <0 0xfed20000 0 0x10000>;
 			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 613>;
@@ -2667,7 +2669,8 @@ isp1vin15: endpoint {
 		};
 
 		isp2: isp@fed30000 {
-			compatible = "renesas,r8a779a0-isp";
+			compatible = "renesas,r8a779a0-isp",
+				     "renesas,rcar-gen4-isp";
 			reg = <0 0xfed30000 0 0x10000>;
 			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 614>;
@@ -2750,7 +2753,8 @@ isp2vin23: endpoint {
 		};
 
 		isp3: isp@fed40000 {
-			compatible = "renesas,r8a779a0-isp";
+			compatible = "renesas,r8a779a0-isp",
+				     "renesas,rcar-gen4-isp";
 			reg = <0 0xfed40000 0 0x10000>;
 			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 615>;
-- 
2.45.2


