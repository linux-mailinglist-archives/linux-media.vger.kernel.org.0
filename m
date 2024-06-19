Return-Path: <linux-media+bounces-13738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DB590F251
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 17:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0ABBF280F59
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 15:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C40B31527AF;
	Wed, 19 Jun 2024 15:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Zqx/Jikj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ro2EA02L"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899C221345;
	Wed, 19 Jun 2024 15:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718811395; cv=none; b=R0y4rs9zwhrYJ0it5OSKwhiDrub5jtKoikiRsts0Pe+kkj1jMoFKTLMPfgdWFN8Gc2bS7+MEX7PP+fwiykki3c8ljhmqyeiJ18r3doSFCk1A/u4nfE3IGKBJqqzlQlb56N64wFgkE1qgCv5+tP5HrbcYfwBwWvji30TY5DO3Elo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718811395; c=relaxed/simple;
	bh=KJFj5e+o7VpD9NNr3CchM8mAH05uZxhtzX7TKcYvdnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l75xiomvkesuhTsKSYOBeOM7T3eOyzRXjWIXNHXmYwiAyiizJKBD3kwcHBlJdenyO81fwWWEQCk4KbDbvcJtcHVi2Iu9FUQ5ffQniQo1GfW42s2PzkZLWJOpN0Dyypopcbj5Lm/4SwWFSsXAAQ0nuaU0SIvY1A6XPEmdhsZBj7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Zqx/Jikj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ro2EA02L; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id A8A1F11401E0;
	Wed, 19 Jun 2024 11:36:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 19 Jun 2024 11:36:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718811391;
	 x=1718897791; bh=Nu/e/5QrvdFIKUx7T4lRBSEMjBYYsMhdUkhwPu9DOTg=; b=
	Zqx/JikjMn4FiVZgrNhn9kHTpxtvg4YNvJjphCadwNg7hc4SVArtuxX6lN5gSR3H
	g7jzktao1VFBg+SeStnZnUEPU4FIuHiiA3J5f1pmuQtdqRWg+W7fE1IbkJLdLDGN
	Xif5n67JWrlmM5/mIwkGnlaxmqpIToVZF8ipcnh8PRq/VE5HT+5YZ4gJzSyDBHin
	sHKqtOYM1Ruf9f170e2oC0osw5wy2yE9wWnrOM1DnzkWh5GeXbXSUJNuaYGM3XAO
	uX/GDHdUN9IQesi/MzAiqmqznfqso3lYCF0uWIve+NQmeAj0oI9oQbmpTE3hDrLU
	cAXSQsIcclf9gBa7p5Aw7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718811391; x=
	1718897791; bh=Nu/e/5QrvdFIKUx7T4lRBSEMjBYYsMhdUkhwPu9DOTg=; b=r
	o2EA02L4qywVne8D9OEgyf4kZ4hIVZPc2h1FZggW1ksDtVfE8HlxpjP8jXRmjSIb
	3zWs/ff9qzIX+VgWbJpVF7sh/LWzWi5zFjMRLrNaiiYtHYj53CDH/nEkdEZjMhNy
	TrI4iq8SHkGhMQ1YhZPjTYF8EPq4SliYwwL0oZlqZM4Csx9eaTkV0b9iNy8AXhdj
	TUpMtR/Euk19j9GIy4bOyG4vHHpABh0Vdp0ryJYvS+XhikMl5DhGvVmQB1CQ1S+K
	P+OrnyVt77EdDAj6o6uJYij2Nco7ndeo4TUrFsS2AhOMdT1cKhtrWkJ8R4YM1s2L
	jNPaiGHO6VSa3mz2ftyWA==
X-ME-Sender: <xms:__pyZmZxcY5N2ki3pO995wpJQ8SxIRWlOn_8js5aTlHax6vAnyrFjg>
    <xme:__pyZpYILdhHmnAwoBfWall6UCzrtBE01wDOluBdLtbmGelsagWyyZgty9wjrPCta
    -3k8SwOEvrxykppDjI>
X-ME-Received: <xmr:__pyZg_Ei3as35Yws7XmM-x129zPJijkcwslbRUz4WVCfi80_EG_zmwlOFwsAGkI_w37ABQNYhlLP1FjSDwTBoVSAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeeftddgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueev
    uedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:__pyZopgXxACe-nOzEuVJS8M822E7Bz3Jv5XdbjDS84t3wLVsEXV-A>
    <xmx:__pyZhrb05DO83Rxzo1TSmJGYj_T7ztGvClbuAzjPvnFBwZCwQ58Nw>
    <xmx:__pyZmRC7Al5KMtGElGJo30ak6K3UaFMmxWqhkJBqITdULVqO6Mjxg>
    <xmx:__pyZhquC9wsqYaTBSDEymobFde_inGaDtOZ613HfR0XL05IqZdaFw>
    <xmx:__pyZuhnrwW3QVo7DB0cGSxN3pytrTv2-GIJRgfZqM6MJsO7VSUDZYTm>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Jun 2024 11:36:31 -0400 (EDT)
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
Subject: [PATCH v3 1/2] dt-bindings: media: renesas,vin: Add binding for V4M
Date: Wed, 19 Jun 2024 17:35:58 +0200
Message-ID: <20240619153559.1647957-2-niklas.soderlund+renesas@ragnatech.se>
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

Document support for the VIN module in the Renesas V4M (r8a779h0) SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
index 5539d0f8e74d..168cb02f8abe 100644
--- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
@@ -54,6 +54,7 @@ properties:
               - renesas,vin-r8a77995 # R-Car D3
               - renesas,vin-r8a779a0 # R-Car V3U
               - renesas,vin-r8a779g0 # R-Car V4H
+              - renesas,vin-r8a779h0 # R-Car V4M
 
   reg:
     maxItems: 1
-- 
2.45.2


