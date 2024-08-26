Return-Path: <linux-media+bounces-16831-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A47E595F436
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 16:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 304A21F22C4E
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 14:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C397418D64D;
	Mon, 26 Aug 2024 14:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="vMQksTy9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fvydt6n2"
X-Original-To: linux-media@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C80F193061;
	Mon, 26 Aug 2024 14:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724683483; cv=none; b=M6DTKhkKArjf6VXsh6JjI2nENdb5h87Cw3eA984L8vAytthowlU91VgY+ZSwhsHu+lf4naXHYUfQ0hlatRx5iHFjlZBLXVCCSyc0lBergrgklnUYLuxRg3oMmJhTP3z2LhcFGJLsJUEIwuOQVlVu+lqZHBXgKdx6UWxNCJjb81o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724683483; c=relaxed/simple;
	bh=KQYw51Gt7kg+ABW2zwbnQFXdUJLeroGSlN+Cv/qZgcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C3pGnsJ7rkj0YN/4BMqsjrEqz/ZDpQEWXN6e3fpWnrsFuuiPEhPWSYBCy3vR/WhvSN69sHSV0mexg1sSDhvnShnzDDLqw3hyIdQm93wh0IJzsPEU1KR0OYPLNITO4qOoGVycfi//xTU6l8948+E6n/RYy2sOKFpLr19tI9tr/Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=vMQksTy9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fvydt6n2; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id 8E6A1138FF65;
	Mon, 26 Aug 2024 10:44:40 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 26 Aug 2024 10:44:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724683480;
	 x=1724769880; bh=a/mA1pMeI5U1vqlceZiMk+v1xyeyRI91H2eFYR1i+KU=; b=
	vMQksTy92oH1SVf2bGoJkituzpXDNHYrmEk178rdprHbxMCrIMYbrL+r0UlJcCZ/
	DuMNN7arJ2udTg6aH8HImJjJNaG1TllslCwYLMxXslq3qRpOss3nRMjHEwjcq+Vf
	zPP2V5rHIlCuZMq7KeDrp/l5yU2yejYCApFh2RF0OAvPKA1OzZXBANuh+QLcmsMq
	k2QcU63dIOsds4QvV/tC1JHidIoKjKGOZlarlTFQ0M3HYUCmDYpjEJSBBav5swye
	IRSArHaTeVdyJhnSUrOwWIMvuWh/YXpL2JCSTEI5v9fl+T6LdFwtSYo36z1106YC
	z1NQkahaETXRbV6+FnrQBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724683480; x=
	1724769880; bh=a/mA1pMeI5U1vqlceZiMk+v1xyeyRI91H2eFYR1i+KU=; b=f
	vydt6n2yn88d6zR82n08hleGAPtExghZtJSpUffkpCqgSKlvBzJllPkQVIxc2oZb
	AUkwiJQFqqaVlmbC5XjoD92ZgTV89cYVTlCS2MuCQOuqKS9m7X/WktGa6ZV+BgOg
	JzMANMiTkFVeGvy7epXDAxiN/6ztIA3OxFaQkSRrNhZdu+kuYVmS1Eg2yoNNDlb/
	8eAMOQxGEKC3gsGT5WcrLX4ro6ykxKH07f0Oyh/r9TP0k7hDmofU75qVH3MnLdBa
	8jLOAqaMpd2ojZP6CN9x/dxjWDl/3QUDAxbZ4ELvwb7Y0Uu/p59baNP2rG1TFTjY
	ecLbNuMBkabHl5UjmGnsQ==
X-ME-Sender: <xms:2JTMZh1V11CfVEV7QiW1UfodCrzpW5iKX7e7SoKu7braoNbG6dsMVA>
    <xme:2JTMZoFn2cbsJSlkZ7-phmL7VM3S5wrmxQ6GAmK7OVUs4Q22F5VkjDyIGum-noLdB
    WhoqToTWjBOmjV02Ww>
X-ME-Received: <xmr:2JTMZh5Q2z3FlG3333zr9Y0kN63cVrY_JYHPDqdNWYT9B-gfJdKjhxMmU5VBg0nnDcizv5HDH1U78YyCknZI5KARYQ>
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
X-ME-Proxy: <xmx:2JTMZu1854RWoUeKtnglz0gdPnGI4IswxMrtwO-_kMOnNWP7LNSY_g>
    <xmx:2JTMZkHjjH0YFgUORVp8ZMO8tgLVVwHk04MZ9g_5ysa_E4XvybABaA>
    <xmx:2JTMZv_E-2fNSIBs__2jBjdiZ6WCsrPNcTdoRZ4E_XjT_pDVIDiyuQ>
    <xmx:2JTMZhmM4agwZmGnQ4SA8lq29G6miuUoWvQ2KMr8ZqrKlHSNPsgfbQ>
    <xmx:2JTMZs_HZuRE2cX7q9hhasks4LajKqwOl7Zby-BwbgjC1BB1MGYMxC0R>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Aug 2024 10:44:39 -0400 (EDT)
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
Subject: [PATCH v2 5/6] dt-bindings: media: renesas,isp: Add binding for V4M
Date: Mon, 26 Aug 2024 16:43:51 +0200
Message-ID: <20240826144352.3026980-6-niklas.soderlund+renesas@ragnatech.se>
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

Document support for the ISP module in the Renesas V4M (r8a779h0) SoC.
This device is compatible with the CSISP module on the other Gen4 SoCs.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Add to commit message that V4M is compatible with other Gen4 SoCs.
---
 Documentation/devicetree/bindings/media/renesas,isp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,isp.yaml b/Documentation/devicetree/bindings/media/renesas,isp.yaml
index 730c86f2d7b1..c4de4555b753 100644
--- a/Documentation/devicetree/bindings/media/renesas,isp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
@@ -22,6 +22,7 @@ properties:
       - enum:
           - renesas,r8a779a0-isp # V3U
           - renesas,r8a779g0-isp # V4H
+          - renesas,r8a779h0-isp # V4M
       - const: renesas,rcar-gen4-isp # Generic R-Car Gen4
   reg:
     maxItems: 1
-- 
2.45.2


