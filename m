Return-Path: <linux-media+bounces-53236-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAA1LIbPnGllKQQAu9opvQ
	(envelope-from <linux-media+bounces-53236-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 23:07:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4C517DFB3
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 23:07:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60AE3319DC92
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 22:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D5F37A483;
	Mon, 23 Feb 2026 22:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iKsJcJCO"
X-Original-To: linux-media@vger.kernel.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EF437AA70
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 22:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771884097; cv=none; b=c8szld04pwMzQfh6RVD3Fb6+LldnNYvUquOdTd3t7m4DKclohLlqp1S2fTP+0qoS7wgBEX9lF8NMY3Iuu31unXamgGEY5hfZcA0fuQUqxCh90068NUojjHg1RKuObQcSOwKcAf5dnrOX6/WSJ40G/54jytJSCRYZZQa55XeGB5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771884097; c=relaxed/simple;
	bh=0tBP5BscOH3N3vwVP0uhe79lDd1tLni+eXo9p6Vj0+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JgoSGvCVpfgJykQST5TFlViI0qco0/fc6gk/9Bsk4k65XdhFJ1q0D0HX7v9lmpAMw+UoMcbMVw1Qx0J1Wm5ddyU5ciSUCIYFTPdh2M5nSBdV4gCexfjs6lD73P5kYo4Rx1H5200JOuqqLoTtrgBbhx/ai9XACUsiSghb3DDE7es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iKsJcJCO; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771884094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Py2P1r/CaueFX7wsjQNF4qDKdF68aIQqofiLeicyHf4=;
	b=iKsJcJCOc4zp/KkntDoMTl4EMwPjvvrhs1gh61/YG2me4p2/pq5AsWOScgiiJ5Vq5MaYw0
	IlQfgq1ow5lHtTY+Slk/TcCStp+E/oFSTHt5/XAsYO38YfQ9LhZU6kDNtCUXqNGtzUlDGu
	CliWsPzFYPackVc4TNZlb3Qkpv101tY=
From: Bart Van Assche <bart.vanassche@linux.dev>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	Christoph Hellwig <hch@lst.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 06/62] dma-buf: Handle all dma_resv_lock() errors
Date: Mon, 23 Feb 2026 14:00:06 -0800
Message-ID: <20260223220102.2158611-7-bart.vanassche@linux.dev>
In-Reply-To: <20260223220102.2158611-1-bart.vanassche@linux.dev>
References: <20260223220102.2158611-1-bart.vanassche@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53236-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bart.vanassche@linux.dev,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:dkim,amd.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,acm.org:email]
X-Rspamd-Queue-Id: 2D4C517DFB3
X-Rspamd-Action: no action

From: Bart Van Assche <bvanassche@acm.org>

Instead of assuming that dma_resv_lock() only returns 0 or -EDEADLK,
handle all possible dma_resv_lock() return values. This patch prepares
for enabling compile-time thread-safety analysis. This will cause the
compiler to check whether all dma_resv_lock() return values are handled.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Christian König <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/dma-buf/dma-resv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index bea3e9858aca..b4710f730e9b 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -792,6 +792,8 @@ static int __init dma_resv_lockdep(void)
 	ret = dma_resv_lock(&obj, &ctx);
 	if (ret == -EDEADLK)
 		dma_resv_lock_slow(&obj, &ctx);
+	else if (ret)
+		goto fini;
 	fs_reclaim_acquire(GFP_KERNEL);
 	/* for unmap_mapping_range on trylocked buffer objects in shrinkers */
 	i_mmap_lock_write(&mapping);
@@ -805,12 +807,14 @@ static int __init dma_resv_lockdep(void)
 #endif
 	fs_reclaim_release(GFP_KERNEL);
 	ww_mutex_unlock(&obj.lock);
+
+fini:
 	ww_acquire_fini(&ctx);
 	mmap_read_unlock(mm);
 
 	mmput(mm);
 
-	return 0;
+	return ret;
 }
 subsys_initcall(dma_resv_lockdep);
 #endif

