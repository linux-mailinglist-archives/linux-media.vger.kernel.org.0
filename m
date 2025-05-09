Return-Path: <linux-media+bounces-32154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08932AB18CB
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 17:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8D0A189D108
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 15:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C993230BF9;
	Fri,  9 May 2025 15:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="W76RuUps"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0613622DFA2
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 15:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746804868; cv=none; b=uRypgAdAD964q8wspQgW0FzvUeV7nS9GxUYCX7ATQc4eQrkkrPCx1kjYVnJ9Ks+QLgJJtmCGru8E4gjTiB2ZngPd0krLalOATh6gpLzH2YZaNN4la25JqfYCk4OninIWDfUD2RYjceBwIvOcyVVuY8HIcnoXtX0olpGu13BqJvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746804868; c=relaxed/simple;
	bh=7rC1XHL5yOG3dH2mke8Uaix3Iaus1Tuaz/T3Ml7gNO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P7xablxuGQp2UODGuBxdhXa0u6VCwt7Dvzv81x9vSLUe2zay+H3AP5lTF7e5Bp43LkOyNBoHVp+tPA2NBBdhlFhjgDs6s1MYVKc9xxtge/ebz1zJuAZiUTYQL7zi7scUVZ68+XxnncM08shUhrht3ukVGmPKLVD15wiye2IDbPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=W76RuUps; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=MHWm1lnij9INTZ75KxNAb0yXxdRyZ8i48YodeRz32Tg=; b=W76RuUpsdEVj1awcbnIy55ly/n
	8HjXnN8X+WgxIijcqaqgxWfoevrjqGI6lbDky72i8FvXyRHyw+aTcVAVJdFH0ho6jV+3lP+ZdB78M
	JVcEpkr0odTMfdEA3DTNrLXi9jkuBbCQsCgbmOS/HU6zkVlnEMTH2GUHKUZQQVNxPTnAcEp0ylkSF
	MBMDg3ME4sh+XtzSCsA/B2ep2qOyicSyEWWyEt0mcfMS+k4KXy8PfhoFFqxwryf35A8aWys/pgZZU
	yF64wk5ZjdX/xgVHwxF1k+GzmGPJmvZUre39wPM/gegreOtvjzLUv9Gk0P8FEIcpwhIH9/Ca4Jlv8
	3ud3KwBA==;
Received: from [81.79.92.254] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uDPfP-005oG0-6i; Fri, 09 May 2025 17:34:16 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
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
Subject: [RFC v2 12/13] drm/i915: Protect access to driver and timeline name
Date: Fri,  9 May 2025 16:33:51 +0100
Message-ID: <20250509153352.7187-13-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Protect the access to driver and timeline name which otherwise could be
freed as dma-fence exported is signalling fences.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_requests.c | 2 ++
 drivers/gpu/drm/i915/i915_request.c         | 5 +++--
 drivers/gpu/drm/i915/i915_sw_fence.c        | 2 ++
 3 files changed, 7 insertions(+), 2 deletions(-)

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
index 4874c4f1e4ab..8008b7767641 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -2184,7 +2184,6 @@ void i915_request_show(struct drm_printer *m,
 		       const char *prefix,
 		       int indent)
 {
-	const char *name = dma_fence_timeline_name((struct dma_fence *)&rq->fence);
 	char buf[80] = "";
 	int x = 0;
 
@@ -2220,6 +2219,7 @@ void i915_request_show(struct drm_printer *m,
 
 	x = print_sched_attr(&rq->sched.attr, buf, x, sizeof(buf));
 
+	dma_fence_access_begin();
 	drm_printf(m, "%s%.*s%c %llx:%lld%s%s %s @ %dms: %s\n",
 		   prefix, indent, "                ",
 		   queue_status(rq),
@@ -2228,7 +2228,8 @@ void i915_request_show(struct drm_printer *m,
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


