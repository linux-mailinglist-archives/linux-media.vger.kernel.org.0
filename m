Return-Path: <linux-media+bounces-11943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B3E8D01A2
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 15:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49799290985
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 13:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3BA515ECFD;
	Mon, 27 May 2024 13:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="rjc1bziL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gBV2zdjk"
X-Original-To: linux-media@vger.kernel.org
Received: from wfout6-smtp.messagingengine.com (wfout6-smtp.messagingengine.com [64.147.123.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6417E15F416;
	Mon, 27 May 2024 13:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816763; cv=none; b=BjNkguTWqoSxun3pl2D435oFKjwzxY/YxSq7ncrbs5HINEtxy67YKGB4Xw7E2MYKaaKqBSIXlk0VK3zpGwC0VIvKe30LiWVQOn+SDcrpBCav0XFLElFXV/P/8XOJelM1HurpD+qP+donWwpfyJ1ZyA21rP84X4igyglUL6TwHi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816763; c=relaxed/simple;
	bh=qVkTmP7bQnYIRaR5/MHlXhoTsZNoIzAsKDT6o8PbYho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=beg4/pn9WUORFVT47PMhkz6M4dF9RweL5n3PLqW5SczjE2RN2WFvQ5jiiQPtMp9FHzwAJwwHZgWc5M/0NsC9OafH8STjAU89+0mxpwApcPUeIDKTk9Cwy9mtOdj78j8nr8VdY845aAQomciuVQxT7rGgq8Uza26tDiV4lslR8LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=rjc1bziL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gBV2zdjk; arc=none smtp.client-ip=64.147.123.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.west.internal (Postfix) with ESMTP id 6EC111C000CD;
	Mon, 27 May 2024 09:32:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Mon, 27 May 2024 09:32:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1716816760;
	 x=1716903160; bh=8N1+W8d7rjdLSoykSwGNaIORjBn/+Ek/uP16hP0M3cA=; b=
	rjc1bziLKZvNYWXsYtHzUplmmJBryMndCMv625Z1SwV7iMbLbvhYn9KDE1/q3myS
	v9abbTf8uhzzGl0EGB2obkmOUqznSJyyJgwdsaJvrG3U/MhoyFn40N/9CHOiPumj
	tshJRGSTurpMHGC5pzk4AvBPsYhMlagzGcozv5lp81moxwAnhh8+65JHN7Iy+2xA
	zx2GIPCcxy8HN0KLxYGWxr4goUsg0NLs1edNcgwHl6+B4TotW1phw9VMS7alwwBX
	FdEsJ/OZ+ZwfPNb0W5G3zNImccorwXCHPIfiRq/XF0BgbGO21dc4CbyudDJoQXEY
	Nzcn/a4qlUd2h3F2Orh9ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716816760; x=
	1716903160; bh=8N1+W8d7rjdLSoykSwGNaIORjBn/+Ek/uP16hP0M3cA=; b=g
	BV2zdjk8Ue8yq46dHqIg+AM4V+sX4iMg2GTa38eNX134VY3h9XqqVEApVaQv76s1
	gNmGgGeKPPmuiOJfEb0HbHDCWOV3g3aPN9lknk6fLOmJBcohMd8jUV1cDkDP6wYV
	DXrmuuDSBIyUlNefOIeYR0ApDgyNVkmeBLQoQeiDvphiS8In89fireMXwVrNUv5m
	tc99WVNrbpT1fpsQN006FOanux8touU+QqybMBshsDFYuGOanEy6o7pclmmFK+2Q
	IR7OAtxM2Fg7h76U9sJFM2PbptB/hJafiXxoV9CTuBGDmgb7U0q/n9fD8rc1TDFg
	zva4kkc2PpIC5lI/vmBbw==
X-ME-Sender: <xms:d4tUZi3LrxHE7wvRneFLDfVvY835dbfDnjSVJ1HCUxRG20VRapUocw>
    <xme:d4tUZlEM1hOtAgfBq9G8hO5kqldKU8FL-i4DcebnKOSma1Z9DwkNHEjfCExZ-dNVI
    kyAWw1aAPJlZf6_Rio>
X-ME-Received: <xmr:d4tUZq5cQFFiUDc4V1bceaG7r6qgsam0EDIoJNX3oQpNeWoHP4IwWCTIueD1VVkmp3PlZI0oLeNJwWQukNXJxszp91etZOTKuGrR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueev
    uedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:d4tUZj029wRQE2sXonvNEKPmS5V3Ws3Ie7Og1oTcMW_Dgbt1LH__JA>
    <xmx:d4tUZlGqfFosL5nwoLMjgjBfP1qdh1zb6ItMSNJjtcUI7ID1YNnh_A>
    <xmx:d4tUZs_mq0kyHY5Rb_L-a9138Xo7sV7C29IJclaFSroNcYTh_mGgaQ>
    <xmx:d4tUZqnRAItCxsahKAhIkhnsTyGjsECP_rYteXOh7e2y6qGaEq-sMA>
    <xmx:eItUZuNiUv4QnQ4zIbvtQRWqI7wrnqB1liKS2_JOup-DKpP6kaDAAw_M>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 May 2024 09:32:38 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/7] media: rcar-csi2: Allow writing any code and data value to PHTW
Date: Mon, 27 May 2024 15:32:16 +0200
Message-ID: <20240527133221.1688830-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240527133221.1688830-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240527133221.1688830-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The helper to write an array of code and data values to the PHY Test
Interface Write Register (PHTW) register uses the case where both code
and data are zero as an exit condition. This prevents writing data = 0
and code = 0 to the register.

Up until now this has been OK as no such combination where needed, and
it was a convenient exit condition. In future writing data = 0 and code
= 0 to the PHTW register will be needed.

Avoid using an exit condition when writing an array of PHTW values and
instead pass the length of the array to the helper. This allows any
combination of code and data to be written.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-csi2.c | 29 ++++++++--------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 6cc128990140..c02e1ec6600d 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1447,13 +1447,13 @@ static int rcsi2_phtw_write(struct rcar_csi2 *priv, u8 data, u8 code)
 }
 
 static int rcsi2_phtw_write_array(struct rcar_csi2 *priv,
-				  const struct phtw_value *values)
+				  const struct phtw_value *values,
+				  unsigned int size)
 {
-	const struct phtw_value *value;
 	int ret;
 
-	for (value = values; value->data || value->code; value++) {
-		ret = rcsi2_phtw_write(priv, value->data, value->code);
+	for (unsigned int i = 0; i < size; i++) {
+		ret = rcsi2_phtw_write(priv, values[i].data, values[i].code);
 		if (ret)
 			return ret;
 	}
@@ -1494,7 +1494,6 @@ static int __rcsi2_init_phtw_h3_v3h_m3n(struct rcar_csi2 *priv,
 		{ .data = 0x11, .code = 0xe4 },
 		{ .data = 0x01, .code = 0xe5 },
 		{ .data = 0x10, .code = 0x04 },
-		{ /* sentinel */ },
 	};
 
 	static const struct phtw_value step2[] = {
@@ -1503,12 +1502,11 @@ static int __rcsi2_init_phtw_h3_v3h_m3n(struct rcar_csi2 *priv,
 		{ .data = 0x4b, .code = 0xac },
 		{ .data = 0x03, .code = 0x00 },
 		{ .data = 0x80, .code = 0x07 },
-		{ /* sentinel */ },
 	};
 
 	int ret;
 
-	ret = rcsi2_phtw_write_array(priv, step1);
+	ret = rcsi2_phtw_write_array(priv, step1, ARRAY_SIZE(step1));
 	if (ret)
 		return ret;
 
@@ -1523,7 +1521,7 @@ static int __rcsi2_init_phtw_h3_v3h_m3n(struct rcar_csi2 *priv,
 			return ret;
 	}
 
-	return rcsi2_phtw_write_array(priv, step2);
+	return rcsi2_phtw_write_array(priv, step2, ARRAY_SIZE(step2));
 }
 
 static int rcsi2_init_phtw_h3_v3h_m3n(struct rcar_csi2 *priv, unsigned int mbps)
@@ -1549,10 +1547,9 @@ static int rcsi2_phy_post_init_v3m_e3(struct rcar_csi2 *priv)
 		{ .data = 0xee, .code = 0x54 },
 		{ .data = 0xee, .code = 0x84 },
 		{ .data = 0xee, .code = 0x94 },
-		{ /* sentinel */ },
 	};
 
-	return rcsi2_phtw_write_array(priv, step1);
+	return rcsi2_phtw_write_array(priv, step1, ARRAY_SIZE(step1));
 }
 
 static int rcsi2_init_phtw_v3u(struct rcar_csi2 *priv,
@@ -1561,20 +1558,17 @@ static int rcsi2_init_phtw_v3u(struct rcar_csi2 *priv,
 	/* In case of 1500Mbps or less */
 	static const struct phtw_value step1[] = {
 		{ .data = 0xcc, .code = 0xe2 },
-		{ /* sentinel */ },
 	};
 
 	static const struct phtw_value step2[] = {
 		{ .data = 0x01, .code = 0xe3 },
 		{ .data = 0x11, .code = 0xe4 },
 		{ .data = 0x01, .code = 0xe5 },
-		{ /* sentinel */ },
 	};
 
 	/* In case of 1500Mbps or less */
 	static const struct phtw_value step3[] = {
 		{ .data = 0x38, .code = 0x08 },
-		{ /* sentinel */ },
 	};
 
 	static const struct phtw_value step4[] = {
@@ -1582,29 +1576,28 @@ static int rcsi2_init_phtw_v3u(struct rcar_csi2 *priv,
 		{ .data = 0x4b, .code = 0xac },
 		{ .data = 0x03, .code = 0x00 },
 		{ .data = 0x80, .code = 0x07 },
-		{ /* sentinel */ },
 	};
 
 	int ret;
 
 	if (mbps != 0 && mbps <= 1500)
-		ret = rcsi2_phtw_write_array(priv, step1);
+		ret = rcsi2_phtw_write_array(priv, step1, ARRAY_SIZE(step1));
 	else
 		ret = rcsi2_phtw_write_mbps(priv, mbps, phtw_mbps_v3u, 0xe2);
 	if (ret)
 		return ret;
 
-	ret = rcsi2_phtw_write_array(priv, step2);
+	ret = rcsi2_phtw_write_array(priv, step2, ARRAY_SIZE(step2));
 	if (ret)
 		return ret;
 
 	if (mbps != 0 && mbps <= 1500) {
-		ret = rcsi2_phtw_write_array(priv, step3);
+		ret = rcsi2_phtw_write_array(priv, step3, ARRAY_SIZE(step3));
 		if (ret)
 			return ret;
 	}
 
-	ret = rcsi2_phtw_write_array(priv, step4);
+	ret = rcsi2_phtw_write_array(priv, step4, ARRAY_SIZE(step4));
 	if (ret)
 		return ret;
 
-- 
2.45.1


