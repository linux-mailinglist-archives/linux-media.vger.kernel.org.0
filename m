Return-Path: <linux-media+bounces-17589-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1AE96BD23
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 14:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FD361C24738
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 12:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CFC1DC057;
	Wed,  4 Sep 2024 12:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="YmlnIIlX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HBHXoEsn"
X-Original-To: linux-media@vger.kernel.org
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEF01DA0F9;
	Wed,  4 Sep 2024 12:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725454333; cv=none; b=oZ7wzEUN03aIPUaHbKwknRHaL5zx1c4iA1ki8FWgNT6bB5T9eVvL8SyzyRW4roX6lhXC5Vim79nJjxFiCxr8Vy5p39YbcFKK96RSfZXZQ20c0r3aoxMCHvu77hMMX2eZiStGR+dqY9vL1FxO1bRRV65lziRJr0drRxHN9wGA/1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725454333; c=relaxed/simple;
	bh=/vC0N0asLVl0lHN1KwQMzIN2N/apXFXjJJd8qOMfQuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fl5DzhASMGB50jt5CX2wnva6Hg19do5bwqbYpV3ryEwbLPeimBBc63hbN+jHMQ6V4Ao9B7ygj+7F4Gj1TYyetfmY8+e6YQImW9oQirM2DLmGyT1+EAvrrwRwWHhO6BS49K7C2rbgHCvcS9w+LJ/YsSsclJoFSrVx+TfDETpe658=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=YmlnIIlX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HBHXoEsn; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 132B313801F4;
	Wed,  4 Sep 2024 08:52:11 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 04 Sep 2024 08:52:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1725454331; x=
	1725540731; bh=/t1GxqdzaPNcXcCFcGW0j9sbx/Vl0HCFeyHG4omIRHc=; b=Y
	mlnIIlXbdtwWx3lHpiuZ+kabbGRCemQW21ahs+hgCfflisworXxMqj7DcYYzHkUW
	MLx57mwXId1/CnXOzi/S2OtICInk2j2E2oeDESHvMcfvKjX3ArCeoeGKkmgK4d6z
	+ePfaX25JSY5eeIMybT03+qWKkw9iro8C48RJBZ2KVZSLbV7ILI3/EBiWnnNiHMz
	EGzTdMr9zRqZyuw/DCeKizybWSTT73K9bQet4IHewCgTpPAQNPw9WCjz3nkGMtBC
	43LkosavH27ZyH4UAqPw/Hk1GEHJ5UtNZHEYRuzoMWxTEufTqQGnGAQTRcg9+vfq
	ttwFQWjqyZG+sJPIngwZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725454331; x=
	1725540731; bh=/t1GxqdzaPNcXcCFcGW0j9sbx/Vl0HCFeyHG4omIRHc=; b=H
	BHXoEsnn+dNkmvVBf8S7JX0v6SBaLbxR0TXJyryo//JENfs7D5jhyRvVxtBS9btj
	nOG/zRjwlp0ewHOajKVQ6W+KvuB7upuUfxuELoOkJ7BTcRR+33Gg/JRBcLmcbOtd
	I7COEAyb6pb/Bw7nyoDpnfjQRD+6yM8E7N3KjTgSyFe+dD+dSlWoPwPKEj6wbXzg
	dRlV5g0dkHt2IvnYuLKxzJG3rtgunn6cxGk7fIuwyNO/3+Ou52nCGZj6QxLRk54z
	eSV0DeQVmqpFieVqm+FCpE4B3agoGb8FtjSI71SfAbyeVCAVTI6KwwGBSLBxh7sd
	07vmWfJi8EW/NfcR7aGYA==
X-ME-Sender: <xms:-lfYZjjYisalnynC2WBFatre5Wxfj_hthBTgDFCGLst7CCG4DCwxiA>
    <xme:-lfYZgB89nKi7cXztZL0OgR73SPr81ON0QAuvgtAIKaRfQlU7HiIMO83lQMP3GnHk
    P7tRkYW7OvIbGazHZE>
X-ME-Received: <xmr:-lfYZjEku609nMgWf0TdECoNX1OcPQGakLHyGcsHpN0gtY6nhiqMq7xyi5iB4KrptfjXAJ2adp-eh9bmNPcY2slM0kbv4cFT19pAiQdzCmhBvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehjedgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghm
    ohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrg
    htthgvrhhnpedvjefgjeeuvdfguddukeelveetgfdtvefhtdfffeeigfevueetffeivdff
    kedvtdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhppdhnsggprhgtphhtthhopeej
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtihifrghisehsuhhsvgdruggvpd
    hrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqshhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopegrphgrihhssehlihhnuhigrdhmihgtrhhoshhofhhtrdgtohhmpdhr
    tghpthhtohepvggumhhunhgurdhrrghilhgvsehprhhothhonhhmrghilhdrtghomhdprh
    gtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:-lfYZgTbQTvry-1jZlxhBSWrOaVblmMKamgcoIlnr_osg7sA7yMtgA>
    <xmx:-lfYZgydwwGRrrKx2sXvn72GThjOHJE5gMDwdjXQcH8H532mlgTh4Q>
    <xmx:-lfYZm5CWS_5YYV6DlXr4FoPldQ7MKGItlegQJKUAsg7SNLxd7mACw>
    <xmx:-lfYZlyutW6kYVVdKI0cCRFbT85gEoFOwcS8vviDnYHeizs6JTeVPg>
    <xmx:-1fYZjwG9z90Q0kaET01PQQyT8456AYGFDm424Copxbpsw6FWlh-m6fI>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Sep 2024 08:52:08 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org,
	apais@linux.microsoft.com,
	edmund.raile@protonmail.com,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 4/5] firewire: core: non-atomic memory allocation for isochronous event to user client
Date: Wed,  4 Sep 2024 21:51:53 +0900
Message-ID: <20240904125155.461886-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904125155.461886-1-o-takashi@sakamocchi.jp>
References: <20240904125155.461886-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the former commits, the callback of isochronous context runs on work
process, thus no need to use atomic memory allocation.

This commit replaces GFP_ATOMIC with GCP_KERNEL in the callback for user
client.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 3ea220d96c31..518eaa073b2b 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -982,7 +982,7 @@ static void iso_callback(struct fw_iso_context *context, u32 cycle,
 	struct client *client = data;
 	struct iso_interrupt_event *e;
 
-	e = kmalloc(sizeof(*e) + header_length, GFP_ATOMIC);
+	e = kmalloc(sizeof(*e) + header_length, GFP_KERNEL);
 	if (e == NULL)
 		return;
 
@@ -1001,7 +1001,7 @@ static void iso_mc_callback(struct fw_iso_context *context,
 	struct client *client = data;
 	struct iso_interrupt_mc_event *e;
 
-	e = kmalloc(sizeof(*e), GFP_ATOMIC);
+	e = kmalloc(sizeof(*e), GFP_KERNEL);
 	if (e == NULL)
 		return;
 
-- 
2.43.0


