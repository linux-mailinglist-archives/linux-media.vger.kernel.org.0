Return-Path: <linux-media+bounces-11937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F80F8D0141
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 15:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3345A1F21829
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 13:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552AE15ECF0;
	Mon, 27 May 2024 13:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="xbHVu3jA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="k5+ThxkV"
X-Original-To: linux-media@vger.kernel.org
Received: from wfout6-smtp.messagingengine.com (wfout6-smtp.messagingengine.com [64.147.123.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516D143AC1;
	Mon, 27 May 2024 13:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816147; cv=none; b=GuSPl/zlqIch9RaLblu+aBUvBtLWOlVPOMIVwL82BxAzjhsek4PIwEmA2LqnLzzhtQRJQJGvc7ObIadYvBhvfMA64LNHWvdxFnFZ8lEQuzRxhQRH+9sg3tn0ysEIQ5wM6GgDEr324tAxZMhk9MPJqSAV/WWx/ScVnuXz2cCm3os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816147; c=relaxed/simple;
	bh=4p0axbg9ZtamGUJjvC+TeYrrBcJKNF0SxlnZsvDux7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G9EclOuVrdrFt5IWteFOWH0ZNgEO0E1qcMgUXvMoR5BzJh2oMS5dWiSxrdwApVAjeJLWjEzR+angTaTOQZ5lEnAAdXugX70BoJ+lZ7JqSKXkgOjcKO/UNRN2Z7gO8MaJPipSpkzVPwSeno3+fXV3yITkGDCBIEu7xsZggTmj85o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=xbHVu3jA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=k5+ThxkV; arc=none smtp.client-ip=64.147.123.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id 104AC1C000B1;
	Mon, 27 May 2024 09:22:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 27 May 2024 09:22:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1716816144; x=1716902544; bh=RM
	inUO3fjEyWk58LjTNr3Vf8l40ouHkcXqFV/V0b7fM=; b=xbHVu3jAAJkc0FENSM
	9DFoL9A7USmv3wKg6CE+7coWCJg4tjjlY8dOlhdC7CaO2zuTRIdSHLAH+T3bEoIM
	nVDQDJh/NnxU1weTiZ8QszZtxvcAu8VIHbOxIOHwa9/dvuOEtOJEiNB17V3j2ZTV
	Z71dWBXf6JSKzkof7jIR4YETd2a7eL+vOnonatjfvNdfXJWtorGwvfR/XxDm476H
	+uL/hNPGBQvOjJ07J5/6cEA208Yf81jbh9WQexyUYkX9r/T4qiNY3A50wmkZqZKl
	13mzsOOChki6Zp9X1im6+XT0Ssk4sXSqnT8GZq58XmMH2semgP2skJh7o1B4Z2YS
	SSeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1716816144; x=1716902544; bh=RMinUO3fjEyWk
	58LjTNr3Vf8l40ouHkcXqFV/V0b7fM=; b=k5+ThxkV8kbb7XKbDNADokiuPNGuU
	ZLZdN/loMeV0r6IR9J/YkVUFPFuHpGfU6xrOblIzfZ2DtVqx+Tyb0mafEO+wFfqz
	c0JgVB5iXbNy5PkfQwGYztFs1eXZWrQ9LD8i2pCs39amSUBCZheGN7VELq0YHuAL
	bpU6MtWYM6RsbtFED/caCpjPbyQLtgVKlfzN65e2+/L2C/27lKWx3/ENGrmvwqnZ
	5TFf7xcJ2113RoYnMeylurDO8stXdXdC19y7lIWsNPmkQp7zTK9M12awlOjwz6Cw
	AINUB1avFgzemMyGh98hudON16J6cPoKPznPDwS6K485cGk5BEpB3AMNQ==
X-ME-Sender: <xms:EIlUZkHL_jz4O9FpCLEibWoObSEhGsTzhpRivSdesXha_cvXYxOT1A>
    <xme:EIlUZtUM--gYEc7N9OBgzbBLBTxOUHM_4_lC0YifU9R6CM1MP1zkccJcTrz8Evjy2
    KS7WRGhVS4XOwDQRZg>
X-ME-Received: <xmr:EIlUZuIsKEJlbpSls_diQgkyrECE2VZgyn03NWEDZYD_y-arFB-oqKIv5TolahVHzBMYdpOnPNNKkHnM1WI0kUmlMU74PQMLbo4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefg
    ffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:EIlUZmGUqeRsmfbD947WFjZs-l1AmkA99TS4pFqdTT2nArr6455vgg>
    <xmx:EIlUZqUXM9uULWAKNgNecdAdWp0Q5DyRxFEEQFUhxTxI3uFOlEnWQA>
    <xmx:EIlUZpPrAZ-iH3NhlBe8avsbr8HY_LT6nlUFhx_p0HHtDVlPp2D6QQ>
    <xmx:EIlUZh3xmIXKyxdGotWmkzhqRX9aHgWscG_RcLV9qPWWFoCLp8jG9A>
    <xmx:EIlUZmSPQBusXNjRmQ3j4SOCQoUH63U5uAkdd27MW-yPWM8LmfX49Tna>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 May 2024 09:22:23 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] dt-bindings: i2c: maxim,max96712: Add compatible for MAX96724
Date: Mon, 27 May 2024 15:22:16 +0200
Message-ID: <20240527132216.1681903-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The MAX96712 and MAX96724 are almost identical and can be supported by
the same driver, add a compatible for MAX96724.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 6c72e77b927c..26f85151afbd 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -25,7 +25,10 @@ description: |
 
 properties:
   compatible:
-    const: maxim,max96712
+    items:
+      - enum:
+          - maxim,max96712
+          - maxim,max96724
 
   reg:
     description: I2C device address
-- 
2.45.1


