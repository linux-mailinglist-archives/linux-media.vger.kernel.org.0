Return-Path: <linux-media+bounces-18979-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CFC98D00E
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 11:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3754A1F21782
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 09:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0F419AD87;
	Wed,  2 Oct 2024 09:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="YRbGd1lu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="S0JOwN0S"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B64F199E98;
	Wed,  2 Oct 2024 09:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727861057; cv=none; b=NLlLgx8JnpZ/SfeMzekV09220+3jaVCin1vwh2CchUyZoLudZFGqE5lN6NOyb9UpH1g8wxPoGbaIVOleuKku9mvSlEvhx2tAG1ZxxD/LGFKsmXBiKPgT+rQSkl2FCNLYd4o1xCTHYmcKaWvOdm5IurBPRUWrXLVMNe1akEmrxck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727861057; c=relaxed/simple;
	bh=+sW71fMhknxpcA3opf+DYaW9ctx6YYxo+keoEe+fPpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OuQWDCrTJ2BfKIXM4nxsoNq/lZxe9/DCCk62Ib1IpB2mv9/Q5B6vvSH1Wz7oUfZJwS6KmTXkW1S2gJNAykIIXwa1bw81KWUt80A4Pm29EqmCNJ+89Rl+COFEH1qPpotRhHB25t+fvVZpdyjU60LG+LBhocqQcnPig3JU9632208=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=YRbGd1lu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=S0JOwN0S; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D0BE31140191;
	Wed,  2 Oct 2024 05:24:14 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 02 Oct 2024 05:24:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1727861054;
	 x=1727947454; bh=hVVCX2ag5XBXOwf74k/blaHyu3bR2YQZ2vJgRSmE4Xc=; b=
	YRbGd1lutFjNS2IRq0ylLx99NJu0TmZ6O3Qyw7jT3sYhd3HuzYjPyZ8FQHvjDVuc
	KVNI3/3pxQ0UXH+NuM1FTK5die/xr+cO3lnTjVGWnFMyC9mGgAgHDq7chV/EiW8v
	Cq/izHcrCaD6+rJH9RElkby7fuR5r3naNC6271GynR18yAxtynpNFQMFT6p1t14c
	Ae0v6y4c9Myf4kFfo6HAxaqqRePZEx6vpbQKVhKVdqUhgDAkTVrWgHzNUpck0Ik7
	Bvyd1xInvpNBIvueq8m6L45A6NdW+D9zOO6D02mx5TawSza6KfxX5mcpC/fEGse0
	koIHjdQ/wTdBbPNPXXNYFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727861054; x=
	1727947454; bh=hVVCX2ag5XBXOwf74k/blaHyu3bR2YQZ2vJgRSmE4Xc=; b=S
	0JOwN0Sl6o54cRL1fmE7iuV6ijPPA7ldoyfJAjb/HIVaqEGIgJlYaQOjz77QWnTk
	XKdFSXOxyTVAmEK8X7CM0QFDlvLLL/tVSBQH4DiZZDoL8fbNINLxB/b3+x9dmpKN
	bT2iolJTAd27/uGzPPvR347kDL6/00IhpChtQqJNPkgRD8TBxUJIYdOXhg+2uxsF
	SBaPSxoEmFHEd5+858cBaeHmgbPX3BgCkUxk5xXfCZzkAtA0y3Nd4tF42OPu3Vmb
	d+ubrITzom/89ZAAKCQZok+BSqTcF1JJaX+TTovCgK+mCWRzgzL1rJe0gJitBL8l
	kmXg+LQ2dpGC/LYD7pG9A==
X-ME-Sender: <xms:PhH9ZjDqW5xcfAsDkRY8li077IFF8DD6FgZ2BN6HwEHqexJZVzciQw>
    <xme:PhH9Zpjyv_MunNKJn_jCm2ecb-p9Vw9ovplnd0g9e8va2slhc78h_-gezc1unWwnP
    6ulW8X46WEXDVSyESc>
X-ME-Received: <xmr:PhH9ZukyL6hFQ5gDgfKBJMlmSRmIlsl_yL-Hp5bTW6iq4nYTD4CbMhPH1oN0nWkQy-sq4K4E7eOmIoE6snEG1ndzRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdduledguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffle
    efgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgr
    ihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtoh
    hnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgkhhhsehlihhn
    uhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepshgrkhgrrhhirdgrihhluh
    hssehikhhirdhfihdprhgtphhtthhopehjuhhlihgvnhdrmhgrshhsohhtsegtohhllhgr
    sghorhgrrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:PhH9ZlxvhUVCtJh0XaAIGsDDxhKrP1_vFBqyogm4U3XOFLwwDdQGuA>
    <xmx:PhH9ZoTW8CiP07zEoNSAWKu9nYErCI39JNhBLAaFNuWprV5B2DZhFA>
    <xmx:PhH9ZoaK3IkU1hmfo4cggHkSq8LQASklAzURXg7318aLQ73s9ownEg>
    <xmx:PhH9ZpTwgDGo2csvFX3ztqrO-RdliWC7OQmYWu6oy9lSX-7mDD8EYg>
    <xmx:PhH9ZqBHjRRaauix51Ve4lizjoEu8ZqpoqO6sk88f2P2C6VRBEyqjRsU>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Oct 2024 05:24:14 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Julien Massot <julien.massot@collabora.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 5/5] media: staging: max96712: Add support for MAX96724
Date: Wed,  2 Oct 2024 11:23:31 +0200
Message-ID: <20241002092331.4135906-6-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241002092331.4135906-1-niklas.soderlund+renesas@ragnatech.se>
References: <20241002092331.4135906-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The MAX96724 is almost identical to the MAX96712 and can be supported by
the same driver, add support for it.

For the staging driver which only supports patter generation the big
difference is that the datasheet (rev 4) for MAX96724 do not describe
the DEBUG_EXTRA register, which is at offset 0x0009 on MAX96712. It's
not clear if this register is removed or moved to a different offset.
What is known is writing to register 0x0009 have no effect on MAX96724.

This makes it impossible to increase the test pattern clock frequency
from 25 MHz to 75Mhz on MAX96724. To be able to get a stable test
pattern the DPLL frequency have to be increase instead to compensate for
this. The frequency selected is found by experimentation as the MAX96724
datasheet is much sparser then what's available for MAX96712.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v2
- Use device information instead of if and switches statements to
  differentiate between to two devices.

* Changes since v1
- Group in series together with binding.
---
 drivers/staging/media/max96712/max96712.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 0ee66022026e..ede02e8c891c 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -27,6 +27,7 @@ enum max96712_pattern {
 
 struct max96712_info {
 	unsigned int dpllfreq;
+	bool have_debug_extra;
 };
 
 struct max96712_priv {
@@ -173,8 +174,9 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
 		return;
 	}
 
-	/* PCLK 75MHz. */
-	max96712_write(priv, DEBUG_EXTRA_REG, DEBUG_EXTRA_PCLK_75MHZ);
+	/* Set PCLK to 75MHz if device have DEBUG_EXTRA register. */
+	if (priv->info->have_debug_extra)
+		max96712_write(priv, DEBUG_EXTRA_REG, DEBUG_EXTRA_PCLK_75MHZ);
 
 	/* Configure Video Timing Generator for 1920x1080 @ 30 fps. */
 	max96712_write_bulk_value(priv, 0x1052, 0, 3);
@@ -455,10 +457,16 @@ static void max96712_remove(struct i2c_client *client)
 
 static const struct max96712_info max96712_info_max96712 = {
 	.dpllfreq = 1000,
+	.have_debug_extra = true,
+};
+
+static const struct max96712_info max96712_info_max96724 = {
+	.dpllfreq = 1200,
 };
 
 static const struct of_device_id max96712_of_table[] = {
 	{ .compatible = "maxim,max96712", .data = &max96712_info_max96712 },
+	{ .compatible = "maxim,max96724", .data = &max96712_info_max96724 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, max96712_of_table);
-- 
2.46.1


