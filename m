Return-Path: <linux-media+bounces-36718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 496BDAF8231
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 22:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6254F580D3E
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 20:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B3312BE7C7;
	Thu,  3 Jul 2025 20:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="I6VIs9pG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ycz6i91Z"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F94A2BE640;
	Thu,  3 Jul 2025 20:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751575989; cv=none; b=rorlrJq00fUArH8D8gPaNFU6u9Ef5lFhXIoVHPj+QKb7/hj7iHr0Ml4FEa6RhmVG9FSNeM4/g5eV7pWL+Kc4t13HIJOZS95XcHXXLs/VrrVtkI8QyAZz2s3srdA7jmFQj6iOushWo0Sp6j2LEuzxnErDSMsxevAVykAHu42XjW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751575989; c=relaxed/simple;
	bh=tIaPcAzptPKXTT+/oD+IMrTV+UsTEk7VwZLVQSNCsh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tdQlpd4GvvwQCMm520eEPf+AkVh4dETwHAruj/3cELSrBCWYTlgY80oem3EkFbqI2dAkW3sTJ2q7nOrURFSMdpI2WZbS2OdRq7ItHYs/K6rIpRDSWy3x8brvMlQf1DRpYbW8Unllbu73Lgx4eZz8p48AanF64SsHca44UdKASsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=I6VIs9pG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ycz6i91Z; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7400C1400EDC;
	Thu,  3 Jul 2025 16:53:07 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Thu, 03 Jul 2025 16:53:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751575987;
	 x=1751662387; bh=QLWDNLb9bEq/4fdp6tUzs4GRj/ptdO2LM4Pnte2It8Q=; b=
	I6VIs9pGhWmRJTexrI4mPCBrM+BNhfVKYZ37c9xxh2Gu7cC7GV8wisp67QlA98YQ
	5p59MX22MvEDlcDD5EsRBBvfdwR7ep5tQ4tiiZzFnMmx2ml8jpiBGBQZLxSiGum/
	G5AE0/w6dJaLrqimJLAHIG5hniu+U1j9JPOpThzt6vCeXHGiyKiWD2kdWIwG4C+5
	B5PIpC7Q48ezGhd2i5cd/lohq6qkOXxgrAwYtpVHgPhGcDgQq9CY4RUvG9j9SCBL
	fDanob8ycYtpP1adCbd1VfdDjEOrrSzGhq0MyWL4P4O1wuGEjQzOCTPspat5Xwfn
	yYahKrKpcSek/W3thN8ZTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751575987; x=
	1751662387; bh=QLWDNLb9bEq/4fdp6tUzs4GRj/ptdO2LM4Pnte2It8Q=; b=Y
	cz6i91Z8J6jZHmyUJ1vFEevskWB90REo7X4oFubzFrIizfYPx5CX522cCaT5jKUM
	AFsFQPvI0aZkcepWOHnZ8mpIg3h33NW2MBdLCTcmTXs0BZJzJ7ZSm9VlAJiGAavo
	NqUDR1Ql0lFCP6d2oiphX48zTM/T7ZeQSZk4VC/4HfhZORwNfzK7ugGJZ4TM0Xmj
	ium6rmzLoLbd8UGO3Y8SMUuykdzhElKNFrUvV6UKyn80r60JtbNSgBz79jZ/IL4y
	osuQsY6EFVvFouRMb8zzYsQ1s2/fgZSgDTt6ppGyurZnJdpzincThkTEtuU85RCj
	+gpw4i7DgqNw8B+tB8RAw==
X-ME-Sender: <xms:s-1maC_dZqY9Y694BK0xRNXvSEQg5uOgPqmGb0SETFlbp8HdnwRu4g>
    <xme:s-1maCuDzjVkHfSzbyzeV2kR-0utPo12cuZPPhFyKaufgijiO05EsuCb5uq0-4EEa
    wBO_SjE7ghu9FngTbM>
X-ME-Received: <xmr:s-1maIDTyp8yewIG2naWIpVWzEPo7ITDuMva2Ob7UQJxBpU1FIYyN8ZnlIdPtW5GepNi59cybX7qhsHflfa-8BcXEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvuddvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtoheplhgrrhhssehmvghtrghfohhordguvgdprhgtphhtthho
    pehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvhgvrhhkuhhilh
    esgihsgegrlhhlrdhnlhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthes
    ihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghs
    rghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrg
    hsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:s-1maKd5RIKecs_BJu68f7O4hV7ChNy2qNI1-W48Ii4V5bcBHEtJBg>
    <xmx:s-1maHOaqzBcJBj3q_xtKtXno5ecJqiWLhUMI4yDuUcrHqpCMwleug>
    <xmx:s-1maEmxvoIBwZieKfRX5fhpPPio1ZXRO3ZtmAlvPnmf4WhXGOU8PQ>
    <xmx:s-1maJujYi7Vyje_E2N37_AwWzorC0b-rTCDQtcn3TQ8qD1uXkFOng>
    <xmx:s-1maJwLkcNbt12oim7y4LORR8ERoCiMnrKH75Cph1tnhvX1gsqrtKFC>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Jul 2025 16:53:06 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 06/11] media: adv7180: Power down decoder when configuring the device
Date: Thu,  3 Jul 2025 22:52:18 +0200
Message-ID: <20250703205223.2810806-7-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250703205223.2810806-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250703205223.2810806-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some variants of the chip (ADV7180) have it's decoder powered up after
reset, while others (ADV7280, ADV7281, ADV7282, ADV7283) have it powered
down.

This is tracked by the feature flag ADV7180_FLAG_RESET_POWERED. At probe
this flag is used to initialize the state variable powered which keeps
track of if the decoder is powered on, or off, for the resume callback.

This however misses that the decoder needs to be powered off for some
configuration of the device to take hold. So for devices where it's left
on (ADV7180) the format configuration at probe time have little effect.
This worked as the .set_fmt callback powers down the decoder, updates
the format, and powers back on the decoder.

Before moving all configuration to .s_stream this needs to be fixed.
Instead of tracking if the decoder is powered on or off, use the
flag to determine if needs to be powered down after a reset to do the
configuration.

To keep the behavior consistent with the currents implementation switch
the decoder back on for devices where this is the reset behavior. The
primary reason for this is that if not done the first 35+ frames or so
of the capture session is garbage.

To keep the support of starting the decoder when resuming from sleep on
devices where the reset behavior is to start with the decoder powered
off, use the state variable streaming. If it is set the decoder was
powered on when the system suspended so we know to start it again when
resuming.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/adv7180.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 3c7c896a21a4..eab3ae2331fd 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -214,7 +214,6 @@ struct adv7180_state {
 	struct gpio_desc	*pwdn_gpio;
 	struct gpio_desc	*rst_gpio;
 	v4l2_std_id		curr_norm;
-	bool			powered;
 	bool			streaming;
 	u8			input;
 
@@ -556,8 +555,6 @@ static int adv7180_s_power(struct v4l2_subdev *sd, int on)
 		return ret;
 
 	ret = adv7180_set_power(state, on);
-	if (ret == 0)
-		state->powered = on;
 
 	mutex_unlock(&state->mutex);
 	return ret;
@@ -900,6 +897,13 @@ static int init_device(struct adv7180_state *state)
 	adv7180_write(state, ADV7180_REG_PWR_MAN, ADV7180_PWR_MAN_RES);
 	usleep_range(5000, 10000);
 
+	/*
+	 * If the devices decoder is power on after reset, power off so the
+	 * device can be configured.
+	 */
+	if (state->chip_info->flags & ADV7180_FLAG_RESET_POWERED)
+		adv7180_set_power(state, false);
+
 	ret = state->chip_info->init(state);
 	if (ret)
 		return ret;
@@ -940,6 +944,14 @@ static int init_device(struct adv7180_state *state)
 			return ret;
 	}
 
+	/*
+	 * If the devices decoder is power on after reset, restore the power
+	 * after configuration. This is to preserve the behavior of the driver,
+	 * not doing this result in the first 35+ frames captured being garbage.
+	 */
+	if (state->chip_info->flags & ADV7180_FLAG_RESET_POWERED)
+		adv7180_set_power(state, true);
+
 	return 0;
 }
 
@@ -1471,10 +1483,7 @@ static int adv7180_probe(struct i2c_client *client)
 	state->irq = client->irq;
 	mutex_init(&state->mutex);
 	state->curr_norm = V4L2_STD_NTSC;
-	if (state->chip_info->flags & ADV7180_FLAG_RESET_POWERED)
-		state->powered = true;
-	else
-		state->powered = false;
+
 	state->input = 0;
 	sd = &state->sd;
 	v4l2_i2c_subdev_init(sd, client, &adv7180_ops);
@@ -1582,9 +1591,12 @@ static int adv7180_resume(struct device *dev)
 	if (ret < 0)
 		return ret;
 
-	ret = adv7180_set_power(state, state->powered);
-	if (ret)
-		return ret;
+	/* If we where streaming when suspending, start decoder. */
+	if (state->streaming) {
+		ret = adv7180_set_power(state, true);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
-- 
2.50.0


