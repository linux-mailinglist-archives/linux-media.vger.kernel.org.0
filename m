Return-Path: <linux-media+bounces-16928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0F7960BBC
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 15:20:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7768286D21
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 13:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA741BDA91;
	Tue, 27 Aug 2024 13:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="gkDObz1g";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fkfqwuhH"
X-Original-To: linux-media@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52E81BF7EF;
	Tue, 27 Aug 2024 13:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724764829; cv=none; b=Bux6/qcmZqftMYKs5N+hQ2Vo6jBo5rsZ/LBqEyuoTuhzBnVa8hZrUctciL0d0gAdeHn8fEeuN1sU6KkqgGoJ0uzKLrrWiZGTPJ0vGhruAbJOuVn8Jo4ssvQz4JYUDlAjuUEWWdBMbOvDXyCHi2eYcnElQHFgC3kKHQzC7ucMcng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724764829; c=relaxed/simple;
	bh=W6yDp5EUASM77VD23KjsnCX9DE0gSIiDZt0v6YUlQkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OIlGKhBioGgIfySSJwCJ/WtHPBX4OoyhtMSbXw1dIz8ZrfOtuRMa1Z0c64+IrfsfBzlC/VqoMhZfrkb4zS9aBYj8Wmbgu3sBCDa/YbKWa3LEfSBtDIRAH5Er8HHmnz2hcnUjqieKSzoCXpMu7dT8Q18bJPo4Qi3l2OC+26gVoZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=gkDObz1g; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fkfqwuhH; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 2DA4A138FF62;
	Tue, 27 Aug 2024 09:20:27 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 27 Aug 2024 09:20:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724764827;
	 x=1724851227; bh=IpMMqN+5JuKt3dBvPn3s8nLCPqj7JVPQJghGrL04Rzw=; b=
	gkDObz1gn2CLooZldeBI/GpuNLTxX5Uo5PtjkT7rSbHJwrcmXj/GU3XfXD+0HY8z
	Zj94YZGQZu2teDtkBUPIgIbHhdk/SH+ZQXXiUEtzfg3CzCGUN6fWLsLKFUUqC4SZ
	WEjsorRcVHADR9QzmzmrR1AipkF3hNqS1EtT31FMKGz237ZSXzjfHTSC78aRbSt9
	PmmGS8slNu9KfGPBWPoR6Ud8lJp7LtM/8uuxH7ycKY3Tg5RKm8G6ojGSVoWtul+B
	H7q3xnP8TPqhUo55akBaRQcsIgPIPvobq41MFOzcoXcJkBqHwUEblw+EwDB7Ah9M
	bn9F3ARs1isjpb0LOYT+/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724764827; x=
	1724851227; bh=IpMMqN+5JuKt3dBvPn3s8nLCPqj7JVPQJghGrL04Rzw=; b=f
	kfqwuhHOZ9TJ/av/3jRhxH3jcniUtmqPqoYvXHdhMCsXdP+nTiwODYbV4FoaGZa6
	I/XjKBFkePJ+W6d7gGlcvUmg/kmwiqFQd9DXzyLx/W5NJS4n1aH0Iku12g36Jhbg
	r8q0AnaRvb1VDiS3pz5Ywop+tSzbqMuXIh3ObO5O4kgW+/tlL0opkkcd9CKUAvc4
	LRwt5vQWaJUP5gTPV1X+OLsPmz7dbfkvW+k1NsjNkleJebtF5u1lC111B17ZtdRm
	runcLuKlr+2j9Dbf3NOAHseM9LRZtxFUX5pCn+u8OMC+b5uExNuksOJUZoU9xmjR
	1KbUWzO3lTlwFDnKzdK/Q==
X-ME-Sender: <xms:m9LNZhy3zPcMFxSNQt5yLjhboac4PymzuwZs8VLcjGBiJM-4eZar6A>
    <xme:m9LNZhQ7c8zlbg6Pr2JSSZYr76FPbUVgaXQwXEJaST5CgWA0B9l_s9u2Z4XIDdVnX
    gLyMrPHIlAN6MY4JfU>
X-ME-Received: <xmr:m9LNZrV39FkDHt4OjMCIoyDeLLhLrd-bmHRi7S90fdF9qrV0dgWWCsFFOOI7YEWmGS9r3xAEVSDqNUylGMUE0fCUsQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeftddgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffle
    efgeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhn
    ohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgkhhhsehlihhnuh
    igfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirges
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsthgrghhinhhg
    sehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqrhgvnhgvsh
    grshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:m9LNZjgCY4bfwFu-RuSPOp1VhVCtqjJ-yC5FWRRmk7h6WQoyIBqwvw>
    <xmx:m9LNZjAGCgSrCzE6QQtkQLz5GA4rAe74Tqu6IJ6sihtC-10XbYXfHA>
    <xmx:m9LNZsJe-o6EIkCaTp477ol3NljSa3CEqf07TOVrYV0xikB1wvQ_zw>
    <xmx:m9LNZiA2MtsrzZySGJweYxIuBUve9S5hoDmS99uTKcqnxTAefWJ1Gw>
    <xmx:m9LNZn6Evnj54pMfwx9JTh74UiZtAuvM-Qy1ec6XlDkReGGs3KRSKOCb>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Aug 2024 09:20:26 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 2/2] media: staging: max96712: Add support for MAX96724
Date: Tue, 27 Aug 2024 15:18:41 +0200
Message-ID: <20240827131841.629920-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240827131841.629920-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240827131841.629920-1-niklas.soderlund+renesas@ragnatech.se>
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
* Changes since v1
- Group in series together with binding.
---
 drivers/staging/media/max96712/max96712.c | 26 ++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 6bdbccbee05a..6bd02276c413 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -17,8 +17,10 @@
 #include <media/v4l2-subdev.h>
 
 #define MAX96712_ID 0x20
+#define MAX96724_ID 0xA7
 
 #define MAX96712_DPLL_FREQ 1000
+#define MAX96724_DPLL_FREQ 1200
 
 enum max96712_pattern {
 	MAX96712_PATTERN_CHECKERBOARD = 0,
@@ -31,6 +33,7 @@ struct max96712_priv {
 	struct gpio_desc *gpiod_pwdn;
 
 	bool cphy;
+	bool max96724;
 	struct v4l2_mbus_config_mipi_csi2 mipi;
 
 	struct v4l2_subdev sd;
@@ -120,6 +123,7 @@ static void max96712_mipi_enable(struct max96712_priv *priv, bool enable)
 
 static void max96712_mipi_configure(struct max96712_priv *priv)
 {
+	unsigned int dpll_freq;
 	unsigned int i;
 	u8 phy5 = 0;
 
@@ -152,10 +156,11 @@ static void max96712_mipi_configure(struct max96712_priv *priv)
 	max96712_write(priv, 0x8a5, phy5);
 
 	/* Set link frequency for PHY0 and PHY1. */
+	dpll_freq = priv->max96724 ? MAX96724_DPLL_FREQ : MAX96712_DPLL_FREQ;
 	max96712_update_bits(priv, 0x415, 0x3f,
-			     ((MAX96712_DPLL_FREQ / 100) & 0x1f) | BIT(5));
+			     ((dpll_freq / 100) & 0x1f) | BIT(5));
 	max96712_update_bits(priv, 0x418, 0x3f,
-			     ((MAX96712_DPLL_FREQ / 100) & 0x1f) | BIT(5));
+			     ((dpll_freq / 100) & 0x1f) | BIT(5));
 
 	/* Enable PHY0 and PHY1 */
 	max96712_update_bits(priv, 0x8a2, 0xf0, 0x30);
@@ -181,7 +186,8 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
 	}
 
 	/* PCLK 75MHz. */
-	max96712_write(priv, 0x0009, 0x01);
+	if (!priv->max96724)
+		max96712_write(priv, 0x0009, 0x01);
 
 	/* Configure Video Timing Generator for 1920x1080 @ 30 fps. */
 	max96712_write_bulk_value(priv, 0x1052, 0, 3);
@@ -303,6 +309,7 @@ static const struct v4l2_ctrl_ops max96712_ctrl_ops = {
 
 static int max96712_v4l2_register(struct max96712_priv *priv)
 {
+	unsigned int dpll_freq;
 	long pixel_rate;
 	int ret;
 
@@ -317,7 +324,8 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
 	 * TODO: Once V4L2_CID_LINK_FREQ is changed from a menu control to an
 	 * INT64 control it should be used here instead of V4L2_CID_PIXEL_RATE.
 	 */
-	pixel_rate = MAX96712_DPLL_FREQ / priv->mipi.num_data_lanes * 1000000;
+	dpll_freq = priv->max96724 ? MAX96724_DPLL_FREQ : MAX96712_DPLL_FREQ;
+	pixel_rate = dpll_freq / priv->mipi.num_data_lanes * 1000000;
 	v4l2_ctrl_new_std(&priv->ctrl_handler, NULL, V4L2_CID_PIXEL_RATE,
 			  pixel_rate, pixel_rate, 1, pixel_rate);
 
@@ -438,8 +446,15 @@ static int max96712_probe(struct i2c_client *client)
 	if (priv->gpiod_pwdn)
 		usleep_range(4000, 5000);
 
-	if (max96712_read(priv, 0x4a) != MAX96712_ID)
+	switch (max96712_read(priv, 0x4a)) {
+	case MAX96712_ID:
+		break;
+	case MAX96724_ID:
+		priv->max96724 = true;
+		break;
+	default:
 		return -ENODEV;
+	}
 
 	max96712_reset(priv);
 
@@ -463,6 +478,7 @@ static void max96712_remove(struct i2c_client *client)
 
 static const struct of_device_id max96712_of_table[] = {
 	{ .compatible = "maxim,max96712" },
+	{ .compatible = "maxim,max96724" },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, max96712_of_table);
-- 
2.46.0


