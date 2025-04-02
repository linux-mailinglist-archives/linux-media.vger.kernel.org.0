Return-Path: <linux-media+bounces-29256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A87E6A79571
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 20:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5AB418867D0
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 18:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435791DDA24;
	Wed,  2 Apr 2025 18:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="C3kCTiCD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EeOOxWis"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E267118A93F;
	Wed,  2 Apr 2025 18:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743619766; cv=none; b=Rv7j3EFrkzaAcWAvTITsmFWV5nmQyPZP+DpcW6fP1Qw9Dv63Av8iqam2evHz8Jvsq8eblvsLrORkfI3Dq1382vpdizY+LmXNbJ++9bFjfCdjeeBu9EAhlMATc+CZLXRp8LO+6SY02xMuDkSe9W5QJmZVpNgaEoGXMW3HVSfsepw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743619766; c=relaxed/simple;
	bh=TDgnhSLwq5u6AnvENFjY5avyBR6y8r67krEiRbbY/F0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OlIHe1B4knNlUf2eNfjOC2jk9nAuFJvpfWLEtXQSD6aq66/bPU2nGmRPbMgvOCAuUDyDXmEc89HeDC4RCZEkFkZhj3LPMow7J6l40YH8NkNj0USSweI+mXMREeVf+H+3nqj+bCgxoR1hn1lyGumAynqTKq2hzes8eEpH1o4cLH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=C3kCTiCD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EeOOxWis; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 5E7DC11400F0;
	Wed,  2 Apr 2025 14:49:20 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 02 Apr 2025 14:49:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1743619760; x=1743706160; bh=2h
	KtpuOLYk/4qKermYFFut9jJqmFwmbWaGFNFIA/XTU=; b=C3kCTiCDLbAPK78rqq
	sATMZO46gokOLhLimhsED/D9IodRN/dIEbIiC8f/SNZnAnEukgtH9Yq2hmj6bPo9
	zTMU6PpPoxlWzJGqiXcJogMVA3hPAPpqyNN9pVCmV7YqYiAB1rSiIgcdg7Z256cf
	CD9/Fo6ToRdPQ8iY8Qhgup5sN22eNVcS2zP9cc/j6c0EyylZKfxHEHNFEJE9oKtp
	96RRJdnBI6ozVsiiP+X8n1Zd7l2xE8dQKsyDSDp1TCfLPScF2nzSoAIEyfmZL16j
	C/yFLULjDhuKtFPWb0M0NBNMG89MbwEgbsno2m3vmkmb9bMfukdEeOafC4PEOHW2
	Nbeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1743619760; x=1743706160; bh=2hKtpuOLYk/4qKermYFFut9jJqmF
	wmbWaGFNFIA/XTU=; b=EeOOxWisOK8CgNedChWlBgA5N9L4vrJ6NMEayZ8fEM2H
	zycHOv8G0OBAEhEKbdQEWp5TyM5WVCOFuWIcvrcQx7h5XmqaFVBQEIV/V+QwYX3O
	nlmwpz3Oo0T8rSOSIMOxgo18+8KGyRHSVVsmTtBsXARdnptRHEI09jl7Sg0Lc/Af
	XqGyHRESm4ButlRXzeaMq17RLHjmgjuyNMeJuVqWxfFbh71NqhLee4K+/dUiha3h
	HEFzFeXfjxcDpO15F7+xAH5ozUwn5aN5gtJGaIAhF0vw/MEM0kzxrlHC0XDG4j37
	lKhbLhtWEDhMAqjGwqrrzea0M/EpQ6/9HUvpjJjBEw==
X-ME-Sender: <xms:r4btZ0tEKVtXIpFMaE9CiW0KQ96MLLaMXAHdz_dWVvgAHddBj4NStQ>
    <xme:r4btZxeSBytGjRHle1k6ErjijYXZqGA7hJDheXgw5kxm85scpi2GikUDY6KzipVCy
    OOg4oVjaxm9JLvD4TM>
X-ME-Received: <xmr:r4btZ_w1Drb5oUrfsUV_jItnV-DMZbX9N8RG9LHIeRmUYK-GK0_LnywZ_vLo6ccMemghcKfKBTRP1145d0pwNk-hmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeeigedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehudelteetkefgffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfe
    etgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsrghkrghrihdrrghi
    lhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmtghhvghhrggsse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdorhgv
    nhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruhhrvg
    hnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthho
    pehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrgh
    hnrghtvggthhdrshgv
X-ME-Proxy: <xmx:r4btZ3PQwNlUsGNAHte0GtwLJZxa_SBSS0D85Etrdq3Y19DWv7YBjg>
    <xmx:r4btZ0_XpxJrSTjaU58VfQz7Ad-v-unbWKpSGf3xc21e7W9UQ0H0rQ>
    <xmx:r4btZ_VCojwO8CEzQ64LzsEsebcrYnKpxR8rulauQhvithfUTzfVsg>
    <xmx:r4btZ9cxuDtbnDVmwIFkcVlSJu3nYpx4lvxr-elFDO5uxUQB9osfEg>
    <xmx:sIbtZ6e5cL_tWhAzq2vBBH6JS394MnUGjdhjIVAO_0LSuw74caIe82GU>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Apr 2025 14:49:18 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: rcar-vin: Fix stride setting for RAW8 formats
Date: Wed,  2 Apr 2025 20:33:02 +0200
Message-ID: <20250402183302.140055-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Earlier versions of the datasheet where unclear about the stride setting
for RAW8 capture formats. Later datasheets clarifies that the stride
only process in this mode for non-image data. For image data the full
stride shall be used. Compare section "RAW: 8 Bits and Embedded 8-Bit
Non-Image Data, User Defined 8-bit Data" vs "RAW: 8 Bits".

Remove the special case from pixel formats that carry image data and
treat it as any other image format.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../media/platform/renesas/rcar-vin/rcar-dma.c   | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index f8394be8a922..fdf0f86c801f 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -680,22 +680,6 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
 
 	fmt = rvin_format_from_pixel(vin, vin->format.pixelformat);
 	stride = vin->format.bytesperline / fmt->bpp;
-
-	/* For RAW8 format bpp is 1, but the hardware process RAW8
-	 * format in 2 pixel unit hence configure VNIS_REG as stride / 2.
-	 */
-	switch (vin->format.pixelformat) {
-	case V4L2_PIX_FMT_SBGGR8:
-	case V4L2_PIX_FMT_SGBRG8:
-	case V4L2_PIX_FMT_SGRBG8:
-	case V4L2_PIX_FMT_SRGGB8:
-	case V4L2_PIX_FMT_GREY:
-		stride /= 2;
-		break;
-	default:
-		break;
-	}
-
 	rvin_write(vin, stride, VNIS_REG);
 }
 
-- 
2.49.0


