Return-Path: <linux-media+bounces-36721-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67429AF8238
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 22:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C46FE1C87A6D
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 20:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925192BEC28;
	Thu,  3 Jul 2025 20:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="mD83IoXC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ch8Qzkn7"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD992BE640;
	Thu,  3 Jul 2025 20:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751575997; cv=none; b=vBml29HasiSjwBsm3jbjup8cxYnK+3cXGE8IPAmaxBSSK0C9OZ8x+EENIpmU/J6d1Y6SxSp+JnN9Tql1xVtz2+ZsjtC45hZINFHATR/gVDngxvVkzyqisialMp/k49ixPFRQEFw7VsbRGMZ/lvR6+JWCa79CMODY/4cZiNysOsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751575997; c=relaxed/simple;
	bh=OeXLzEqaQlY9wqdCqas4VrD8PvXosuXM5X0Fu/ISRdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T71FRhgcpAweeMr7HPTe4DxYnbxW1Lf8vJ63qvO9PyCKzojm15z6wa2lhlbNPRi592R7oPs+NJGjyU/2tBe+10PM3xj4RclmmfF+4Cjrixi2ldm66kh2hD20IYktWB+geSpMjb2CE+JhQd06aaBPapJio1Xldalo3NiS8YPaUNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=mD83IoXC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ch8Qzkn7; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6CAA61400F45;
	Thu,  3 Jul 2025 16:53:11 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Thu, 03 Jul 2025 16:53:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751575991;
	 x=1751662391; bh=+4UGmOSwUtQ3S9Z1iiAVG4MvQv7+iF2fuwZXgXmi7uk=; b=
	mD83IoXC/cNz84NaUOLoUmM6sKNkMbqZ/LDDtfxsLCXm0wrN6CJhkRHst5/sNH1O
	4NIpiNAwjrMce4dc6xU8QM9jVAilRPVaVALBvBLIB1EcBaBy5T73kxEO3BQD/GbQ
	ORVMzDde0vdYQQfTDW8r2SYiXgek1Jw8eE58LH7OzPcMGeD65cIrV64Ls+ltQ/+I
	cVfCUCKivpOZQXSJtGH/YfbYiJSEl7nA2q4DoDZcQ4poLcqSDrn/OmErqSIJ/gro
	f38exrE1rm7Sz1DBnk8ytVrR62+5AUGtnuDFA0/hRqYPbmNqj8L7W3KmHxJCCr7V
	ToNXOviXln1c2+pgzQ+tWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751575991; x=
	1751662391; bh=+4UGmOSwUtQ3S9Z1iiAVG4MvQv7+iF2fuwZXgXmi7uk=; b=c
	h8Qzkn7KifF2RWs5TNSdesjkdkiThqPYsbE1MF2zyhfuLAlBAE44DTPLkK7h+7DK
	vrt4D6T9+7uTy+np8reKsx1Yvq+gUFw2xs53NhSPzGa+NfAlYIiGYCD25dB1G5b6
	4Q7LXiCk+YokvQnw1ZLsyzDN0WUpbiV5Jytu9kb4cOBuKGuECG/LKfhbNfDNBoH5
	Gqk5kKGKq3dNQgLJ1KZ2dvwjhQyUw9BtjB6NRNw7HzdeRKTsJsLbuXy5YHMnl6oZ
	Vhs2Z4XCtDyZac8h2dihyx+UsA9R9rSUq+WtkXoJq4T/kAkUPdzbSiPNPAuaW10L
	JF5dQJhPeHrGV5tVzLF8w==
X-ME-Sender: <xms:t-1maMLFKncBHCPbDcpiIg-Xc0eTTK6McIlK_-1nUU3L7ftDYz-g0w>
    <xme:t-1maMKbsP0jGz_kqAKRoJ0MtdvMoCfnvwkKE9uvhNnBHp1Xp80BSaCRatAkwqVnF
    d06JtoZ19SoxU1sHSs>
X-ME-Received: <xmr:t-1maMv1WnqFGw8XJRznlz747Kk8jJRI5iutv_HjihcEqg9k0oKnMTm41rolBQQEhUmfRneqdFjnQFlpSspNz6PUjw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvuddvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgepudenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtoheplhgrrhhssehmvghtrghfohhordguvgdprhgtphhtthho
    pehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvhgvrhhkuhhilh
    esgihsgegrlhhlrdhnlhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthes
    ihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghs
    rghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrg
    hsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:t-1maJZ1lrcqIdes6LGZCalFOOz3tNH7u6ylVAXgZ6qJA7EckN5S1A>
    <xmx:t-1maDaZQA9NVBK-Ke750ysfNEiua-3x0APIp1qN1cIH1el206zFVQ>
    <xmx:t-1maFBc1hqyibhU23JLWGoQ9jQfoeW5pUL0Gg8y6Oeb_SN9j9b64A>
    <xmx:t-1maJa_kvBgsc60R33r162StHwQwXf0Z3LKPUhFB4MPNkYwa8ssIg>
    <xmx:t-1maBPPpRsU2JXK-kzzYhly-7zJ6TkxN8-ya2xmx5_2ZJy1ggOg1hrl>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Jul 2025 16:53:10 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 08/11] media: adv7180: Remove the s_power callback
Date: Thu,  3 Jul 2025 22:52:20 +0200
Message-ID: <20250703205223.2810806-9-niklas.soderlund+renesas@ragnatech.se>
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
index a6f2bf7caa73..dcdc89b717a4 100644
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
@@ -973,18 +958,29 @@ static int adv7180_s_stream(struct v4l2_subdev *sd, int enable)
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
 
@@ -1014,7 +1010,6 @@ static const struct v4l2_subdev_video_ops adv7180_video_ops = {
 };
 
 static const struct v4l2_subdev_core_ops adv7180_core_ops = {
-	.s_power = adv7180_s_power,
 	.subscribe_event = adv7180_subscribe_event,
 	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };
-- 
2.50.0


