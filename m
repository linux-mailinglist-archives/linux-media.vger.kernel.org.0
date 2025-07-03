Return-Path: <linux-media+bounces-36719-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB94DAF8233
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 22:53:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 895E958145A
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 20:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EBB02BE7D0;
	Thu,  3 Jul 2025 20:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="KgzkShdK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XR5GcZyY"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594D72BDC33;
	Thu,  3 Jul 2025 20:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751575992; cv=none; b=hW9AVaTjXgXF/mPadl75lo1Wzo2w/vA0Bho+k86U5ISMRhxgqVtrN+eLjpNWqrxmLOWODx2ctJ9G28hErygzgmb0ecco8XEqtdgLQWu/vCD02MLIW3aY7jypPq6htjfZ8DWcjzxl+lX9Mr/t4/a62UbsSDehnMwpauTlFv1esKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751575992; c=relaxed/simple;
	bh=DltSKoUIwRG4BVMqm9lH23lNExexVn2EPa3e80/YL6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wpxm/fGXENOfRgb1448bnQm7/k3E49GuHwZCb23szusBhPGvTGi3DEPZS1BRFVv3/ZwEnGZlFB+ODpTFAPieGv6T0FlHlUYwYzhRodt0KZkiCZEUgl0Lsv+fP2tTxhA7qncxKIjuQu4wTyMJmMFGwUifXDVJhXKpInkM4i/L4JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=KgzkShdK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XR5GcZyY; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 83819EC10C2;
	Thu,  3 Jul 2025 16:53:09 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Thu, 03 Jul 2025 16:53:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751575989;
	 x=1751662389; bh=68gHK5VSW6MknkzEgjfYA0BhciIdG3JJ+KDPpaRSZWc=; b=
	KgzkShdKuH2xP7rBysAwKtwbrymjB8XVDcfsdlbrBRbmXzI3TnhvlKevk7k4Fsj7
	c/Pz793H+H2UtXATw/XxKzOF+b1p06k7yobdb9NFLNd85leTh1Wa+FzsOxkC5kSl
	VrsxCmt/ewSIxNH64tmUq9mWk67UzxGDOo5/agG3B5qVtyHMnmnomU11eFweWXZL
	38FQ9/9Kv7Zejqs8w54y3CJe+mkZsl1DlvclrUnsfLOGzF9GB+8k2O/LVoYJWgsX
	W/aeKR6WIKvWOc+lQ8WrQNGKiYRNLiimH8y5fdlACxpOp6RLXApUhPx5wskDNwpK
	3BiqEfYr5azexsk1xPS9/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751575989; x=
	1751662389; bh=68gHK5VSW6MknkzEgjfYA0BhciIdG3JJ+KDPpaRSZWc=; b=X
	R5GcZyYZLHTAaF9V+zc25AnD8wP0KQdIoFYCz3gbiDc6SuImUy1dys9Ts7AK3slZ
	XN1rHPgvLe1WZawip8bjCR5sTs/Twbtnrq5fsnxMcPxlMCdqlG9FlCRlnoz5LYu0
	FKYJdyhi+E9Hruia9JIzGUxA9B/Vqi2AZMcUFOFzXVPmD32K05WZ/m2WI7dVeIFz
	f3L1vb96JTb5cKULUnYxWb78D4UQQVH8kgXXSr9yNthL9Kd5ULr0lEGpQpzrXlAg
	BwDqFkYa9anecme2TWyDM8UByfGjZtFyKgVXZijmYfuVl+HhxLZxhSFvNhSxT23h
	m5kuhtRcIAS4mAxPG4bPw==
X-ME-Sender: <xms:te1maN5z7qyei3byZ_0kjuR43FrhfWaDRVUVuPLjBWkwka8zZZ3L5w>
    <xme:te1maK7lPnoAhY5HigVCufa1qiaGRD5guqdKNyBVfkzaS4F1J5TDRYC9XeUZ-pU2L
    -NxhtTAtrZq_0FIsHA>
X-ME-Received: <xmr:te1maEd36iak1zdXf_olHO10YdWlFTLBcssjva9hlKkq1-YTkcgm4WS66HawlR4OJj9LcqsYLVyiEPr8JgiJ_3Fc1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvuddvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtoheplhgrrhhssehmvghtrghfohhordguvgdprhgtphhtthho
    pehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvhgvrhhkuhhilh
    esgihsgegrlhhlrdhnlhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthes
    ihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghs
    rghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrg
    hsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:te1maGL_VQWCBxT10Z44XSjOAOKGPSVl72z-CVmaIBHUA0Obtya8pA>
    <xmx:te1maBKNqy8Fmu0n7IckZ2_skLnUoVJrb3glfqANAsqwvrKbWa3tcw>
    <xmx:te1maPzYR5YdzwJpCNt4KMdGKlMT_5el_p6UqpBkKwM_B5xXKvx9TA>
    <xmx:te1maNJcd4zbWDVMdMbdLbZpYhyQ73n_mGbM5-JbE5bhRDpWzFf39w>
    <xmx:te1maPi4dFLEn-o0ubI3bQqmkFm2kaEEg8F7om-sByMtOX1TgQyKw48m>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Jul 2025 16:53:08 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 07/11] media: adv7180: Split device initialization and reset
Date: Thu,  3 Jul 2025 22:52:19 +0200
Message-ID: <20250703205223.2810806-8-niklas.soderlund+renesas@ragnatech.se>
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
index eab3ae2331fd..a6f2bf7caa73 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -891,6 +891,23 @@ static int init_device(struct adv7180_state *state)
 
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
 
@@ -908,14 +925,10 @@ static int init_device(struct adv7180_state *state)
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
@@ -1501,7 +1514,7 @@ static int adv7180_probe(struct i2c_client *client)
 		goto err_free_ctrl;
 
 	mutex_lock(&state->mutex);
-	ret = init_device(state);
+	ret = adv7180_reset_device(state);
 	mutex_unlock(&state->mutex);
 	if (ret)
 		goto err_media_entity_cleanup;
@@ -1587,7 +1600,7 @@ static int adv7180_resume(struct device *dev)
 
 	guard(mutex)(&state->mutex);
 
-	ret = init_device(state);
+	ret = adv7180_reset_device(state);
 	if (ret < 0)
 		return ret;
 
-- 
2.50.0


