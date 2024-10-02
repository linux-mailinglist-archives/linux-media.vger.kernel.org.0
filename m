Return-Path: <linux-media+bounces-18990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E04898D15F
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 12:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31F791C20BCB
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 10:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438501C3314;
	Wed,  2 Oct 2024 10:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="FmG/v0+Z";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GTpACYWP"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27D01E7667;
	Wed,  2 Oct 2024 10:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727865277; cv=none; b=nPvaz5ZYEfgBmBKWw6fmzlN7oUSanl5JwC5FdS/U1ZBGZKA3r81yO28OI6IzhCVnmMB49YFtLOqYdJNzf8IRdijNBdEQbDh2KBriFdugkr/mltmoBVaEiJCRlHimog+kBBry7fFUeqcfFGaaYUyI24pKqL/WiYIrUGTaB71XMkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727865277; c=relaxed/simple;
	bh=YIfTxHiEvUAVhkU3V9dbhXvptga1ow901Q5cbVOGSk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YYohb0BLArIoGT1LWVWnzXukv9PDJoUJ0MBOf8SjmbSKbKBXWaMFotJZGeF3x8l8SIa8RhnLNkq9xRMSQeEbXRS0ynZTqITJ7W3/OsaGXOgOHctxisRjMwOM57rHFmBR3qOj5cJcMhxiBkIamcUuxgOxx94jynxamJQ6qKHVHoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=FmG/v0+Z; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GTpACYWP; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 1488613801E9;
	Wed,  2 Oct 2024 06:34:35 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 02 Oct 2024 06:34:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1727865275;
	 x=1727951675; bh=GjEIhcPUrNWOp27FIGg3lTjVjxhwbQaFKJgLoP6Jq2U=; b=
	FmG/v0+Z1d6RAq4KvZ11AckAJWhUqHMq6SYm0yYdLvUwHhHcwH3GXKyuWHNWcVxp
	IqRvWyB6AI3ndA8oH2MLswSwU+4eYA9eWKtFNjwBOVKGDpmDXxY2woL1/RkaxR4z
	Co9yZaQmsVqT5KQpTzJUsxNlu2UL1QnL5o35GHocZxHJ9cMl0Cgb1ztIkZNHKWTs
	IiymjOfrNMZxJOHz6M9afqQEZwDdL0a9u4FnP8W4gW1MHyRkxzGGvlGRalqNojmR
	RqEbAYXnFTdzkAcosNS4+LH4Mb27kyqR0+kq3C/6gFQaqKjMiZObVfmgjuqiGyWw
	QPv8Cc3IYklIUwVggCZyqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727865275; x=
	1727951675; bh=GjEIhcPUrNWOp27FIGg3lTjVjxhwbQaFKJgLoP6Jq2U=; b=G
	TpACYWPldeEn0TN2lr+5GzFbgAcEgFYHUu9+FFLlsOhm0Kkl/fsC6pzwEV1yTKjz
	noxDNnv3ozwo4gxWRpqKV+IMTEQfvhgoFKFxz+qTAf7OJ58tG/nsC1APlEYC7FD/
	lGiSjaD9y9Y7jWSg6JDJGEDrDZsUaKjJ0M7zKYG6Q86teJAMbGCz5GZ64m3FXhHG
	zjz3bhhlORZZjiDrpO/jn4VhVxRKgxvRJ9cUzp4OlSM6lt93uXgOiOBzj3aJeEvP
	PDjPke6fL/H4CpmRapqa8vLQsYK54yTmRbxVnZis4NNrBKfVzn4t5FkwBhQ1s77P
	ldNMCC17ndiyCsdYpCLcQ==
X-ME-Sender: <xms:uiH9Zt40eV8Le8hFYTAutcid8n-QwAFiD76fTKUEUiSnSj2wMmn9HQ>
    <xme:uiH9Zq4SuRR2DE6b96H7h12ycT38EDQ8Br8sqgigBUQdQZIg98ktgnA18OPLuYuVY
    obFXtCXdVLkXDQdu2g>
X-ME-Received: <xmr:uiH9ZkegXS0_N6_1b0ZXA_1gqHOxsOpL6Mx09LBOzD61ew76OungeARix2mcGySbQpWFYfGc8SgbNgnwakCU8z7Ktw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdduledgvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffle
    efgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhn
    ohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgrkhgrrhhirdgrihhluh
    hssehikhhirdhfihdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggv
    rhdrsggvpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsoh
    hnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:uiH9ZmJ0NAeWNswPenhk-X6Gr25d387kvw0ODIumBj3Ug7mt1XaFGA>
    <xmx:uiH9ZhJegbQCbWQCe5p8CKNPo5yGuXm2AEl72xwdNNwiakNG5V_qHw>
    <xmx:uiH9ZvzVF-v-ACYXDkuFk5GSaC0MANC93B-bkWm5_PD0pKSd1IjnxQ>
    <xmx:uiH9ZtIVVMLIncPCLQRBKqXgs2vjSw_AXV06VazLaXBhLIPfdmU1tw>
    <xmx:uyH9ZoZ8jG98E9GZPGGqCHxVCIRHjq_sCMQBvyzBF-Q5PF2V_xcxCF7X>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Oct 2024 06:34:34 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 3/3] dt-bindings: media: renesas,isp: Add binding for V4M
Date: Wed,  2 Oct 2024 12:33:18 +0200
Message-ID: <20241002103318.24289-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241002103318.24289-1-niklas.soderlund+renesas@ragnatech.se>
References: <20241002103318.24289-1-niklas.soderlund+renesas@ragnatech.se>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
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
2.46.1


