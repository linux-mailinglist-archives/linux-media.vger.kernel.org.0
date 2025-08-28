Return-Path: <linux-media+bounces-41273-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9E1B3A5C0
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 18:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE8551673D8
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 16:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0361F28980F;
	Thu, 28 Aug 2025 16:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="YSdu8507";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gKB7u7xo"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68E72C2374;
	Thu, 28 Aug 2025 16:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756397310; cv=none; b=Af91Ph4ToCYg4QmeZX6po+nl9oZPLSrzNrsGahkiELHS2j3x5wvxYVLOVOGamdbJDy2yrIYq/D+HrRBluz0KXAM+usYhZ10dPgeEZjEdXaLqLpItYQZs881xxNfNEk51MjKxpo41CXPfG6zec1l91CdNDtZa/UvTgbOEoL25Lyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756397310; c=relaxed/simple;
	bh=VJfn+oYYSy4ZA3gD/v34MccuM8z6wCCXGEg2ktmhxn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iikfyxUBb3DSCg62ezOBh95B1GY6ECYEEsRrRX3wqLDiHcWMNfDaocHLmpbWL8Vxn22uODZSomrQpb5SI51qkVh9xUWxtBP5Tvg+RjRWKmqWMzUl2BRtMIne3Yaw0iap2cnD6nkKjzTibXY7OMgnvYaJvfZez0TrKtcVV+totFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=YSdu8507; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gKB7u7xo; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id B640D1D0017C;
	Thu, 28 Aug 2025 12:08:27 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Thu, 28 Aug 2025 12:08:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756397307;
	 x=1756483707; bh=y5BVgo3OvyYLOab0BxHeSijM5P7vg3KbiuQ4Gr8Z3eU=; b=
	YSdu8507rv++pX1Qiyr2f5ng9/tlWhyxIiTvbutc3IMJdZ5ldan792/mD3vjfIFM
	Y+oVCSwG+SdUObBY7TuFBHQ1XZ1zOoBb/BnDu5eCZHmjmDgjMdT7tAWIaK9TdcvO
	RptzEQXIg38VTdOBRUXR25tW2rSxrTgXyivwazZ8GY6BZnni5TIeJgnZenEDMdEo
	lLRyeIhcTPX+xtYU5Bct/qVb4CSqUEFhmVTs2FYGXGChoJOjjygkVkgr3NFtdnt4
	DxSneWtCQjYjmFByT9bPkwfcMemfbSKwDx1iVrCQp5dUI1xnKRVKI2FD8sHAWR5p
	sAHPtxunsDzO6ALWAQpT3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756397307; x=
	1756483707; bh=y5BVgo3OvyYLOab0BxHeSijM5P7vg3KbiuQ4Gr8Z3eU=; b=g
	KB7u7xoBO26MH8kn3CX5kHnBlf9XWKfO06ilGikkQaUkAZn6G69rS6e6nrHGgGz5
	mf73sk2zhiqjR+1qEJ8zLrjTPuXAsQ2blHWnRzzajnWeAVY+DU8V28gkSIjLsz9e
	qaCHacYwulO9+IaOz9VJsMSmWmtLq5+f+5+TMwKYl9/c9btVS4psV+56kH7G8wYs
	1qAG6UoYTElP+sz3Vp+c1+e6WwOARp42aflujxmMgdnk7On7lIPw4uigWencG5VA
	AzoWlDYAZjCj3drW5NiY51188g32GolnkZnHx1Ozp13OR9PEHQdVfDZDMuZ7Bcsn
	ky14RRKySgNdins0WWQgw==
X-ME-Sender: <xms:-36waN6KMHi9kphkQWW_3hA8GYpH2RjTRv-SMeJ4ThBMzPPnxXg6jg>
    <xme:-36waOtoy5l7WG8N3ikSzBnmwNSkYRZ6l2lFaIhKD2y4ahnuF30cbENBdP-d2LUOU
    TmYnLSfHjzwF7gxCwQ>
X-ME-Received: <xmr:-36waNgt0BCua9w695w1Ms4GarpFR08YU8hDrYY22Dg4yLafoN4-m6d99GAu8ZzrQM5OO4K8jqcw4WB_9i4finWUfw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukedugeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeejpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehlrghrshesmhgvthgrfhhoohdruggvpdhrtghpthht
    ohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhhvvghrkhhuih
    hlseigshegrghllhdrnhhlpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhht
    sehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguih
    grsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgv
    shgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklh
    grshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:-36waJrwzTji2JOwgSPKGZ1exMFbeLO4oMJt076NN89_tPlp_TYkaQ>
    <xmx:-36waKvIOh599zNhEy7FrdHu4RLxvLA6nYWo0_zizq2san3NzJhQFQ>
    <xmx:-36waMbQgYo9SlMCNci43oz0EqLDkQWDGcKENny0KN5s9W8CtlULYw>
    <xmx:-36waBbmSDp4dsT7OkxLQRtTwdUUoZNMsrmw3gW9xz06atImbWk_PA>
    <xmx:-36waHtdqaDubB9UxdeO4oTw4Dp0dDGFFnw9uiL-3mmy3RiRLmz_AS0u>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 12:08:26 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 11/11] media: adv7180: Only validate format in querystd
Date: Thu, 28 Aug 2025 18:06:54 +0200
Message-ID: <20250828160654.1467762-12-niklas.soderlund+renesas@ragnatech.se>
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

The .querystd callback should not program the device with the detected
standard, it should only report the standard to user-space. User-space
may then use .s_std to set the standard, if it wants to use it.

All that is required of .querystd is to setup the auto detection of
standards and report its findings.

While at it add some documentation on why this can't happen while
streaming and improve the error handling using a scoped guard.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/adv7180.c | 37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 47112b43769d..ca0bdfa9dcda 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -388,32 +388,27 @@ static inline struct adv7180_state *to_state(struct v4l2_subdev *sd)
 static int adv7180_querystd(struct v4l2_subdev *sd, v4l2_std_id *std)
 {
 	struct adv7180_state *state = to_state(sd);
-	int err = mutex_lock_interruptible(&state->mutex);
-	if (err)
-		return err;
+	int ret;
 
-	if (state->streaming) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	guard(mutex)(&state->mutex);
 
-	err = adv7180_set_video_standard(state,
-			ADV7180_STD_AD_PAL_BG_NTSC_J_SECAM);
-	if (err)
-		goto unlock;
+	/*
+	 * We can't sample the standard if the device is streaming as that would
+	 * interfere with the capture session as the VID_SEL reg is touched.
+	 */
+	if (state->streaming)
+		return -EBUSY;
 
+	/* Set the standard to autodetect PAL B/G/H/I/D, NTSC J or SECAM */
+	ret = adv7180_set_video_standard(state,
+					 ADV7180_STD_AD_PAL_BG_NTSC_J_SECAM);
+	if (ret)
+		return ret;
+
+	/* Allow some time for the autodetection to run. */
 	msleep(100);
-	__adv7180_status(state, NULL, std);
 
-	err = v4l2_std_to_adv7180(state->curr_norm);
-	if (err < 0)
-		goto unlock;
-
-	err = adv7180_set_video_standard(state, err);
-
-unlock:
-	mutex_unlock(&state->mutex);
-	return err;
+	return __adv7180_status(state, NULL, std);
 }
 
 static int adv7180_s_routing(struct v4l2_subdev *sd, u32 input,
-- 
2.51.0


