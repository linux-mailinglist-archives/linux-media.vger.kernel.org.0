Return-Path: <linux-media+bounces-33025-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDD6ABF5E7
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 15:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 021134E6DF7
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 13:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145C3274FFB;
	Wed, 21 May 2025 13:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="tNYph5Ge";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jpx1ZjB+"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CE326D4EB;
	Wed, 21 May 2025 13:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747833689; cv=none; b=nlLoqIt7lt4obyJnGWj/sn7ikT9fIDVhRfwNqka3jfSm203Ek+6KKMMQKjX3wrCUnRwQ8zWYdIq9CWJGOvX4oflAPpXIKX21yw+L7E6aQ8juneUbk7ZG7xK4dDEwxyAI0ovN3VEm/JYalDYjynEgf/YUK2GcFMrHJE0YJPqJG/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747833689; c=relaxed/simple;
	bh=sfWonh8KgG9SVcgst+ESZk9f51EiHh/9IVxE1J6eFok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TbnR65IAPxXb740/ASIRnupXdH+ykb5KjOflLNamjBxSCo8fC7IiuOx/RsXScOqUBzw7hTduEfeeqS8CL6r1wZ/nt3p9EuyhxEB4mUbcujcMSDWVAYSl7e6GynvxpckAqVMXq8nhIu7C8eVtDGb5hllaLKNQSCCjNlZP72fEseo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=tNYph5Ge; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jpx1ZjB+; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 58C64114012F;
	Wed, 21 May 2025 09:21:26 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 21 May 2025 09:21:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1747833686;
	 x=1747920086; bh=ag1sBhpk21cQwhPAldR462s8gAi6uyxSJ+eV/ePJe4g=; b=
	tNYph5GeRTwHgKVfsdPSvnmDD5b/u51juI50lyM4EU2x9GKmIwXthTTLAvf9qowJ
	Dd+Tj1Lv9of4CS8OIXVjU0qAXxVALPYykXjg7qyqp8VNwvsBmph9NfkQseSj8wqR
	4NidPpdJ8PnfUtDLn7E8eGeMgQ5z1sjHTeZNUOvHKfa0tIaOuyRsZh3h2KZCdk6k
	+S3YLKBgXdx5hbe17sYp//ONJ6jC5ZuQv6sEbJZW3lEJowh59NP9Uwi6gs2DJLku
	wsx6j6x1o5g242pDIPFBJX0jRUcLADTNNunlA/3D3AApPCzIzcfKDvAEjSkN5YH1
	yTK1P83YCoyLtiMZHx65XA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747833686; x=
	1747920086; bh=ag1sBhpk21cQwhPAldR462s8gAi6uyxSJ+eV/ePJe4g=; b=j
	px1ZjB+fXf6ol4C7PF+/tVTxOUZMezN7eLsqEEWe9S7kPPMbmb/xAfMrajIuuqpK
	RIRmup50002n/+lV4+cl/1fs5ONFTHBgjTymNqNxmJohwKSFiPW+QxugkCw91H3x
	3vNrGA2xMpau1U+ZFIG/t8zmm3kjSCAR6OrJ9ycfmCs3LJO764sb2a+QA50Ll7yW
	lMP6U20RwbAhTJ5DhgzN8whwre+M1GDKM6d046e09PGis4g+9UwGJ0VJq9Cpm49m
	WlLpASpQ2n1JTK+DKJy4va6TeezLTGrgaKQHLHbeNxed5WL+/6v9AR5NXr4oe/SK
	w4fMYkJOkud73D4n6b6/A==
X-ME-Sender: <xms:VdMtaEBEyU_U9vn5rwTBbyNQQILB7ZHAd8RReIhc2jmeYXeBVLy4Qw>
    <xme:VdMtaGir-X5811pilpfNybwol25KTE4ThBKRHgPG3ZsHTAPjaoQAM-FZRawXemiCU
    fRkQf5ve6BmD6Agcec>
X-ME-Received: <xmr:VdMtaHnDjYtJx5mzDZ3RxfrvTqs5dWngv0j6v-D6L_-FzLSbt_eJDiT56XaKDfLj-Q8PasWZG9JSvMVOXi-e8L57>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefudekucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgj
    fhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnug
    cuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggt
    hhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeuke
    evfeduhefhhfejfffggeffleefgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvg
    gthhdrshgvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtph
    htthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhmihdr
    vhgrlhhkvghinhgvnhdorhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpd
    hrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghr
    ugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnug
    dorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:VtMtaKxcai8afHp92JaG7pDO68dRoSzCzLL6jaey4ZojRUmkIj6ccQ>
    <xmx:VtMtaJTBX5JfQ3b7rHcoHO1790Fnq5iMXsb8iM0i3QnaofboLjo7qw>
    <xmx:VtMtaFYAB6hG2DoDzf2EHcVzpwmaGyP9H75LdnEr6yaguIR2YjbPBA>
    <xmx:VtMtaCT6LSudBcqF1tOOvlU8uN-WWSwYTULtxEC7WBdlFd6g2ep7DA>
    <xmx:VtMtaOCmq89IX_kCEOp2iMHL_JOvJfwQFA1eDi31d890R-dJZFWqZ6WM>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 May 2025 09:21:25 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 1/6] media: rcar-vin: Use correct count of remote subdevices
Date: Wed, 21 May 2025 15:20:32 +0200
Message-ID: <20250521132037.1463746-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250521132037.1463746-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250521132037.1463746-1-niklas.soderlund+renesas@ragnatech.se>
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
index 846ae7989b1d..b9ea5b8db559 100644
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


