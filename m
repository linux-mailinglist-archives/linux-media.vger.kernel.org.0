Return-Path: <linux-media+bounces-41269-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B666B3A5A6
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 18:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B00E7B72F4
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 16:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71527285065;
	Thu, 28 Aug 2025 16:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="MwAQkrog";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iyKgoadd"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB4729A9F9;
	Thu, 28 Aug 2025 16:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756397300; cv=none; b=onZm9LJi0MEPeIfkLroq/BNHlxVnsbJlwcP89YnZJ/H6TYYNPfOYktLvN6Y6z7fS4DABYprac0B7GK5R2irz1tF0SsLxJjVnbfpVPEz1htZ4610nmCiLGBNrApuVveiP6+y/Xr6o9+ZQ7B6mPQOTpoCq3+lz5HZOq33NTFWqS+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756397300; c=relaxed/simple;
	bh=iFvauvFDgtV93tmFhoaXT7TMMdrQYPesY3GGHzj4V+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SKreJjnKmzu6wZsTV3Iy8PmRUwf/+mPl3JHF0VSIuSj+h3A1KwI9o8f9HVH6IkAGUUS0aWRRLDswuSueV2uWIKVz6SSz46digZnUR0QRc9HwxaCFloKPv1Nj1OJtmqBxAAdSltzJj6QK/5D2OlVblXcL3ZAJvX8Xnz9Fe52ObLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=MwAQkrog; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iyKgoadd; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1EA397A01D0;
	Thu, 28 Aug 2025 12:08:18 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Thu, 28 Aug 2025 12:08:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756397297;
	 x=1756483697; bh=dx6wH2fSV0XysyUWX5ynvlSK+t31ryjB7eRHCIzHY9w=; b=
	MwAQkrogI7iBxNtNFhlRtZYXzVQS1bUBgYKipgwfoEtqxtg62sorIdy4SDQFOUXE
	xY8xPbVqEXsCZQyCYaHDZEKXjGbhRa4naLb0PoX1n5CYsH0zCzHWCTtTZ7J99SkZ
	9A1XVCyJl7/tk/FlGS7T4bZXHSw3W119+QXcSlIpeHh8twhXFthqgTODjdSLCGWc
	bRoKGdVF7R28yL+fFrJRjKBM7Qt8gotfNq0rEqUF4vDm7SDBVnepF5tp03VfxN/g
	uZ8ASL8lZ95gUHnKUnrx15Q3cWcrgO3/XMUyzRUqYdyAWR/W/aiZvfBMyYhZeqK2
	kxcZr4Mk+9yris02oGPyRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756397297; x=
	1756483697; bh=dx6wH2fSV0XysyUWX5ynvlSK+t31ryjB7eRHCIzHY9w=; b=i
	yKgoaddWYBGswAUcF1w/xz6ulPWSf06fMDRk2ThGz8mvabTs7aokP2qKr7xX2AbN
	CLFoG+0OOXuIa69ZegxqX75gj+lNPfiEafb8Wx1fkb7QHeKNe132mh/5r9aJ4OyP
	wLTaYwiCzmi1xsm4p5vdbETLcram2puG9aS93Z31nPAR18ROKrEqlFsAbmSt6TwV
	Z+SOth1Dn9cZw+V6mmXOhccZiHaFSghKIjndWGV+Snsfrda1wx9XXLkqkLsh8CtN
	U5gbq6OSXdUvdgKhFOmLIag4ouQ6VzGXH6nc7tPWdfVsfz2aLeqIp+H0yh2OMUOV
	CKC748De7tukbhmiqdhHQ==
X-ME-Sender: <xms:8X6waHgkpRa_pfLKxddjG_VTleyNx47kARrPwYrY-58OssCRgIxAuA>
    <xme:8X6waH0rafkliAmShr37i7hWsrJOz98CzS119Th8g1sZVL1JmrZ-0cvkr_slmYuQm
    d7N7I2wRzH7H_-FUiE>
X-ME-Received: <xmr:8X6waAIyY37CRtlJIJou5zqtnEkH7QS2NVd2smKfaOkUwSxYJdpZIhUtVhaJ5YmjlQe6CFlQ37hi33bHd4H2LhrFFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukedugeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeejpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehlrghrshesmhgvthgrfhhoohdruggvpdhrtghpthht
    ohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhhvvghrkhhuih
    hlseigshegrghllhdrnhhlpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhht
    sehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguih
    grsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgv
    shgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklh
    grshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:8X6waHxy3DjrOFNotcA7CoB6NMtf_JeLJJEydGE1z15bJP_g2GQiBA>
    <xmx:8X6waOUhceUhbTMg_0qIDCxsYE21ACxuxWl9d2IhMa8Q2iQFbkilvg>
    <xmx:8X6waHjqR745ZsZXBpknLmo-LjQOXLZSo7oDdOPCa3YFxD6saktFvw>
    <xmx:8X6waODCz0ylvv8p_2kiFgHlF8ILHHflg6LauW7MC71NQ6zgYYcXhQ>
    <xmx:8X6waE1CNlBr9MHkTrsHtv63guENTQ_7YH9NRFcP7YHSOVfBjzrdY11Z>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 12:08:17 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 07/11] media: adv7180: Split device initialization and reset
Date: Thu, 28 Aug 2025 18:06:50 +0200
Message-ID: <20250828160654.1467762-8-niklas.soderlund+renesas@ragnatech.se>
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

The two different tasks of resetting and initializing the devices, and
configured the video formats are grouped lumped together in a single
function. These two tasks are then only performed at probe time, or when
resuming from suspend. Configuration of formats are then done directly
by the IOCTL callbacks, such as .set_fmt.

Prepare for reworking the driver to only reset the device at probe and
resume, and configuring all video formats in .s_stream instead of in
each IOCTL callback by splitting the two tasks in two different
functions.

At this point there is no functional change.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/adv7180.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 0bc608291df7..ecec13fee49e 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -878,6 +878,23 @@ static int init_device(struct adv7180_state *state)
 
 	lockdep_assert_held(&state->mutex);
 
+	ret = adv7180_program_std(state);
+	if (ret)
+		return ret;
+
+	adv7180_set_field_mode(state);
+
+	__v4l2_ctrl_handler_setup(&state->ctrl_hdl);
+
+	return ret;
+}
+
+static int adv7180_reset_device(struct adv7180_state *state)
+{
+	int ret;
+
+	lockdep_assert_held(&state->mutex);
+
 	adv7180_set_power_pin(state, true);
 	adv7180_set_reset_pin(state, false);
 
@@ -895,14 +912,10 @@ static int init_device(struct adv7180_state *state)
 	if (ret)
 		return ret;
 
-	ret = adv7180_program_std(state);
+	ret = init_device(state);
 	if (ret)
 		return ret;
 
-	adv7180_set_field_mode(state);
-
-	__v4l2_ctrl_handler_setup(&state->ctrl_hdl);
-
 	/* register for interrupts */
 	if (state->irq > 0) {
 		/* config the Interrupt pin to be active low */
@@ -1487,7 +1500,7 @@ static int adv7180_probe(struct i2c_client *client)
 		goto err_free_ctrl;
 
 	mutex_lock(&state->mutex);
-	ret = init_device(state);
+	ret = adv7180_reset_device(state);
 	mutex_unlock(&state->mutex);
 	if (ret)
 		goto err_media_entity_cleanup;
@@ -1573,7 +1586,7 @@ static int adv7180_resume(struct device *dev)
 
 	guard(mutex)(&state->mutex);
 
-	ret = init_device(state);
+	ret = adv7180_reset_device(state);
 	if (ret < 0)
 		return ret;
 
-- 
2.51.0


