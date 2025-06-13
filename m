Return-Path: <linux-media+bounces-34772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB85AAD9165
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 17:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB1F31BC397E
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 15:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB231EFF8B;
	Fri, 13 Jun 2025 15:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="T8qUZR5f";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qkAARgE8"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3EF1F1306;
	Fri, 13 Jun 2025 15:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749828915; cv=none; b=K7TrZAi9ex43zQ6DjTRvpdv75+3Dj7+J+QUUbT8kSmo+KwR7AYSgenM+YWAJUsz8wK98xXFLptRx4O+f43cOy2Z9Qv0+n3Fp35q8yr68GqtAyjO6XDdbFS26lqVpZK9HiAj3SnkvxchQ24Te/wzhIk58ycVQGHX4/kD1cOUPFVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749828915; c=relaxed/simple;
	bh=ReOReSago1mI0dQGpm/P4G6lnKzF2kMEGKe9KYQMRio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X7U1ex8a6ZjrHhdSmpRNPs8OlY+T9srsc6xPHtU8dfVUZ2SRUUsLdDE/THi6wTsOsesx99yMlSkX0wymnbI+ME4dDp/5NyRoFCAGO2oY+auCC1a6GRWm74zSSKU2CEtcvLB7VO+lGLWHbTp2gzcOZxSYGXpKQSKbaKX584RWRWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=T8qUZR5f; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qkAARgE8; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id ECAF61380392;
	Fri, 13 Jun 2025 11:35:12 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 13 Jun 2025 11:35:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749828912;
	 x=1749915312; bh=y5NyNeDcWLkk1uT92iydjjyKafrH/xhS0CUG/ETEpDM=; b=
	T8qUZR5fSpYLU+bwsnS3TUjQyMK8Y7cg3nHFrNeobE9ng+tiK9FZr/rr0YQdRAJo
	kalPjsBuhdmb2WJPMuwTK/OVclo2Lun2fIYdBe2A4MMm4kWuM3FXVy6JkkRh2+T/
	fO/ShJb3M//ZHxzbkndUNqB9ZuyhHz9PGUlBRewCSu446SbA9IqLRSAhTL3syxdl
	Y8ifHRj+xTGOfouYPzih3Zo3whcsLhHG4COgZqH+WK/tD4D10MrH9WsqxCn6KMYg
	7M6ed6AieOFSBHrbUE2U2TR4AYD7NHd92fW5blrRKEmg1VN+YTnEkqPlcMBz8fRR
	clTBvaeuwbOzwmUGL2T3pA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749828912; x=
	1749915312; bh=y5NyNeDcWLkk1uT92iydjjyKafrH/xhS0CUG/ETEpDM=; b=q
	kAARgE8lIe1bF01txtAxjGp4xEn0EOMphFNU/J1zxqjSo+dw5bNPwL5mgxQ2AoKQ
	PbPABZL8kZDJyoVM0NaM7sXlYqwIoOEiQGika8U+gjt2hTMEmXqn7CSa8AOQeoZk
	YR7Uc5obOq9t96qHS52BKIYT/nYkNjT1eUm4GkGbW0O7dMgvcmIPUbg3e9ti9JH7
	ujISk4W7wyUOOiwjMyj0xzvpdLQb4kQMMFOvpko9lSyDMqdoFg3HR29oJDMVnnKy
	erGOV0HPPCYgoTlV4BK6Sv42huUZZ2+R53osrwVPwSOOnyzjRp1EHn8bPbrxKNiR
	ztWQ24bYz8RHvw2rAp3cQ==
X-ME-Sender: <xms:MEVMaF4z6-MaKMcDybWfVKThp8jvHXd-RZUR76ndeVrgoJsnkJb8FQ>
    <xme:MEVMaC5v6YHhkkungxw3M-Is5X5gfQ1223BCNn-QKy0Lt4uxHhId5r7g7zGXBhVx9
    7Y1Fyxu-FVrAGQAa7o>
X-ME-Received: <xmr:MEVMaMcCEGQ0FdcI3H7hyI5SFhEQlr6vTmBMwlOypnFTlYIB66sXTGjhVMwqki8J0tYM91742XFciA77W4Ii6oKe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeefvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgr
    ihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhr
    vghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlrghurh
    gvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthht
    oheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrg
    hgnhgrthgvtghhrdhsvgdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthdo
    rhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:MEVMaOJkp2N2q3okslwabyOTl4kCSEw9imDYmsX1R7bv1hFrypn9Mw>
    <xmx:MEVMaJLEhAsHZOFmkGvtg-eB5FhxD-_4twl5HxsO66xg8tBdjLzGLQ>
    <xmx:MEVMaHx6oYN6BvCXBb_CKdNwnxQd_kjo4RH2s5ulB6fzGRUesqGfzw>
    <xmx:MEVMaFIgugSNMPRxwVt9cxip_402pio6shrEZeu9Jt5QbSE9G2xUvw>
    <xmx:MEVMaAmPWIXDIyX6VqGEcTLUE_prq0XWezLZcn3-EB8HwdAB7wusT845>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jun 2025 11:35:12 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v6 02/13] media: rcar-vin: Store platform info with group structure
Date: Fri, 13 Jun 2025 17:34:23 +0200
Message-ID: <20250613153434.2001800-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613153434.2001800-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250613153434.2001800-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When the transition of Gen2 to use groups are complete the platform
specific information can be retrieved from the group instead of being
duplicated in each VIN's private data structure.

Prepare for this by already adding the information to the group
structure so it can be used without first having to find the group from
a VIN instances private data.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
* Changes since v4
- New in v5.
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 1 +
 drivers/media/platform/renesas/rcar-vin/rcar-vin.h  | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index cf5830d7d7b1..66efe075adae 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -156,6 +156,7 @@ static int rvin_group_get(struct rvin_dev *vin,
 		}
 
 		kref_init(&group->refcount);
+		group->info = vin->info;
 
 		rvin_group_data = group;
 	}
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index 83d1b2734c41..313703cd1103 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -242,6 +242,7 @@ struct rvin_dev {
  * @lock:		protects the count, notifier, vin and csi members
  * @count:		number of enabled VIN instances found in DT
  * @notifier:		group notifier for CSI-2 async connections
+ * @info:		Platform dependent information about the VIN instances
  * @vin:		VIN instances which are part of the group
  * @link_setup:		Callback to create all links for the media graph
  * @remotes:		array of pairs of async connection and subdev pointers
@@ -255,6 +256,7 @@ struct rvin_group {
 	struct mutex lock;
 	unsigned int count;
 	struct v4l2_async_notifier notifier;
+	const struct rvin_info *info;
 	struct rvin_dev *vin[RCAR_VIN_NUM];
 
 	int (*link_setup)(struct rvin_dev *vin);
-- 
2.49.0


