Return-Path: <linux-media+bounces-17160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F515964C0B
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 18:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 060D61F23379
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 16:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6191B7906;
	Thu, 29 Aug 2024 16:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ZgU3z4iS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KR37OkNY"
X-Original-To: linux-media@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EE91B5ED4;
	Thu, 29 Aug 2024 16:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724950292; cv=none; b=Ac2IKPN3fwivoqC9t9AXplpV9vAXSvvQ67g/OwVfQ+MGLdgFd7cAwnWJiSR6dCTexoo+2kqMbLNszrGgSPRPhw1+SoAlHOgrVF8hEx2B6W6h87QJ6WWSfvCYf+NA1ks7g3ydp9vwlDHjMUusWCQSnfHQS94ZxO2HsQof9xqa1Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724950292; c=relaxed/simple;
	bh=eOO4ga2gq4Fu/RVkf64nUszOHQAmQ6vhsEgqndWRlrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eTMuIRrgZNL7IwYqQPywBPzFiS+gEwWVJRN3AgPx/eT7nm/Ok2SqVJEI7fxc/kiNeRcZR9epvT5F3H8w1o+jQK4cDZgOPddcbKvzWhBPhTd0hpNmFvLmhXrz4brnreop6nenxdtRXepnZV6o9FGyZKbpeLQYpd2LOtlrEd5NPkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ZgU3z4iS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KR37OkNY; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.nyi.internal [10.202.2.46])
	by mailfout.nyi.internal (Postfix) with ESMTP id 4C5A4138FFE1;
	Thu, 29 Aug 2024 12:51:30 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 29 Aug 2024 12:51:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724950290;
	 x=1725036690; bh=WDB8F1Ppi2dnLUjfJLEMky03qYnuVDfL+uH3BolJxiM=; b=
	ZgU3z4iSiMGt6IeZBSltxQkYYjijQIZhAeBoraWdnxzWlYu2ZGDy9fMbR+/i2iX3
	z5MoZeneU/OlFEWQzkVbQl9YHOwi/Z05xg1qGxQNmtq3gHHr/t5LoaFkU88Ec4yU
	fo4rL+WkkW9mAuUDSiPQSdDN/XQk+TP2YSPQSPvUPDyY5ZBcoBNLHBf3Mg0aIko0
	Nj5GXrZs3Z1DNvrr3MsuaXDcrB3AzT2FfwKC2hqJ4Frkjfu03xtLxMqQYFHueo1N
	SBMg8b54+xwxMd5rFT4moA62TZa2Db6PYQq4peH3hWSmlcgQxuM+Ha5DwOJLYB9W
	QxkgjNPGmQCLnQp6yvyrXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724950290; x=
	1725036690; bh=WDB8F1Ppi2dnLUjfJLEMky03qYnuVDfL+uH3BolJxiM=; b=K
	R37OkNYGuq5H6DzqJXoAdzt4IeAWzcFRQnHZUDL0zmiay7cAeGewQ3jy7soJboIr
	wkfoxB4DNeOAMk7IoX3IvWpaB987OJn0lKGmcGr7OYLALNe0Blt8pUalFhQ41MkI
	24OkCHU6XiP7uivb3K0hhYCxAmYe6Igvx3dIgpiLNLoCoBsWD3exJcTE7S7dtpBh
	ECuaPlmq8RxGoNCG7NOJZfFsjCRPBCMGtGrb4cgBODscOCGRtLEayaZnMeEgMjna
	asU5qnFYgNo9myvOdWdtWfjXGuZehr8DMzLF7oG6fhb/WepAK826JORH90jNZ9ZR
	etFsVIOGI8e5oOOj89LBg==
X-ME-Sender: <xms:EqfQZma-hoDermReQ0Orae_LMDi1XdUCh29X5Kkryx7_LDINv8MBog>
    <xme:EqfQZpbRbAo6m1EB3j7XpA7XHIDU7njFXlkX10wSZ2Hll1AomWpZyMRj4bZU5nj82
    EtChJqlOJ7m9Y3kXZg>
X-ME-Received: <xmr:EqfQZg9ZSnYauZo6tjF7Zht2dgKJY2rfhwMRwFMhBnm6FDqNjudevJLZvuH6DzAgQNYJx_cckhLX9d-8MdPS_jtI0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefgedguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmtghhvghhrggs
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptgho
    nhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhkhheslhhinh
    hugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehsrghkrghrihdrrghilhhu
    shesihhkihdrfhhipdhrtghpthhtohepjhhulhhivghnrdhmrghsshhothestgholhhlrg
    gsohhrrgdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrh
    hnvghlrdhorhhg
X-ME-Proxy: <xmx:EqfQZorRYoqp2BSwHIwo5wlucz9_zz4DFs0YRLqU-Qf_YoI_s9RHnw>
    <xmx:EqfQZhr40MfYGCF7ozuQARycmkmOq_ZuSmjzFtlIpBbaB7oQzS6c5g>
    <xmx:EqfQZmSbv5fB7QyKGhUDX2uqbtPAKnEhQyeREuZrK9YAQk17sorD9w>
    <xmx:EqfQZhqT_iyN-si4I_gkiMhMheeBdBIrzJ13D2xNmkv5LpO-osvEvw>
    <xmx:EqfQZviNPXjR7OgCb69GyKuDsFcxzxQmAsChFh_7uuHnYq54YumXiWVr>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Aug 2024 12:51:29 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Julien Massot <julien.massot@collabora.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 4/5] media: staging: max96712: Document the DEBUG_EXTRA register
Date: Thu, 29 Aug 2024 18:50:50 +0200
Message-ID: <20240829165051.2498867-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240829165051.2498867-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240829165051.2498867-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The DEBUG_EXTRA register is not part of soon to be added MAX96724
device. To make it easier to understand the differences when reading the
code prepare for the addition by creating named defines for the
register.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v2
- New in v3.
---
 drivers/staging/media/max96712/max96712.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 46a6bb018fe2..5c15346c05dd 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -16,6 +16,10 @@
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
+#define DEBUG_EXTRA_REG			0x09
+#define DEBUG_EXTRE_PCLK_25MHZ		0x00
+#define DEBUG_EXTRE_PCLK_75MHZ		0x01
+
 enum max96712_pattern {
 	MAX96712_PATTERN_CHECKERBOARD = 0,
 	MAX96712_PATTERN_GRADIENT,
@@ -170,7 +174,7 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
 	}
 
 	/* PCLK 75MHz. */
-	max96712_write(priv, 0x0009, 0x01);
+	max96712_write(priv, DEBUG_EXTRA_REG, DEBUG_EXTRE_PCLK_75MHZ);
 
 	/* Configure Video Timing Generator for 1920x1080 @ 30 fps. */
 	max96712_write_bulk_value(priv, 0x1052, 0, 3);
-- 
2.46.0


