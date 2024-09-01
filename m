Return-Path: <linux-media+bounces-17293-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D329496760C
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2024 13:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50AB31F21A18
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2024 11:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6EE17DFF5;
	Sun,  1 Sep 2024 11:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="aMFxa78L";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="p/GyF/1H"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F3517BB3A;
	Sun,  1 Sep 2024 11:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725188817; cv=none; b=NXSIrzJtdA3lWE8vIUic4iaZkEXUL1o8lAbD7YqLW/sAYX4Dg5EzYBKekThkyfx1b1Q+hs1tW9e5gkysSz1Du5V6bIxxhT5MrbhtOkgp/HmVOh5yNAZCuqiZ+OIRMHZ5AGPHVdGv15u/GVpCM4yk7fFLj96CQDfBEUmTUtk2gdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725188817; c=relaxed/simple;
	bh=yKOaG+kSFix+vIuQ6lIJ6MAOdbVN2WqpuE6eTJSdVIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T9iqarMGIxNr+X2ueBPjU8W56dt1peKlAjPxGrPx0GSVOmR3cjwo8so2YLFJxwM34VXRchi6zAqT0FfGaaV9uhDHIlzSRWLpQuTDE+BXxoKc3MdnDWNd9hfIWs3uZZaDa9iL2BnzEanIYczRWyploy8ROyatNQuThY55/w1TFJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=aMFxa78L; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=p/GyF/1H; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id DA81D1140299;
	Sun,  1 Sep 2024 07:06:54 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 01 Sep 2024 07:06:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1725188814; x=
	1725275214; bh=H3FG4jYj1xMGNWjODDfCxIAEWvCnUOU5rzwe2GtoNos=; b=a
	MFxa78LYkGv+DpRRncJyoOQaTvdgMGyNAERDLpVezSjwkWrq3Gq+Vy5GbU/ts18m
	iFJMeamaTZoTgsoh4vyxaBoV8Cr4VVxqkzEYzoGPOF+8QHYWyxZNr8yXUjh6Nts5
	TY7hRSBEbLDzdUaVxtZu7Iz+1MSmcEIwi7z7NrxfuDdKZsFHV5eDrH1nwORYE9Wg
	6bQkFhMs1hQkIXFv7VM3TTKSs5CVPa28suVL4H/ZGHvrH9AHhPXck/mlRV/bCi9h
	SDx/o+wZeZJ+rXDnS6i8K534EpJKREUzNGJLlH8SX7nJDjzBkwJynA/8z7O4qu94
	kobd0j6esKqD/sPwMeZ7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725188814; x=
	1725275214; bh=H3FG4jYj1xMGNWjODDfCxIAEWvCnUOU5rzwe2GtoNos=; b=p
	/GyF/1H41Hxm9wqfxXdcLKMgrag7KmFk93CkihFREl+KiSVxR0RECTYvHjWQgpkK
	Tc69TClrQt/dR12ico5FPVV9ye0pgSdBPnY3E+vkgfwbV+1Qx3cJkyhPpt5MSc7J
	HIfuXCXHfNeMv65T9YZ/qDVnV5jXhXKIIZoZrEtEzoCIkXCEEpjqxnn8I/sUpOZC
	ucQh1tZCjE3vaLaeGu3nCKA2VcDy1nnouFfBhoD/gZzfZJNDsKmmiyscNOQeyERo
	8iia11EmjTj3eEXIsS1HXf95E5MRC6nu7znhGYTdy/LuFaMpHv+QeH+Xf3b7AJiW
	Tl+ZdBmnovhD4PcSgAQSw==
X-ME-Sender: <xms:zkrUZvfEH4ZS5F8BMs7-30K9EOZVAwbuN5c9dRf6hxsuM0jl0IAt8w>
    <xme:zkrUZlPjJrRbJc76Kf04MyYchqR70r6Ce9c_q2Re2HhqpgPrh5DdXHPBWxXwHo75L
    b5m5y60hCC0d3zF62k>
X-ME-Received: <xmr:zkrUZoi0ryZbO-0Wh3ETU8CL-4EVdmlfRvliFrFjFGvLBHYH-kgA51zCt6co1dpxjN9vorHMOUPdEqUApeSAc6aGSXosihMq89MBgkBdIgo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeghedgudefucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:zkrUZg96RfetWT1Gqw_H8dcew-qSbk9SDAddkCKJw5f9A5vuDKd6FA>
    <xmx:zkrUZrs2VnjGxnuQafIxRzLl1DuoyZ9znznO5gPVViBYe7df9BRv9Q>
    <xmx:zkrUZvHrK9Eb6CELOHITJatMAPmUpYlHbeGTSgIrtdyBADwt9doMBg>
    <xmx:zkrUZiONd3ik683ysDoTsIz32_rXDNxibHqaaInSPZu347lG5mn9Yg>
    <xmx:zkrUZk_oqx_HI7v2_FOfmvp2fscoPfgeYmPB99HGeIgiWEv_um9NNSjw>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Sep 2024 07:06:52 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	apais@linux.microsoft.com,
	edmund.raile@protonmail.com,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [RFT][PATCH 3/5] firewire: ohci: process IT/IR events in sleepable work process to obsolete tasklet softIRQ
Date: Sun,  1 Sep 2024 20:06:40 +0900
Message-ID: <20240901110642.154523-4-o-takashi@sakamocchi.jp>
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

This commit queues work item for IT/IR events at hardIRQ handler to operate
the corresponding isochronous context. The work item is queued to the
workqueue on the cpu in which the events are handled.

The callback for either the implementation of unit protocol and user space
clients is executed in sleepable work item. It could results in any errors
of concurrent processing as well as sleep at atomic context. These errors
are fixed by the following commits.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/ohci.c | 55 +++++++++++++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 10 deletions(-)

diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index ad3bdc48f0f5..c94b2728cf03 100644
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
@@ -2237,8 +2278,7 @@ static irqreturn_t irq_handler(int irq, void *data)
 
 		while (iso_event) {
 			i = ffs(iso_event) - 1;
-			tasklet_schedule(
-				&ohci->ir_context_list[i].context.tasklet);
+			fw_iso_context_schedule_work(&ohci->ir_context_list[i].base);
 			iso_event &= ~(1 << i);
 		}
 	}
@@ -2249,8 +2289,7 @@ static irqreturn_t irq_handler(int irq, void *data)
 
 		while (iso_event) {
 			i = ffs(iso_event) - 1;
-			tasklet_schedule(
-				&ohci->it_context_list[i].context.tasklet);
+			fw_iso_context_schedule_work(&ohci->it_context_list[i].base);
 			iso_event &= ~(1 << i);
 		}
 	}
@@ -3128,6 +3167,7 @@ static struct fw_iso_context *ohci_allocate_iso_context(struct fw_card *card,
 	ret = context_init(&ctx->context, ohci, regs, callback);
 	if (ret < 0)
 		goto out_with_header;
+	fw_iso_context_init_work(&ctx->base, ohci_isoc_context_work);
 
 	if (type == FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL) {
 		set_multichannel_mask(ohci, 0);
@@ -3225,7 +3265,6 @@ static int ohci_stop_iso(struct fw_iso_context *base)
 	}
 	flush_writes(ohci);
 	context_stop(&ctx->context);
-	tasklet_kill(&ctx->context.tasklet);
 
 	return 0;
 }
@@ -3582,10 +3621,8 @@ static int ohci_flush_iso_completions(struct fw_iso_context *base)
 	struct iso_context *ctx = container_of(base, struct iso_context, base);
 	int ret = 0;
 
-	tasklet_disable_in_atomic(&ctx->context.tasklet);
-
 	if (!test_and_set_bit_lock(0, &ctx->flushing_completions)) {
-		context_tasklet((unsigned long)&ctx->context);
+		ohci_isoc_context_work(&base->work);
 
 		switch (base->type) {
 		case FW_ISO_CONTEXT_TRANSMIT:
@@ -3605,8 +3642,6 @@ static int ohci_flush_iso_completions(struct fw_iso_context *base)
 		smp_mb__after_atomic();
 	}
 
-	tasklet_enable(&ctx->context.tasklet);
-
 	return ret;
 }
 
-- 
2.43.0


