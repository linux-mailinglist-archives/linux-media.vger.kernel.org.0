Return-Path: <linux-media+bounces-41268-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA98B3A5B2
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 18:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4F1C1C87225
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 16:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A4C29992E;
	Thu, 28 Aug 2025 16:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="LrpWPz9I";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SxuzDxPb"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5160283682;
	Thu, 28 Aug 2025 16:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756397298; cv=none; b=Ld/1wRdZ9gAxxU2NsEezBSQxcBG5UvPaTfoxBZj6TwsLBiv3oGsLjHVRpdBo5eCNyzCUtmYuIogTykknha+FC8dZplFvm+sNoipT/tiWpdDnSUVRBiuCesYsSnhd3D2KMEna3C9xVk82Jzqe52tIVO6rkdnOfT9FHUGejbXc49s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756397298; c=relaxed/simple;
	bh=b/LnpskgQPV15S71m1V/5Bonxy0bHmaq98KjFJi+XQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gUuDEFXOw3M36MX1ey69odUtfVP07uv/2norBu6yshtgrIYY908psyGXb6LmeJyy+UpP23VCEAcACv31NoCAbEBFBXgPCGcypm+0eB2S1h+eL1PULzZ2IqgLxW1D3fGO9S7E0iEJrVvAb3DbFTy2QCbTLNt+J/fOQA3n+bSE9NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=LrpWPz9I; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SxuzDxPb; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id BDC317A01E6;
	Thu, 28 Aug 2025 12:08:15 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 28 Aug 2025 12:08:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756397295;
	 x=1756483695; bh=ziIy7q4mBFefeCnH73xKTWuwUJnVXZuJE/sZyi5wZ5U=; b=
	LrpWPz9It9yNQrTQOhSfuUkwV8qMjmzPJPG3bpUULvANteIw5XUi8rtoGsLs4WPZ
	9Os/p0sRXwI+morp8D9U49qpcwaxxO0vywRNetlqm6W//tAdb9QqSflUExd0jnDn
	odJRkgB7qgPpev3JQTQyCK/WE1G1Ft+FWsiLeJOBrhTA/U/LRzz4IBYBxeOP7XHQ
	5Lvq5nvgD1ll5DH/WH3fU4Tu+k3dl0Qi3rhxhg/wMPTTsuIJYyPKyyrCPnVt056U
	DOKWkOllf6frypS2xM4wLx3tia+iAbGeUujKeOmT7O4rIhIM6qCalL19C+7tba44
	B4OGGuukMsUB8BMOKhUrLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756397295; x=
	1756483695; bh=ziIy7q4mBFefeCnH73xKTWuwUJnVXZuJE/sZyi5wZ5U=; b=S
	xuzDxPbUbQzoIQELDq6tOuugu7HJviCyaq221pnvS1ka0h1C0zDdssBkOgyuhSc2
	srccPNT0YiHYFgoaJgYMJtYel/G//iH9MLYZ4uxX8TRCad9HGrQOSJ34JO6bdWsu
	ltA80IqYX/YeODyuDfBYYsPoiGrGJ6xkeAkvuX/ZEfHx89R07Ki+vddAaQ5Ux0kF
	hWHcudxGsRUHV8s9zWQErZh4whdbZHlGVVfQ14wckuu+iq6zsLt9Lx+9A5ORlIAq
	IlPl6ZiRMyicKS4JafLfr+irWFMcgp7qDzbQCfxKGiY2qc+45dshJPhNUydECxqr
	g9HcjmY/N9NN8aOWLTEew==
X-ME-Sender: <xms:736waEfMj055JeZnekHwJBXOKDLws8ycPzK-FEvKqqNjktBSwITIeQ>
    <xme:736waKCY6s_UkvvqeK9TmLE0bwi1Hghl5Px0sPWBVFRBu19Uw7MlbNFHo2f1d_-bi
    MGXLKW1DZGMrYYwWVc>
X-ME-Received: <xmr:736waOkb0BHmLB_COfxG1qwA2f0XcqWOgTCYNBlLtBWmGgq3UU5MFt3QUeMVJxm314hnTmxj5rDgznhfyfqGuDerww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukedugeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeejpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehlrghrshesmhgvthgrfhhoohdruggvpdhrtghpthht
    ohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhhvvghrkhhuih
    hlseigshegrghllhdrnhhlpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhht
    sehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguih
    grsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgv
    shgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklh
    grshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:736waNeTVcs0Dc3ZNnjddQmxOHvXWQCcxzpC3mb_URGhZFfFnkYRdw>
    <xmx:736waKQX4MAA4eZRGFEuEmJFI6WmZbAtfzlVa1WeND6_srOWoADXHg>
    <xmx:736waMsmZAvd4f3Wbmbr8qkL31mOuMrypcQKipnTJolTHlzevE-Gqw>
    <xmx:736waDcEjBYrDgPrkFTmQpHyLXjvPfyBIgD2__c6gtGzQAShXov9WA>
    <xmx:736waNDL6m9RT3okKWKhGk29DeEPwIFOUYWbqdKUNcmbA5m2XQAUCoe2>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 12:08:14 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 06/11] media: adv7180: Power down decoder when configuring the device
Date: Thu, 28 Aug 2025 18:06:49 +0200
Message-ID: <20250828160654.1467762-7-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250828160654.1467762-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250828160654.1467762-1-niklas.soderlund+renesas@ragnatech.se>
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
 drivers/media/i2c/adv7180.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 8409ee9acc4f..0bc608291df7 100644
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
@@ -887,6 +884,13 @@ static int init_device(struct adv7180_state *state)
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
@@ -927,6 +931,14 @@ static int init_device(struct adv7180_state *state)
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
 
@@ -1457,10 +1469,7 @@ static int adv7180_probe(struct i2c_client *client)
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
@@ -1568,11 +1577,12 @@ static int adv7180_resume(struct device *dev)
 	if (ret < 0)
 		return ret;
 
-	guard(mutex)(&state->mutex);
-
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
2.51.0


