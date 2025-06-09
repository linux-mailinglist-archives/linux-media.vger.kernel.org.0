Return-Path: <linux-media+bounces-34347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5626BAD1C2E
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 13:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 895567A3214
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 11:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1BE2566D3;
	Mon,  9 Jun 2025 11:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ASaynKsd"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4DA2512C8
	for <linux-media@vger.kernel.org>; Mon,  9 Jun 2025 11:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749467052; cv=none; b=UMJHyUY+3GUYtlTu8qkYdYeWRGY2zlmrjKYXRct35o5jY5oFivMXTNXke7TNv5vsgjGQ3SPNXHBQwizlc1k0e2Q1Bj8pkovqUVfKIJe/JKItgKyicGCogLd9Qqb90Jk9d828RIj7uUaRGVPj3XYNDLFFIQHVSG277zgcP2ENYxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749467052; c=relaxed/simple;
	bh=5zuCqXAvujCyVWOBNrl/Uiwozsn/7qG7c5SXhVsdE7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jBQuVC/FE2MYIQc5Zec1FO31WqhbST3NytnVDNnL/bgbcBw5fD9/Isggm/FpT8FV9I2lsLLw/BQJSmUknJCA3b10dtDOCmrozc7Wvru041X6Nx5QJc1DWAz21r9Dtsfc7TfCHe1IJo7qKqFP7q2GTaaRjwOcDTkvsUO5S+BNFuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ASaynKsd; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=NkRaIaVztUTmzbJTyyUdXGyMdtGxpCFyiDJM76cTkMs=; b=ASaynKsd9rGGXUVPw7d5JjXyZm
	HUf1ewkKgcM1f+p1LfqKB6hGQq35XWtiLpuaLoS+B5EsHsGks3VAQvhnBVz5tO+7xS+pGqCgR7lgA
	8tQq2UMnOwZIl9GXXCDHuIAzLGyj9R4hoa/6iGPgvjTd0E0AIl0EA9Eq11E2eQaPuZHC3YytHc8M7
	rKcrQwA9+eFfZPKAnzuFM/0v5ohmCrUBbpymIga3Nhq9hgarhPOuM55PS4dQdvqC8ihLEaqriJvgC
	8YpRI2z7/Pps/ny0aSoQPcrzGBTcmkDcv0r2Cvb0Jowk70HneOkMAZuSGVaJ+BuqYf1+2iL1855Di
	xKzK5hPA==;
Received: from [81.79.92.254] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uOaI7-001NxJ-6x; Mon, 09 Jun 2025 13:03:47 +0200
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
Subject: [PATCH v5 3/4] drm/i915: Protect access to driver and timeline name
Date: Mon,  9 Jun 2025 12:03:29 +0100
Message-ID: <20250609110330.74705-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250609110330.74705-1-tvrtko.ursulin@igalia.com>
References: <20250609110330.74705-1-tvrtko.ursulin@igalia.com>
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
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
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
index 9edf659d18db..4cdb8dd524f3 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -435,11 +435,13 @@ static void timer_i915_sw_fence_wake(struct timer_list *t)
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


