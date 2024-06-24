Return-Path: <linux-media+bounces-14066-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0F391504E
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 16:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73AF51F210FE
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 14:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E2419B3EF;
	Mon, 24 Jun 2024 14:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="j5+ELjPf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JRJfpcwC"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149FB19AD8D;
	Mon, 24 Jun 2024 14:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719240210; cv=none; b=d/wkDTlSzamz8YCRsuy3R5i/GFhbVsQXgSMwAfSuA6zrBe1JwcnDS00npDIRiUj90CAm8spWuenxWQc306JA4PzFYGOV5jdPraKi+v4AVHOrHVloGaan8OCi2mU/+w/ZTNgU75TZHV+IxXUVEsQy+wo9Or+ZwXfLvw7Rz0XyaFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719240210; c=relaxed/simple;
	bh=QcFTNvoBnUhRHNkgHmUVK6szgfzBSNFDDv5JCR5TBiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BpUhCOC60QI8a/QnyayGsad3dGiQc3ijxDKONYJvpWtDOk90BfGWDZ2a3QK0mzXFVT+uDCxxo1Ud5QmZ3tY7bI5lELUAr9SGtyh6rbxmQhZN4YlB2PSxhZMnhYyRwyBzM0jp5xm5l0ouDzZ91rnJ7eEIUsvNOqdfbhJsjfRTgik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=j5+ELjPf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JRJfpcwC; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 349081140098;
	Mon, 24 Jun 2024 10:43:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 24 Jun 2024 10:43:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1719240208;
	 x=1719326608; bh=GKA4K3BwBlaqY+V6/TFpvwChJPZ8Lrt8EZQvqccMi4c=; b=
	j5+ELjPffZXTVyDqrTbhGaaT0CUSrGSN6gErnAUvuO1XJAWjtt3gBH2Nx41XT0qA
	or74IxcLR8mvdVJhALAF6bSgpvQvyTzWGc+8q+kUi76eP+N0pI+I7uhVueQV2Jsh
	5VU9zgR+mplUCVXmpsxuiA3NQ/yJFSQZtJLQQvYCMX1YtJMsE0Jcp1v+j2ZvBjP/
	NyMNpeFi16jvsXu4Xp+/hj44/fvDmqzJtiNlMPlk7cFsQ/eXEWmyJ5V7MVSzaVRw
	C2qI88awOY7+LFYlPqTsL0scTqTu3HW4aDveolZ54Q3bNuCeyPx6/dky4eXRbRyt
	QmgkBM2pq/nanPZ2goit2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719240208; x=
	1719326608; bh=GKA4K3BwBlaqY+V6/TFpvwChJPZ8Lrt8EZQvqccMi4c=; b=J
	RJfpcwCNgXNG84BYNUcdzLw143F/VS8GbROdgC/3hM9v7HKnqmSx40Hxf8UHab1o
	4nIoi1rZ0LUAws2ATVYhqUCoWeWSLEMPTK8N/zJAPfCucsElwVu55tsZ4mkrn4yM
	yrqKxtS1BBwFETmpylgf7YahLlF60iWrDIEaIIZ0tLn6tMKbDFiMR2oyCEabYL4A
	kk19uva4320v6KTPi0ZVVlYbIGfLXUTVv10mRbVkovtHSAWnTfXkIqewGPRWJe25
	C1EyDBhHtRt80U9dRvZC2tDKyfhWXJvZphhB3X2XdaM3hGWjGshYjU33vrstzSgm
	sEZj0NVnlEpoZcpjeaGeQ==
X-ME-Sender: <xms:D4Z5Zg1BM-Bq-g3szxRktfs06HEYztbE7yo1vbLwEJJeiBztA88Lrg>
    <xme:D4Z5ZrF8Nghxa9Q23Hd228p-6y4i21aiRQ-OO-dCPieMzLf_DnN1d3PFPKnWOjVsT
    yANEf57B3vlQOfq1P0>
X-ME-Received: <xmr:D4Z5Zo51xtv9_ZB7Xsquwvg4exmRJHg6u5OYbyTqQbJQwoU7E3kub9rrfHHndWFdGMRp9IAYHGC-EXLY1ntNCjnTSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeeguddgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueev
    uedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:EIZ5Zp0N6ah2rXfpJgp3CJFKsCaBsY1DRai_P7EnTzf0LuE2bDDadg>
    <xmx:EIZ5ZjGedTxxl-vhL_xhRSS0Yqx48-hWLIJhLgRuRh1zdA8jFLbaHQ>
    <xmx:EIZ5Zi_9Rj5BeTy9O1S9wB_jguvLM1VIISyw30_2fDy8HjqVYR7gvA>
    <xmx:EIZ5ZomYo-dIF85ZcaXFUcdren2yCpcG7y6sHUbQ3Tt8_DAoXd6-rg>
    <xmx:EIZ5Zr8etOMon5z3h2MyHoreiv99R_jS0X5N2lcCqAvhBjNfygOew975>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Jun 2024 10:43:27 -0400 (EDT)
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
Subject: [PATCH v4 3/5] media: rcar-vin: Add family compatible for R-Car Gen4 family
Date: Mon, 24 Jun 2024 16:41:06 +0200
Message-ID: <20240624144108.1771189-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624144108.1771189-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240624144108.1771189-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the Gen4 family compatible. This will be used instead of a SoC
specific compatible for the new Gen4 SoC V4M being added. As the first
Gen4 board V4H had already been added prior to the Gen4 family fallback
was added this need to be keep for backward compatibility.

While at it reduce the info structure bloat and reuse the Gen4 info
structure for V3U (R8A779A0), which is the last Gen3 board but that had
a completely new video capture design that is compatible with Gen4 VIN.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v3
- Reworked to deal with a Gen4 family compatible instead of a V4M SoC
  specific one.
- Dropped review tags.

* Changes since v2
- Extend commit message to explain why SoC specific compatibles are use
  in the driver instead of adding a new Gen4 fallback to cover both V4H
  and V4M.
- Add review tags.

* Changes since v1
- Create a shared Gen4 info strucutre.
---
 .../platform/renesas/rcar-vin/rcar-core.c     | 23 +++++++++----------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 809c3a38cc4a..a8b6895de66d 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1274,16 +1274,7 @@ static const struct rvin_info rcar_info_r8a77995 = {
 	.scaler = rvin_scaler_gen3,
 };
 
-static const struct rvin_info rcar_info_r8a779a0 = {
-	.model = RCAR_GEN3,
-	.use_mc = true,
-	.use_isp = true,
-	.nv12 = true,
-	.max_width = 4096,
-	.max_height = 4096,
-};
-
-static const struct rvin_info rcar_info_r8a779g0 = {
+static const struct rvin_info rcar_info_gen4 = {
 	.model = RCAR_GEN3,
 	.use_mc = true,
 	.use_isp = true,
@@ -1355,11 +1346,19 @@ static const struct of_device_id rvin_of_id_table[] = {
 	},
 	{
 		.compatible = "renesas,vin-r8a779a0",
-		.data = &rcar_info_r8a779a0,
+		.data = &rcar_info_gen4,
 	},
 	{
+		/*
+		 * Needed for compatibility with old DTS files as it was added
+		 * before the Gen4 family compatible.
+		 */
 		.compatible = "renesas,vin-r8a779g0",
-		.data = &rcar_info_r8a779g0,
+		.data = &rcar_info_gen4,
+	},
+	{
+		.compatible = "renesas,rcar-gen4-vin",
+		.data = &rcar_info_gen4,
 	},
 	{ /* Sentinel */ },
 };
-- 
2.45.2


