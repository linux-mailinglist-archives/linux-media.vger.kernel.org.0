Return-Path: <linux-media+bounces-58753-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLY3N7Fi3mlqDgAAu9opvQ
	(envelope-from <linux-media+bounces-58753-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 17:52:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E3B3FC289
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 17:52:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13128308F807
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 15:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B683EC2FA;
	Tue, 14 Apr 2026 15:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="stG6I3gs"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E690C3D6CBA
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 15:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776181788; cv=none; b=hKDw/dMp9EA3+IzoC+S37ZQT1q7kmKaur+RK63TdCU8ckftjzOITg8WTl2YaIpDyBfi4qUktZ5UW7jp8JNUOHhQHYlLqSc/uv38YTEIqziyhZL3P6Kik+E7GntcUmyY3vbIpkLt/OsiJeQ3i1b2kyLzoD/9Yju0sOw2ttrvOi4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776181788; c=relaxed/simple;
	bh=erj2DJ6UcSVTIgJSuGL7T1govl7nyDgqafRlEr8l3eo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xho+SUBDNY2EmKwRodD5srVU2VKQ6lHBc8noOvihv7Fx9/z83SMVAt+vcYgBQ4exdyBrfk1RiIs/RjTEi7o9I/nPaBMgqAIZ/iuGtT10QEgyKG8p67OvvzYp8YzXUOt2gvkcR/nhowIPggm0OwIjqrxtmc9W6+zn2d8g3mkyhP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=stG6I3gs; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=NH3VFhuA4KTmnv2Djo8xtQoIH/0rZEUzxAByURI9vUg=; b=stG6I3gsqgvfdtVZTDguCcJfNf
	gXAfIrwQpNDQCCp73jOKYg0RMWF2ZbCRMtCWLux1PhBfRjl3JxCp24q1WBMVXh+gvbLqDUvWhTtLd
	IpfsplhtpS81PL7jXXti/5BA67GVooOBN7cHYPVqn41/s89tywrOJPkvZl3SGtT9l9L1EQzY0eDwk
	TmnniWZ29CCI6YUMApd+GvKAkYuHfI86lps9/S/iw70sn2UbKPGYpd2kscAaHQmJaosU6YMILMJ+4
	qQeFlY4kaVm5FQHpGlLZchvWhuSXBWwaUt6MiKwU4zMmt2+6V31lEoIhhj6MxjqA/iAXhaVMneh+B
	tSxqISlw==;
Received: from [90.240.106.137] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wCg15-00FxmJ-Ay; Tue, 14 Apr 2026 17:49:31 +0200
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
Date: Tue, 14 Apr 2026 16:49:28 +0100
Message-ID: <20260414154928.32934-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260414154928.32934-1-tvrtko.ursulin@igalia.com>
References: <20260414154928.32934-1-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.64 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58753-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.912];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,igalia.com:email,collabora.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,amd.com:email]
X-Rspamd-Queue-Id: 54E3B3FC289
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
---
 drivers/dma-buf/dma-fence.c      |  3 ++-
 include/trace/events/dma_fence.h | 33 ++++++++++++++++++++++++++++----
 2 files changed, 31 insertions(+), 5 deletions(-)

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
index 3abba45c0601..9e0cb9ce2388 100644
--- a/include/trace/events/dma_fence.h
+++ b/include/trace/events/dma_fence.h
@@ -9,12 +9,37 @@
 
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
  * signaling,holding the fence->lock and having checked for not signaled, or the
  * signaling path itself.
  */
-DECLARE_EVENT_CLASS(dma_fence,
+DECLARE_EVENT_CLASS(dma_fence_ops,
 
 	TP_PROTO(struct dma_fence *fence),
 
@@ -46,7 +71,7 @@ DEFINE_EVENT(dma_fence, dma_fence_emit,
 	TP_ARGS(fence)
 );
 
-DEFINE_EVENT(dma_fence, dma_fence_init,
+DEFINE_EVENT(dma_fence_ops, dma_fence_init,
 
 	TP_PROTO(struct dma_fence *fence),
 
@@ -60,14 +85,14 @@ DEFINE_EVENT(dma_fence, dma_fence_destroy,
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


