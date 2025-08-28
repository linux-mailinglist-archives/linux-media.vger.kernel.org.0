Return-Path: <linux-media+bounces-41265-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B5CB3A5A0
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 18:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B12223AB221
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 16:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06544279DCF;
	Thu, 28 Aug 2025 16:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="VlsY+QYC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ksYH0PvO"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13F12848BA;
	Thu, 28 Aug 2025 16:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756397294; cv=none; b=KelagEQMKtxEPau4pXTcny5MmhyjxdOn9HPAkVNaF8mMk/RoFb7l5stpXLkRtEZ6yjJqjPc0lR/dVlnLMjn5osq+bSaWdsUhhZ2L2K+8Z18NXN0spfO6TV1S/Qb2iJLc95grEcj1XD5HYVCutJ9ZrKAzrEAJmeyuecO4IT8j9sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756397294; c=relaxed/simple;
	bh=IR6HyWJkFnmM9cDzkiAb1R8i52IvsJXLDYdEAIKsihU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ng7oCFUZbHa8i/mEWU4ONHzRvj4yhXhSyoVcUl56vQ4EvO2p3iv2ttaiRJhXwhTGyMTvO1yrCLFBfwoJb60wZKf0Mjr/y4PqxZSkoUrdKqEhU2eW5NSVvvt/+t/lZR4noB28BehHmyFQC+A31GD0z/r30RmwgwC0S962vkVDUgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=VlsY+QYC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ksYH0PvO; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id A68111D0013C;
	Thu, 28 Aug 2025 12:08:08 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Thu, 28 Aug 2025 12:08:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756397288;
	 x=1756483688; bh=YUHjV8pe1amqq18XMN7EVry19UNalLRUFwLRZlDKv/w=; b=
	VlsY+QYCp5Ou3E7bJSK09AJdQVr3PdhZo8vETdNy8o5gjd+ZfO3u4uHMyQJn1l96
	tkAfHRqHEM+sh+LXxOBu+w0oGYENYvM1y2h0PxeFIyWfDCSDd+gYV3nnfCG9mNUP
	uByUZaBRjxKY6KTiWFriLJzSBJK7+eqr2H1VN8Sj4EKQ6K/bYKlIqzKe+/Y/SdsM
	QU4tZCKRjIjlMyA86y+aFf7ZZWKAG/4GEAqFMwKTFfrTswMoY3QSskF+BjLj4pPv
	oza/KcAqcWyRY5zy9kmYqbcyxRTxy/0p3qz7jDZiBWD+TtUo+8EtgdQhsTmcEBdS
	AgyeJJz1sKTP8mz+CxbHdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756397288; x=
	1756483688; bh=YUHjV8pe1amqq18XMN7EVry19UNalLRUFwLRZlDKv/w=; b=k
	sYH0PvO/GOlBS98fD/LGD2jPqdZbwZLafx9IBjEzNKmSkUvX/8vSILzvEBQgzViX
	qndO0tQJ6DNNU7LMRMXq/sU9kiO8M5+4w37iaRvQkIBJQ+GPQJLzPvksmRvlrVgz
	3j4aeBbiZPH6aAghuDJbBBRINfjHQbOfVGjrPhVhy1pTbY1pR0WxsLdHXz0EKUcl
	elTQtcIpAejViFGI40cIXiVRr6H2hryyaN1YZNqXim2eK91HCIY+wcF9Hqm02s+k
	E1O4M0Yo3lLsPpU+DOp06PwzQyVKQ0ry6wEWuV7w+6g1nqK0Sl70bqbzJxPCSmMY
	VbJZSXmX4YBAFOo2MxJaw==
X-ME-Sender: <xms:6H6waNj5cFUQOXm6_XB7KXPEM0GjKMkfKDTe-QCb0vFQ6Cq0WTd4BA>
    <xme:6H6waHP_8KxHjyrQkgRFkhA88SaQTRhXczlaK4GSvqZUpmCi5I3arHBMZyafX8Hzs
    5tN1Jd23SWiHdImGd8>
X-ME-Received: <xmr:6H6waN8T2kAVxD0QY41hIgkiSEYRNOQhIVHTvl6QjWAuK-cjLw9IGWptKBpH4lDx566wilaLnW0eK7bCdhFYZ9E_VA>
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
X-ME-Proxy: <xmx:6H6waIcgDMFoSL0P9SjZ9aO3lPUDh-AE59d9H7R1c0j2zp_gBjA0iw>
    <xmx:6H6waMwDi1hSQKxTCBMBGZsFgas3wDFs3VrHWv3d9G6QtkE8LqtKmw>
    <xmx:6H6waNK6x4emVzjff5Sds0DaIGWLVOD87iyVUFl4UGYHqZvOeWl6Gw>
    <xmx:6H6waOHsB6W_GUDxumeVHekD44PLhcLKfLdQBuyjFRpZ4bFe3T_YnA>
    <xmx:6H6waKtnPeW0WDsvwoOjmv03UTUcWHZOd9Liic39tzA9EFsG_kdahAKf>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 12:08:07 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 03/11] media: adv7180: Move state mutex handling outside init_device()
Date: Thu, 28 Aug 2025 18:06:46 +0200
Message-ID: <20250828160654.1467762-4-niklas.soderlund+renesas@ragnatech.se>
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

Future rework to get rid of .s_power requires the state mutex to be
held for multiple operations where initializing the device is one of
them.

Move lock handling outside init_device() but enforce the lock is held
with a lockdep_assert_held().

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/adv7180.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index b7f175650bd0..9dbd33c4a30c 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -880,7 +880,7 @@ static int init_device(struct adv7180_state *state)
 {
 	int ret;
 
-	mutex_lock(&state->mutex);
+	lockdep_assert_held(&state->mutex);
 
 	adv7180_set_power_pin(state, true);
 	adv7180_set_reset_pin(state, false);
@@ -890,11 +890,11 @@ static int init_device(struct adv7180_state *state)
 
 	ret = state->chip_info->init(state);
 	if (ret)
-		goto out_unlock;
+		return ret;
 
 	ret = adv7180_program_std(state);
 	if (ret)
-		goto out_unlock;
+		return ret;
 
 	adv7180_set_field_mode(state);
 
@@ -905,31 +905,28 @@ static int init_device(struct adv7180_state *state)
 				    ADV7180_ICONF1_ACTIVE_LOW |
 				    ADV7180_ICONF1_PSYNC_ONLY);
 		if (ret < 0)
-			goto out_unlock;
+			return ret;
 
 		ret = adv7180_write(state, ADV7180_REG_IMR1, 0);
 		if (ret < 0)
-			goto out_unlock;
+			return ret;
 
 		ret = adv7180_write(state, ADV7180_REG_IMR2, 0);
 		if (ret < 0)
-			goto out_unlock;
+			return ret;
 
 		/* enable AD change interrupts */
 		ret = adv7180_write(state, ADV7180_REG_IMR3,
 				    ADV7180_IRQ3_AD_CHANGE);
 		if (ret < 0)
-			goto out_unlock;
+			return ret;
 
 		ret = adv7180_write(state, ADV7180_REG_IMR4, 0);
 		if (ret < 0)
-			goto out_unlock;
+			return ret;
 	}
 
-out_unlock:
-	mutex_unlock(&state->mutex);
-
-	return ret;
+	return 0;
 }
 
 static int adv7180_s_stream(struct v4l2_subdev *sd, int enable)
@@ -1479,7 +1476,9 @@ static int adv7180_probe(struct i2c_client *client)
 	if (ret)
 		goto err_free_ctrl;
 
+	mutex_lock(&state->mutex);
 	ret = init_device(state);
+	mutex_unlock(&state->mutex);
 	if (ret)
 		goto err_media_entity_cleanup;
 
@@ -1562,6 +1561,8 @@ static int adv7180_resume(struct device *dev)
 	struct adv7180_state *state = to_state(sd);
 	int ret;
 
+	guard(mutex)(&state->mutex);
+
 	ret = init_device(state);
 	if (ret < 0)
 		return ret;
-- 
2.51.0


