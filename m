Return-Path: <linux-media+bounces-11934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 283618D012B
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 15:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D52B3288069
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 13:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B70815ECF2;
	Mon, 27 May 2024 13:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="s1Qoosvt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="piW4a9Vg"
X-Original-To: linux-media@vger.kernel.org
Received: from wfhigh1-smtp.messagingengine.com (wfhigh1-smtp.messagingengine.com [64.147.123.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7701F4EB55;
	Mon, 27 May 2024 13:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716815943; cv=none; b=jSJ/aGLwiMYndlFMmuRc2ABL4HLKWgl9xrfmCf7iTr719fEMRIcX0jZMv+k+aGHRuafkBArooW4Psu9iNM4l9vhub1qNTqWPZCEtKG9EJO267aKiKesOfbSkn9ryoegAGfiGk6JhtjY+QB6+jYn7MQXZE7enZAqXOYpIx39naiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716815943; c=relaxed/simple;
	bh=JU7UXv6l+VrAhU79VBwp5A938zZbqFIYeikeslhGeHE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=asJL20vUQI/0sETfR+KJ1px6b4XmRtKfTBrTrW/Gyxi1eEc65KgIiVjyFGEh5e9VCwvEUTzJzxUVqLZ191TgEZ21WB0lwtAy5na7asfDejQgU/b5r44TC4Jr4wWM/FI2+s3cwbneI0tr9TZgrti7wLMmN+T5kgqT/lnG1zYZJT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=s1Qoosvt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=piW4a9Vg; arc=none smtp.client-ip=64.147.123.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfhigh.west.internal (Postfix) with ESMTP id 3C3711800099;
	Mon, 27 May 2024 09:19:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Mon, 27 May 2024 09:19:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1716815939; x=1716902339; bh=4K
	skgvs6LBVr+dtD3t/NT8uGzwWrX7ivOvO7moXAco8=; b=s1Qoosvte9m6rQDqAD
	Q9iVUhwjgJyr4Bb7yO+JT7H7EvLgK7HVKRgD/6ahfHt22laIjBHbNlXjB9nQIgOu
	y2a8vmGXtgqrsShRQ3gf/bL8xgHPPzXuFGDdeD1tQF0ld0LeC2E3TOlhHsude8bI
	B9BiXxR3g6ash/bFF4/msXkPWvoeqCSpYlybMJTEwBBZJRdBTCLm8mEjv6DMmhWu
	4anxG/u2+6aH6IE/l7JrqOcgauciGfR6kuGJBCGgGJIaa5Kwp1lyWWTREDoIbCRZ
	R26+NSPQoh4/od/EGiRLdnbcvgr0ILnY8/Z69nUsFpIRcX583YJZPp5llTenNjHJ
	FA7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1716815939; x=1716902339; bh=4Kskgvs6LBVr+
	dtD3t/NT8uGzwWrX7ivOvO7moXAco8=; b=piW4a9VgbFiGAK9DoQhJMLBVIeGX4
	lFYKbTgaWeHTYcJ4F88rB3jLvf+VpcRleCJjNAugKj6z+mX7fqoddMUURyIXHT1X
	d5MAMzcotbdRZyprcmLUWcnaoC9EOy0+NXc1MnuY/Svt1vjkAg1YY+tRufvIVeNG
	JidXjyuNxul9U9zLQizl9d88rXt9Dnf1D/rVxCasFmum7VO/S12o4clB9b4U13TB
	hMmDWFBwKrsokDdtZ4w3JjBFFN/QYMTgPwCzR4jdIEqxX2TqKM75rMLktUVSEjef
	zPtNfcpXPq+VTdc7ARGlK9JT8RPWOfBYmpiwnqTdp9CjdUy7RxpC/Qk5g==
X-ME-Sender: <xms:Q4hUZrpVTGldcNyjRuZIY5VDF8HupptaKliQfpXGWnr7I3DuGck9Aw>
    <xme:Q4hUZlq48wVNkZJyNz7rRISh6IiZHqPfwhzxhZDM2qb6j9SwtfIatNhxw54FpUzW9
    FXiyqo-16iJtLOVrv8>
X-ME-Received: <xmr:Q4hUZoOyvnY7G45N5q12_4nVE6Y7AcdJMoibhwIybfKQ2uhR8O-pvUgoEokG56Iyc1wMmo-PdUdBR3Dp77lpWZExd27SgPThRIXq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefg
    ffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:Q4hUZu4fO1PbZI-P6PPJn4DXPOv6NIKyoPZe4OXyuQVS2z6M7XnK_A>
    <xmx:Q4hUZq4wiJ6sr6q_hnBGlbM7JcXTabwycyQAqGv3JZ-C8JFE0pFLzA>
    <xmx:Q4hUZmiqByE_ixDjT0jf8VdZLXopSwVMxy75UjkgWYMu0mo2KclROA>
    <xmx:Q4hUZs6P2q3cFElNv0iUe2isZtSi5yzW3TbLoog6BW7N563zpf9QFg>
    <xmx:Q4hUZjEYMG28q2tqwQvyP7WqhCZrPXp-uctYTWspvEvflYvRT9quvlsy>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 May 2024 09:18:58 -0400 (EDT)
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
Subject: [PATCH] dt-bindings: media: renesas,vin: Add binding for V4M
Date: Mon, 27 May 2024 15:18:49 +0200
Message-ID: <20240527131849.1678877-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.1
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
2.45.1


