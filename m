Return-Path: <linux-media+bounces-36877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1BEAF9F30
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 10:38:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF21B4A5F9A
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 08:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749022877E5;
	Sat,  5 Jul 2025 08:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="FxHOVDOF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JzOYxJn3"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E16D23AD;
	Sat,  5 Jul 2025 08:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751704726; cv=none; b=utxcO64+MJ7QVf62CQ6lpQQqcA5HPYd7oEMUwraS+EK+giyzs+ouqSVnvQMJdpKYg+OOoIANlbCjhMGtP2Cg2+bthB6jjMIYYiv4b5dc4dE4qf44SBWRX5V4vZbAcgGBsk+08jDIzU802POfTMzaRXBMq+YV9yENZ1AGP9a1JKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751704726; c=relaxed/simple;
	bh=/etsaXYFIoZgoyV556HsH8waaHgRD5xUKfLHr6ex3+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E3GHPGv0O7I+6DqvYgW+2A6NXPgRrxCcixvIP5aWFU5LrUS5Xc2fEYJnKpQqKm7U3Mi+zsICn+/CdWNMaLFyTt+grRFy2h6tYpZp/7pOWR62nM9i2PhJq9PyUGetgA59VH1dIBryLJuzp1HylhVCCzQ5GQuVucGyTAlPqrkRIu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=FxHOVDOF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JzOYxJn3; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CE9347A0178;
	Sat,  5 Jul 2025 04:38:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sat, 05 Jul 2025 04:38:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1751704722; x=1751791122; bh=Ci
	8XA4Kt8hBM9T66q7vQ6WvkzlyZxe02KicDx9bUMb8=; b=FxHOVDOFAGfpcS/0Z5
	uiW0Kxalqi1EErgg3EKF9Ude4RLeQ9xwzppdRHMDPzMYLKpP2T7zaXn+zKmJjWoL
	2GhxdyVfplwyxoE0P88WkZVGIMKGVS2oYnu9i0Jf5yIBCqPWPna+0UO+Kd2fn/HZ
	jjIBeUO0KycPnqYgbIqpxZZ2RchFD+czFLfGQDSYT1JrT2tj7vzqg0+4q9rLC/mi
	gl9i/65l/c7lT/g0QhUr/aSCmdqiu16VJOV1LccuHZi5xCKrEqgiOCCjdmARixMq
	PGCgWds/oPet0VhqBA9wogAecZrZTSmpOCsR2J70R/4xz8WjCxe8ipQNuAVeZ1jv
	nz8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1751704722; x=1751791122; bh=Ci8XA4Kt8hBM9T66q7vQ6WvkzlyZ
	xe02KicDx9bUMb8=; b=JzOYxJn3tGREOHgvYzVUAOfkhwuAY3fV2GC8HfSH7u3E
	pCoT84rOwfgOY6vv7QowV5A8rKrcs0HeYdoCGKo752/QHeaReRQYIwnZOjiVTVO0
	/lGPMX71nUfP/zjTsGLsSeNaUUyL35Wqx34EfOoJVtwcW/rBlCFAFY3MPmrs1Vb7
	8vh2S69Bjr/vXzMdFLg+g97rB+2WHruuS27jLqi6qKxHaB5TgZ0qvImU089/YVO3
	aJfDy90igZc3y+UcVzlfpqK27MZTBT5Qq+2Okhd/CFPj6LIutWPjOTnrCrRC8Zp3
	13sO6VNUfdn7WqPG3UJ6wZMCoPWJBWX4Tmemy9e6Lw==
X-ME-Sender: <xms:kuRoaC-ObjzIIzy7Swq3pfjri3r8gc4W_suvcc8rTmsJqZBcvcmCNg>
    <xme:kuRoaCvgGiwR09an1TE1qzGjQVsBKbSnz6k1bzMGGMlfsb2IlQN6EfpyTeFP0zj7G
    mTEINi3ofrpzLqZJyw>
X-ME-Received: <xmr:kuRoaIBs3NWB_Q0buj8zrG7Sph5GK7EIaKX424MfUDcfYm2S1CMrFifQCMuoY2CMQeG-abXEYT2NxqcOX6J8HQ0YZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvheehkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfu
    npguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghsse
    hrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgffffedu
    feeuvdejiedvkefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgu
    sehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtoheplhgrrhhssehmvghtrghfohhordguvgdprhgtphhtthhopehm
    tghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkihgvrhgrnhdrsghinh
    hghhgrmhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruhhrvghn
    thdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhope
    hlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    lhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhn
    rghtvggthhdrshgv
X-ME-Proxy: <xmx:kuRoaKeeOGMQnfYBid9aZLofBJQN84iyn6f5Ag29WtvsEk7Ybbf3QQ>
    <xmx:kuRoaHNb3W0E7DS86zJy7Fjk46_KrqhgK80jtJpVT3suOYfooh_RFQ>
    <xmx:kuRoaEneUzAtJpwISNGvZ2LrbA8i3k6mXLLTAInVXvMzWyQZzKVc4w>
    <xmx:kuRoaJvMVJmZwqdhi20as6sX9fXVwSGC7hSLGMSMRJzx2D2GHjEBHA>
    <xmx:kuRoaNvbE1qmf2HW4ER2XDWfQezvMO-jGCR1zDxb0UocVQTgg_s5vFxQ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 5 Jul 2025 04:38:41 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/3] media: Remove remains of v4l2_subdev_video_ops.g_pixelaspect
Date: Sat,  5 Jul 2025 10:37:38 +0200
Message-ID: <20250705083741.77517-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

With the recent cleanup of the R-Car VIN driver the last user of the 
subdevice operation .g_pixelaspect have been addressed. We can now 
remove the two last implementations in adv7180 and adv748x, and then 
remove the operation from the internal API.

The operation where kept in adv7180 and adv748x to support to R-Car VIN 
as these devices are used on some of the evaluation platforms.

Patch 1/3 and 2/3 removes the implementations while patch 3/3 removes 
the operation from the internal API.

Niklas Söderlund (3):
  media: adv7180: Remove g_pixelaspect implementation
  media: adv748x: Remove g_pixelaspect implementation
  media: v4l2-subdev: Remove g_pixelaspect operation

 drivers/media/i2c/adv7180.c              | 16 ----------------
 drivers/media/i2c/adv748x/adv748x-afe.c  | 17 -----------------
 drivers/media/i2c/adv748x/adv748x-hdmi.c | 10 ----------
 include/media/v4l2-subdev.h              |  3 ---
 4 files changed, 46 deletions(-)

-- 
2.50.0


