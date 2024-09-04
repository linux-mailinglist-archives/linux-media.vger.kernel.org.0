Return-Path: <linux-media+bounces-17588-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B054996BD1F
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 14:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31D781F232E1
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 12:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CFCC1DB93C;
	Wed,  4 Sep 2024 12:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="akoObEM7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XNDhK6w3"
X-Original-To: linux-media@vger.kernel.org
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0371DB532;
	Wed,  4 Sep 2024 12:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725454330; cv=none; b=LwWK4bfuwSuycIDhzsh6iZXOCGEchoXgnaVIQOwhRNSchvrguajzoUX8AS27HU7IHNLVKpybhnxSdg6xKFpN8g4zKjqqyINdOxHbrpvGsNeb2cTZt4brCbQN1T38v19NxUQq7wxDa4ne/r/TfmGFajlNa3M57jNW5qcJuRG2CNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725454330; c=relaxed/simple;
	bh=0a//EH3EusIH8P+9x8b0QiWrV8g8Ikq65oM47KxtAcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TMx0e/5/jUWdguIykTji/7yYDQKqKolRKrD4T9zmwOxjFW6hSHMRUK4cYLDQSG1TO9lbaOpA7WFE3/CuPDHpqLBQqSXAi6/cjl4jKwnbC1WoqveQEAMAxKvS379ty/N4CrANBqSW4ISwKOTkxUyZiA/iAiSK2SJd+cb6j/ImMb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=akoObEM7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XNDhK6w3; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 026AF13801F4;
	Wed,  4 Sep 2024 08:52:08 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 04 Sep 2024 08:52:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1725454327; x=
	1725540727; bh=VM4mJNaEoxxS6lwu2GiAK2Ilo54NSX6YDae+GK8Khnc=; b=a
	koObEM7ZNbbGOHe/qVYPh3CGWim8WJIVBO0qVBOjLgKmxSRi4IlX90mprTY3HdGv
	PRybiAl7Lc2tuobu+qz2KYKAzESbsXicGULhU/4eKIiTu1CVAUm4gotoGNa6koT/
	59bz2EkKBb9cGi1YekKd3TKYvvm7LHFc2h1ZaBV4e7Nvc6psK8xH3R5UWudcLDq+
	qt02WjAQL5+5hbKpLGf5eaYp1Pmc2vuthNf0n7UKXC7fBw0B+mOq07pL+l4WFIrn
	FlO/aUjaLsHPFc7STPG4f9nwuj9S+mPEu/J0z1blDLjHVC05bP32oOrPoKneVMgL
	F4YXkldp95VGBPXuL4vcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725454327; x=
	1725540727; bh=VM4mJNaEoxxS6lwu2GiAK2Ilo54NSX6YDae+GK8Khnc=; b=X
	NDhK6w32e5c9gGTDuTMhZ9evcGQYBnLyA1jq3qKLQzsp9lBMne1VXovQ6Gt8vskz
	o436dyww0ZSISuMq5U2IHxogRlBMcv//3dzrtgTpEVRjN54BQyNl1Yks5PDcL5xw
	daGZDRkPsruG0CsKgD2NstqQHmvbzJTI8TpeyqDs7v8/tQqiOy8MIuYHUqo6azq5
	3VPJyVkclJhCdk3nfDXTDLvDTUc6ggMskMHXfoG9DAg5BjnB6tM05R85JBK3AZ/L
	EWqQ+K2SP6YD8nrazpOlGLNCxogH4GID/qPMBnL+HXaefxcDRE3MUiyGDZcbaHYH
	hnQMPFBw21jFT2yCPuJmg==
X-ME-Sender: <xms:91fYZuwMAW-GYEjFZax0WGpgztye4NmoD8weBR6o8NaNmjYjXoI0Cw>
    <xme:91fYZqSklA6iQERAXCK9bk9dmTmY3sv7uNdGoj_W_T9_spyo58bUuBEdqJ3MBzZ9L
    H4M3tT1QOXMB82BLaA>
X-ME-Received: <xmr:91fYZgXKxbctnv_AQJjFstkZuDyPxruq331ItjPDNPnlGuLREgM180kec69n0q7YFTXMBV9rycSBxjohVE2X-wQrdaUg_19l8bRMFDw-y0NwbA>
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
X-ME-Proxy: <xmx:91fYZkjuNsp1cygEK1i823q4B2rRKv6WYJVlV-vCc-dLfaxAS6Xkmw>
    <xmx:91fYZgDpG8rVxdhbVnMopKhxEJ-vDuXyU9bH2U9US4UxND6M_-zoeQ>
    <xmx:91fYZlLRHm7J7AfVvemc8-wBM8F6y7oPMZVpfoOG86fwieBexXfd0w>
    <xmx:91fYZnBdZBkedRVZTDH5NKm39tbS6g4A9_ZLIhTC_G9ObUYIcW4h3w>
    <xmx:91fYZuCfwOms80p5NNKwyAlZ0-ymgpbylgMBNdI2QDY1yl0G2O1DmZ9q>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Sep 2024 08:52:05 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org,
	apais@linux.microsoft.com,
	edmund.raile@protonmail.com,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 3/5] firewire: ohci: operate IT/IR events in sleepable work process instead of tasklet softIRQ
Date: Wed,  4 Sep 2024 21:51:52 +0900
Message-ID: <20240904125155.461886-4-o-takashi@sakamocchi.jp>
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

This commit queues work item for IT/IR events at hardIRQ handler to operate
the corresponding isochronous context. The work item is queued to any of
worker-pools.

The callback for either the implementation of unit protocol and user space
clients is executed in sleepable work process context. The change could
results in any errors of concurrent processing as well as sleep at atomic
context. These errors are fixed by the following commits.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/ohci.c | 55 +++++++++++++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 10 deletions(-)

diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index 50627b8fc38f..d0b1fccc450f 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -1182,6 +1182,47 @@ static void context_tasklet(unsigned long data)
 	}
 }
 
+static void ohci_isoc_context_work(struct work_struct *work)
+{
+	struct fw_iso_context *base = container_of(work, struct fw_iso_context, work);
+	struct iso_context *isoc_ctx = container_of(base, struct iso_context, base);
+	struct context *ctx = &isoc_ctx->context;
+	struct descriptor *d, *last;
+	u32 address;
+	int z;
+	struct descriptor_buffer *desc;
+
+	desc = list_entry(ctx->buffer_list.next, struct descriptor_buffer, list);
+	last = ctx->last;
+	while (last->branch_address != 0) {
+		struct descriptor_buffer *old_desc = desc;
+
+		address = le32_to_cpu(last->branch_address);
+		z = address & 0xf;
+		address &= ~0xf;
+		ctx->current_bus = address;
+
+		// If the branch address points to a buffer outside of the current buffer, advance
+		// to the next buffer.
+		if (address < desc->buffer_bus || address >= desc->buffer_bus + desc->used)
+			desc = list_entry(desc->list.next, struct descriptor_buffer, list);
+		d = desc->buffer + (address - desc->buffer_bus) / sizeof(*d);
+		last = find_branch_descriptor(d, z);
+
+		if (!ctx->callback(ctx, d, last))
+			break;
+
+		if (old_desc != desc) {
+			// If we've advanced to the next buffer, move the previous buffer to the
+			// free list.
+			old_desc->used = 0;
+			guard(spinlock_irqsave)(&ctx->ohci->lock);
+			list_move_tail(&old_desc->list, &ctx->buffer_list);
+		}
+		ctx->last = last;
+	}
+}
+
 /*
  * Allocate a new buffer and add it to the list of free buffers for this
  * context.  Must be called with ohci->lock held.
@@ -2242,8 +2283,7 @@ static irqreturn_t irq_handler(int irq, void *data)
 
 		while (iso_event) {
 			i = ffs(iso_event) - 1;
-			tasklet_schedule(
-				&ohci->ir_context_list[i].context.tasklet);
+			fw_iso_context_queue_work(&ohci->ir_context_list[i].base);
 			iso_event &= ~(1 << i);
 		}
 	}
@@ -2254,8 +2294,7 @@ static irqreturn_t irq_handler(int irq, void *data)
 
 		while (iso_event) {
 			i = ffs(iso_event) - 1;
-			tasklet_schedule(
-				&ohci->it_context_list[i].context.tasklet);
+			fw_iso_context_queue_work(&ohci->it_context_list[i].base);
 			iso_event &= ~(1 << i);
 		}
 	}
@@ -3130,6 +3169,7 @@ static struct fw_iso_context *ohci_allocate_iso_context(struct fw_card *card,
 	ret = context_init(&ctx->context, ohci, regs, callback);
 	if (ret < 0)
 		goto out_with_header;
+	fw_iso_context_init_work(&ctx->base, ohci_isoc_context_work);
 
 	if (type == FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL) {
 		set_multichannel_mask(ohci, 0);
@@ -3227,7 +3267,6 @@ static int ohci_stop_iso(struct fw_iso_context *base)
 	}
 	flush_writes(ohci);
 	context_stop(&ctx->context);
-	tasklet_kill(&ctx->context.tasklet);
 
 	return 0;
 }
@@ -3584,10 +3623,8 @@ static int ohci_flush_iso_completions(struct fw_iso_context *base)
 	struct iso_context *ctx = container_of(base, struct iso_context, base);
 	int ret = 0;
 
-	tasklet_disable_in_atomic(&ctx->context.tasklet);
-
 	if (!test_and_set_bit_lock(0, &ctx->flushing_completions)) {
-		context_tasklet((unsigned long)&ctx->context);
+		ohci_isoc_context_work(&base->work);
 
 		switch (base->type) {
 		case FW_ISO_CONTEXT_TRANSMIT:
@@ -3607,8 +3644,6 @@ static int ohci_flush_iso_completions(struct fw_iso_context *base)
 		smp_mb__after_atomic();
 	}
 
-	tasklet_enable(&ctx->context.tasklet);
-
 	return ret;
 }
 
-- 
2.43.0


