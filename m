Return-Path: <linux-media+bounces-18977-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 735FB98D00A
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 11:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6056B23225
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 09:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3977199945;
	Wed,  2 Oct 2024 09:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="VT++f6YG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oPwf8ZrZ"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B751991CD;
	Wed,  2 Oct 2024 09:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727861053; cv=none; b=jp/ZA811SWQ6VndwAhjpyBqa59N0qX1b1v0Qeng2L/JzF+PoGUXcm6A2SslpqaenV+YkpfOV/glEAE/1C5XyS1AGfOPNMw1nQI3s5Z92Dzkf89dslkTSZuKi9V8+i40FR7WJdWHGxhhVx91xPb5bbz6GrZEm9XBggKSWGRAOQx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727861053; c=relaxed/simple;
	bh=n1Tq6EwLFubmL5yxVvROd2zboDfpq20zgtUlCHtJRn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WF9JXxqLo/A53ppK1UQTRhLX4ERvDVm9MAS8JRQMFAfjTQfEe1pz/Hbo0+JQ/WVdQxnGx050E8KKexWXrvpGBwOuvoZkNydhDS2fi+6b1TPNqaMpa8SdkBxwqfgL3MEgQKiPi9ZT8ybZ+eNnY7ZSiNa6QEUHzjTPvKPHRNbga48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=VT++f6YG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oPwf8ZrZ; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BD64D1140222;
	Wed,  2 Oct 2024 05:24:10 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Wed, 02 Oct 2024 05:24:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1727861050;
	 x=1727947450; bh=5F4cM/CSZbGemnfH60H88zETbO0T/QT5GvIZkeQJqXg=; b=
	VT++f6YGBvsAN7T6UXUNzcXaV1dpRm6fyAzGxyNbc8MUaRe5xEG4utNTQ4eW+9Nv
	BVtCCbx6fkBMe6DOxcuqsTz4azsin8slNmTR30OzKAD3lUlJFbzU2KCEo6Ii+K8B
	G5O5nBgDIKYHTYQRa64caeF6i60Kbpatp6uUUE9nMnT/wVJZ8FJy0DCXotgp62o2
	ALu3vzH1s1ojnqDSa8vwKEHv++ql91eiwGkjOOywWEuxwNweO2QzLkLlxaRfJn3G
	vbi9RnDGKptCStLwFSXXJluAJ6mX/z9qkF6gncNhl7YeVFV315WckozhRaZKgUFK
	dkPR9U4qiUGA4xFE4/lRRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727861050; x=
	1727947450; bh=5F4cM/CSZbGemnfH60H88zETbO0T/QT5GvIZkeQJqXg=; b=o
	Pwf8ZrZCXJh7JZnaXjTN7Pv5k2AWdAAA4w67hTjDRDSWqtSjl27c0rKOuKGGTAMU
	u71r9rkwHBR3+p4LwfysvQfzU7y227JSjxaKDw1c7I7Lm4VWXVWrjASSaKFJj5+i
	9Td3K3S2EMGnntHgd9rCwDxdRKn2stGSZTxT6/ks4ZePyi+GUuquTah5dNn8d5u1
	U33FgcoRWaA5W6h7U12RTIg0NAv+PYmW0rWsEVtzxcME0Rr+AZbkvuTGUy0TTDFd
	FY6TyVtYvNtVVPJjjJZfoKrjBYSfD1/C48MKYrFVyj0HY8laPvG7n4Da6axdgqK3
	Kt5kBqCQUmSN9HtMmk2mw==
X-ME-Sender: <xms:ORH9Zrtb2ZrTEF7ULQYL9_bvkx1d6KYAE_5Dg-P-tYpKPy4R_i36pg>
    <xme:ORH9ZscsUDnd3v4g1YWM4NEjKzE35QTQ3BUqa8AworXvpdhfr4yyJvdaJHG517R4S
    ml3QhVkTZdoXUHjyqQ>
X-ME-Received: <xmr:ORH9ZuwyMkDR8uK1EKwWl52g0zYkZ0TxODCg1VLcYmw-VFq1WMC3wYOif2OkPkoEcn-zX_NMhsqPxO5mN4pRoUpByQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdduledgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffle
    efgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgr
    ihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtoh
    hnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgkhhhsehlihhn
    uhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepshgrkhgrrhhirdgrihhluh
    hssehikhhirdhfihdprhgtphhtthhopehjuhhlihgvnhdrmhgrshhsohhtsegtohhllhgr
    sghorhgrrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:OhH9ZqMik03j69oiAJEtERazCJ51vBB0LspOsMQr-iM2QS3ToCnPNg>
    <xmx:OhH9Zr_1S71kQ7y2E1bPHRuBaNZGcPYboQO6k-zlOhXZYaLc515agw>
    <xmx:OhH9ZqXYG4d-v-6zoGVXcccxOCMcTV6UxuLyZtDcEOH8Rqj2UxAT2w>
    <xmx:OhH9ZscNOcwUjCDwGQvqTaFPVVOl-F4p0pMG4s6myBcog7nVim9gmw>
    <xmx:OhH9ZvWIxG5X4ayVnaofV3HZh5HIcx0-dJ04QrTHwnAHuWs3_hawr5I8>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Oct 2024 05:24:09 -0400 (EDT)
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
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 3/5] media: staging: max96712: Move link frequency setting to device struct
Date: Wed,  2 Oct 2024 11:23:29 +0200
Message-ID: <20241002092331.4135906-4-niklas.soderlund+renesas@ragnatech.se>
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

Prepare for supporting MAX96724 by moving the soon device specific link
frequency setting into information structure. This struct will be
extended to carry more differences between the two devices supported.

While at it remove trailing comma in device table, no entries will be
appended after the sentinel.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
* Changes since v2
- New in v3.
---
 drivers/staging/media/max96712/max96712.c | 24 ++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 07f353f60e71..46a6bb018fe2 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -16,18 +16,22 @@
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
-#define MAX96712_DPLL_FREQ 1000
-
 enum max96712_pattern {
 	MAX96712_PATTERN_CHECKERBOARD = 0,
 	MAX96712_PATTERN_GRADIENT,
 };
 
+struct max96712_info {
+	unsigned int dpllfreq;
+};
+
 struct max96712_priv {
 	struct i2c_client *client;
 	struct regmap *regmap;
 	struct gpio_desc *gpiod_pwdn;
 
+	const struct max96712_info *info;
+
 	bool cphy;
 	struct v4l2_mbus_config_mipi_csi2 mipi;
 
@@ -138,9 +142,9 @@ static void max96712_mipi_configure(struct max96712_priv *priv)
 
 	/* Set link frequency for PHY0 and PHY1. */
 	max96712_update_bits(priv, 0x415, 0x3f,
-			     ((MAX96712_DPLL_FREQ / 100) & 0x1f) | BIT(5));
+			     ((priv->info->dpllfreq / 100) & 0x1f) | BIT(5));
 	max96712_update_bits(priv, 0x418, 0x3f,
-			     ((MAX96712_DPLL_FREQ / 100) & 0x1f) | BIT(5));
+			     ((priv->info->dpllfreq / 100) & 0x1f) | BIT(5));
 
 	/* Enable PHY0 and PHY1 */
 	max96712_update_bits(priv, 0x8a2, 0xf0, 0x30);
@@ -302,7 +306,7 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
 	 * TODO: Once V4L2_CID_LINK_FREQ is changed from a menu control to an
 	 * INT64 control it should be used here instead of V4L2_CID_PIXEL_RATE.
 	 */
-	pixel_rate = MAX96712_DPLL_FREQ / priv->mipi.num_data_lanes * 1000000;
+	pixel_rate = priv->info->dpllfreq / priv->mipi.num_data_lanes * 1000000;
 	v4l2_ctrl_new_std(&priv->ctrl_handler, NULL, V4L2_CID_PIXEL_RATE,
 			  pixel_rate, pixel_rate, 1, pixel_rate);
 
@@ -405,6 +409,8 @@ static int max96712_probe(struct i2c_client *client)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->info = of_device_get_match_data(&client->dev);
+
 	priv->client = client;
 	i2c_set_clientdata(client, priv);
 
@@ -443,9 +449,13 @@ static void max96712_remove(struct i2c_client *client)
 	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
 }
 
+static const struct max96712_info max96712_info_max96712 = {
+	.dpllfreq = 1000,
+};
+
 static const struct of_device_id max96712_of_table[] = {
-	{ .compatible = "maxim,max96712" },
-	{ /* sentinel */ },
+	{ .compatible = "maxim,max96712", .data = &max96712_info_max96712 },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, max96712_of_table);
 
-- 
2.46.1


