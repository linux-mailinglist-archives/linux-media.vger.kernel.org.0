Return-Path: <linux-media+bounces-17292-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E194967609
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2024 13:07:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F1B81C20D9B
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2024 11:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3818E17C7D8;
	Sun,  1 Sep 2024 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="oyb1ROk0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mGm22hSH"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F4E16C684;
	Sun,  1 Sep 2024 11:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725188815; cv=none; b=LujvJa7MlMCdP9LkXtZj1N/njjb2pS4CbMXzBUFC/M8744iznO/DM/csgy4e7+5+P8Gn/JlRXyHGccFe+UqiZXUNLT+eHHaHZaSkMHYzz+m3URqyR7PD5T/ocPAV0mT3fUzitDCVdPK8nvK+MnZUitXz90pFgjtZR7iZgWcVuQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725188815; c=relaxed/simple;
	bh=ydavNYD+iqL8YqGwB0FrgjtumezSHGvAUSoLRpmz3Pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sLdfbdSH+u3ijDYRRiQ1u8hl8ijGK1xCtFJY5+kEvRdzciQtQi5iK3xvqEliVKt6FdyT34L2ldBKKUc+HMCjpA+lPgc4uZk5b5tIFTHTq7CCvMtNE8TCh8YDe2bwoE46/DB2+x4tckzO8tuP1D+vFz8qZixw7E/9bB1SJyailDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=oyb1ROk0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mGm22hSH; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Received: from phl-compute-05.internal (phl-compute-05.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id B77A4114029C;
	Sun,  1 Sep 2024 07:06:52 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 01 Sep 2024 07:06:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1725188812; x=
	1725275212; bh=2SEHXfPMMbG/XZRxOUGUorrs5TFwh/6sxr7DMq7qodg=; b=o
	yb1ROk0bIMbFec7WLubjdPTHvALfa27/ZeEiI0/uHEAoKPQ5fujDz7SRdKDJci9V
	MW3IDQY8ejycn54QvSiHqvPxSdTCKPy9n1mPyPsmlKFfOjcG9ZwVl0GN0dNaMDNe
	nInn3jzDTd+kU45y29TkKMgm4VzGaZTbBxCTdOMjHPlFIRfWpzBZZsrHUwLM9PXS
	7JhQOJ2l2qhtduZVg0qbATw61+UzXCGvCRKzyAhz+iv7SXF+EbRwYS68ZnxIdIXi
	cRtTcb41oZ9it2fqWd2bnPjmS0s+ifSChRm7cRV2qSC3MCAmA5EIZVH/J6C8b1xn
	iigpW5CczcNMrr3K83ZCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725188812; x=
	1725275212; bh=2SEHXfPMMbG/XZRxOUGUorrs5TFwh/6sxr7DMq7qodg=; b=m
	Gm22hSHYDHAAsFSqhPDKkpPMKmMhBOdQFArBdaU2ZCAIGh9NRAjTmwDrcLbdIdd1
	Nge8vZgEbBrzx0n/8rXvSw+4Zd8teXv2wBK4CvDTbpjEwaYtL6LQBaPvDpEy1FQb
	2uxfd7iZLmBJ+hbC+JYJGA8fhD/TtnH4cf4prKhfGM8iHvlTlL9Yw0is3gvLRppT
	xeW5GsG5uBCdw6l4Im0hjaT8DE81gkxjfIM2drD8tzM8BDmeClKaorNBVkmAe9IZ
	80oabxzRYZ9LlWsr+39eEI1vesV6FkAxg0utne3Bfz/HXsR8hCoOPsV5CBczlBJ2
	E20PVjsT+bGtjROaCKNRA==
X-ME-Sender: <xms:zErUZtWpT6MxjE_T-0pDuoGeNQ0sDl0vYhRxcb4yK4t-UO2ZVeYhkg>
    <xme:zErUZtnJ0qk5WydvK4Vbf7LHRTDpRxI50OmroKUmFcG9GUg4Cfqq_iuAgMRQFjh7M
    x8g_81pYvbFRetgQpY>
X-ME-Received: <xmr:zErUZpY_hekDMRAJCQktWz3QyNsKMcg8QxxPhXcWWfmPvD2BOkFa7ORMYBZeJVNrGVb-L__HdnuhGKV9eFbJTgqBUwyH_yhZoGSh2HD3uHc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeghedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghm
    ohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrg
    htthgvrhhnpedvjefgjeeuvdfguddukeelveetgfdtvefhtdfffeeigfevueetffeivdff
    kedvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhppdhnsggprhgtphhtthhopeej
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigudefleegqdguvghvvg
    hlsehlihhsthhsrdhsohhurhgtvghfohhrghgvrdhnvghtpdhrtghpthhtoheplhhinhhu
    gidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqshhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrphgr
    ihhssehlihhnuhigrdhmihgtrhhoshhofhhtrdgtohhmpdhrtghpthhtohepvggumhhunh
    gurdhrrghilhgvsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhig
    qdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvthguvg
    hvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:zErUZgVDCBxTPb0N8GIkMy5ulGf1y_NorL6o-5oUmpVsd3k351SelQ>
    <xmx:zErUZnnLmraRqXlbfLvoIa7J06mMAYCgYS4Ml2t0RTXWm23rHbTsVA>
    <xmx:zErUZtf0KdUQdvGLZLvV0TmQpgnFxhy-O_T1SxFsLcRDOhi8y3KLSg>
    <xmx:zErUZhH7pw-Ix7SihWS5NYtixossIvOChETUHrR7Nyy7-WkuawKzHA>
    <xmx:zErUZlV81ozcQLjTcy7TZNDXtNdPbN938EfumRwtsZaXHoD_sYRlDKZP>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Sep 2024 07:06:50 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	apais@linux.microsoft.com,
	edmund.raile@protonmail.com,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [RFT][PATCH 2/5] firewire: core: add local API for work items scheduled to workqueue specific to isochronous contexts
Date: Sun,  1 Sep 2024 20:06:39 +0900
Message-ID: <20240901110642.154523-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240901110642.154523-1-o-takashi@sakamocchi.jp>
References: <20240901110642.154523-1-o-takashi@sakamocchi.jp>
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
 drivers/firewire/core-iso.c | 22 ++++++++++++++++++++--
 drivers/firewire/core.h     | 10 ++++++++++
 include/linux/firewire.h    |  1 +
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/firewire/core-iso.c b/drivers/firewire/core-iso.c
index 101433b8bb51..124579a9c657 100644
--- a/drivers/firewire/core-iso.c
+++ b/drivers/firewire/core-iso.c
@@ -211,21 +211,39 @@ EXPORT_SYMBOL(fw_iso_context_queue_flush);
 
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
+	err = ctx->card->driver->stop_iso(ctx);
+
+	cancel_work_sync(&ctx->work);
+
+	return err;
 }
 EXPORT_SYMBOL(fw_iso_context_stop);
 
diff --git a/drivers/firewire/core.h b/drivers/firewire/core.h
index 96ae366889e0..1b78d66a88a0 100644
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
+static inline void fw_iso_context_schedule_work(struct fw_iso_context *ctx)
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


