Return-Path: <linux-media+bounces-41272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84577B3A5BE
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 18:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EE6216C8B0
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 16:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF6A2C324E;
	Thu, 28 Aug 2025 16:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="PPQBhq4I";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HjKRaXUe"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC9021C16E;
	Thu, 28 Aug 2025 16:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756397308; cv=none; b=gLx/4sJ5pT80ROeNCuo2KEbP9IKCkXAEpVD8CkXpl1CPJ0e2rOBBz7JnbkajFnv8JjGJVPTlOTHPaTdV1XW6Xdi3iqbGfAZpbq4gZHtbeJ2bnnSrT7ZodY7v0kW8xJgNGNAe9I5NIaHGlv+yVy6X1Gqi5290apmgBX+MvjHM6Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756397308; c=relaxed/simple;
	bh=7jDx61Dj/JLFYdzFHhib60LPbOl2Eh4EvmQARLN40kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dTSIJAtIJQMtDY0M/yzz8ebOPXH3N0NK2GqIGky4sfylrGwe4H4dxbTys8watZELwCRiZ8AGYV9NzLqx1nIg6vHqdWAeZjkyeWVH4qQFigdD1dGv+aQb4E0JyFogo2g3WCEAC53ixJTeL3r2wSEe/qV8o4DH04JCN5g0cJOKWTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=PPQBhq4I; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HjKRaXUe; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id 7032A1D00168;
	Thu, 28 Aug 2025 12:08:25 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Thu, 28 Aug 2025 12:08:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756397305;
	 x=1756483705; bh=XR+vf8dQscgS93+kKLuyfypUSu8wjDAt1bXxfrOLgvo=; b=
	PPQBhq4IoV21OQx1KoPWrIJCSonh3PdrUUHGocvjdAWuvliu7wBdWuIGlfB1xlhx
	nZt/Q+FbhxXX+xSV/bN+MlvgU6rt1b10Xf+lAYWpv/GEF9wWlIqJOdHj1gfCfzcE
	fH3beeQu8s9dOQLxh0MGqdxmIyJvhVkFghul0EZNVI3P2PqBp+jhe6JJPwWecDsQ
	W0vxLeNhY2XJ3UQBn/kBt5VkNViCKZ75Zhq1XbP4eiKSNgYLFdZa3xoHahRnRtU4
	60uKXKDLGFDf3m86nZJ1cSjcbuV1nLbNoesVo6+I4VC6qPQhNLIeJrlMNZLh91eR
	4hv9CxHlJwfL2n8yEHCNxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756397305; x=
	1756483705; bh=XR+vf8dQscgS93+kKLuyfypUSu8wjDAt1bXxfrOLgvo=; b=H
	jKRaXUezqpvqclFoIzHcs8aOCzZPiKLiXu7GwgOn3Dtc0YlcSWNqdW9t4Xmou46/
	KybuLF+CSXbDSzZo113IwrMvkhRZyegRFc4tFmsjJ9bevPmJlh4dEp9ksVIcgeVT
	EJ2wsPh7U05ZDX2whYjHKhNaADOLrmmptHbP4qsIuDIUOToUYZxgmm4V2eDW10NA
	QJa5M3AhV/fF/VOzI8DYrcgXHA9AHS2F1i9elIc/SVlFf1XSYDOKeZqTr9ruyQj7
	qQDutMmLfKItRylu/SaPAnaKsu/C02UFvzHEJWouHvu7paTPAmbbpC9gIc8+7PQf
	raQZHioY4aBrqMBkZtFJA==
X-ME-Sender: <xms:-H6waDsKTSI4GkoBFTw6CsR5SOeox1SFPwJ9pj-Ob9eISu5bPc9mUg>
    <xme:-H6waIQxF7J3qGOiSAEArOyaUfCKTsyGAnOI14GZiMU_Sthtxh7wZy-YTZMHNn53A
    kaARBqsJviM0m-k_Y4>
X-ME-Received: <xmr:-H6waP0MWhpqdLvjOngz_hSP7E3ANu_GpPpoxUReufzBijm800IR32p8OJq-j5Cdc28YxcByfkfm_w66tqNOXpjSaA>
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
X-ME-Proxy: <xmx:-X6waFsxGfNq1MSBSx1P1BjgU-JGb5z78KhPDSgP_QlWlytYJ8vQkQ>
    <xmx:-X6waNjAXhy1xjVnZr9s6XHFQmUfqtqJ_36wDEViiKsM42HUcl3OuA>
    <xmx:-X6waO_pRuBxgYzZaWaJd9akUId41v13HZVu5LwCufzRt_zJr3rMJw>
    <xmx:-X6waItym5Oeih4Z7lRX6R9a5vb2wY1yMhfSs7fUD7Z7G0jNVbWong>
    <xmx:-X6waDQhLjEOozvxpTHuL5e1qoLJGllNiOroHMMmiRyXxJ_Ys0yWSHl5>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 12:08:24 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 10/11] media: adv7180: Only validate format in s_std
Date: Thu, 28 Aug 2025 18:06:53 +0200
Message-ID: <20250828160654.1467762-11-niklas.soderlund+renesas@ragnatech.se>
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

The .s_std callback should not write the new format directly do the
device, it should only store it and have it applied by .s_stream.

As .s_stream already calls adv7180_program_std() all that is needed
is to check the standard is valid, and store it for .s_stream to
program.

While at it add a scoped guard to simplify the error handling.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/adv7180.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 641cf698df5e..47112b43769d 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -468,22 +468,18 @@ static int adv7180_program_std(struct adv7180_state *state)
 static int adv7180_s_std(struct v4l2_subdev *sd, v4l2_std_id std)
 {
 	struct adv7180_state *state = to_state(sd);
-	int ret = mutex_lock_interruptible(&state->mutex);
+	int ret;
 
-	if (ret)
-		return ret;
+	guard(mutex)(&state->mutex);
 
 	/* Make sure we can support this std */
 	ret = v4l2_std_to_adv7180(std);
 	if (ret < 0)
-		goto out;
+		return ret;
 
 	state->curr_norm = std;
 
-	ret = adv7180_program_std(state);
-out:
-	mutex_unlock(&state->mutex);
-	return ret;
+	return 0;
 }
 
 static int adv7180_g_std(struct v4l2_subdev *sd, v4l2_std_id *norm)
-- 
2.51.0


