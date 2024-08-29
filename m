Return-Path: <linux-media+bounces-17161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D16964C10
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 18:52:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CCE0B208F5
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 16:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E5B1B7915;
	Thu, 29 Aug 2024 16:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Sq/kzhv9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="F0EXdgzC"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7F21B78E9;
	Thu, 29 Aug 2024 16:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724950293; cv=none; b=H+d712AXXyYUReXUQ9KfQCyJpQ4yoD/jbd6x+AekwdLNz57r2BVW0nt8UUdH+hB5+7Pm1FCWefzbpfgmQKAaqNR4Po9xrzXL0AN/aRhWSnvE/uYy2XvSaIgMumxXpCcitkdyh6gsyk811ScP5a71iRlE6/Qrj680BMYJinVKEDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724950293; c=relaxed/simple;
	bh=NrgUPGywuCDB0/EY24umhRmDzHlcWj3oseE0HRIwecM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rr3Kn7rkJ/Zq1ar2sddqgbgvJ7/NY7LJP/EuEJaRXSCpWPwPnHgFtg2zxkdaYRRrY+k1JWkhQtAN+oqSYEDdaa8exSyeNq2ybXVBxp2sSgjU5Bq9IpFfojYPYTJRk0nD5Wh38kdNxFZ8mjQPxXir/wtwMVIHFxcD/rgZMACvVrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Sq/kzhv9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=F0EXdgzC; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.nyi.internal [10.202.2.48])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 427E41151AA0;
	Thu, 29 Aug 2024 12:51:28 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Thu, 29 Aug 2024 12:51:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724950288;
	 x=1725036688; bh=LSo5uIuhKP+mGkorF/JzPWpQS//DcSM/BipM4Sq8T9g=; b=
	Sq/kzhv9QkfOLdFW/TSFiRPEDYvLr5RcOsS5GYHpvqV350tO/CxhXqnAHn3CSBtZ
	GRJ4jGdEFygHvIQfGDZcZUMv2dU0avf3v0oDV3Q3iXQyVz8jimjHtt2Iu6rWbqXQ
	XpJmYJZhaKH2+5ON1ZT7NOWqxljFtqvE/VM2QBjasx3EicRRQxeGhVxO0PJGF068
	v4DbpcRLQiuM/J19ys4w1gyJXwUOY6ituxnOYmbHFBvAHRk71jUMssIY1gIojtwi
	lTEEfqqJD3c43MY7M+5H56awg8Czz9ngwfDDZica5JrBj0++78A+ZTz4zje+10Q3
	0LhmVbmXI4LT0gbyg6+MiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724950288; x=
	1725036688; bh=LSo5uIuhKP+mGkorF/JzPWpQS//DcSM/BipM4Sq8T9g=; b=F
	0EXdgzCgM4nU0xAhjZ8B5oioveisUBRcYjtHdCCopFDrteYgNBwoXvaNTQ/k+arV
	seVjkUFSA7xlkL6lBNxBC24u6EHJAWfN2/bb1ATc2k0B4rImyrjpzeK46VJbjvIp
	PE3EszEXHZ2DOdnTNxi20YB3rxtxq1cydtDd1Z/S29G3zyEy2k+DRBy/IVQJ4GfB
	3ykZ4S8jZTOz7A21j2udv/oRRoOxdhkJc7+q9Pq0afyuQJvz/z29phjKdd6CIfNn
	hMYw4j2t3kHRiLYBO4jMVRRVrzkHacONqeNNWzBx8JY9YqH1Xqe9BvrmG1u1AQaf
	+sEUlJs+uUy6SfvmjCgPQ==
X-ME-Sender: <xms:EKfQZuQ1NJ1bojiW9_4-FH-5eppEmWk7N1mf5Dnm7EYaMIZy2fougQ>
    <xme:EKfQZjzmy4WPj1EUSJl3RmYu7XZ_r0Lv4IAeIbxJmM45JP_6DvCYJDZupz8ZBnIbu
    JQ0rOa4fB6kUko6_OM>
X-ME-Received: <xmr:EKfQZr1HW2d5RSJW1YkSF_D_ZCBiQEkPOW1VFsHXdghYcCsLUmE8635m5hSoUOPn3ugBcJW5SsKcWUvEUqPeqyPSbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefgedguddtgecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:EKfQZqDFcFHg4B7XCFXNnGaVtRLuftZRRlA5HK1OcQNqQY0KE1PaSg>
    <xmx:EKfQZnipVSpLTFz4YDUCZ4PgrA0OQMVAa1NVfqBGhJOPbRl4VH3CFA>
    <xmx:EKfQZmqUQcieUSiE4cv0fo5bacJwbPoO8u7Pwo_p_Gn98MZFgEaBzw>
    <xmx:EKfQZqj-mF-68DuX5q5PdKe4d3s2vvZn634V08P5S2uciwByL33sHA>
    <xmx:EKfQZgb5oYLqtfKEMi0abSs-HZ_3kk3g5qw9CUckpIoicKTWiv-6kcxJ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Aug 2024 12:51:27 -0400 (EDT)
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
Subject: [PATCH v3 3/5] media: staging: max96712: Move link frequency setting to device struct
Date: Thu, 29 Aug 2024 18:50:49 +0200
Message-ID: <20240829165051.2498867-4-niklas.soderlund+renesas@ragnatech.se>
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

Prepare for supporting MAX96724 by moving the soon device specific link
frequency setting into information structure. This struct will be
extended to carry more differences between the two devices supported.

While at it remove trailing comma in device table, no entries will be
appended after the sentinel.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
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
2.46.0


