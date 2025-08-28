Return-Path: <linux-media+bounces-41264-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C75BB3A5AE
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 18:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B255B1895BB3
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 16:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5196327D773;
	Thu, 28 Aug 2025 16:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="IuSu/4lB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SCDWaWbC"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E97421C16E;
	Thu, 28 Aug 2025 16:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756397293; cv=none; b=SZs5EqfgJypOXUx4LaV4nsdXgnBlNskWBRNdrsefhJj0c2SD+gI6FdvYFHDwTj2eD+eFk4TmTbwFAjKHIamaKM4pesQVIrkwbUdiHRgkX8NY/hBYZUHXdHP1QK5TRnPlimSgwpfVj8ZiGGfiNJX88yZBb8l19PMpkTyaMxoEVs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756397293; c=relaxed/simple;
	bh=Bl3SZhRSqoCS5tRDxTOOYAJVu6kppyTwN9m93wS8ClM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X6OodMQ6S4C5V+TIRMtRaiX46C5H70N1vjakwgrgy/MO1uSpgKhZlFs3i5dnfmG/hZtvhX+T9Cc0rQIgL863zqBLLC5AwkIeKFjxcJTC3hwstmSd2wsPAVAqrnMHkNBkDZuqTd58y8WndBmm35VwX10pVOj+Pjc/6gWOwIe+/U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=IuSu/4lB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SCDWaWbC; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 08CEB1D00161;
	Thu, 28 Aug 2025 12:08:11 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Thu, 28 Aug 2025 12:08:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756397290;
	 x=1756483690; bh=j3+OWkF07y6yjk82e93qe4TzhTV25wy1lyEByeMssKg=; b=
	IuSu/4lB7mJVxQpu6RiKn6VP1PELziOXu8xWl/TlSgjrRnYfdqXGVYZUZ9CSVQQW
	yOunNePYBnF0bISloE6xepvhD5p5VeT65tOObxFCvRaGhdEF03eSyBiWhEZQahkA
	4/EiIcfs4HhCK00y86OsjzeRyyGs5Vo5qcsVYWT/FCktx33Iia4PDMRWxjjh6dA6
	TevRZVBxg05f1p7nkqmhb6CrZDpfrQJ9fynv2q44OGqPiFQBNcMA4Ue5HnPhwk0E
	OdoyTfSBdJea94xh7CDdV6ZX0mhfRJj56PGJ0NeIE4XY41zDQjMa4KtAQ8lNjVRS
	8l6CPFJiL1Mjn526TnfSqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756397290; x=
	1756483690; bh=j3+OWkF07y6yjk82e93qe4TzhTV25wy1lyEByeMssKg=; b=S
	CDWaWbCixKxQRbgJLfivzTAZC8nnlKEWeqeYdfIoZPdAXnSrByOeyskh719weh1i
	CK/TsxC0P0WbOVWZcPxTF/a2+hKB3KxMWmkPLJUE1SH2OugmzY79LO04wwa+Kkcj
	Xjv2Utsj/NcDBes3paZYCbWtIfItSUZQ3b2Z9e2n5WVxCQk1STb0d3HSy08OoHG9
	8GrcETJ8RXtw5E/SqyQS8n/RAudOeqsLq09sb7TJIhXQDv9bdQLK335i/H352xnd
	tpapoGkQISgve7VUfGnnwzxPP5FOJ+NJwqgSgvcjyR7bxdd6puQQqBFdpsmyiPzH
	/7XV2xBnYIDU9zdngneYA==
X-ME-Sender: <xms:6n6waIsTgPyCCBacL43ssgKlLP9byhZybNyi-S6vrGTC1REjQp6ezQ>
    <xme:6n6waKrCeUrgLyjCZKkumAAM1_XrRu-64H_kMlfFLqUPjqxw-2B8bexslmUgk7rOP
    E6dN_V_v8q5PU9mDOo>
X-ME-Received: <xmr:6n6waEqcLNyoIq1BR7tusNzyL_Fm9vrNGf2fczA6zohmxgvyULMzIjS0QnWNWs0LmOQTwRGmOr7fyfWICXnRSIPH3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukedugeejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:6n6waBZYZJY70ACnimfMHO9r7ulE9P1vuozIN2SQcmXxYP6NGZKjIg>
    <xmx:6n6waK8l2aqqw5HU76L4fcG4zvbeG9FE-AknTWTsMlk7DCD5lYuMvw>
    <xmx:6n6waHkawtzpOJMz_jsl2vmjZelMk5VYzg-jdNWMI1QJA56rioQKSw>
    <xmx:6n6waPywhsXfMYlFQA9uvFEDzxM36eIFIYhrLCnEnbAljpdrHkD7Uw>
    <xmx:6n6waHa1aQ_moOE4YhrPdI4VSUWSZ-DQHW2GWFWz6BBUZ9fqwlk-qNT2>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 12:08:10 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 04/11] media: adv7180: Use v4l2-ctrls core to handle s_ctrl locking
Date: Thu, 28 Aug 2025 18:06:47 +0200
Message-ID: <20250828160654.1467762-5-niklas.soderlund+renesas@ragnatech.se>
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

Instead of handling the state lock ourself in .s_ctrl use the v4l2-ctrls
core to handle it for us. This will allow us later to use the unlocked
__v4l2_ctrl_handler_setup() in initialization code where the state lock
is already held.

Add a lockdep assert to demonstrate the mutex must be held when setting
controls.

There is no functional change.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/adv7180.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 9dbd33c4a30c..7b0387151c3a 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -601,11 +601,11 @@ static int adv7180_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct v4l2_subdev *sd = to_adv7180_sd(ctrl);
 	struct adv7180_state *state = to_state(sd);
-	int ret = mutex_lock_interruptible(&state->mutex);
+	int ret = 0;
 	int val;
 
-	if (ret)
-		return ret;
+	lockdep_assert_held(&state->mutex);
+
 	val = ctrl->val;
 	switch (ctrl->id) {
 	case V4L2_CID_BRIGHTNESS:
@@ -647,7 +647,6 @@ static int adv7180_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = -EINVAL;
 	}
 
-	mutex_unlock(&state->mutex);
 	return ret;
 }
 
@@ -668,6 +667,7 @@ static const struct v4l2_ctrl_config adv7180_ctrl_fast_switch = {
 static int adv7180_init_controls(struct adv7180_state *state)
 {
 	v4l2_ctrl_handler_init(&state->ctrl_hdl, 4);
+	state->ctrl_hdl.lock = &state->mutex;
 
 	v4l2_ctrl_new_std(&state->ctrl_hdl, &adv7180_ctrl_ops,
 			  V4L2_CID_BRIGHTNESS, ADV7180_BRI_MIN,
-- 
2.51.0


