Return-Path: <linux-media+bounces-11951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE1E8D0236
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 15:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0ADB7B260EB
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 13:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D8D16C843;
	Mon, 27 May 2024 13:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="G+MjiFHP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CdYdGbyd"
X-Original-To: linux-media@vger.kernel.org
Received: from wfout6-smtp.messagingengine.com (wfout6-smtp.messagingengine.com [64.147.123.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8D916C6A5;
	Mon, 27 May 2024 13:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816865; cv=none; b=UnSTk6Zy8/O/y8aJOz01f1rqYAnfgmhp3kPYzDIlhYePxNkoTgBdK71R/2tHif5a6QBIF7wQms/K1Y3Glix9N6sOdZqrduk0oY7fz5WO0dIO068ZKTQe1vceEcLH9S+USx1RuOflWgrFoTSmPSMavC8Sd8pDJL6VWlajNMixLmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816865; c=relaxed/simple;
	bh=d+v41JcbajrjvSh/0PWN39VYtQ8YDsJdOOHPujagmso=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mLGXaRrc+Eua3jSifwgDPIvAWs+N4Mj45mZAgG8OJBiUxYICDe+epxRBuC/GdTibFuYtDSQAo05pkvu6v0DK1Ct4hF6JGzQYueMXho2EJ4lkJTXUsNUN84DFcRHLrLDwfwYJ7nSPaatTI27Ic9e2HrVSL+0aVE15EnQjJ+z0NDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=G+MjiFHP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CdYdGbyd; arc=none smtp.client-ip=64.147.123.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.west.internal (Postfix) with ESMTP id EEF241C000EC;
	Mon, 27 May 2024 09:34:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 27 May 2024 09:34:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1716816861; x=1716903261; bh=nh
	ZVIFUNaoYwBoLE4NfSC2jv1TkPZZzgfD9ip6TlWJs=; b=G+MjiFHP7kFd42uKOh
	fNrRGT6NyupbOwxPGl06VqzEVF2NyoOSSQ4gVFrNcoWVHaV+985gxN3JjvYDV2vy
	GK1CRucq4J1OpWg61cbjpaJk00e+i2h9BqFWbyyNX7iwhQxVPAnvzxRUj222zKyS
	cdPxtOmR4540BLoggdAUmNnlRFt+1JRYQoRnp62RR5MFaoND9I5t3ARwDnFSqbhi
	qnFD23v1Gc96Fogt4KpHgsmTL1w/aMfiOLtpPHkbxjmOb3qL0KzayeZD4kNBl3+v
	rOwFyHd9OkcLWr/WhzL5kfzQkQn3UZSXxoFT5J8u1bKbYJnVTZhTsrLDmRN2Bn9G
	eo8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1716816861; x=1716903261; bh=nhZVIFUNaoYwB
	oLE4NfSC2jv1TkPZZzgfD9ip6TlWJs=; b=CdYdGbydK1W+8D9+Y4ZFSO/WQXHQ+
	H4sSKRLFWLg7jQ4TARHBeAuw5sK5u1lJm4AepSAXWeYdWVJccH8Q9C4STCHbNB03
	H1/rJ0gKLSBTKOmx2e3VlGn0/ulVwgTPCe31nAC2Rr690JW6wFn4xLaYuylBhP4F
	wGWcATOA/xdVKFTJAuvzLWsW7aufEQ6sBzviFmoDHjF+DiYVVMJmirkl6ePi7fjQ
	7TBauRtm+iWAXf6xeiRnQWM1B5Mo/Z65PM9TY3PGDlzFIGLANO5lau1hYXND8pNd
	rXizSFwGpdTW2v/bgpXUR0HWxGL6jnIDjF66X4gVV3qbkFVYcHHQkvwyQ==
X-ME-Sender: <xms:3YtUZnrHch-pMhobOhcT48UW55sopT5mn60if9ZqGQNZeFBIBQcTqw>
    <xme:3YtUZhqnhHsX2fMrle-mxMN9Uq2UH8tuiMnAKa6FSAVwdDbLMvtsuRFyPThoYhCMS
    xGDOtW_w_RWsayOwqU>
X-ME-Received: <xmr:3YtUZkPa9FRA49DkvACHYfUUzFzQqf0LYO7QiktUr0sjtbtz8dnOH1E8Pb844VDMwMkCHKOjzGSQiFwvR4rpi9tuIpjIm0gyB1nZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefg
    ffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:3YtUZq6MAL3aqphNFwvJLZCijXmI8yVTglQ6L-MN1RhxWTfkD4kL3w>
    <xmx:3YtUZm7-S8h5AciHaLVHj4IfmA8p0V0lDpQOf8DqjWd97ZIo9UqaDw>
    <xmx:3YtUZijFQAEjAV3xoSDVtKzCe845Q4pspsgOk2fCrHELig-5-lyTmw>
    <xmx:3YtUZo5zM52dssLeXGXtfFdIwCKywpHwkdetz0URpzjq5kO7D_Oydw>
    <xmx:3YtUZjv_aLBdGFcYWh-k-HvVyOx_OhmfZ6H_QNMgKZbZSnxRNImH5pEj>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 May 2024 09:34:20 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: staging: max96712: Add support for MAX96724
Date: Mon, 27 May 2024 15:34:10 +0200
Message-ID: <20240527133410.1690169-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.1
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
 drivers/staging/media/max96712/max96712.c | 26 ++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index ea67bcf69c9d..69a0a6a16cf9 100644
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
@@ -290,6 +296,7 @@ static const struct v4l2_ctrl_ops max96712_ctrl_ops = {
 
 static int max96712_v4l2_register(struct max96712_priv *priv)
 {
+	unsigned int dpll_freq;
 	long pixel_rate;
 	int ret;
 
@@ -303,7 +310,8 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
 	 * TODO: Once V4L2_CID_LINK_FREQ is changed from a menu control to an
 	 * INT64 control it should be used here instead of V4L2_CID_PIXEL_RATE.
 	 */
-	pixel_rate = MAX96712_DPLL_FREQ / priv->mipi.num_data_lanes * 1000000;
+	dpll_freq = priv->max96724 ? MAX96724_DPLL_FREQ : MAX96712_DPLL_FREQ;
+	pixel_rate = dpll_freq / priv->mipi.num_data_lanes * 1000000;
 	v4l2_ctrl_new_std(&priv->ctrl_handler, NULL, V4L2_CID_PIXEL_RATE,
 			  pixel_rate, pixel_rate, 1, pixel_rate);
 
@@ -419,8 +427,15 @@ static int max96712_probe(struct i2c_client *client)
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
 
@@ -444,6 +459,7 @@ static void max96712_remove(struct i2c_client *client)
 
 static const struct of_device_id max96712_of_table[] = {
 	{ .compatible = "maxim,max96712" },
+	{ .compatible = "maxim,max96724" },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, max96712_of_table);
-- 
2.45.1


