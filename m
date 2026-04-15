Return-Path: <linux-media+bounces-58795-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EP8vBxJO32mFRQAAu9opvQ
	(envelope-from <linux-media+bounces-58795-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 10:36:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C664020E5
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 10:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7AAF30CA39C
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 08:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E6B3CBE6F;
	Wed, 15 Apr 2026 08:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="CuUWnSyB"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD8A395D87
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 08:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776241942; cv=none; b=ZHwc6u1Vkw/ludsdYhms2hmc9y6wywC9iBGZ52k/6hK/BamQj/Ne37K0ADmT1OzkU4xCp6K6NUHO2fueS+N1z6+9zfZdJPgaG2Oz5GPxsPPUgAKclVAIb6t3o57cE0BPa1w3aec1xFyYH08ITPhBjqgUm5YizFViJPrSY85LalI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776241942; c=relaxed/simple;
	bh=IYJdq2GF4cjtbmPNtdunLVnlXgxME0O1TL0JJpZ+ypg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=reU9A/Is0iMgBjZJ9wz5SIN9KZpb3YR1osyfaMIRT2zeBMf0ABinIudUPmwHmT/vIrUEeKWX01rtoKH8wEFaUut4qP5XRTvN7PNnGnvdR7JxCFHQZ0syhzAWG4y2/ZgPKRsAsiM8HY6sjEnYERfRW/La46wGyhkurElI44pr7+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=CuUWnSyB; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=TrNNJa1+30iJ08uCK6HKe3RckGkPHTEMVi6lOyyvx68=; b=CuUWnSyBc+gBlHsJ6JFDHP+Qtf
	pYJKQUPbpDJPB+ikIjqI7CwS79YPl/gtFyztASty4lFrrP/eCHLgR8A/JcSIWK+bhzJOV6m/7P6Um
	F+evbjOHn5PLzTEDSb8CxfnFPAlGZ5r540IJQ2voDNDGEzuh/PZ2zOD6Rk4IeFs7G/Tk4p8b4v3oO
	XeV1EpmK9m2cL1nLEZFyWA+pX3H2v54vMcnqwMEJ+eG4+TTSspVKAhf3TuftyonkI+BLJ4OD4GNOZ
	2pcA5zMUzVgPl7KmgzEzjypymMO2zZYZYJum1JxHgRHL9OefR/vvdT69aVmtHqVTG3EEZHWtgYkbl
	QrOmjsbw==;
Received: from [90.240.106.137] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wCvfO-00GHZU-Td; Wed, 15 Apr 2026 10:32:11 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/2] dma-fence: Fix potential tracepoint null pointer dereferences
Date: Wed, 15 Apr 2026 09:32:07 +0100
Message-ID: <20260415083207.40513-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260415083207.40513-1-tvrtko.ursulin@igalia.com>
References: <20260415083207.40513-1-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.64 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58795-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.926];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 72C664020E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Trace_dma_fence_signaled, trace_dma_fence_wait_end and
trace_dma_fence_destroy can all currently dereference a null fence->ops
pointer after it has been reset on fence signalling.

Lets use the safe string getters for most tracepoints to avoid this class
of a problem, while for the signal tracepoint we move it to before ops are
cleared to avoid losing the driver and timeline name information. Apart
from moving it we also need to add a new tracepoint class to bypass the
safe name getters since the signaled bit is already set.

For dma_fence_init we also need to use the new tracepoint class since the
rcu read lock is not held there, and we can do the same for the enable
signaling since there we are certain the fence cannot be signaled while
we are holding the lock and have even validated the fence->ops.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Fixes: 541c8f2468b9 ("dma-buf: detach fence ops on signal v3")
Cc: Christian König <christian.koenig@amd.com>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c      |  3 ++-
 include/trace/events/dma_fence.h | 40 +++++++++++++++++++++++++++-----
 2 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index a2aa82f4eedd..b3bfa6943a8e 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -363,6 +363,8 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 				      &fence->flags)))
 		return;
 
+	trace_dma_fence_signaled(fence);
+
 	/*
 	 * When neither a release nor a wait operation is specified set the ops
 	 * pointer to NULL to allow the fence structure to become independent
@@ -377,7 +379,6 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 
 	fence->timestamp = timestamp;
 	set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
-	trace_dma_fence_signaled(fence);
 
 	list_for_each_entry_safe(cur, tmp, &cb_list, node) {
 		INIT_LIST_HEAD(&cur->node);
diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
index 3abba45c0601..5b10a9e06fb4 100644
--- a/include/trace/events/dma_fence.h
+++ b/include/trace/events/dma_fence.h
@@ -9,12 +9,40 @@
 
 struct dma_fence;
 
+DECLARE_EVENT_CLASS(dma_fence,
+
+	TP_PROTO(struct dma_fence *fence),
+
+	TP_ARGS(fence),
+
+	TP_STRUCT__entry(
+		__string(driver, dma_fence_driver_name(fence))
+		__string(timeline, dma_fence_timeline_name(fence))
+		__field(unsigned int, context)
+		__field(unsigned int, seqno)
+	),
+
+	TP_fast_assign(
+		__assign_str(driver);
+		__assign_str(timeline);
+		__entry->context = fence->context;
+		__entry->seqno = fence->seqno;
+	),
+
+	TP_printk("driver=%s timeline=%s context=%u seqno=%u",
+		  __get_str(driver), __get_str(timeline), __entry->context,
+		  __entry->seqno)
+);
+
 /*
  * Safe only for call sites which are guaranteed to not race with fence
- * signaling,holding the fence->lock and having checked for not signaled, or the
- * signaling path itself.
+ * signaling, holding the fence->lock and having checked for not signaled, or
+ * the signaling path itself.
+ *
+ * TODO: Remove the need for this event class when drivers switch to independent
+ *       fences.
  */
-DECLARE_EVENT_CLASS(dma_fence,
+DECLARE_EVENT_CLASS(dma_fence_ops,
 
 	TP_PROTO(struct dma_fence *fence),
 
@@ -46,7 +74,7 @@ DEFINE_EVENT(dma_fence, dma_fence_emit,
 	TP_ARGS(fence)
 );
 
-DEFINE_EVENT(dma_fence, dma_fence_init,
+DEFINE_EVENT(dma_fence_ops, dma_fence_init,
 
 	TP_PROTO(struct dma_fence *fence),
 
@@ -60,14 +88,14 @@ DEFINE_EVENT(dma_fence, dma_fence_destroy,
 	TP_ARGS(fence)
 );
 
-DEFINE_EVENT(dma_fence, dma_fence_enable_signal,
+DEFINE_EVENT(dma_fence_ops, dma_fence_enable_signal,
 
 	TP_PROTO(struct dma_fence *fence),
 
 	TP_ARGS(fence)
 );
 
-DEFINE_EVENT(dma_fence, dma_fence_signaled,
+DEFINE_EVENT(dma_fence_ops, dma_fence_signaled,
 
 	TP_PROTO(struct dma_fence *fence),
 
-- 
2.52.0


