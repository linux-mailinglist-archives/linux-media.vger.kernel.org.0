Return-Path: <linux-media+bounces-36878-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 758E6AF9F32
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 10:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02C6C1C256F1
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 08:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7FF2288521;
	Sat,  5 Jul 2025 08:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="I2B5DwNs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Z+yQP2fk"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F991C1AAA;
	Sat,  5 Jul 2025 08:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751704728; cv=none; b=vCDYoomFkminNUNBS6xVgJ0K+LKNNQyt35plBzZuWPYjKIXIyber6x+Y1eF0c7g53N1IZUMvkqstHmTGMkAAJE4MNgo1lxl0r+U+E/Ze4yvItdPQwVcSOYrVQTDuGyI+z+Wwb3dASti8pzTLdRBVEkt9UZNjGwAFTgmk60FLTcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751704728; c=relaxed/simple;
	bh=xSkvj9o8V0bTzCrnkkf8hA7OPl6MH7/g1LzmP4TTltg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OklYRxqMqDdZamkR7djnotApWI8JF6Ubvfw68vZGh/v2LvJOL7NMS2NSMC4ESUwyVHdy2+gADrYVm41AnKuHMaMXlcW1bmvBmDqZ7T46nkIswUQYzVrX7dpl+MD4folnewgxpuDhQe/EBSbFTmry3biDpnVKSxC7PPtQcO+tS6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=I2B5DwNs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Z+yQP2fk; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1CA277A0185;
	Sat,  5 Jul 2025 04:38:45 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Sat, 05 Jul 2025 04:38:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751704724;
	 x=1751791124; bh=OdxKbVOoneXqLrmcVM6lNH10xUJ2oyEDKl8lEZHizkE=; b=
	I2B5DwNsf6f6jAj/zTiklVvNe3DZjqu8bknwuE+IemFBRWc4GP8IbkDB5fmM3WRd
	816cO0Dg1q0j1UDWjRbD2KzAwJerPCS55GqPNJ33y73G0ddRyHAl9dAg1u7ucVJ+
	LmuDvML4z5D3vOOW4lMcY32/23hwRfWLxtqCJGV7buwUsoGSMff86hl2MdNU3Djp
	RKY/vxbduzb9Mk2AaRQew9zsWG5/+2xrQNe2tlLihgbzIgeImF7VK/XwflunF3yb
	z2++jUNHzYK9Cger2IM6bf2P169nW/yVg2m7IVukBz8cOj+oSp1NwO1mlrzzwptQ
	/7krkxJO93C7IAAzePuIBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751704724; x=
	1751791124; bh=OdxKbVOoneXqLrmcVM6lNH10xUJ2oyEDKl8lEZHizkE=; b=Z
	+yQP2fkAYrSgrclg5xIapCETZff6Tea/FUWNVvqSy8zlhCkDent8vWkLuCbzsJJb
	wTAgqRFDYQII101jwcKlk8Pzf8/B6tf+bWRHX9uL71dzZoNrdfz+h/mxkdLtl6Wo
	uF1Nb4dN+t2o92I0auLsgsfYhUuXli4Y4zmhLYlVWl3+xRog7rHuYfrEgnhHVcOE
	8LXwy3FMf/VyBrhIutZjJasXUUT+TMlOoGjEXEQOXPXQ/98Ok76lOYM4sgEVXmua
	4oiQIJSEO4++xwThXIqghNptZyLQmeVUICDenIElAcxpcOCWI9+oCAetLbFO24WK
	qR+mpNcSNugRvdEpJKZEQ==
X-ME-Sender: <xms:lORoaEaJzs1D3-HzoEQTJyRQDBy1bHgHHtEz7NljlAesalCIbiaNqw>
    <xme:lORoaPZyw7jN-EwqDD3hepKtB0SX-FF7cPLSS4v7g7U-kt4MGI75MaJIkSdxU6KT_
    W8FidBtyFI5EKgUo50>
X-ME-Received: <xmr:lORoaO9OqYrNNx7T2BygTC5ADXccci8PuePvp96wmgs3YtxgikfCdxmVfnO3XmbkyV2If_f9Ju88o7y-QsboN9AXlA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvheehjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtoheplhgrrhhssehmvghtrghfohhordguvgdprhgtphhtthho
    pehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkihgvrhgrnhdrsg
    hinhhghhgrmhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruhhr
    vghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtth
    hopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgr
    ghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:lORoaOrBOHLSjhj9ecNMc-sNX5Hv4XZ_sqIT89vvqnvfssGwvldgpw>
    <xmx:lORoaPqQXozHJv2MLSttlxB8y-r9Z3BLrXQssj_DYGxn-8WlKW2UFA>
    <xmx:lORoaMTy4q38vQYV23qtQykDoOgheQGlqnY7hmB7pZxcFUzlJR79ZA>
    <xmx:lORoaPoGCychU5iwSEOE9aMeVbBrM51_CaXrjbKL1k9PHyKDV73i7Q>
    <xmx:lORoaB56hHbkKK-LG_ABGL8e4RqnnCfuvBM6hK_1CdQ7G03jOpwhIz-0>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 5 Jul 2025 04:38:44 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/3] media: adv7180: Remove g_pixelaspect implementation
Date: Sat,  5 Jul 2025 10:37:39 +0200
Message-ID: <20250705083741.77517-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250705083741.77517-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250705083741.77517-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are no consumer left of g_pixelaspect in the tree, remove the
implementation from the adv7180 driver in preparation of removing it
from struct v4l2_subdev_video_ops all together.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/adv7180.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 6e50b14f888f..5d90b8ab9b6d 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -868,21 +868,6 @@ static int adv7180_get_skip_frames(struct v4l2_subdev *sd, u32 *frames)
 	return 0;
 }
 
-static int adv7180_g_pixelaspect(struct v4l2_subdev *sd, struct v4l2_fract *aspect)
-{
-	struct adv7180_state *state = to_state(sd);
-
-	if (state->curr_norm & V4L2_STD_525_60) {
-		aspect->numerator = 11;
-		aspect->denominator = 10;
-	} else {
-		aspect->numerator = 54;
-		aspect->denominator = 59;
-	}
-
-	return 0;
-}
-
 static int adv7180_g_tvnorms(struct v4l2_subdev *sd, v4l2_std_id *norm)
 {
 	*norm = V4L2_STD_ALL;
@@ -929,7 +914,6 @@ static const struct v4l2_subdev_video_ops adv7180_video_ops = {
 	.querystd = adv7180_querystd,
 	.g_input_status = adv7180_g_input_status,
 	.s_routing = adv7180_s_routing,
-	.g_pixelaspect = adv7180_g_pixelaspect,
 	.g_tvnorms = adv7180_g_tvnorms,
 	.s_stream = adv7180_s_stream,
 };
-- 
2.50.0


