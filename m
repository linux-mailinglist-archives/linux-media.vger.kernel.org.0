Return-Path: <linux-media+bounces-17241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 283DA966A9F
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 22:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E1BA1C22A01
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 20:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9071BD018;
	Fri, 30 Aug 2024 20:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="te/QhY/+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XMGj6izn"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB931BFDF6;
	Fri, 30 Aug 2024 20:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725050102; cv=none; b=bT60Sxn2f0wZLbjdQdIs83lbP9mUf8VNTeJ2KpLfoX1tzJl0b+52t3FTA2ypalWt3mCm88tJ1mHHFYrp4QtLvd21BA9eBoNv5gmYZm3m8j2aT/pmrbJIJc0f0FiMfa0GfRGCM4k+euEzWlbkqqd4+ktnS/FJdZ/S8LunFjr/rYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725050102; c=relaxed/simple;
	bh=lYkTEnnPcCugk/nsalm6Op60l/MgYrq9QArPuUxn8c0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lMhLBaYHpFDK72fm3zwsX1CnaBUVJ4a7dU3ODCbOGiBGbOJYUZGWKPoRGdhlnyUlOu5K0Fj3DZ4jWVzM7Vc/hGlATlqsMIi7yEaLIfIDYxkGC5CKDYvQwSncpBhZe37S7xiCF8V6HCRE79xq2yXKR5AvxuBaqcbgslMKt60GonU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=te/QhY/+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XMGj6izn; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id AEC04114017B;
	Fri, 30 Aug 2024 16:34:58 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 30 Aug 2024 16:34:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725050098;
	 x=1725136498; bh=+LzqbnOSHKHcDTgCNDGqaKM+uDKxUJO9P7aNNgkMlRU=; b=
	te/QhY/+e6CpMMPmvZ+b9BC8I+5TDo9TyvYNNrd94RchngOcMKPgqhoxyFZOsdnF
	hjyimkN7Bkl3zNNFBUzo3wK62U7ECjrvBpOA1747DHa+Q8rCa946jsNtT1QKfWp2
	g85qEJU2JTk2uiaSW7xP2lKgFhlZz6nCEY5qD6NiNnfWBzCMO0CR6hvRZ91LQMM8
	O2U+H9AfbzhZhVC5HOnrPIkQNSPS4sHC+6+ErjvX9NX3jTfg0OvYmY+BayO8o2Zn
	KZJuiwpH6eeBW2YEAkltiqFrkAeZsoqipUZkvKrWfxhyb1XF1g4o30/6Llq0hr1w
	B67O/mmpLVh9g+dNSQyLCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725050098; x=
	1725136498; bh=+LzqbnOSHKHcDTgCNDGqaKM+uDKxUJO9P7aNNgkMlRU=; b=X
	MGj6iznroT4WQaOpo9irxwd1WUDQG5CnizCGNsMA8QnwNpFiRzpImdRjSpxi5iM+
	muPVY3ght9mHWAKXaPvW7G8/akzqqBCXacJQErfVI6e/LrLMNIWuy18C0qouXRF7
	7nW8yWYgGWGtGORUhhSYylMMM1fT4kWzilo3bbOTpxOCkKGvCt4zROQfhSBb+ZnK
	YjBAzPULJ8jkZdHBUHTmrQ8VXhP54tqOdNABfCAyxX651CjWJPRAAnohISYTZRVP
	UOo0vvr8EHKFXPnQMNKp+PVrO1b4oF7is5rk/ZpnIvSoqcp2SGddC++v0MInT73l
	7rlkInV5GNIN3BicFZTBw==
X-ME-Sender: <xms:8izSZoEX1FQgoGLvbcB5wgn22w92cWbAQuCUvAunji40-wQUQ5bTqA>
    <xme:8izSZhUETny_y2zLnQot5nkv05gbgRT7ntBWz-Lt_uMk8Bc4G6lU8ZZSF9GaCcmBV
    gvLhE017AGWix4nGXc>
X-ME-Received: <xmr:8izSZiLznvUoBH0L4_mu2_DVExIYs3Tte9gDwmPi1KR6Qwwy0bCQr6LoJGgg7Yu_pnre7ufh8_CSp4b6UsXgWyGI0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefiedgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmtghhvghhrggs
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrth
    esihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepshgrkhgrrhhirdgrihhl
    uhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehkrhiihihsiihtohhfrdhkohiilhhofihskhhiodgu
    theslhhinhgrrhhordhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggv
    pdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:8izSZqF9WUcnxIAM3a7qXjFKiOpFLT3V5nnJS5F7EUEu72xLSoNKKA>
    <xmx:8izSZuXnqHLYPyNUTLMaTiQx5lXUTrRABkQ7kxDiOxkqvdXYecw14A>
    <xmx:8izSZtMWRXCW-oJb_UpohfWrEPJ6oVdvT2Vg0QvQo8NCdTsjR-zytQ>
    <xmx:8izSZl3bDVdiKxJjWLY6tDNVyLkuQiVB2l9PVWj2qOelGN8nzxNOHg>
    <xmx:8izSZvtsCyP1mGkMLNGdmnzhPxvebec8ZHwS5HXM4KPrMMK30iGe-eUi>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Aug 2024 16:34:58 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/8] dt-bindings: media: renesas,csi2: Add binding for V4M
Date: Fri, 30 Aug 2024 22:30:57 +0200
Message-ID: <20240830203104.3479124-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830203104.3479124-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240830203104.3479124-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document support for the CSI-2 module in the Renesas V4M (r8a779h0) SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
* changes since v1
- group with driver changes.
---
 Documentation/devicetree/bindings/media/renesas,csi2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,csi2.yaml b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
index 977ab188d654..80b77875874d 100644
--- a/Documentation/devicetree/bindings/media/renesas,csi2.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
@@ -32,6 +32,7 @@ properties:
           - renesas,r8a77990-csi2 # R-Car E3
           - renesas,r8a779a0-csi2 # R-Car V3U
           - renesas,r8a779g0-csi2 # R-Car V4H
+          - renesas,r8a779h0-csi2 # R-Car V4M
 
   reg:
     maxItems: 1
-- 
2.46.0


