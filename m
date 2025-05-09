Return-Path: <linux-media+bounces-32151-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C498BAB18CC
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 17:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9DA3A23953
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 15:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE60230BC7;
	Fri,  9 May 2025 15:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="VD4CLquh"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F8322DFA2
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 15:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746804865; cv=none; b=Hh2cLeobwxr9fyxVdLWKc9Wjg8DrWaTguAWW9G+tRNsnB1U39TMrynnj7D/RWCksIjdDApPQm7U7O9bgfy3xz9FUfqrryZsOrkn/BV/WE/vBicnDGE/ML2+kOxxrq4Z6/1ktvXqC93xtTj82VR4irSqQmRQ325+4hqenFG0VtBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746804865; c=relaxed/simple;
	bh=7stLYki25FvPG9pQhk0JDio3dztVscieFfVPSxvZig8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OY78kf3WTa81gdBQ0SVrLk0GokieR7NUUrlUZ7asbWRNbKHBSykD9OYh5Fan0WX6rZGlGz4XkePGNr63z4MvPjCql+EBc4kGvsV/R2l1p99YzVjyGQweA1iJ/3ZMlsUBZ6ZxxijVh2gIFexGL7yQbUZGZ5imgGqHm/sZRGQs5MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=VD4CLquh; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=QIVSG+DcJjfDxYSma2hUhKEztJ2hqENQXXN7wRL+rgE=; b=VD4CLquhVUatXV7nn41rnOQNwK
	yzcwi2UxdqgOLIyRWMJA7Q+Ksa/qAhUWBnaPhHXLeMaXdItz19on9khlQRnaZGrGw32Yweg6TeCws
	WYh8abNbR1kYcHT0+tszIcIR6OOQIBTgIHC3KCjZUrv5p+lEcozooqAq0U9mo4dFDGwy2lqcTVMgO
	2JxIO3hZNdjx50LwKt4eSlieMFnF36F0MNAAuNtErslg4DzAfmVnxHbixLLjNUi/+qn/1IlrCQHly
	W/YGcgptnAr6n1CoXK7DvJy4/RE94I16Rv9GuIfbyFJKLixBwtWaFQybVppDm2OH9Y9CM2D1JN5zX
	od0KqRvQ==;
Received: from [81.79.92.254] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uDPfM-005oFY-SM; Fri, 09 May 2025 17:34:13 +0200
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
Subject: [RFC v2 09/13] drm/i915: Use dma-fence driver and timeline name helpers
Date: Fri,  9 May 2025 16:33:48 +0100
Message-ID: <20250509153352.7187-10-tvrtko.ursulin@igalia.com>
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

Access the dma-fence internals via the previously added helpers.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_requests.c | 4 ++--
 drivers/gpu/drm/i915/i915_request.c         | 2 +-
 drivers/gpu/drm/i915/i915_sw_fence.c        | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
index d1a382dfaa1d..ae3557ed6c1e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
@@ -252,8 +252,8 @@ void intel_gt_watchdog_work(struct work_struct *work)
 			struct dma_fence *f = &rq->fence;
 
 			pr_notice("Fence expiration time out i915-%s:%s:%llx!\n",
-				  f->ops->get_driver_name(f),
-				  f->ops->get_timeline_name(f),
+				  dma_fence_driver_name(f),
+				  dma_fence_timeline_name(f),
 				  f->seqno);
 			i915_request_cancel(rq, -EINTR);
 		}
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index c3d27eadc0a7..4874c4f1e4ab 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -2184,7 +2184,7 @@ void i915_request_show(struct drm_printer *m,
 		       const char *prefix,
 		       int indent)
 {
-	const char *name = rq->fence.ops->get_timeline_name((struct dma_fence *)&rq->fence);
+	const char *name = dma_fence_timeline_name((struct dma_fence *)&rq->fence);
 	char buf[80] = "";
 	int x = 0;
 
diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
index 1d4cc91c0e40..e51ca7e50a4e 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -435,8 +435,8 @@ static void timer_i915_sw_fence_wake(struct timer_list *t)
 		return;
 
 	pr_notice("Asynchronous wait on fence %s:%s:%llx timed out (hint:%ps)\n",
-		  cb->dma->ops->get_driver_name(cb->dma),
-		  cb->dma->ops->get_timeline_name(cb->dma),
+		  dma_fence_driver_name(cb->dma),
+		  dma_fence_timeline_name(cb->dma),
 		  cb->dma->seqno,
 		  i915_sw_fence_debug_hint(fence));
 
-- 
2.48.0


