Return-Path: <linux-media+bounces-53235-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6O9DEdjOnGllKQQAu9opvQ
	(envelope-from <linux-media+bounces-53235-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 23:04:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F2217DF42
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 23:04:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7224930AF707
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 22:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5791837A4BA;
	Mon, 23 Feb 2026 22:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="T50wnAdF"
X-Original-To: linux-media@vger.kernel.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDD7379997
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 22:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771884093; cv=none; b=iaeGghXtXdEnhEj8r8LmgP27MnOM3Plc/iK87SZD7OlCcsb8JHYqsKO1LDY6ZcIGuQsyw49K9aNmvICE4z/6m2d274ZrfPbiJls6hpkliCXZttzoptjyP5npa1UTRv86BmoqdsVnpCe4LI+VPGIaJoC0efUpxrFA7hEJdK8oMBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771884093; c=relaxed/simple;
	bh=O7msDbSV/q/aPMQwbkM5TLFQRq+8/vrOQCED1+8NCdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uq9Eq0rfbiXLNQegXlJ27OB59oaTjeLF+rYjg/q/Nr29jF3Dx3EFP3vrqW0q+TZgzx8tJbMsb4ouK4TeOAz42jt5qaeg2Tnl3A7d09eZ9Ubia7nkNKMfeUNgGunSS/CJJydwJQ1aFRAK1stPn9aHVpKcpS0C9VzXdu9TL6DPDYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=T50wnAdF; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771884090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cx0m4RKg1tjcI09gpNOMxEOQE0GYux9DXoEt7ZAs+co=;
	b=T50wnAdF5NS6LJODD63u0Q0iXUFJUCfVWKAWRCHWBZDCJUzfkQpYYXWD6CNLxdSxw68e1g
	Fg1GaeLRWLQvc9K2x85NBZjp2dyIVlEHz00oPEOawOboR2WazxMfd7EbTMCxrkv0igrxE2
	Ps810Q5/SoC8nXHjHClv4R6ZP4gKSEY=
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
Subject: [PATCH 05/62] dma-buf: Convert dma_buf_import_sync_file() to the early-return style
Date: Mon, 23 Feb 2026 14:00:05 -0800
Message-ID: <20260223220102.2158611-6-bart.vanassche@linux.dev>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53235-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,amd.com:email,linux.dev:mid,linux.dev:dkim,acm.org:email]
X-Rspamd-Queue-Id: B3F2217DF42
X-Rspamd-Action: no action

From: Bart Van Assche <bvanassche@acm.org>

Before making changes in dma_buf_import_sync_file(), convert it to
the early-return coding style. No functionality has been changed.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Christian König <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/dma-buf/dma-buf.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 11711874a325..1666133ac8b8 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -523,11 +523,13 @@ static long dma_buf_import_sync_file(struct dma_buf *dmabuf,
 		dma_resv_lock(dmabuf->resv, NULL);
 
 		ret = dma_resv_reserve_fences(dmabuf->resv, num_fences);
-		if (!ret) {
-			dma_fence_unwrap_for_each(f, &iter, fence)
-				dma_resv_add_fence(dmabuf->resv, f, usage);
-		}
+		if (ret)
+			goto unlock;
+
+		dma_fence_unwrap_for_each(f, &iter, fence)
+			dma_resv_add_fence(dmabuf->resv, f, usage);
 
+unlock:
 		dma_resv_unlock(dmabuf->resv);
 	}
 

