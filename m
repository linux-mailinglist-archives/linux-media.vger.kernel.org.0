Return-Path: <linux-media+bounces-18976-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 071A798D005
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 11:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75AAC1F2188F
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 09:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CE0019992E;
	Wed,  2 Oct 2024 09:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="LMZWb4IH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gKtWGpD8"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AED1991C9;
	Wed,  2 Oct 2024 09:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727861051; cv=none; b=er37hAK6vsMewrOaDv4Cc2gzS+HUZhB8ILmz4g689Bn+Rvjyg7WV4ZaR0piYFaDgPXU/KjM8PYS8Fq8mFEjUeEj8DU6luf1avCm6WyfAAZohiNido/DiO0DPOlY1RRlpmShAwIrkU0Ed8jPaC4zKLD9Ybu9L/evoqceKX89aJR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727861051; c=relaxed/simple;
	bh=OM2EhQyAgBsjJtBVAg9wZVHt+Bi2YXrJBm9DFDO9O7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hBSfnOdtSNgGN5jJjCVCwdlooslcnjo3y1CWqL3BZzhU3J5S8YlmYz6ZMbgtzyGwCI4SRaC85l8OURg39/NoT1I9uqP2MNAZUlhmQrc9+oSMX51C5NXmWJmTyssWMlCnjgLJ/alav+mw46U6kSGhBh7MtxqGVBjhisjX1cP2XK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=LMZWb4IH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gKtWGpD8; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id EB53C1380586;
	Wed,  2 Oct 2024 05:24:07 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 02 Oct 2024 05:24:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1727861047;
	 x=1727947447; bh=1kAPxtP6rXmdSNZapdFIBezQ2V8DVAypLU9JA7zRiMA=; b=
	LMZWb4IHibG5nUyRSKrhq/fByKNszJtuLbdl6ngXTVCEh0f8MVCyNEownL3LfsYw
	zXMv3U8xcGKTRiJAaOhnTNtR5cuB180Jh643D1R0B8Dna+eUNlVpC01ipMLUPG9T
	Fzv2hygN7I8JLVApEBSR9XLhFJ2GKDEGDcCTKG+35rNQDk54DjTOCXFYUXO6NJgR
	hLWSRynVCYLsvIzpsSOkY5AbhJBFTEJ2M4dYxlg72xNN8TOWySg9wURQfaFBH1uZ
	ZWo2nwAfZyWx7GtUqhOYqCOxvtNEIIE5nNTHEsUwoTFb1a9qKY2FJ9q1mR/FQDPV
	XbDDCTTxd6kawH4Q2PdMAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727861047; x=
	1727947447; bh=1kAPxtP6rXmdSNZapdFIBezQ2V8DVAypLU9JA7zRiMA=; b=g
	KtWGpD84CK9czfxQd/l0+lhotAoqxi5C/yuKue2xebiUqSdG6ZVYurlSDBVvDluW
	/HGNigUhz2qZjTGryk+7AKKlyE+Jv5mBHUroT9vqqTna+WMFA0f1255aEGULmwa7
	LqjOOHOsGJQVijzC5oC/R5cFQGuxWAeuuYmhv1QwkQL8UHy2KrVWcVpXU1T+J0g/
	b/uwljUxgBi7UqOOuHQtCl+OLx8a1IqsTec2YxD43j0ZM3TvMdFNp5EYRLe4IHCw
	AXAbPm+UJx3yPEG4VyMcWAXDvyRED0aQbr9kuE3Z/NwqrzhdSO65gJ4P77ynb+se
	e5O7Nwmb9pGX/kpGCXBSw==
X-ME-Sender: <xms:NxH9ZuSsZ26GgspIvI1IxeP2aJDOiyzx8fFiGM7ZpuLkoe4JT_3m2w>
    <xme:NxH9ZjyRn4lbhuzDni-_trIwSTtFfvxrkORtoElSx_odIPm2rwOVox7TtaHSX5ijy
    kFzKjOkXYHmoz8iGAE>
X-ME-Received: <xmr:NxH9Zr0WHdh5kjP9aVFonycP9uzy37Z9LtRUyKcL-Ixht9nzvGA3Up1UgsD5aVNn_epzjRaGhCcmpViboqZGfz1A5A>
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
X-ME-Proxy: <xmx:NxH9ZqDo70fUFg-5zaVqfCQMZDGX_mukRc6GgYCNQNACF49Se_AWKw>
    <xmx:NxH9ZniQ6ZtT2j7NmuPynpUrHn0GohxBjhQ3mX7uQ_8bko405NK4qw>
    <xmx:NxH9ZmrvxPmRoIz4dGY2qH5Vjm3xU6pQUwZ9fafOeGLpmcJVHGhfvQ>
    <xmx:NxH9Zqi9SFy8QdqSbI1XHL72c-rzVO3-ulCy7kmJUQZ7rNRX-woSQQ>
    <xmx:NxH9Zn5a3HZwXka704VlHPU1w5SEeLcpCaLyDEcN_8U_ECvcLSX4Izve>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Oct 2024 05:24:07 -0400 (EDT)
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
Subject: [PATCH v4 2/5] media: staging: max96712: Remove device id check
Date: Wed,  2 Oct 2024 11:23:28 +0200
Message-ID: <20241002092331.4135906-3-niklas.soderlund+renesas@ragnatech.se>
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
2.46.1


