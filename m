Return-Path: <linux-media+bounces-36715-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A8DAF822B
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 22:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B066D5449C6
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 20:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF262BE626;
	Thu,  3 Jul 2025 20:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="whc/b/DD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lUfgs7D7"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14052BCF48;
	Thu,  3 Jul 2025 20:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751575983; cv=none; b=ZGxmE1xkTIXU+Nohu6wf27NxwgFWK711QdXVEFWvF81mR8lonqcGgElQ7kn/h2Xripv4P1bZcpu0mvevd4cyu0V9sd5n8w1X+MM+NJ+gsR0GU0cWf5w49ZgokNhAadA8QitOpyR5Wv49RsTr87agecvNLJcEBN6EE7HG4J51Ar4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751575983; c=relaxed/simple;
	bh=2TIX6mlFQZkNrxwFAY3ChIo8CwYy46M8R9+PsxM6C64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OVipjIV97KVHqK1U5xK4tQwkXI5l+oVmmtvZidPhK+mTlYAENaxAEW3GRSKDpQTyflyLr99zkwpCmBqrDMJBnrxOXZSLcqgUmGKSN12it0K/O1z8QJ5sB8ZrUqnILlq+aoBD02W661YgBrQvhIUC41ESZq/56/xpm9dEIVmV/Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=whc/b/DD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lUfgs7D7; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 116B81400E2A;
	Thu,  3 Jul 2025 16:53:01 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Thu, 03 Jul 2025 16:53:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751575981;
	 x=1751662381; bh=kod0WhDlqN/k3kw2GaBuVWXkQcrouyL64zxLgSRj7pw=; b=
	whc/b/DDu8wM6x7Q6xvo4LSLbBG3hcyLGm6DVTT6hh1yEe062uT6+YMjTCjcEGuG
	IZnN+DEmYX4m4C6uvisCXQ9Sk3VuYAKTma3loIBY/DRJYVwX6lziZeOiixipe2De
	dTorcSE2ircxeRkYo7UUdiG+mRasnwH/1HdDmuqutzVsKFg7iux4YK9AH7GCfdkg
	nVHWP6Q6az5iVmpELNPP8BE6xqUCYvpQo+Kxa2vISitv/ZUMdzdx64fGfoCHXgpM
	yKJ+NmR8YpRHRnFNpWbNrUuUYtIrTTOyq5pz4LGBKmd0ApWb8VFISOliOm/kvCbw
	n4fYc9/W3efgheacLbC7TQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751575981; x=
	1751662381; bh=kod0WhDlqN/k3kw2GaBuVWXkQcrouyL64zxLgSRj7pw=; b=l
	Ufgs7D73Z2qeCsiUk+zzX0sD36IPdOM2pn350KsFpp+1vYwAvhHVQNk83CP0byZ3
	C6+w90MFNHy1+eSiHHHEmiY1nM95ag5Ls+GzhQn4/D39Q1WR6i9YxoUDcW+7i8VK
	NkJTlEL8vl80B4XciWXo2DI+wCqrWDnLruOT6oJqjlUUkCa97Pn1uGJ1mxtrA0an
	2OqLsYXk1NjDOrtogAeAdzb1CS/AOYg4gpzXOWuWiiXTsAUIJJQ5VbJnzqeQnKXa
	SCjoJ3FxOoGPKOb05bPgN8sNgz67Q9+/XvgjC60KgrFJsyuAp8+6dgYOlZP1b7/i
	Ln3gB9OP0aGDs6K9/V9DQ==
X-ME-Sender: <xms:rO1maFfUj-Rjg02qGakTHCRIHfScTrvJNiWcfyziGEd_3aDbo-994w>
    <xme:rO1maDOvLQTcv62R3NlLndm55yz-MZzYttx8vGSnB82HsJjLNB-ClzN-71pGDli5H
    vizLp3z2ziVkXpTne4>
X-ME-Received: <xmr:rO1maOjCP4dllMNNS66z1CzOLaZmvmi5HkuW6Zk-xT9QTPhO3Q-a3xLpwCZmH5ouen_aIJGQNJYpI7Lf0n2WS1hv7g>
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
X-ME-Proxy: <xmx:rO1maO_YBQLzquLsKIPVdoLfSnI0QpXZ2-L-RtlSBHUlsTL_kLzIMg>
    <xmx:rO1maBvc-5fc31HQjP5N_Usw6ty2d0vvf_YcjyIUtIqYQkqhDt6ouQ>
    <xmx:rO1maNGVx9GwjPaRrbhCS1oxd0Lil7ewSKAGp9q0vQzaX0jqx-4zJw>
    <xmx:rO1maIMh3m8qRqDWPtmA0eYiojV6R30y5FDqgMIojzidCut5FzSUUg>
    <xmx:re1maKT49nmv0IqOhbuH6vG5ke-YcKz3m6oZxCJ-wXXejVmV69n4lOdL>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Jul 2025 16:53:00 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 03/11] media: adv7180: Move state mutex handling outside init_device()
Date: Thu,  3 Jul 2025 22:52:15 +0200
Message-ID: <20250703205223.2810806-4-niklas.soderlund+renesas@ragnatech.se>
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

Future rework to get rid of .s_power requires the state mutex to be
held for multiple operations where initializing the device is one of
them.

Move lock handling outside init_device() but enforce the lock is held
with a lockdep_assert_held().

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/adv7180.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 0c5511a7667d..bef708916190 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -893,7 +893,7 @@ static int init_device(struct adv7180_state *state)
 {
 	int ret;
 
-	mutex_lock(&state->mutex);
+	lockdep_assert_held(&state->mutex);
 
 	adv7180_set_power_pin(state, true);
 	adv7180_set_reset_pin(state, false);
@@ -903,11 +903,11 @@ static int init_device(struct adv7180_state *state)
 
 	ret = state->chip_info->init(state);
 	if (ret)
-		goto out_unlock;
+		return ret;
 
 	ret = adv7180_program_std(state);
 	if (ret)
-		goto out_unlock;
+		return ret;
 
 	adv7180_set_field_mode(state);
 
@@ -918,31 +918,28 @@ static int init_device(struct adv7180_state *state)
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
@@ -1493,7 +1490,9 @@ static int adv7180_probe(struct i2c_client *client)
 	if (ret)
 		goto err_free_ctrl;
 
+	mutex_lock(&state->mutex);
 	ret = init_device(state);
+	mutex_unlock(&state->mutex);
 	if (ret)
 		goto err_media_entity_cleanup;
 
@@ -1576,6 +1575,8 @@ static int adv7180_resume(struct device *dev)
 	struct adv7180_state *state = to_state(sd);
 	int ret;
 
+	guard(mutex)(&state->mutex);
+
 	ret = init_device(state);
 	if (ret < 0)
 		return ret;
-- 
2.50.0


