Return-Path: <linux-media+bounces-31946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B728FAADBA3
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 11:41:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDC763A11AE
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103BC205513;
	Wed,  7 May 2025 09:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="OOFyaCMA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QPb2cTYb"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC94A1FCCF8;
	Wed,  7 May 2025 09:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746610892; cv=none; b=mpLHOGqAbrTk6WnPDrrvwTjMU2wKpIzyonu9/mwcWYqP+1jTNmnMrKmJf7MCeg0CnAqY31fdrHiw+LIVt3cXDMA3Dq7O/fh+pzLgH05wKGibp4ZHaQNXQ8zND3vX19e9zH/hZBbhhBxKsdZ12n2xlf9iDjMIlwevM8CQIq+iW0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746610892; c=relaxed/simple;
	bh=RPHx3MvQ2V7V4IvMw+bc6PWyHhA6Gm8Cj5NziIaFF3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qqPyONnhOqIBJ9vL2SUodLizRI4imJwpXEcLE8u8VwbHtugAjXMfrG2NMrrd1k0dPDTpKyGefnSNsNv5f1jdERbPjCgJ0LFdzrNTfRbUx9ohLxgm5urL8WCJlgwRPEO/ycIzI2nG9Od5uW9P04V4PFlPwP2Cn/yQKz8UNixL/QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=OOFyaCMA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QPb2cTYb; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id DB2681380158;
	Wed,  7 May 2025 05:41:28 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 07 May 2025 05:41:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746610888;
	 x=1746697288; bh=NNgbCIGo3Bt2vZnDVXGbIbb9O+7rprWGrMqXZ3JaxBs=; b=
	OOFyaCMA1op4lKx6jhRDYq86zaU7YVzSoWgH5wUuWRu0jO0NySXg63d2Rv9nE5wc
	Lof/TiKSRYQ/FaFUDu10SlRdjsWZbgfIz99sfApnVpDCtGOOrqlapum2ZPgU3hRR
	q/ZkXgMpUWmcAO8tEYVmT5XjsaZPwzu+o4lT2IVieAq+iTuE9IYMt8rwOByZSf6p
	DN0PO/vnMLGP4opRB9g2p6mf4DHY/jbO8h5WmMjmATqUJZDFrFTP2reZoWDfg6T1
	pl3QjHS9a3lqbOewoWSxp7OKIft3b724yUyuCu9WccURmembDczAIDJdFMbQ9cJq
	3NiweSm1SY91yc16CUH68Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746610888; x=
	1746697288; bh=NNgbCIGo3Bt2vZnDVXGbIbb9O+7rprWGrMqXZ3JaxBs=; b=Q
	Pb2cTYb9e3FgSYkwGR7g3COzM51OkKJ3RNTzv3cjIH8Xk4NbJ8y7uPOfL1ZoROES
	rKAd9pTtFxQRuqEnj1EQPWaa2I4zW/fYuWXgDjeylxB+zdfrhVW8do0q6TJW8+NA
	UaWrZY1KMIk5+D3ubcuDMWyxyhzvdWFFk+KdQ3eVId+PxEGVamFVbKLTPt+DvOgQ
	VSf6rKY8goIXk11UCpq2VmImNhfQG8LRP94eTUahCGRLv0Fiafk0azw3AkajfJ+P
	WQ5kbaznZ7KGqUkHAtOFbIhlbQNuw6+TKMkUPdjNAI04ncT8q86LiJrH73kUyO2F
	Fkv90eI3rb44+Vd0/+WlA==
X-ME-Sender: <xms:yCobaN0r_nQO9oz7P3url9A7Lbp2XTRenleNKM5hd22G54D_gwMgAg>
    <xme:yCobaEFXU4kmaJ1j78_ZtvCP62zDmxjrfediNyvUR2YGqNZN3MulcUEx6Jmdo81xL
    xf5vs0wnEitkZ8KBJk>
X-ME-Received: <xmr:yCobaN7kLB73538D3E9QcX4Y31_m3FE-g1WMy1I2MFialUNNj3dy6BiQtHxRVojYPsQ73QrV6cv1cjJ85L0Y6Rag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeihedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffgge
    ffleefgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprh
    gtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsrghkrghrihdr
    rghilhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmtghhvghhrg
    gssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdo
    rhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruh
    hrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphht
    thhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrh
    grghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:yCobaK1SSPRrWnUF34d6BIiznRMJ1p8IThBKjTsXfmNhhqMg3tFmCw>
    <xmx:yCobaAFm0nbvjEx5g_NcqFYZtiJsbfmb-hwFFsFRKbSSzYYabVLszw>
    <xmx:yCobaL_wDAck5cBeMXV_oeYlThs64SOjj0yx5-felXtiZtVRcyvulw>
    <xmx:yCobaNmsf6VLQ2BYxdE0zFt0NPTWXRoK84JugDQjmoi-d7jPS2tW0g>
    <xmx:yCobaOEF7j6kRaIfwfhwIu4MvyU_GrC-RPj4jcmNXpdDS8mmpntPiBNi>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 May 2025 05:41:28 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 1/6] media: rcar-vin: Use correct count of remote subdevices
Date: Wed,  7 May 2025 11:40:09 +0200
Message-ID: <20250507094014.622087-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507094014.622087-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250507094014.622087-1-niklas.soderlund+renesas@ragnatech.se>
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
same in the past. Fix it before the two diverge.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index cfbc9ec27706..9856a7a70026 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -262,7 +262,7 @@ static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
 
 	mutex_lock(&vin->group->lock);
 
-	for (i = 0; i < RVIN_CSI_MAX; i++) {
+	for (i = 0; i < RVIN_REMOTES_MAX; i++) {
 		if (vin->group->remotes[i].asc != asc)
 			continue;
 		vin->group->remotes[i].subdev = NULL;
@@ -284,7 +284,7 @@ static int rvin_group_notify_bound(struct v4l2_async_notifier *notifier,
 
 	mutex_lock(&vin->group->lock);
 
-	for (i = 0; i < RVIN_CSI_MAX; i++) {
+	for (i = 0; i < RVIN_REMOTES_MAX; i++) {
 		if (vin->group->remotes[i].asc != asc)
 			continue;
 		vin->group->remotes[i].subdev = subdev;
-- 
2.49.0


