Return-Path: <linux-media+bounces-17159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61072964C08
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 18:52:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 855B41C2208F
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 16:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6B71B78F6;
	Thu, 29 Aug 2024 16:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="LrR4rM16";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RmD1ZbyT"
X-Original-To: linux-media@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043E81B5ED4;
	Thu, 29 Aug 2024 16:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724950289; cv=none; b=cyTCAdwN0FAxEyeNmSmKnEIbmY+QDt9LNsjft8RK9wFU7VhgtzsPHn1cIV9/49Cfr2Et+Dstyj8wDpEX9VYKfMZ5pCldjeI+1Aa2vX/Ju7tiTrLfmsQUuUCKIEC+bosyPNrwhL87b9/J6nYdgmVbfMGeQ/4we2xcOU7/sz/Y9qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724950289; c=relaxed/simple;
	bh=kiS0jm7lCLlbf+dBw7GOY+2Sqws0+VatRwPAKqWYFao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tZ6sQIVzZ1cDuo0QBHfxULH8zeW7poXibK9baOn8Zcr+1q6YzMK8BgYVEyxIB87MH8ZjptyNulHiYZ0KbREZlHgLlq0tSy756X4VX+1BiXltC3D9erVMQweW69Gd+2i7BqMXOF6+5GJWp/MT5X0Yy6qjfpn7AwuQLVOWvXTUaRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=LrR4rM16; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RmD1ZbyT; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 37894138FFE1;
	Thu, 29 Aug 2024 12:51:26 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 29 Aug 2024 12:51:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724950286;
	 x=1725036686; bh=x6A4LGX/1vq2toB9ZhoQhgcOMtPHQMbLf4ivt2Pc0Y8=; b=
	LrR4rM16qTHeUG0TR/OCWM1AVjei/lRFYMYz6z2+hvZEcFJxXrAxXBRdhHnJNW3Z
	nNDVBFHQrEkF2MNqsJ8zC9iHruIIgrzTJIs7KSBKYQYCLKvZuIi8sa1lvxk7UHOK
	sCtFFlcPlP4Nw7CVIbdGgOmu8a2rysIzEfmhuZAV2Kxy0n2R8PCdjY5lHkFi7Oof
	DWb072YMBqtK5mzQ190Y3FfQSFr3+L9PI8MhXraWMLvB4jNPzIOwP2re+Z6IZewr
	oUT3E2+R9mGodb0m653dyD9xhaDWvB8XMNWTrD6Tir7iEQPNpRMP3MeQPhVFwP6w
	JKlKzhwsQyFz5GhBA4pNHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724950286; x=
	1725036686; bh=x6A4LGX/1vq2toB9ZhoQhgcOMtPHQMbLf4ivt2Pc0Y8=; b=R
	mD1ZbyTD0N+glOtwK2VWL/1M4XpUzNKqB94KqwHAF99PskJx4ddu6FVRTG0bneLt
	Qr9GemOxGep/ACZx7mGmDsOTAeLpB6z4+msGFiV3YkNSeouA16/UTxQU+TmINCXU
	g/kNyD8iE9AAkMkDB7W93+l0HGQ8j4hmpE1PXnTKj64PezjOejbs41BeMGVsgBpu
	tldgte1qdMjqYpV9wuYs2h8kFjzSGFGKLyr6K9yRxf/1eax7sNyWXGFYGvPtQp9F
	2YVxZdzfdPfmQ3PkieBWDkZzh0T9mwln0Y3BBoZC7Nv2rxmPn/TWZ9uWxspENRbG
	2aCvDdYftcCleSnUq6DFA==
X-ME-Sender: <xms:DqfQZgw7muW34ruJF_g21G7pJpzc0kiJXHKe3ocMffUrcL68j0dVYQ>
    <xme:DqfQZkQIvnJZWDSKUP9KawFG0KZeu0CbOC5id4TYI-D-bVk8y4u5r9qU7BT_88acE
    hPhUH3aGqq1zSC-Ng8>
X-ME-Received: <xmr:DqfQZiX1ZiSGGQl0cOaies-XZbpSxMyCcarPZrsj9P2gT9WljbssrP1hWJ8WZF64DUV_bi9PMSY9Fy1oFEnHVIEeHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefgedguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmtghhvghhrggs
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptgho
    nhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhkhheslhhinh
    hugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehsrghkrghrihdrrghilhhu
    shesihhkihdrfhhipdhrtghpthhtohepjhhulhhivghnrdhmrghsshhothestgholhhlrg
    gsohhrrgdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrh
    hnvghlrdhorhhg
X-ME-Proxy: <xmx:DqfQZugKFVnthM3idOtsjmsdAFUCf4vwahcmysQsZqKnnHfGZcPbww>
    <xmx:DqfQZiDZ5U8YOLeHw8y4TlrLB3AvL5T1_juk5UsGBA0WA-HLAMmOgA>
    <xmx:DqfQZvLOVvAEZseFFFYhpxwKotgJpmaKAgK2oqdWVMXgEFLXIGQWew>
    <xmx:DqfQZpAamWj9Ew3P_KIaRBU5Yvnj8ktVywYMiR8u0xMS29J_38kS3A>
    <xmx:DqfQZu7eAHEwdalHF8hMQzHGgeb6sGd0U-uomV5z3DvObvkAoOXvuGXz>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Aug 2024 12:51:25 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
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
Subject: [PATCH v3 2/5] media: staging: max96712: Remove device id check
Date: Thu, 29 Aug 2024 18:50:48 +0200
Message-ID: <20240829165051.2498867-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240829165051.2498867-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240829165051.2498867-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This check is incorrect and checks the wrong register. Furthermore there
is no documented shared device id register for MAX96712. There might be
overlap with the soon to be added MAX96724 device which do document such
a register.

However as the check was merely a precaution and to check during
development that the driver could talk to the device there is no harm in
removing it all together. A correct and more sophisticated check can be
added later if there ever is a need to differentiate between different
versions of a device.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v2
- New in v3.
---
 drivers/staging/media/max96712/max96712.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 6bdbccbee05a..07f353f60e71 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -16,8 +16,6 @@
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
-#define MAX96712_ID 0x20
-
 #define MAX96712_DPLL_FREQ 1000
 
 enum max96712_pattern {
@@ -40,19 +38,6 @@ struct max96712_priv {
 	enum max96712_pattern pattern;
 };
 
-static int max96712_read(struct max96712_priv *priv, int reg)
-{
-	int ret, val;
-
-	ret = regmap_read(priv->regmap, reg, &val);
-	if (ret) {
-		dev_err(&priv->client->dev, "read 0x%04x failed\n", reg);
-		return ret;
-	}
-
-	return val;
-}
-
 static int max96712_write(struct max96712_priv *priv, unsigned int reg, u8 val)
 {
 	int ret;
@@ -438,9 +423,6 @@ static int max96712_probe(struct i2c_client *client)
 	if (priv->gpiod_pwdn)
 		usleep_range(4000, 5000);
 
-	if (max96712_read(priv, 0x4a) != MAX96712_ID)
-		return -ENODEV;
-
 	max96712_reset(priv);
 
 	ret = max96712_parse_dt(priv);
-- 
2.46.0


