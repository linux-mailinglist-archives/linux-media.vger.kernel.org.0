Return-Path: <linux-media+bounces-34270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFC6AD0801
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 20:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0017B1897DA4
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 18:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07891EF09D;
	Fri,  6 Jun 2025 18:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ZYVRF3SO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KV2eG6Fl"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36001E5B63;
	Fri,  6 Jun 2025 18:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749234413; cv=none; b=VK7BABOw2IGmjzWtKcBtZsEB0KOFbclf0unNF2beJGtEii189daQAIlPsC2MXmqifXTCIAAhE+GdlkjKJ/9M3QSGgJGnIClPoTwx3E/ksodwbHyUf4T1GL1XUMzdIyTvCkNLGm18NWWYhm3DIgXmyEoBEcqWbcykY5jvtey9c5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749234413; c=relaxed/simple;
	bh=3kHAV9OhjfhoCoy/q0rmsXyUSvFbLZPCa03kJlx7J+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DVi4ZX1Ih92tb/qd5EhjZggMXYVmPKupZe3xMUEw0ffIEgjIHA3mcIsR6+dCriVRhTGAQ44jJoUiS7Yb/dkCKceHJvIWw+94XP/oJtt57KYELM3vmEgUujK8nAv4F8qzb86via4jUvX6/+ysHssV2mWm1vrgwo1OPNKlUYoFLdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ZYVRF3SO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KV2eG6Fl; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B361525400D9;
	Fri,  6 Jun 2025 14:26:50 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 06 Jun 2025 14:26:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749234410;
	 x=1749320810; bh=/dFKTJhtmTCudVGDszzO8S6+wU6CqhQh+wpqOgKpr6A=; b=
	ZYVRF3SOd5E0dDBT4/sfKIiBdiJTOTtGmuRfDcjk4H6r1tKqbqhVAPL2+aoOpswA
	Hflk/p1wxS8h6FIt8hQmuhAwJOs1IbKoR8hBDnLZLbbZ5fLrcC2VRMD5BSHqI6AW
	Ro33NzOcEUt5Sen7qzcqZR0f7hOaar8P5yQMMNqC4M4GyX4WDUyWE0wOK5ozE/fa
	JtaCiovZg4X8AhbjtOJIzNBqc5YNK+JBgcCaaxipc3NhFvzwDmC6a9izFXvdu0kd
	JrfPNlnU/rZ4ouuRLwC0fi2ZOWz5DPznZwBKNopC5KfzJqE4kkZVIWq664XfTsDn
	AoHDUEmo9hI0r8oGNohAag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749234410; x=
	1749320810; bh=/dFKTJhtmTCudVGDszzO8S6+wU6CqhQh+wpqOgKpr6A=; b=K
	V2eG6FlYsoHbRXxqN60jLHPQtbLbI8j0q1UGW9mtf4KeghMDs7g77U2D6Ha9u1I3
	O1zJu4harHA9S5X5Mz+RqK4tx9C1VGoDmB5XXjr4r39kAfD74Yjbkqy9zzJH4APm
	w3kDYl9MnoCcIlR0VbWWMLssnmbEGOSnpapquRzvGmsdkTwQRe3a3pzVzqx87Dlx
	rLweAEIyDaPpMrJrWpyJzf0ogNpvf1BI04D7cnIJ9ukJfrMesMiKv529Fl98LYIZ
	cX7Uuw9JuXnB9SO3DRljrmR8JViAlpbu7J3klV1cSa8AT7FFYsQATa42JtqNbmzr
	YVsfjBUNPrYtAvotr6yvw==
X-ME-Sender: <xms:6jJDaBgJIVyvW7a6eMMrUJO0ZAGc1twG1l28iMV_JzjEK4CJtYemIw>
    <xme:6jJDaGCLUmJlDrpLhsasOefRkuCWQNvZPMIBTtGacVj8GscFyIjwL8-nlF2IMhiGV
    Iq1hoPEBuIZbnHspa8>
X-ME-Received: <xmr:6jJDaBHwPbpq4gYF8cX13hUYvpWLl9xCvAClulZRvAPEIc5GCqSwgtbP43MSfXOmo4nuud7RUZEZfO_qMOyZ_1Fa>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehgeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffle
    efgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsrghkrghrihdrrghi
    lhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmtghhvghhrggsse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdorhgv
    nhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruhhrvg
    hnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthho
    pehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrgh
    hnrghtvggthhdrshgvpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtodhr
    vghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomh
X-ME-Proxy: <xmx:6jJDaGTpnURTzmc3h3zPSpY60omB80Gg_P8edSK2dj6T621G5DXRsw>
    <xmx:6jJDaOz7XzOmpOmZXhh4gTUooidIxHWdHx99OxIupMYLxsQr19oMOw>
    <xmx:6jJDaM7nqoKOQ_C3FmPze1hHQDd3LXddFRPqKym-FXNtzy1h4uvUfw>
    <xmx:6jJDaDxYjfd7JCHnuz057VlEkVtvmi8JrRJe-zGeyAT2Ist481z3Ow>
    <xmx:6jJDaGOwMw2VG633tbkSW-N48n6NZngEfzzTBW4BuIyiN2022cCFbjQv>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jun 2025 14:26:49 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v5 01/12] media: rcar-vin: Use correct count of remote subdevices
Date: Fri,  6 Jun 2025 20:25:55 +0200
Message-ID: <20250606182606.3984508-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606182606.3984508-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250606182606.3984508-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When extending the driver with Gen4 support the iteration of over
possible remote subdevices changed from being R-Car CSI-2 Rx only to
also cover R-Car CSISP instances. In two loops updating the bounds
variable was missed.

This had no ill effect as the count the two values have always been the
same in the past. Fix it by looking at the array size.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
* Changes since v4
- Use ARRAY_SIZE() instead of updating the incorrect define to
  RVIN_REMOTES_MAX.
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 846ae7989b1d..cf5830d7d7b1 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -213,7 +213,7 @@ static int rvin_group_entity_to_remote_id(struct rvin_group *group,
 
 	sd = media_entity_to_v4l2_subdev(entity);
 
-	for (i = 0; i < RVIN_REMOTES_MAX; i++)
+	for (i = 0; i < ARRAY_SIZE(group->remotes); i++)
 		if (group->remotes[i].subdev == sd)
 			return i;
 
@@ -262,7 +262,7 @@ static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
 
 	mutex_lock(&vin->group->lock);
 
-	for (i = 0; i < RVIN_CSI_MAX; i++) {
+	for (i = 0; i < ARRAY_SIZE(vin->group->remotes); i++) {
 		if (vin->group->remotes[i].asc != asc)
 			continue;
 		vin->group->remotes[i].subdev = NULL;
@@ -284,7 +284,7 @@ static int rvin_group_notify_bound(struct v4l2_async_notifier *notifier,
 
 	mutex_lock(&vin->group->lock);
 
-	for (i = 0; i < RVIN_CSI_MAX; i++) {
+	for (i = 0; i < ARRAY_SIZE(vin->group->remotes); i++) {
 		if (vin->group->remotes[i].asc != asc)
 			continue;
 		vin->group->remotes[i].subdev = subdev;
-- 
2.49.0


