Return-Path: <linux-media+bounces-32573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8209AB834E
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 11:50:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DF4A1BC1170
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 09:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104282980A6;
	Thu, 15 May 2025 09:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="MHx++PCU"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D5C28C873
	for <linux-media@vger.kernel.org>; Thu, 15 May 2025 09:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747302631; cv=none; b=cP+Zk1azFz3MHJAk2eVNfaVReucUdhDIZ3pcDSd/pop/Y46M3qxH5FtUQbAQQZ7UxcZqutMAONUIDVPFGMmUu+acJBjZxn3Xxws4f9LUsjowHVaFodPUJ8gOwJOZ/P1hB/67s+vla2RweNpkBM7IH7u8Q1xuA2uJgTiSu5+0Glo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747302631; c=relaxed/simple;
	bh=xoXlLFwCOtptbEwn3zdyyz0/Oz53S+y6U7VeKuYSDhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EbuvhzsHTcwrG50YBLYSWbDqUwz6qDyJXMVqYMVE9VJ/+wkWHAFTrlVkSzYbULFYOBpr/IZIU2znJLpeNHZJttBQD2ZWui2TGFYzj9jVTk3/oOO3b0wXG6HoGkNLV2bPDIbtrjeF3oraGn3dZRCShPdG0f2ugb2aT2lUVpecAQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=MHx++PCU; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=aMVgEdL4UwJ0HMHlYTqE88UZJm3uG0CFe7Qa2YdtcHg=; b=MHx++PCU05+lD64D1efjyeIjkU
	Or01XNIJAFQyviQjeufPT/dvtMUwKVaj8g2QyUQnYsYh874OnwKxbJYISME6b1rsTAtxxOlV/g5Ir
	z0QJ1e3t9uYM4iLBfj7Nv+J49roqWNkviTi/Ebu6jAffkpki/CJiDsZAoJSfWP5YMujc3piFKgDtA
	fzFMEsxmKknzrrvG04w/vDaN/QV4n3oPjWeiwxO9BzvfozNR79nOz8qW6Q8kRABQ7N4OCF5Jt5rYx
	HClc4V97ws4tpzcDMONNGeLQQQxQVI4IP2n9o9ScbDpglg8KXKor6juXucoumPlu1uI88ovDn3T4P
	0WSmztHw==;
Received: from [81.79.92.254] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uFV8U-008ZRe-9k; Thu, 15 May 2025 11:50:12 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>,
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
	kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v4 8/9] drm/i915: Protect access to driver and timeline name
Date: Thu, 15 May 2025 10:50:03 +0100
Message-ID: <20250515095004.28318-9-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
References: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Protect the access to driver and timeline name which otherwise could be
freed as dma-fence exported is signalling fences.

Now that the safe access is handled in the dma-fence API, the external
callers such as sync_file, and our internal code paths, we can drop the
similar protection from i915_fence_get_timeline_name().

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_requests.c |  2 ++
 drivers/gpu/drm/i915/i915_request.c         | 17 +++--------------
 drivers/gpu/drm/i915/i915_sw_fence.c        |  2 ++
 3 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
index ae3557ed6c1e..11fca24c8b5b 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
@@ -251,10 +251,12 @@ void intel_gt_watchdog_work(struct work_struct *work)
 		if (!i915_request_completed(rq)) {
 			struct dma_fence *f = &rq->fence;
 
+			dma_fence_access_begin();
 			pr_notice("Fence expiration time out i915-%s:%s:%llx!\n",
 				  dma_fence_driver_name(f),
 				  dma_fence_timeline_name(f),
 				  f->seqno);
+			dma_fence_access_end();
 			i915_request_cancel(rq, -EINTR);
 		}
 		i915_request_put(rq);
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 4874c4f1e4ab..a8de736ff556 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -66,18 +66,6 @@ static const char *i915_fence_get_timeline_name(struct dma_fence *fence)
 {
 	const struct i915_gem_context *ctx;
 
-	/*
-	 * The timeline struct (as part of the ppgtt underneath a context)
-	 * may be freed when the request is no longer in use by the GPU.
-	 * We could extend the life of a context to beyond that of all
-	 * fences, possibly keeping the hw resource around indefinitely,
-	 * or we just give them a false name. Since
-	 * dma_fence_ops.get_timeline_name is a debug feature, the occasional
-	 * lie seems justifiable.
-	 */
-	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
-		return "signaled";
-
 	ctx = i915_request_gem_context(to_request(fence));
 	if (!ctx)
 		return "[" DRIVER_NAME "]";
@@ -2184,7 +2172,6 @@ void i915_request_show(struct drm_printer *m,
 		       const char *prefix,
 		       int indent)
 {
-	const char *name = dma_fence_timeline_name((struct dma_fence *)&rq->fence);
 	char buf[80] = "";
 	int x = 0;
 
@@ -2220,6 +2207,7 @@ void i915_request_show(struct drm_printer *m,
 
 	x = print_sched_attr(&rq->sched.attr, buf, x, sizeof(buf));
 
+	dma_fence_access_begin();
 	drm_printf(m, "%s%.*s%c %llx:%lld%s%s %s @ %dms: %s\n",
 		   prefix, indent, "                ",
 		   queue_status(rq),
@@ -2228,7 +2216,8 @@ void i915_request_show(struct drm_printer *m,
 		   fence_status(rq),
 		   buf,
 		   jiffies_to_msecs(jiffies - rq->emitted_jiffies),
-		   name);
+		   dma_fence_timeline_name((struct dma_fence *)&rq->fence));
+	dma_fence_access_end();
 }
 
 static bool engine_match_ring(struct intel_engine_cs *engine, struct i915_request *rq)
diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
index e51ca7e50a4e..e7bdc1165b90 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -434,11 +434,13 @@ static void timer_i915_sw_fence_wake(struct timer_list *t)
 	if (!fence)
 		return;
 
+	dma_fence_access_begin();
 	pr_notice("Asynchronous wait on fence %s:%s:%llx timed out (hint:%ps)\n",
 		  dma_fence_driver_name(cb->dma),
 		  dma_fence_timeline_name(cb->dma),
 		  cb->dma->seqno,
 		  i915_sw_fence_debug_hint(fence));
+	dma_fence_access_end();
 
 	i915_sw_fence_set_error_once(fence, -ETIMEDOUT);
 	i915_sw_fence_complete(fence);
-- 
2.48.0


