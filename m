Return-Path: <linux-media+bounces-16828-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 216F895F42C
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 16:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45BA51C21E4F
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 14:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C99192599;
	Mon, 26 Aug 2024 14:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="MTFDR2Ga";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ofaSXFC4"
X-Original-To: linux-media@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5834818FC83;
	Mon, 26 Aug 2024 14:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724683478; cv=none; b=RdWjDkUUIDdPndeVqHCVVfB8M7sO4ekMQRJIJ+sqQW7wt06xTePCdvJvofdXVwX9uV0B8hIDz2L5+GVqkPHsfnOWN+AOO0yyOMU40gmnv+CTgZQnPQGguwelSCKDHUUfd+ljwjJ+YuonA9+kO2NBpT0aA9Z6LKzlmp4W+MnN8N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724683478; c=relaxed/simple;
	bh=xmYzx5VtDeatGchJ5T+SctF9H8ZhBVwhhqEoxa2AY2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QseF38zTrcAS4+JrlR+wnmMnwmy0tcit8nQUTaDUETKMOWCLkohjK2I64EZad36nxwiJ2PlzCYjI5Dfghg2wYRM+oJ0alB9ioccYs5C3Dq6StohLa/fjwqQ/xsQLA1cDyjxz5Apw1IEKYHdEtF4JIszB5DwFdL3r/URAjMgm/a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=MTFDR2Ga; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ofaSXFC4; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 7722F138FF67;
	Mon, 26 Aug 2024 10:44:34 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 26 Aug 2024 10:44:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724683474;
	 x=1724769874; bh=FNlKDsgiyJvfuAOhgquaBtEXbykoWDJmot1uG9QHA/s=; b=
	MTFDR2GaIMHEz84n453DMS9Iv64gaG14PpfFKEoSPMch+dwrdidxv2ALiD1ySsmN
	epIR+27YRa97i08r2NVapB/e2j4DFEXu6vb353bJKh6BKDDxCJjj+widt3n+hymw
	jd2wDGsA+2KqmuDO58xNFemTV5XqE6Q8AIrute3yU4nyCmHRTzt1cvxewzBTJlUa
	XUfhMGSYnownm+8IDZTPSGyHgZ2soT95eZ2w+Qw8EILSzGqDw8bbdMfUBtC5S2N/
	Da1/vut3OY5EunkcGfHFgIIw60A+TRJ2f481CQtDuIffCQ21AdpIK62pJ4v2708d
	sxL9+dpT044Qyfxqk/FR7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724683474; x=
	1724769874; bh=FNlKDsgiyJvfuAOhgquaBtEXbykoWDJmot1uG9QHA/s=; b=o
	faSXFC4FnGHW/ATzCdtv+v0sw9+sVss1YrYAIx/D3w7f3HMTDyNO3/oE56KdHr64
	QaqZqDDxB9RQqI+gkrZ7ICD8UjLWVmMh6l2B8xcmrvQnGiIKEoHs9mK7qe9mE4E5
	QpceOI2IxWPqZ3vvPLswQ6sFQ8S9G0U8kzGqkaE9O0V5bX7IGbtx9IAE1+cQOHY8
	PKpzfWfRR8WsrmA8UfF/WqpaM4WrxAzFalZUlzwA5kD/D5uLOjUdF8dziSJaU9QV
	+SSXn5YS5OMpWPqY7Fe3N0VE7zgf+3BqgQzzIQKJQT3q9/jOwJY++J53LotH8H71
	yvMERVdhF+TT7iErNp/cw==
X-ME-Sender: <xms:0pTMZhAdUkjrSYamet9qWWzDdCkKtHUdPxDmB8mjfWbQjfDnSaDqxQ>
    <xme:0pTMZvjbyIN4XW13z3pBM_1cEWyMOKDlWq6Pbp6OAcLqQ0hLSIm5bEz9L98ay_FV1
    cDuPLARz_ke-jGfuJU>
X-ME-Received: <xmr:0pTMZsnQJmKo4Ur6Hih931aiZSkf75C7TwmbxlvoPvdf-Eio64iJ7v1c2lHs_TAz7PpSWuxN4uin3xjLz8eyGsWOKA>
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
X-ME-Proxy: <xmx:0pTMZrznSrZVZUdjvYAmblC0MLEje8RmVAqU5ZvrX5-syISaeOIj9Q>
    <xmx:0pTMZmRXq89-3ZaquANNra_xpoV6vgGoFGm_LG8jgXjIZbyzdliXhw>
    <xmx:0pTMZuapjiVYsD_HT3i48pkyVPMq9LVd-l1ydwJ_OroAjH1jqi3sZA>
    <xmx:0pTMZnSMCLHbLemy-063J3ncfnpq-bdgMMX2TBueN0xvg76XGdseNQ>
    <xmx:0pTMZrKK5rrf9DNUlwZvRBRO8lNx8WRHFIbGHpkyuPP3yDRM7Bbyxo0k>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Aug 2024 10:44:33 -0400 (EDT)
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
Subject: [PATCH v2 2/6] arm64: dts: renesas: r8a779g0: Add family fallback for CSISP IP
Date: Mon, 26 Aug 2024 16:43:48 +0200
Message-ID: <20240826144352.3026980-3-niklas.soderlund+renesas@ragnatech.se>
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
in the bindings produces warnings for V4H for DTS checks if they are not
added.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- New in v2.
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index ac3d4062c2fa..ded805f0e633 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -2075,7 +2075,8 @@ du_out_dsi1: endpoint {
 		};
 
 		isp0: isp@fed00000 {
-			compatible = "renesas,r8a779g0-isp";
+			compatible = "renesas,r8a779g0-isp",
+				     "renesas,rcar-gen4-isp";
 			reg = <0 0xfed00000 0 0x10000>;
 			interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&cpg CPG_MOD 612>;
@@ -2158,7 +2159,8 @@ isp0vin07: endpoint {
 		};
 
 		isp1: isp@fed20000 {
-			compatible = "renesas,r8a779g0-isp";
+			compatible = "renesas,r8a779g0-isp",
+				     "renesas,rcar-gen4-isp";
 			reg = <0 0xfed20000 0 0x10000>;
 			interrupts = <GIC_SPI 474 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&cpg CPG_MOD 613>;
-- 
2.45.2


