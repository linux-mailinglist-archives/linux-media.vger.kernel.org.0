Return-Path: <linux-media+bounces-41270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B825B3A5B8
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 18:10:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEC50188BA64
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 16:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA1E2857DF;
	Thu, 28 Aug 2025 16:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="rZbHaKdo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NIuBnZTc"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BAE2BE64A;
	Thu, 28 Aug 2025 16:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756397304; cv=none; b=L+p26sw8rHwlEiwmfebE9ygzMAjCxFFjkNv8BUbN2U8l6GwPd/iblLjiAsqeTDVywZEXY2vQHX18MN5COe2XxWZ/liOfkzI9SaHRniBW5yUmFeZ+dx2ac/+w2d+jdHcQNHpfaZcitGZarn3p+D1OEl9BCbrJeYXggNyM+s1+bD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756397304; c=relaxed/simple;
	bh=AqoaHanpGW4lWbOBxHRiaAVksngtQGEHt9v4ZIzI3oc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wn6dB5qJB0w5TwNAfkuTLBNxSQzdY1gXaBik1qz/0omB7DPk4DYAZziYSXj/7/K71Ew3XmeXF/QeufVYds7wTiw0ZJIZypVz1+gmKxmyHUvXBafPttGLLoDbkx1v9pfVkYiOBl9gf+rpcwSB5yVgx/9dli5g5823yJOytum26f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=rZbHaKdo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NIuBnZTc; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id 9B53A1D00065;
	Thu, 28 Aug 2025 12:08:20 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Thu, 28 Aug 2025 12:08:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756397300;
	 x=1756483700; bh=nwVBZO/fwb3wjtODqCgG9berfTs7QHy+TZ6GRGZkrEw=; b=
	rZbHaKdofxmGoRCLWz5lkR0d1RFTuC9BAmxjvUEeBNDWMTKY9Veq19JmKATESjbR
	M/F97gjpOP6xj8fG4YGpmXX5sdeMJVKH9hXzlQJqvVrOt2bC6arGMbTSS4ufr8ht
	jpyaE6/xTj7N1NP/jnrYrg5GpQ5FFWowR5K4Y6QQJo5DI+875yLhoRzrS7H1bl9s
	2xXFgB3EWArHKbxF2ZOeXqw5JxFHQWAGvF6elY995E6BeXrwXwliB6Df52naucON
	7fB5m5EJRRcO6GyBGiPEkIUWQJ0+WNkJiEIQiLFoDnKU5wi4Ei4YvjRHs5Z+fCN4
	v9VTw3zusKkFBa7gM+e4DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756397300; x=
	1756483700; bh=nwVBZO/fwb3wjtODqCgG9berfTs7QHy+TZ6GRGZkrEw=; b=N
	IuBnZTc7iSuFIVkT8BDmu1/sxQRDYNpeNmNNrctk670zMQUun++8nIHJazdJ14p5
	65hVe444T9ReJ3r/H6zum+/SEkT3BBpAYzlXqgnrR7LskLgS7s5BZXBfLNTa2nZk
	Y6P9aSFBdbF6gb8iOAFT4Ht6Zoeu6kqz6h3jjifUOx/XOhpPGnOIYZMQfbP5AYgg
	SVRW3oKo+WLMbEEYkANgmTbgB7PpRz3ATeXTILYx4F7HrGyMqAJKuELytUtnQFX4
	ChBGuAGXGmWpQycGMmEpzdTYouLnHX18mMISDEtQOkBy/Jj2ZB9E39XIfS7o0qIJ
	UQHMdR/SU9duURQ9mBxHw==
X-ME-Sender: <xms:9H6waFcZAkMH4koTbGoy547wUSPFgaDE6eFyRmfRcR0mPV9nAassAg>
    <xme:9H6waHDIkYA5zhmfNmdAqf-bC8nlzAg-1hN08iCLdBWDaUV9WZl9RpObd4OwG5eu_
    aj18r3Nv0V7qU8YwTc>
X-ME-Received: <xmr:9H6waHlXtPG5z3veK5WQmxtCZ55uTflaOJsX30qKy25zvPhTUQ7p9wAspcTWxMdfBAwYlgwGjD1Dp_eScsLfmaUYfA>
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
X-ME-Proxy: <xmx:9H6waCdQxvVVw4YAN3zmqYO2x03JobYKU1_npsVyIvyiQ2MDutebLw>
    <xmx:9H6waLQl0BX80cvqbr3Yj4JuOTMMR4yBaccugetXC7QjlLrLnlXjGg>
    <xmx:9H6waJuD_LjqHOA2JHc0hHgub2HtRAzzZxvyFVwenssqnhUXizradA>
    <xmx:9H6waMdojtNkCDnBiVEckaIx7Kt7hi4LWvsFib0eAhEf1pftVLrJjA>
    <xmx:9H6waKB1cKVIWg-9qDDOUTcYLuY8htNGb1KiOcKzsdRm_8XlJJOr-Fn7>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 12:08:19 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 08/11] media: adv7180: Remove the s_power callback
Date: Thu, 28 Aug 2025 18:06:51 +0200
Message-ID: <20250828160654.1467762-9-niklas.soderlund+renesas@ragnatech.se>
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

The s_power callback is used a bit oddly in adv7180, the callback
adv7180_set_power() do not control power to the chip itself, but
rather the power to the chips decoder.

When the decoder is powered the chip process video data, or if no video
source is available freeruns. When the decoder is off the device i2c
registers are still powered and the device can be configured.

In the current s_power implementation the device starts to transmit
video data as soon as it's powered, and the s_stream operation only
tracks if s_stream have been called or not.

The actual configuration of the device happens when the configuration
IOCTLs are called. Sometimes with very odd implementations where the
decoder have to first be power off, the device configured, and then
unconditionally power on, see adv7180_set_pad_format() for an example.

As a first step to remedy this remove the s_power callback altogether
and instead completely initialize the device from s_stream. Future work
will clean up the IOCTL callbacks that directly configures the device
that is also done by init_device().

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/adv7180.c | 43 ++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 24 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index ecec13fee49e..c8b63c985b69 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -545,21 +545,6 @@ static void adv7180_set_reset_pin(struct adv7180_state *state, bool on)
 	}
 }
 
-static int adv7180_s_power(struct v4l2_subdev *sd, int on)
-{
-	struct adv7180_state *state = to_state(sd);
-	int ret;
-
-	ret = mutex_lock_interruptible(&state->mutex);
-	if (ret)
-		return ret;
-
-	ret = adv7180_set_power(state, on);
-
-	mutex_unlock(&state->mutex);
-	return ret;
-}
-
 static const char * const test_pattern_menu[] = {
 	"Single color",
 	"Color bars",
@@ -960,18 +945,29 @@ static int adv7180_s_stream(struct v4l2_subdev *sd, int enable)
 	struct adv7180_state *state = to_state(sd);
 	int ret;
 
-	/* It's always safe to stop streaming, no need to take the lock */
-	if (!enable) {
-		state->streaming = enable;
-		return 0;
-	}
-
 	/* Must wait until querystd released the lock */
-	ret = mutex_lock_interruptible(&state->mutex);
+	guard(mutex)(&state->mutex);
+
+	/*
+	 * Always power off the decoder even if streaming is to be enabled, the
+	 * decoder needs to be off for the device to be configured.
+	 */
+	ret = adv7180_set_power(state, false);
 	if (ret)
 		return ret;
+
+	if (enable) {
+		ret = init_device(state);
+		if (ret)
+			return ret;
+
+		ret = adv7180_set_power(state, true);
+		if (ret)
+			return ret;
+	}
+
 	state->streaming = enable;
-	mutex_unlock(&state->mutex);
+
 	return 0;
 }
 
@@ -1000,7 +996,6 @@ static const struct v4l2_subdev_video_ops adv7180_video_ops = {
 };
 
 static const struct v4l2_subdev_core_ops adv7180_core_ops = {
-	.s_power = adv7180_s_power,
 	.subscribe_event = adv7180_subscribe_event,
 	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };
-- 
2.51.0


