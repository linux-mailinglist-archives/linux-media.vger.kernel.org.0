Return-Path: <linux-media+bounces-41266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4D5B3A5B1
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 18:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB8841898840
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 16:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA62F28724A;
	Thu, 28 Aug 2025 16:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="gb9CL1P5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="d8+QHjT9"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5533527E7FB;
	Thu, 28 Aug 2025 16:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756397296; cv=none; b=tp01NkJGy7Wv3e5gJ6n8QaeFTakek0WOU1qyHKhNKOvI1maS1Hh5VO5Ar4PuSZHnqNLMGQarWJIS7CS3ZwhfMvFw8xVHCaeu7qlbuRGME98qEpZT+zDxnOQJV9GotKHOxYV2LuuVEzZEr6VaAKz6MV+In0Wvh2ol5AwhtFBLv6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756397296; c=relaxed/simple;
	bh=jnVPRNznxjDgwuNDiSyCXzcT3UR3gg3VlLLzZg+Dnqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NCY8R2n6FmQPyYrEReaK82gmdiyzU8GCMNA2gqr4xjDMWmQkQ6InBcLlD13RU1tbOdQzibVqzp0K5bFIYRh7RaOrLStXm+pJgXt1xj8OhjIMZ/Rq5l/1ylLPn0E4VL5hpw0E+LC5yxR048YVVmttfwQrwNT6wmXa8+rHveBnfzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=gb9CL1P5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=d8+QHjT9; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 621107A01BC;
	Thu, 28 Aug 2025 12:08:13 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 28 Aug 2025 12:08:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756397293;
	 x=1756483693; bh=HHaRGTVk2JXY1NoNjjdd7UT/faquBH+w5rUZ4m7wa6E=; b=
	gb9CL1P59XArEjugFU9x7qd33uS/y6raF9jOtOEaLtCBb0jLTdCqd2Zxz7A9sh79
	7GpzXLjbmI4lms/vum1BRKpRgf+0jVdY6TMOysuoiZyAm1u67wCb3/7oI6vAViUG
	8VJvYfMz70TFBLnjw6/EXWRKQoK80xGeE/kAkVSmL7OPQBlqwtADOg1bIMRUzrag
	muD2D46F4hu4LhjTWurxXy4H5+5WUcvbhv55y1ihRLfujlPBoHpFZax4Ne7qGB/y
	fFhsofFwjZ2kX3jgm0P27DQGzu8YCmTTmLwcqItXMy4IY0zXGIZzMd09iI5IUVBx
	3HBKfSLPZm1TAeso0HUi3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756397293; x=
	1756483693; bh=HHaRGTVk2JXY1NoNjjdd7UT/faquBH+w5rUZ4m7wa6E=; b=d
	8+QHjT9e3paV1eWKwr/YhJcp+Z1fnUWP4lqZ414vUBsG244D5+DTRzTTKvw+IGiL
	H8UAsW6zttN1AuhgvDcO5+cw0bJz39e8LmCyAKsgigXA2LnEDRBfAj41ADVzUMje
	wuwq0MgN1Ifp+HTD7uZwDniIGL1lCXp2OFxebVFBx3wb4KvnmR12Y37XtlgD4lS8
	NapJU+adjuMxmUR/riyGR+Dn9xcf2udK8QldgOEJGIeUoczLDeSFR4yM7D5pW9Sk
	LRkuHaQtUY0mltPf7PfiNcVC71tHWhgtJiSSLM9oJojxqUQZrX4K6qnAnk1oSwfA
	OAgchq2sz4OEy26U9bAWg==
X-ME-Sender: <xms:7X6waB3eI4rtrVO4l41BKojnk3NoH5iGOmRh0GcSGBfZXG9sHzFstg>
    <xme:7X6waNQuzhtL_p2qc4mepbEMb5yQpy56oixyop0Pv7rM0fTBZkA9TVJMFbf1fhfT9
    PqZNGIw4dHcQ0VdFDU>
X-ME-Received: <xmr:7X6waCxmBPlE9_XAKgDL-FyPubqOMV3B2vwIa8Zr_bLQtww8WQ2TOJ1gNB8GRMdRlZ83fWmRQ64W6oIO-OvuFMlRUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukedugeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeekpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehlrghrshesmhgvthgrfhhoohdruggvpdhrtghpthht
    ohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhhvvghrkhhuih
    hlseigshegrghllhdrnhhlpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhht
    sehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguih
    grsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgv
    shgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklh
    grshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhr
    tghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtodhrvghnvghsrghssehiuggvrg
    hsohhnsghorghrugdrtghomh
X-ME-Proxy: <xmx:7X6waFBZ_tW_99-JUpeBi0SH_dEgYsoMDKpHsq-cikXQU111OTDekA>
    <xmx:7X6waGHH_Yl766gywDsTbFXvfL7qNYKKYvuFYsyHclGWmAE-PTitvw>
    <xmx:7X6waEPfuDQKjoAym5_aiMD5QmZ7LjzMaOjgAfduCfI_xrqdBMzcwA>
    <xmx:7X6waP72nYRcXJ9Gsyb_XP2WqtVfXaq5H-vcV1HGhy_ehj_8NPfhlw>
    <xmx:7X6waJgLFnEN9QOIO1lMIH0tgAvxzj5IeNyAYr0D76tUdb-v7FFPDT3H>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 12:08:12 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 05/11] media: adv7180: Setup controls every time the device is reset
Date: Thu, 28 Aug 2025 18:06:48 +0200
Message-ID: <20250828160654.1467762-6-niklas.soderlund+renesas@ragnatech.se>
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

The device initialization code resets the whole device, thus the initial
controls set at probe are lost as adv7180_init_controls() are called
before init_device(). Additionally the controls were never restored
after the device where reset coming back from suspend.

Solve this by separate the setup of the controls from the creation of
them, and always set them up when the device is reset.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
* Changes since v1
- Fix spelling in commit message.
---
 drivers/media/i2c/adv7180.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 7b0387151c3a..8409ee9acc4f 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -700,7 +700,6 @@ static int adv7180_init_controls(struct adv7180_state *state)
 		v4l2_ctrl_handler_free(&state->ctrl_hdl);
 		return err;
 	}
-	v4l2_ctrl_handler_setup(&state->ctrl_hdl);
 
 	return 0;
 }
@@ -898,6 +897,8 @@ static int init_device(struct adv7180_state *state)
 
 	adv7180_set_field_mode(state);
 
+	__v4l2_ctrl_handler_setup(&state->ctrl_hdl);
+
 	/* register for interrupts */
 	if (state->irq > 0) {
 		/* config the Interrupt pin to be active low */
-- 
2.51.0


