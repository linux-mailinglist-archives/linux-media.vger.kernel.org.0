Return-Path: <linux-media+bounces-41263-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D722B3A5B5
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 18:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C88F41715F1
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 16:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BCAD277003;
	Thu, 28 Aug 2025 16:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="p98XwB86";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E35LDZ7m"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9DF27B35C;
	Thu, 28 Aug 2025 16:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756397288; cv=none; b=rllWuUTOxRLabkF1R2EpItqTxJyBvULdOC9OV5NjzJ8ZuQC5GarhR3ZiA2wMIy6FzPh63IVlc7KfbQfMpcE1Q+XGyBLRBlRiHjIO+7dEatZZ1p0/oOc7Lq0pn1oOTTn3ns+AnfQywzZTep8JAEd0RO+WjhOgfWkrsWjUz+mVTG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756397288; c=relaxed/simple;
	bh=rwMBLiOsufQz1Ru63HI0VN0UKVZYZ2NpNwNtFHdr3tE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NIwz7mUywHA2F7uWGph5ZSQ0ZqSWG5Cgsz25wA4t4VyBHqm1Qoj4L2hfhK4trbdOyMlrsSSpp4hRaZufdXlu50QWUk5ZAlr4lPMuEKFXBsA23qJqRXA4bxQdJDn9icNyl6aI1xvtB8T32/dN8i3FXksdujgvRx0aV7cdtK3TGvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=p98XwB86; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=E35LDZ7m; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1C00C7A0127;
	Thu, 28 Aug 2025 12:08:06 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 28 Aug 2025 12:08:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756397285;
	 x=1756483685; bh=z6vq1lgYIumxgNTU0MjeeDv0mZ3xyQGMxbD4nffoFgk=; b=
	p98XwB86lEj/Bqp4vBDZrJKXUA/jo8jrzrhf6N681tgNs5zhMc7Cy84h3z3sMCbk
	EczKRs8RKj9ojWlbpU5uFzMKWYHbBcJ/P78/KXgswjfDcKPW/slkMW/ApM4bKGUX
	lJBdBoghlNWiCElcxTizotZ4BdouT8UvgeaQJyY60qvZZbtDu4Hr02aKP4AamXjG
	3mOUwoP17hH1/47OP5t2tzBhN1dDUoRsl7lHcSSOrCUz7nleKKnxG32kp3S0oBYD
	7yOKCo6ayvWe48BihEoVoUP2/Cul3wzJWA/mEXQq+RuaX8V1ljy6AmdQWz80CXbz
	4Rq/qUlxBHNutZUcrn17cA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756397285; x=
	1756483685; bh=z6vq1lgYIumxgNTU0MjeeDv0mZ3xyQGMxbD4nffoFgk=; b=E
	35LDZ7mSAENzWTjLD/n16dnGaRKozdkogIKQLglDbkzpD/qO125Y84SKwUqQyyAQ
	h8e/eeoEV/Jj9WzygfMEGB24VuC7lSJSJztB+eaSiM7woTp2wA2+Z+leaF0SZgLq
	hQuv/wyz8wunNklFJHZbO6PN3UtXdKIyVoIr/8227Swuz3m7b9Oi4plht6SvavIE
	L/rAxZ9MeA4IOrvyKBpisotukWfr9DQwvOSX07cPRHdHFCG9oh+pSgNIGXLK+sP1
	IKpr2RKWk8nFplv2emdgS7ZWRZaL0FGn5gDamE15XZURVMOLxQ79WqZi1fWYWDZr
	4ffdcHJI31AJoSwWWwvKQ==
X-ME-Sender: <xms:5X6waNHgQdO_rlr2AhdFXPcXJcLWlPFT41L8hdQMK_SHcnl5kYHjTg>
    <xme:5X6waGJTaem7nhmTP82Zm4qk8zBbKwtPAHrtPGJ1_fH3Vd9qjMnYX9vbtmuLZfl0p
    d4oEHrFA9V9HssLlC8>
X-ME-Received: <xmr:5X6waIPsZy-A6ovG6w9vXuLu7RmJTdcxV0Jx10NuAvnU_gkG5ZRY-euslqo_CSCTyVpnePj7xmtlitEVhUtpJhoMEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukedugeejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:5X6waGnBW6QcmgPSajy2QHDioXDULQcpgEC3wrtiWsmRBvYlySnIvA>
    <xmx:5X6waM6qClTTZywjfK8ppAamchUq9hXmuyeDuPbhs1bRxleUm5Y1AQ>
    <xmx:5X6waK2LdAsBEVkF2MMGtBPI_h8cT9CMBZRVNKd3irqAcl0VqqFNdg>
    <xmx:5X6waHEEgtQj_xkqRsEKDrmXtGrdt5qz9qWv6brRfTMZkj4NHLWBUw>
    <xmx:5X6waNIuvyshyWUKgYUMG7l_Usdv-nTJhaql6BNX-Aoe-6ZcOVz2-LuZ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 12:08:05 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 02/11] media: adv7180: Add missing lock in suspend callback
Date: Thu, 28 Aug 2025 18:06:45 +0200
Message-ID: <20250828160654.1467762-3-niklas.soderlund+renesas@ragnatech.se>
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

The adv7180_set_power() utilizes adv7180_write() which in turn requires
the state mutex to be held, take it before calling adv7180_set_power()
to avoid tripping a lockdep_assert_held().

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Take the lock in more locations that was ignored as later patches in
  the series reworked them and solved the issue in the rework process.
---
 drivers/media/i2c/adv7180.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index ef63b0ee9b8d..b7f175650bd0 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -813,6 +813,8 @@ static int adv7180_set_pad_format(struct v4l2_subdev *sd,
 
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		if (state->field != format->format.field) {
+			guard(mutex)(&state->mutex);
+
 			state->field = format->format.field;
 			adv7180_set_power(state, false);
 			adv7180_set_field_mode(state);
@@ -1549,6 +1551,8 @@ static int adv7180_suspend(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct adv7180_state *state = to_state(sd);
 
+	guard(mutex)(&state->mutex);
+
 	return adv7180_set_power(state, false);
 }
 
@@ -1562,6 +1566,8 @@ static int adv7180_resume(struct device *dev)
 	if (ret < 0)
 		return ret;
 
+	guard(mutex)(&state->mutex);
+
 	ret = adv7180_set_power(state, state->powered);
 	if (ret)
 		return ret;
-- 
2.51.0


