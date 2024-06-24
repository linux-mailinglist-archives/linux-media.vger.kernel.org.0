Return-Path: <linux-media+bounces-14064-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F0A915047
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 16:43:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87B32B238D3
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 14:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7150419B3E1;
	Mon, 24 Jun 2024 14:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="X6Pt8kLy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Dd6nLmBY"
X-Original-To: linux-media@vger.kernel.org
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3B419AD8D;
	Mon, 24 Jun 2024 14:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719240207; cv=none; b=n7nBOTcQ+7DwpLnIpu3Z4Y2KCxeJ9VeTnfeRyBV/F3VgJecjufv0gRNkitVJbQj7UASJpFsfbNVYOs2Qxn8JQiykMjvvWV4aIJIJKCfC00IzYuS1zKOvBZoF5dpF0y92PtwCpvZJS0MB2VWbB7bu9EC2VF7d+7bgQDxOjRpfHKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719240207; c=relaxed/simple;
	bh=uYQiPSLES/u3fmTNzqBOmTnid9DGw4dlBrDoHRAvhOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tMdSkxPBYu3PmSScgSo45b9KFSZU2hl7aYU0VHqSsD4bcHDyTpUd1yYHYa1hrOBW9v55w1NoTdQvjGZqVFx6zP/UImbJZsPad/iHvtjxDKxZTWEJw7AkZv9CW6e2nkvFgzCvGj7fESGSYAZd3Xcqfsp/XPb7ETXRtLeANY8vczs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=X6Pt8kLy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Dd6nLmBY; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id D67A71380202;
	Mon, 24 Jun 2024 10:43:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 24 Jun 2024 10:43:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1719240203;
	 x=1719326603; bh=l7GiehYptWcg8PCU+72HtnFDpltXfJuZPq3CPUP6lFE=; b=
	X6Pt8kLy3lOiz00JY0MeJcG6r0uyygIM2B6fRjCPMBqNXCSiAHi/fwC6ZC1tUZjf
	CW4j+lSYp99PuDrCAWw936IksYISA7n3Kvb6sKWrS8nbiAiYmVGHgEIHUG1deNUm
	Esr+3Hi4H4ZjFfHVHYo930zC4t50IqcqngszysR6GO11NVnNR7NoT2sS4vk1KyYq
	0g0DkLsgITdTMORR1CO4opIra7FI/1p687pO0iNiQ1gr0UswOOmTPZOZ9bCAvhhe
	29DUJ9vxHXhO1gTgDiOvinSWi7PPaD7exZ6bIdE8k7uf496+DoLavYGi78ueVEy6
	7RyzsEKXCrXZXqonMoesJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719240203; x=
	1719326603; bh=l7GiehYptWcg8PCU+72HtnFDpltXfJuZPq3CPUP6lFE=; b=D
	d6nLmBYTi2jJQTm+y93F6XO7cp5DT42yhrSJxV/wzoe99TsM9RJboy16fkvWxqyZ
	foy7gMpAzcv24LlEtT4ikSQxdowQqoJ470ziHCVwfT3tK6vgzCNqvQJ8mrvqN5Hs
	vMXCqXoWlcD0IKgoTWMOKs71D6aUmJlLzcE4bDHIZABRyaHxqLnYiR7850FinINq
	KM9ufd+bAxvseX6bUUAhBY+gRLSCFBQo2eGtKfOpJauIfPAG3pFfwTre8hnUjoRE
	BJuuYnWzXfSdFu1mILxDRoR72F+DX3vlnuEuip/Fwq0iec+AE9SbnAsVzrSDMDqz
	NGQaYiyNEhLPdBqzOL1KQ==
X-ME-Sender: <xms:C4Z5ZvgIpF13gEILkWeqmkhNfgpMZcEPgmn1gxfKrmN16Vrg83X1Uw>
    <xme:C4Z5ZsC9fNtKUuScKAwYC93EfWZvBJaJQYSzbMT0wU0J5LgIq93EDzYtMDrZzCC7S
    m4SgaNbcOzg38rD2cQ>
X-ME-Received: <xmr:C4Z5ZvGi9-pgw4Bxa02cNGaqHPS0XwvYp-o9-YAaAEOuTsJjP4nAajAo8DyUg4cKEEto562WJ3OrBQwdx-ZkFutsig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeeguddgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueev
    uedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:C4Z5ZsRS5ACNnWYyolaGif-VqlCDsqCA9MCxCBbUd1aQ6YuCSUZt9Q>
    <xmx:C4Z5ZswZhwSVZqzuYdQOQS9tEonyMnxyYAL3ER5QoJvXCM6JWHj8tQ>
    <xmx:C4Z5Zi7gqX8WQA5m_FzY5PeyBk-gTgZufR5aStvJGTGF3UdMPYK-VA>
    <xmx:C4Z5ZhxZw_sLTks0_-P0fSanvAg6VQj1r5pMBIu4QjNTHmOaoMfpIw>
    <xmx:C4Z5Zhq3V_VgIObqiwnB8VFfMJhdR0TsXaD9gPJdAHDcQ1MxLuERriEb>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Jun 2024 10:43:23 -0400 (EDT)
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
Subject: [PATCH v4 1/5] dt-bindings: media: renesas,vin: Add Gen4 family fallback
Date: Mon, 24 Jun 2024 16:41:04 +0200
Message-ID: <20240624144108.1771189-2-niklas.soderlund+renesas@ragnatech.se>
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

The two Gen4 SoCs released (V4H and V4M) that have a video capture
pipeline the VIN IP are very similar.

The datasheet for the two SoCs have small nuances around the Pre-Clip
registers ELPrC and EPPrC in three use-cases, interlaced images,
embedded data and RAW8 input. On V4H the values written to the registers
are based on odd numbers while on V4M they are even numbers, values are
based on the input image size. No board that uses these SoCs which also
have the external peripherals to test these nuances exists. Most likely
this is an issue in the datasheet.

Before adding bindings for V4M add a family compatible fallback for
Gen4. That way the driver only needs to be updated once for Gen4, and we
still have the option to fix any problems in the driver if any testable
differences between the two SoCs is found.

There are already DTS files using the renesas,vin-r8a779g0 compatible
which needs to be updated to not produce a warning for DTS checks. And
the driver will need to kept compatible with renesas,vin-r8a779g0, but
for new Gen4 SoCs such as V4M we can avoid this.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v3
- New in v4.
---
 Documentation/devicetree/bindings/media/renesas,vin.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
index 5539d0f8e74d..c3ef4fde7baf 100644
--- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
@@ -53,7 +53,10 @@ properties:
               - renesas,vin-r8a77990 # R-Car E3
               - renesas,vin-r8a77995 # R-Car D3
               - renesas,vin-r8a779a0 # R-Car V3U
+      - items:
+          - enum:
               - renesas,vin-r8a779g0 # R-Car V4H
+          - const: renesas,rcar-gen4-vin # Generic R-Car Gen4
 
   reg:
     maxItems: 1
-- 
2.45.2


