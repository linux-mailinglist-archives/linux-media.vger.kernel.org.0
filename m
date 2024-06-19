Return-Path: <linux-media+bounces-13739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F3090F254
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 17:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFCE81F238D0
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 15:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D2121345;
	Wed, 19 Jun 2024 15:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="N7Dsri06";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oIuFizL1"
X-Original-To: linux-media@vger.kernel.org
Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C6B150994;
	Wed, 19 Jun 2024 15:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718811397; cv=none; b=rv/mhqBbEKCTK9XYbSA6nPkOkCKuX41VBRrSDNUpUahyXV4I5JDq49MZoOnST8JSs6bqgSCZsAtV4bBf0+oXqo9IdB08t8IldnnqOwhQV9iN5q4uN+g2dCpt6tFGSIL6y3xwaQykMMkzOUvBEgF+TLHAC7kN8JcCHIg6SfbU9Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718811397; c=relaxed/simple;
	bh=sjmkIm1zsrC10eD2advKHDcjbqcq5pzS78G2inpOkvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WIXj8cCnsM+dLh88gQv2uW/oJHsoYhsBAmCxTmWU8kwHFu/Ningj+q4HbnpYsUAjuNa7/cJsPXjdU6Me9aVy+vyOK7anhzgsIB/JG5Q1oZAUGx2u++Fz7VMDOMpXOJwM4JAZ+deoWYpxPOWv5H0EFef+5IC87pKGji+e4qXZvG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=N7Dsri06; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oIuFizL1; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 4B23E138011B;
	Wed, 19 Jun 2024 11:36:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 19 Jun 2024 11:36:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718811394;
	 x=1718897794; bh=mrgUJ9PZVo0mdAfnL1MC+I4cutj4Wk6Q3wuGf6mCjx0=; b=
	N7Dsri06/yLtXhvI3zFp7tEJ4tDSQrAR7GVhc7m0IFtfBYgZe6qPcLnZLxbDB7SR
	uxsfxDL83vkrWEVOuKZ2z/q7pn3fudFyLXd5mxBP1Hjl5pzUcnq2Z7OdEwLf5P9B
	WspR/sbH/izWhu1dnFxhigR9bFFWlWCuETzAXaM2DTOms99Yu9yA+jol1dyByC9C
	Fl8qzeJcUdh5OlHhl4MbveCylm9pcv9B4RuXHqo6hQ8Ii8xf+mpKiyluKdkXdweF
	d+ytI+a1TeDAbkgFyFMY5X+Uuwdv3u5QSrOYpy/b6txetQUajxk8mmuB2nBMJuy5
	4LIl6JQfNF20ptSdqjfBHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718811394; x=
	1718897794; bh=mrgUJ9PZVo0mdAfnL1MC+I4cutj4Wk6Q3wuGf6mCjx0=; b=o
	IuFizL1Op29pgYXfhxv0+Tcm/pSo/4+vGDYIbl5hBbGwrmg+k1SeWHcxQUhiJxJM
	VtsWPITyNXycCzOc1JpXWDlkEDUwqrcf5wh6pAeW6DhH3qu3byHTviK2OWLppXZd
	oYWkMX24NCeJUR/u7wvKMGF4K3CkiaCxfxdVNDF+fIRNxhoMULYdg7JptxlSOVFC
	BDP0VY/+B3yfadbsJdGs4jweKIZErOXbe9bfvn8UuYbiPeRrsdKMn1ofy2CLSNVa
	WPuJlebFhEaWFUrotFXLaPrdFrdXX8wRParn8gSDr6LZybYDTswDBUCczOAbc/HE
	LuvdrVF/FjIc0XFn6uW1w==
X-ME-Sender: <xms:AvtyZonZF2a3vYzwXK6XyRzu-rwqRg30rrEsIVYMQ0lYCuth3ns4WA>
    <xme:AvtyZn3R2oXPK9E8hBO1GXr9HT_GvtSd4hnpyZGgSTbHTq06DdTH-7iS12Vz4NpQ1
    Efk7knjROFr9x3ovuc>
X-ME-Received: <xmr:AvtyZmrY_RL4c74hnWjq0JH02RrkFBTYr4oyGlDUT_9lBqN1K6i7o5zGO6xgNkBySUTe5Ud83i5lctloY1sL3jl93A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeeftddgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueev
    uedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:AvtyZknNH9l7A99cpRUb0vSK1XT5my0kezN1RHMGST-GG5C5lsy9Ow>
    <xmx:AvtyZm3Cic51f_6wawowR6rhk92h-LKQphvdKJ48JgMSfuHBQEjm2A>
    <xmx:AvtyZrtSuPh4P4_rBGVOlkykPCzBquzTJY8myMJ5l3EOdMGg1wHXFA>
    <xmx:AvtyZiXN0GGIW-_AOiyQd1R2BEfeaasrKVuuhZoHAxkR-SNpoYqR_w>
    <xmx:AvtyZjuKxHIeAuGafwf5EoGYGpNgFNVM7YBeIDQoStmxddLUoUl3SBts>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Jun 2024 11:36:33 -0400 (EDT)
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
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v3 2/2] media: rcar-vin: Add support for R-Car V4M
Date: Wed, 19 Jun 2024 17:35:59 +0200
Message-ID: <20240619153559.1647957-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619153559.1647957-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240619153559.1647957-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for R-Car V4M. The V4M is similar to the other Gen4 SoC
supported V4H, and uses the ISP Channel Selector as its only possible
video input source.

The datasheet for the two SoCs have small nuances around the Pre-Clip
registers ELPrC and EPPrC in three use-cases, interlaced images,
embedded data and RAW8 input. On V4H the values written to the registers
are based on odd numbers while on V4M they are even numbers, based on
the input image size.

No board that uses these SoCs which also have the external peripherals
to test these nuances exists. Most likely this is an issue in the
datasheet, but to make this easy to address in the future do not add a
common Gen4 fallback compatible. Instead uses SoC specific compatibles
for both SoCs. This is what was done for Gen3 SoCs, which also had
similar nuances in the register documentation.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
* Changes since v2
- Extend commit message to explain why SoC specific compatibles are use
  in the driver instead of adding a new Gen4 fallback to cover both V4H
  and V4M.
- Add review tags.

* Changes since v1
- Create a shared Gen4 info strucutre.
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 809c3a38cc4a..6992b61f0d48 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1283,7 +1283,7 @@ static const struct rvin_info rcar_info_r8a779a0 = {
 	.max_height = 4096,
 };
 
-static const struct rvin_info rcar_info_r8a779g0 = {
+static const struct rvin_info rcar_info_gen4 = {
 	.model = RCAR_GEN3,
 	.use_mc = true,
 	.use_isp = true,
@@ -1359,7 +1359,11 @@ static const struct of_device_id rvin_of_id_table[] = {
 	},
 	{
 		.compatible = "renesas,vin-r8a779g0",
-		.data = &rcar_info_r8a779g0,
+		.data = &rcar_info_gen4,
+	},
+	{
+		.compatible = "renesas,vin-r8a779h0",
+		.data = &rcar_info_gen4,
 	},
 	{ /* Sentinel */ },
 };
-- 
2.45.2


