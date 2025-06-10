Return-Path: <linux-media+bounces-34467-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A3DAD3F5D
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 18:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB4CA7A1655
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 16:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142AA242D92;
	Tue, 10 Jun 2025 16:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="WNjuVEhQ"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9107E24113C
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 16:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749573777; cv=none; b=UjZeZer32Uo30JmhiC9nIUvhso/caoVhWssY5m0dyvtD+7cb2ceVr40/zlj3CW3LaUZDu4K+5K1Viwv6FpusszwMBdj/zUjKiOmeO0a33QkgOrMsIa2VTaP9HQZUdjby36YS7+07SS7TbjhLC/YIrXmQZJQEkriXTwH7FBtQwoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749573777; c=relaxed/simple;
	bh=1eomT6N6aP2pb+Fy0apHTTfuUaK3U4aWcc4SEBfylJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ppT3KFu0mKbYnDzxe3N9Wc7foF5UPxsN4WrZqkzKo7YO5S4nyh9pAm0lkmV7dsYfq7S92cKK1f8961MSq8WalcTFwatrmzF+O8MtXgkaNITqwjSoo2+NWuK+Wp5/TGBXY+teFsihel08c0pOaR8DkvtgeZirsl9ICIkGsQFKIRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=WNjuVEhQ; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=oASi8k/zVPAmlE0IllMtJCVm4RPO01RjKDIqI77ITPE=; b=WNjuVEhQfX/D4FImMBYTu375cV
	MNlaXP7lgptlG3tK719cnQfQkLk1pRQtkdB+fxjTaAUeaLGzMVGH0FmB8UZl5AVUGg/C9WpxhVIBg
	R9xSQvrjjM1419Al5oC4QrkCZaAlpi0zGeHMoSIZAFkIRR0pk1XWP1sz/r4rWEEbWkWn6ysOFrqgv
	JSN6hVZxoWyjruAYQGRvA6cGZJmq+a30b8DRRM7ZyyZqo50SyBfaJeVY1pjnjQ+aV4Jm7moQYrt7b
	Ch+AtHMB3JPjouV15jnSstXPPQXxTUbn2ivjRax6VZ2UMdWPhhsWVG33priI7woqzjHnvurCUUHzU
	PhftOiOg==;
Received: from [81.79.92.254] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uP23X-001t9g-43; Tue, 10 Jun 2025 18:42:35 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Rob Clark <robdclark@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	amd-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v6 2/4] drm/i915: Protect access to driver and timeline name
Date: Tue, 10 Jun 2025 17:42:24 +0100
Message-ID: <20250610164226.10817-3-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250610164226.10817-1-tvrtko.ursulin@igalia.com>
References: <20250610164226.10817-1-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Protect the access to driver and timeline name which otherwise could be
freed as dma-fence exported is signalling fences.

This prepares the code for incoming dma-fence API changes which will start
asserting these accesses are done from a RCU locked section.

Now that the safe access is handled in the dma-fence API, the external
callers such as sync_file, and our internal code paths, we can drop the
similar protection from i915_fence_get_timeline_name().

This prepares the code for incoming dma-fence API changes which will start
asserting these accesses are done from a RCU locked section.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> # v1
---
v2:
 * Rebased for dma-fence API change.
---
 drivers/gpu/drm/i915/gt/intel_gt_requests.c | 10 ++++++++--
 drivers/gpu/drm/i915/i915_request.c         |  7 +++++--
 drivers/gpu/drm/i915/i915_sw_fence.c        | 10 ++++++++--
 3 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
index ae3557ed6c1e..93298820bee2 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
@@ -250,11 +250,17 @@ void intel_gt_watchdog_work(struct work_struct *work)
 	llist_for_each_entry_safe(rq, rn, first, watchdog.link) {
 		if (!i915_request_completed(rq)) {
 			struct dma_fence *f = &rq->fence;
+			const char __rcu *timeline;
+			const char __rcu *driver;
 
+			rcu_read_lock();
+			driver = dma_fence_driver_name(f);
+			timeline = dma_fence_timeline_name(f);
 			pr_notice("Fence expiration time out i915-%s:%s:%llx!\n",
-				  dma_fence_driver_name(f),
-				  dma_fence_timeline_name(f),
+				  rcu_dereference(driver),
+				  rcu_dereference(timeline),
 				  f->seqno);
+			rcu_read_unlock();
 			i915_request_cancel(rq, -EINTR);
 		}
 		i915_request_put(rq);
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 4874c4f1e4ab..b9a2b2194c8f 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -2184,7 +2184,7 @@ void i915_request_show(struct drm_printer *m,
 		       const char *prefix,
 		       int indent)
 {
-	const char *name = dma_fence_timeline_name((struct dma_fence *)&rq->fence);
+	const char __rcu *timeline;
 	char buf[80] = "";
 	int x = 0;
 
@@ -2220,6 +2220,8 @@ void i915_request_show(struct drm_printer *m,
 
 	x = print_sched_attr(&rq->sched.attr, buf, x, sizeof(buf));
 
+	rcu_read_lock();
+	timeline = dma_fence_timeline_name((struct dma_fence *)&rq->fence);
 	drm_printf(m, "%s%.*s%c %llx:%lld%s%s %s @ %dms: %s\n",
 		   prefix, indent, "                ",
 		   queue_status(rq),
@@ -2228,7 +2230,8 @@ void i915_request_show(struct drm_printer *m,
 		   fence_status(rq),
 		   buf,
 		   jiffies_to_msecs(jiffies - rq->emitted_jiffies),
-		   name);
+		   rcu_dereference(timeline));
+	rcu_read_unlock();
 }
 
 static bool engine_match_ring(struct intel_engine_cs *engine, struct i915_request *rq)
diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
index 9edf659d18db..73e89b168fc3 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -430,16 +430,22 @@ static void timer_i915_sw_fence_wake(struct timer_list *t)
 	struct i915_sw_dma_fence_cb_timer *cb = timer_container_of(cb, t,
 								   timer);
 	struct i915_sw_fence *fence;
+	const char __rcu *timeline;
+	const char __rcu *driver;
 
 	fence = xchg(&cb->base.fence, NULL);
 	if (!fence)
 		return;
 
+	rcu_read_lock();
+	driver = dma_fence_driver_name(cb->dma);
+	timeline = dma_fence_timeline_name(cb->dma);
 	pr_notice("Asynchronous wait on fence %s:%s:%llx timed out (hint:%ps)\n",
-		  dma_fence_driver_name(cb->dma),
-		  dma_fence_timeline_name(cb->dma),
+		  rcu_dereference(driver),
+		  rcu_dereference(timeline),
 		  cb->dma->seqno,
 		  i915_sw_fence_debug_hint(fence));
+	rcu_read_unlock();
 
 	i915_sw_fence_set_error_once(fence, -ETIMEDOUT);
 	i915_sw_fence_complete(fence);
-- 
2.48.0


