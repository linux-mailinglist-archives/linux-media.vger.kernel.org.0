Return-Path: <linux-media+bounces-14653-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 796CA927AEF
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 18:16:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0E061F238D3
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 16:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA2F81B3720;
	Thu,  4 Jul 2024 16:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="DjyvIJ9T";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JWKyk2R6"
X-Original-To: linux-media@vger.kernel.org
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8671AEFFF;
	Thu,  4 Jul 2024 16:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720109797; cv=none; b=YTjeFQMX8rZRTNpYQnDml9GkpOCwlzxlw/4zU8yVlJv4j0T3AfPNG5L9Oyi4LoHoFwNPLGhZN164E9oHzURxZqVEqpq96kDR4FaScziMrbYLX9qW9lx36/lcU94d95+AFpZsrPFb2fjBW0Mdl+d7+9tXuuMY7wNYWZF3G83o3FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720109797; c=relaxed/simple;
	bh=wjrMAx7ojP4JuKX961rfrDEIF9RVwFQycEXnjIiIHJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gCLFDIoMwbZcRYxnlTOaapLOqE57YJPTsaAqQnKBucE8xn3OsDHoz+mQJMBGGEIRmjTVQkmw/aTKyOO70P0zkuGpJs97c2LyemsemJHNQVn/e90gG5JvvRdsv+Hk8GBW3UX7G3NW3pU4GIe9iJ1re4NVefKZldpcMK0JExl0tks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=DjyvIJ9T; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JWKyk2R6; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id BA2A01380289;
	Thu,  4 Jul 2024 12:16:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 04 Jul 2024 12:16:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1720109794;
	 x=1720196194; bh=oMbbwB2lHC8AbI7q1uaEvdFmEVr4MfKHAVO2ljwuBxI=; b=
	DjyvIJ9TvBQGbXnCHMQZnw8LDH43/m/adF6JvhKzDn1kcDYjLq6u+sIQagtdFsyh
	DtDJEq3z8CY19st9hSUrEHnWIR+2xCVKLw1QCl7flmwCMMlIeOQVl/+ES6W+aovK
	/BOp+GRkPAo7GVH0dUL5/LyaFHWc0ufmewxU0cYIsX2G2vFrpdjJn6MxL5DeTxju
	vheW9JftloSqlTIykwd21pQR+GkvYNqdlvyJZX7sEehHAR6K/y9cPxCrYCzvMZxs
	GS14vy1bDW6KHMeHizotp9agbb6Q2tkYMNIcvorHIMJ4w3c7fZo5cEgZelIo4EKd
	bgxF7v89FlPUsqSFqEORvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720109794; x=
	1720196194; bh=oMbbwB2lHC8AbI7q1uaEvdFmEVr4MfKHAVO2ljwuBxI=; b=J
	WKyk2R6O0neU3kd2mOX1gAGEU6bsRIi3M3b4rPeI6lUN87NxutDQaASrjR60jjSF
	ltWsUEpD78iZRiPRxT7ysupOUIiUuK+gWpxM7JPdyQvwbL5DSWY7GEZLyP4twwkx
	v7F6qN1ldRfGSDrfRR1XPfGXy8g9beoKBYlzHyP6IlDpDeJx93m1UTP1dpPPPz9u
	TjkG5lfIH1avDvrh00XL75bDE7owinzKNhvhMEC5ZcnXfE9LDTesPP5XZ6gQZ4yq
	IiRP5aPGwjxLgtn5Ufh/dUz7DQOA/D5XTdcV0Xufgc6vkCrEoV+5rSpnPu8rLEOk
	A5uo7ZsRzbpxgk/vSIYLA==
X-ME-Sender: <xms:4sqGZlCU-bc1YTVL3rIVZyU-ENfbS0qt6RJVuJ8QktfmN9-DR5_hiA>
    <xme:4sqGZjgiOvKE99U3uOUYkpq0Oz0zew-7eCk49HcpGSA_sgSHSTE0EwpRcKSkOgZ_X
    VeN3yJRq2yme2OFwGs>
X-ME-Received: <xmr:4sqGZgk6f3BmXk7926SAQ60txvLc7R1kiK5sBs5fPu3S-tZfbP0-1PjAnvizIYnyR8HkSSmkluYieVDok7QcCISFDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudelgdeliecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhl
    rghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvg
    hsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeu
    tdefhfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghr
    lhhunhgusehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:4sqGZvw3f8eV5gbZ1fxbEdgUim64z8QhUDmcFcGO2TXiYCod2LTTwg>
    <xmx:4sqGZqQCC57o04n4AycfBBXhfOxdh_gDqAaj79y81LaiIlulIVOBlw>
    <xmx:4sqGZiYUJlePFgzaEO_04QbHxY9cdoskfZ_wTrvXiyNEPy9Qbo8FyA>
    <xmx:4sqGZrRJ9kqdA4IpeVAnWEy24RdfbCbx128_PyAAPfo1sfQm0pPTIQ>
    <xmx:4sqGZmZ8oQyJvOhYx6PNHqOwigAVVyqSiNlPAenc7ieqhnHqKl7BUohv>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Jul 2024 12:16:33 -0400 (EDT)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/6] dt-bindings: media: renesas,vin: Add Gen4 family fallback
Date: Thu,  4 Jul 2024 18:16:15 +0200
Message-ID: <20240704161620.1425409-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704161620.1425409-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240704161620.1425409-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Gen4 SoCs V3U, V4H and V4M have a similar video capture pipelines.

The datasheets for the SoCs have small nuances around the Pre-Clip
registers ELPrC and EPPrC in three use-cases, interlaced images,
embedded data and RAW8 input. On V4H the values written to the registers
are based on odd numbers while on V4M they are even numbers, values are
based on the input image size. No board that uses these SoCs which also
have the external peripherals to test these nuances exists. Most likely
this is an issue in the datasheet.

Before adding bindings for V4M add a family compatible fallback for
Gen4. That way the driver only needs to be updated once for Gen4, and we
still have the option to fix any problems in the driver if any testable
differences between the SoCs are found.

There are already DTS files using the V3U and V4H compatibles which
needs to be updated to not produce a warning for DTS checks. The driver
also needs to kept the compatible values to be backward compatible , but
for new Gen4 SoCs such as V4M we can avoid this.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
* Changes since v4
- Added V3U to the list of Gen4 devices.

* Changes since v3
- New in v4.
---
 Documentation/devicetree/bindings/media/renesas,vin.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
index 5539d0f8e74d..aa16f1528f2d 100644
--- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
@@ -52,8 +52,11 @@ properties:
               - renesas,vin-r8a77980 # R-Car V3H
               - renesas,vin-r8a77990 # R-Car E3
               - renesas,vin-r8a77995 # R-Car D3
+      - items:
+          - enum:
               - renesas,vin-r8a779a0 # R-Car V3U
               - renesas,vin-r8a779g0 # R-Car V4H
+          - const: renesas,rcar-gen4-vin # Generic R-Car Gen4
 
   reg:
     maxItems: 1
-- 
2.45.2


