Return-Path: <linux-media+bounces-17587-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEFE96BD1B
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 14:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DF8F1C2494C
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 12:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B1971DB53C;
	Wed,  4 Sep 2024 12:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="rSnh85vQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="f476JSad"
X-Original-To: linux-media@vger.kernel.org
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688561DA607;
	Wed,  4 Sep 2024 12:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725454328; cv=none; b=ioY0wpn0rLXcLVhW7I06dqTTqmfeiRtxvntARYMRCQV+zMD6ofdWc9SgvX5OBX2hSnRmHurB0fvdnm47Z+isGIgGfBF8Kv+2JLtwgLHp2EHRSJpRVeGMiVocOnEfuEgiqnaSLIFxBRdLtYieb3VdyISd6I3m6fLHQ6PVj7q+96E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725454328; c=relaxed/simple;
	bh=Rt4lx3HXVPQrysORXCw0l3fKDUyXQb2o3/1ZWr1n2bA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lyRwGCzobnOUItyDkQ8UAW7PxdCjAHmjq4Dt2/AEFZ/H66DKnw5wGy7Pn3gxgmulGigqs94wXlFvbVFkhvEqenmVM+er4H2X9g+c+wSHN7r9Oxw8Kw43+eSumcMr7SrNYRAcLOcovfkwbWIQbe53FgwGgyTF0aSBU2jjYJoMo/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=rSnh85vQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=f476JSad; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id B3AAF1380141;
	Wed,  4 Sep 2024 08:52:05 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 04 Sep 2024 08:52:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1725454325; x=
	1725540725; bh=RSfspq38f8gW7QJFYGIc1REufVKmHzw31V7N3gqLU3w=; b=r
	Snh85vQYtngRK7fiwEM9LT89woRP8/quEXuYdz7s+tktehi5lsDR4FjoR5E6Wziw
	nKONHtf85FDIp4+ltQZwk7DLYLHpTv8bZclDCRxZyzAopQ/9lnc2rOOEMUofMXqp
	rBnrNX8J83Fg2k/DHaganeHDY44h4seBUuXdktxcmWW/bUSP4KJortiKnVxNw5pt
	ZD+d/dar3w0i+r8NbPeNxBtn3qSwrQ4YkwecffmrRlT1onYKwYsHR1Duo9xbnCWl
	IoLXheYIJS6+YL0bTEtaL3q41WwNGx7xnFmgABpUOTLVO+28lfPRn7cCtS9HspMG
	HhFDEkSkLoWBSqXZf3jDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725454325; x=
	1725540725; bh=RSfspq38f8gW7QJFYGIc1REufVKmHzw31V7N3gqLU3w=; b=f
	476JSad/qUY+bLQTJbCPoZZTVytfoDAwLndGnRD8l5RIa9psGrkq896mNNIq8hF4
	JfGfHfuox3mDWvxeGEXqRRFsgHJXACoRgXK6SiuAKVjQixmULW6z8JcBTXEw0LhS
	ZwbgmKHOGrZJv7grC5bF6IfIVy5R0o1l1kWpYVLasBhctbesu4fQ00OdkgUkbY3F
	+zBZAQm3Z/HoISRDkkvJUXfUxME96shajxhbKom/Pf1+JHYx3eJaij9Neh7kLSE5
	1oYm8YQGDzwX+XQgn5ewIlJT+k6Dy08ekYCnRLgEvt2bWMeRLMvsoCKHtlk2e1oA
	IudPnwqYFbFKkIHDTvkSw==
X-ME-Sender: <xms:9VfYZpB4lVXmp1lL7JIg_GOZR9NCovUNxTRrA6wEkL_j_wWc0exg-A>
    <xme:9VfYZnjRqwf17hoo0nF7sP2zwzdYKVqK0syuxHwctyUJ-IqPoEfDNzyR4kZrcmKv0
    YzFagNH-yX4OJ6VO30>
X-ME-Received: <xmr:9VfYZklYWsQ4PW9lY0ARs24PrFnoKTWtdSlPDU2IjwwlAHUqnroPhqaB9ADgnpNeZK7_vxJ3A-6ZiA097N5Nsu844OGBWXmGQ3MKVu_bkrJnmw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehjedgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghm
    ohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrg
    htthgvrhhnpedvjefgjeeuvdfguddukeelveetgfdtvefhtdfffeeigfevueetffeivdff
    kedvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhppdhnsggprhgtphhtthhopeej
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtihifrghisehsuhhsvgdruggvpd
    hrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqshhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopegrphgrihhssehlihhnuhigrdhmihgtrhhoshhofhhtrdgtohhmpdhr
    tghpthhtohepvggumhhunhgurdhrrghilhgvsehprhhothhonhhmrghilhdrtghomhdprh
    gtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:9VfYZjyZ-LuwxXFYZ3cnjuojfaQxcqCtiV4GOF8IynVgFjt8rm8HUw>
    <xmx:9VfYZuTqGOrZycffjXkhe_XdMiaTu0OVLh5TFPVOsE3oFQ6fZRC51w>
    <xmx:9VfYZmZ3u9ICDJ-b7Lm1yxYEXT_clto3tLgBbWo70OD62GESmhOJ2g>
    <xmx:9VfYZvQLvR_zO8rwtVPyXosvk96uEo71h0R1MqByQ3PW30Qeyw5JrA>
    <xmx:9VfYZrSpDCcfkQKHSTcxyAXpBgPWgoLybfveeBqogYR6tUrHVV0LNu09>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Sep 2024 08:52:03 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org,
	apais@linux.microsoft.com,
	edmund.raile@protonmail.com,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 2/5] firewire: core: add local API to queue work item to workqueue specific to isochronous contexts
Date: Wed,  4 Sep 2024 21:51:51 +0900
Message-ID: <20240904125155.461886-3-o-takashi@sakamocchi.jp>
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

In the previous commit, the workqueue is added per the instance of fw_card
structure for isochronous contexts. The workqueue is designed to be used by
the implementation of fw_card_driver structure underlying the fw_card.

This commit adds some local APIs to be used by the implementation.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-iso.c | 30 ++++++++++++++++++++++++++++--
 drivers/firewire/core.h     | 10 ++++++++++
 include/linux/firewire.h    |  1 +
 3 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/firewire/core-iso.c b/drivers/firewire/core-iso.c
index 101433b8bb51..af76fa1823f1 100644
--- a/drivers/firewire/core-iso.c
+++ b/drivers/firewire/core-iso.c
@@ -211,21 +211,47 @@ EXPORT_SYMBOL(fw_iso_context_queue_flush);
 
 int fw_iso_context_flush_completions(struct fw_iso_context *ctx)
 {
+	int err;
+
 	trace_isoc_outbound_flush_completions(ctx);
 	trace_isoc_inbound_single_flush_completions(ctx);
 	trace_isoc_inbound_multiple_flush_completions(ctx);
 
-	return ctx->card->driver->flush_iso_completions(ctx);
+	might_sleep();
+
+	// Avoid dead lock due to programming mistake.
+	if (WARN_ON(current_work() == &ctx->work))
+		return 0;
+
+	disable_work_sync(&ctx->work);
+
+	err = ctx->card->driver->flush_iso_completions(ctx);
+
+	enable_work(&ctx->work);
+
+	return err;
 }
 EXPORT_SYMBOL(fw_iso_context_flush_completions);
 
 int fw_iso_context_stop(struct fw_iso_context *ctx)
 {
+	int err;
+
 	trace_isoc_outbound_stop(ctx);
 	trace_isoc_inbound_single_stop(ctx);
 	trace_isoc_inbound_multiple_stop(ctx);
 
-	return ctx->card->driver->stop_iso(ctx);
+	might_sleep();
+
+	// Avoid dead lock due to programming mistake.
+	if (WARN_ON(current_work() == &ctx->work))
+		return 0;
+
+	err = ctx->card->driver->stop_iso(ctx);
+
+	cancel_work_sync(&ctx->work);
+
+	return err;
 }
 EXPORT_SYMBOL(fw_iso_context_stop);
 
diff --git a/drivers/firewire/core.h b/drivers/firewire/core.h
index 96ae366889e0..2874f316156a 100644
--- a/drivers/firewire/core.h
+++ b/drivers/firewire/core.h
@@ -159,6 +159,16 @@ int fw_iso_buffer_alloc(struct fw_iso_buffer *buffer, int page_count);
 int fw_iso_buffer_map_dma(struct fw_iso_buffer *buffer, struct fw_card *card,
 			  enum dma_data_direction direction);
 
+static inline void fw_iso_context_init_work(struct fw_iso_context *ctx, work_func_t func)
+{
+	INIT_WORK(&ctx->work, func);
+}
+
+static inline void fw_iso_context_queue_work(struct fw_iso_context *ctx)
+{
+	queue_work(ctx->card->isoc_wq, &ctx->work);
+}
+
 
 /* -topology */
 
diff --git a/include/linux/firewire.h b/include/linux/firewire.h
index 10e135d60824..72f497b61739 100644
--- a/include/linux/firewire.h
+++ b/include/linux/firewire.h
@@ -511,6 +511,7 @@ union fw_iso_callback {
 
 struct fw_iso_context {
 	struct fw_card *card;
+	struct work_struct work;
 	int type;
 	int channel;
 	int speed;
-- 
2.43.0


