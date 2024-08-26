Return-Path: <linux-media+bounces-16832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA6795F43B
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 16:45:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53BEE282ACF
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 14:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF7C9193092;
	Mon, 26 Aug 2024 14:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="LmNAHm3+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="M0WxmdTD"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C200193089;
	Mon, 26 Aug 2024 14:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724683485; cv=none; b=RDanBT4/OcgHRweW/RoB80/JSHoVTp/09OpibaiCWkEzAzUDQLBXz23QG/w8l45eUHpSKvObYZrku1Q2izK43pKGBHrL7996Rvdlc8GjIDMYbG6rCgF9SXoAZee0q0jXjstW6Ak39pqsLkI7nClKLsnWU0FeKCgmnIsF+lTCSHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724683485; c=relaxed/simple;
	bh=x3pIx0tZnsNu2X1VQ2Kjatp0BgLSNWhWPPMmuyJhDHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NpDVjWPBBXF59hnny3ITlflzy2VxFYXa86UdSmbRdzWTUGWA2CewjZSFRkPtM/Pr6QBtdD6ig6YTQHgQk9lUGVeaUfq8+HFY5amSYHi8wd/WETiD29zMjSO6rzHN+bBONMdP7awZflkP7AP84/rpvoLzIfckqcCvZd72+6OyUuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=LmNAHm3+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=M0WxmdTD; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.nyi.internal [10.202.2.48])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 9E0741151B1C;
	Mon, 26 Aug 2024 10:44:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Mon, 26 Aug 2024 10:44:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724683482;
	 x=1724769882; bh=qv8Z4YHfG+TYcyFRDWgQy0o9iy3nI3T0/Vei06MB6HU=; b=
	LmNAHm3+yjE4KlCp3h4sqe3oq6yqAV6w015hr52qpkkV2Q6Mc9Ho3Kmt7nb5zO2a
	swi5xPpkOjOFAM18A0lxsv+MJ2WMclp8XdajfkvTUGGhA7ZhJ6Xv7u7DsEK+lTan
	kAYY8Gt8dGgSn7K+snxFUN3m8E43ih2R4rNPDUaywfGjDCJU1DT2fsk5Gznh97eb
	mZximaHtQUvHpMwdeAnIKbd0R6TvibkxRLtJa44sFA8+ejN1DgCRlr6/9jkd66Gf
	V3NCYNebKXDVlSIPE0/OnKhNRmtXbkbzdi9to1CLyIxOuPvD9gGfEuSrW0za+Zb3
	Nx8EnHFvDBOqUAhicswdEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724683482; x=
	1724769882; bh=qv8Z4YHfG+TYcyFRDWgQy0o9iy3nI3T0/Vei06MB6HU=; b=M
	0WxmdTDYzgTqkXEv/qW6mmSF4q+3Ldp8tTcvoFk/kOpBZmVHNgsgCj2+ihNH4JaZ
	GpYEN9YoOByfnCMNgI+OVlECFWCWZIRuKaiN92h2qxK4t6TQx8MrAJF3WJxJ9Bl8
	h9Bv7szSwsBPIevIy2Q2r+/6TQVHhiSCeCP+DlUi19GwMS4MvCg5ucItlX1mDJSF
	0xv1DQES6vFhlDE6YUPZ7eHv7cw0R/pgzd+c6+EGXSPrAdCWrsijoFaOlACbR8Ue
	VMQIFB5xnTJUBEVF7dL+e9Q4TiWlRAzQdv5GnZ1sZmzYVtJhGTQEuRtBWZe1eirU
	oopRoEovzXbOf5KFzwW/Q==
X-ME-Sender: <xms:2pTMZpOUOCF2ReZmeEglt4jp63PIhZ4gORfWgjLGV-4JWsCRAWfgFQ>
    <xme:2pTMZr9wDbRi0hioXVLiLoiHZW2y4s26bjKytzB_Nk8Dlksn9hTK6WPzI1iUk9zK1
    dQ6wysBzN4sOXtKuvI>
X-ME-Received: <xmr:2pTMZoTzeEYrvG6ATYZhzCxQrl0FiYQXihEqXrxFBMQKlvj6qfcBlpK0nu6Mm6swtkyWAP2LH_UQIs_SDeHInH3J2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddvkedgjeekucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:2pTMZluz2-YyR0X-Fq9OkhZ9jj1LELEa1qBwPP58V7y9aCzueaYS9g>
    <xmx:2pTMZhfk1iwA7B9HBNgH5EXmT1ZSccdWf5Q7o8PoeP5hYdvZACLsSw>
    <xmx:2pTMZh1khuDPOJYIp7xjhfPGm6GYfAHNqD8Kd00pEx4JBI8ANJn0kQ>
    <xmx:2pTMZt8_hDoGxxiQvJKiWJZoZlZeTZ7GXYgQRKY3-iICYFjQRrYonw>
    <xmx:2pTMZiWqKpufgHXOJ7LK3aFU2FmZ-GqpyNnxT2ZD1JRrrxGJgfOwsPeQ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Aug 2024 10:44:41 -0400 (EDT)
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
Subject: [PATCH v2 6/6] arm64: dts: renesas: r8a779h0: Add family fallback for CSISP IP
Date: Mon, 26 Aug 2024 16:43:52 +0200
Message-ID: <20240826144352.3026980-7-niklas.soderlund+renesas@ragnatech.se>
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

The usage of the V4M CSISP bindings where merged before the bindings
where approved. At that time the family fallback compatible where not
part of the bindings, add them.

Fixes: 2bb78d9fb7c9 ("arm64: dts: renesas: r8a779h0: Add video capture nodes")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- New in v2.
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 28ca59e735e5..12d8be3fd579 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -1829,7 +1829,8 @@ csi41isp1: endpoint {
 		};
 
 		isp0: isp@fed00000 {
-			compatible = "renesas,r8a779h0-isp";
+			compatible = "renesas,r8a779h0-isp",
+				     "renesas,rcar-gen4-isp";
 			reg = <0 0xfed00000 0 0x10000>;
 			interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&cpg CPG_MOD 612>;
@@ -1912,7 +1913,8 @@ isp0vin07: endpoint {
 		};
 
 		isp1: isp@fed20000 {
-			compatible = "renesas,r8a779h0-isp";
+			compatible = "renesas,r8a779h0-isp",
+				     "renesas,rcar-gen4-isp";
 			reg = <0 0xfed20000 0 0x10000>;
 			interrupts = <GIC_SPI 474 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&cpg CPG_MOD 613>;
-- 
2.45.2


