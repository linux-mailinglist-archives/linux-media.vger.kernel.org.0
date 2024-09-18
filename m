Return-Path: <linux-media+bounces-18388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 865A897BBCB
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 13:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A99551C21AB0
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 11:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C411898E9;
	Wed, 18 Sep 2024 11:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MsAvxCN/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B9417CA02
	for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 11:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726660520; cv=none; b=sCJXDlfes+y3Y/oV2MA6jI7q70/34LFWxC7fQMkKa/gEtWwacTMRS+xHgssvmuLHj+rcEvpqivLf9G1EjOZAuLaA1NYafcObHboZJcMiifMpm/7LshK/Pqs8gFKfbbI/yYnsEBaeIB0CkE+H2gOAokpGi84t5Is7RyuKT93Wc5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726660520; c=relaxed/simple;
	bh=emMaK/6+sjJxSe9y2pycpeb3UJos1sQ1eXJ4687MVWM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nk3ziIKX9FDhaWNQBELOuqxXi1aQ8/5obp9Qccmb8YnKYVY7k6qdN4krkuaM2oZPMSX+K7Y6L8iw4ynV6krU7KnxE60InvUcjAiSswp9Ks8ffbeOeyxRnq3uXuFYSB9EHo3SLbHGTee8/ZnmELJEhXJNlSlNPIVZgStp+I/Y77I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MsAvxCN/; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a8a789c4fc5so126112766b.0
        for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 04:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726660516; x=1727265316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+IEnAh17rPx86HTPr3+SszG4P4edMw5KT10nkvzKf4=;
        b=MsAvxCN/X+sdlnbc/mFhOxgXHwLUTv1QLInsIf5l1ZM9N3MshzC2G0/T0RjTCdEN4W
         uwDe0R+7QbRYo4+OQ9blu3Mk6X7eSlNEf4kDfNuJV9BpoLdUtWXZel98kGVRLcnm7HDN
         a/ToJUwDj/ogltvDyRkesrHGXLpvqxfqmGqOyJxlLJcywwcqKdJiR+nHhI+n5SefVV0L
         BCYGzZNsOBXObEv6sdKMYXYnDbyd9ZjbeTf5tfK053kmPRvCfDmsfI0TviJysccnIRbP
         K4X5acI+pvcT8+1EGtQ5sZltlsOj1gAhby/YDi+i3j5RXvw+B1QlYWq3WNipaf8Xjxea
         Ning==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726660516; x=1727265316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+IEnAh17rPx86HTPr3+SszG4P4edMw5KT10nkvzKf4=;
        b=GWwkQEpBWKeEJB+u8S6zn40amVfvisGJPf5wLXPJiTkheJm8FL6Uc04+JFzaJR8LBb
         9TVJ5Uu4YyLarbSCDskrnDAHJR9w2Nqnf/isTcmbF5R/+kQZ/vmfCaGy012+qTYCF3FJ
         fepy1rcpvoOan7ZU8vwQvHU3JLstB3BETD7X10uizk54Qpl0IXQULThxxQlnWs1W9KI2
         cRU1crwmM6zfufcoQdaG6wMbYRb8e73KOrSXUmFgJXEW3vAeXAWFvP1eJVMGXO8P6BPb
         mCdLYcBgjGfYfdtoRRaP47pN9+bclW+k/Cch4wBhboTAc3erAzmN/S8CYGtHR1nw6hvx
         YBwA==
X-Forwarded-Encrypted: i=1; AJvYcCXmuF+41W2Tbi8EzcIYqjjpM7c0CwHZmCxK6mP0B0brwNbMCsNmCfsBdbgFEq0gbhF5IGDFoAH4NTdbKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGJja9O+XrUabjKlDUfEfxuAvhjeH2h8shbOA2XuPjPP8LyJsF
	ilRUD46cFQtms/tC8NgNkPJ92iKXNbpjjG6m9wN6eVuoTADtByU7
X-Google-Smtp-Source: AGHT+IGIQEnLUH2F+0BmL9+O02A2TFiGRGngmR1FWPvsYb5yaI1ZCdVF0g+DEhZ3A3D4N9KhSxPoLw==
X-Received: by 2002:a17:907:3f17:b0:a72:7a71:7f4f with SMTP id a640c23a62f3a-a902a3d2e92mr2517054966b.7.1726660516212;
        Wed, 18 Sep 2024 04:55:16 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:155d:1400:17ae:e091:3b52:93d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612df563sm575281966b.151.2024.09.18.04.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 04:55:15 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	daniel@ffwll.ch,
	tursulin@ursulin.net,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/2] dma-buf/dma-fence: add wrappers for driver and timeline name
Date: Wed, 18 Sep 2024 13:55:13 +0200
Message-Id: <20240918115513.2716-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918115513.2716-1-christian.koenig@amd.com>
References: <20240918115513.2716-1-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As discussed with Sima we want dma_fence objects to be able to outlive
their backend ops. Because of this timeline and driver name shouldn't
be queried any more after the fence has signaled.

Add wrappers around the two queries and only return an empty string
if the fence was already signaled. There is still an obvious race
between signaling and querying the values, but that can only be
closed if we rework the locking as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c                 | 39 ++++++++++++++++++---
 drivers/dma-buf/sync_file.c                 |  8 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h   |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_requests.c |  4 +--
 drivers/gpu/drm/i915/i915_request.c         |  2 +-
 drivers/gpu/drm/i915/i915_sw_fence.c        |  4 +--
 include/linux/dma-fence.h                   |  2 ++
 include/trace/events/dma_fence.h            |  4 +--
 8 files changed, 49 insertions(+), 16 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 0393a9bba3a8..d82f6c9ac018 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -538,8 +538,8 @@ void dma_fence_release(struct kref *kref)
 	if (WARN(!list_empty(&fence->cb_list) &&
 		 !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags),
 		 "Fence %s:%s:%llx:%llx released with pending signals!\n",
-		 fence->ops->get_driver_name(fence),
-		 fence->ops->get_timeline_name(fence),
+		 dma_fence_driver_name(fence),
+		 dma_fence_timeline_name(fence),
 		 fence->context, fence->seqno)) {
 		unsigned long flags;
 
@@ -973,6 +973,37 @@ void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
 }
 EXPORT_SYMBOL(dma_fence_set_deadline);
 
+/**
+ * dma_fence_driver_name - return the driver name for a fence
+ * @fence:	the fence to query the driver name on
+ *
+ * Returns the driver name or empty string if the fence is already signaled.
+ */
+const char *dma_fence_driver_name(struct dma_fence *fence)
+{
+	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
+		return "";
+
+	return fence->ops->get_driver_name(fence);
+}
+EXPORT_SYMBOL(dma_fence_driver_name);
+
+/**
+ * dma_fence_timeline_name - return the name of the fence context
+ * @fence:	the fence to query the context on
+ *
+ * Returns the name of the context this fence belongs to or empty string if the
+ * fence is already signaled.
+ */
+const char *dma_fence_timeline_name(struct dma_fence *fence)
+{
+	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
+		return "";
+
+	return fence->ops->get_timeline_name(fence);
+}
+EXPORT_SYMBOL(dma_fence_timeline_name);
+
 /**
  * dma_fence_describe - Dump fence description into seq_file
  * @fence: the fence to describe
@@ -983,8 +1014,8 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
 void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
 {
 	seq_printf(seq, "%s %s seq %llu %ssignalled\n",
-		   fence->ops->get_driver_name(fence),
-		   fence->ops->get_timeline_name(fence), fence->seqno,
+		   dma_fence_driver_name(fence),
+		   dma_fence_timeline_name(fence), fence->seqno,
 		   dma_fence_is_signaled(fence) ? "" : "un");
 }
 EXPORT_SYMBOL(dma_fence_describe);
diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index d9b1c1b2a72b..212df4b849fe 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -137,8 +137,8 @@ char *sync_file_get_name(struct sync_file *sync_file, char *buf, int len)
 		struct dma_fence *fence = sync_file->fence;
 
 		snprintf(buf, len, "%s-%s%llu-%lld",
-			 fence->ops->get_driver_name(fence),
-			 fence->ops->get_timeline_name(fence),
+			 dma_fence_driver_name(fence),
+			 dma_fence_timeline_name(fence),
 			 fence->context,
 			 fence->seqno);
 	}
@@ -262,9 +262,9 @@ static long sync_file_ioctl_merge(struct sync_file *sync_file,
 static int sync_fill_fence_info(struct dma_fence *fence,
 				 struct sync_fence_info *info)
 {
-	strscpy(info->obj_name, fence->ops->get_timeline_name(fence),
+	strscpy(info->obj_name, dma_fence_timeline_name(fence),
 		sizeof(info->obj_name));
-	strscpy(info->driver_name, fence->ops->get_driver_name(fence),
+	strscpy(info->driver_name, dma_fence_driver_name(fence),
 		sizeof(info->driver_name));
 
 	info->status = dma_fence_get_status(fence);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
index 383fce40d4dd..224a40e03b36 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
@@ -33,7 +33,7 @@
 #define TRACE_INCLUDE_FILE amdgpu_trace
 
 #define AMDGPU_JOB_GET_TIMELINE_NAME(job) \
-	 job->base.s_fence->finished.ops->get_timeline_name(&job->base.s_fence->finished)
+	dma_fence_timeline_name(&job->base.s_fence->finished)
 
 TRACE_EVENT(amdgpu_device_rreg,
 	    TP_PROTO(unsigned did, uint32_t reg, uint32_t value),
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
index 519e096c607c..aaec28fd4864 100644
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
index 8a9aad523eec..b805ce8b8ab8 100644
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
 
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index cf91cae6e30f..4b0634e42a36 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -264,6 +264,8 @@ void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
 
 void dma_fence_release(struct kref *kref);
 void dma_fence_free(struct dma_fence *fence);
+const char *dma_fence_driver_name(struct dma_fence *fence);
+const char *dma_fence_timeline_name(struct dma_fence *fence);
 void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq);
 
 /**
diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
index a4de3df8500b..84c83074ee81 100644
--- a/include/trace/events/dma_fence.h
+++ b/include/trace/events/dma_fence.h
@@ -16,8 +16,8 @@ DECLARE_EVENT_CLASS(dma_fence,
 	TP_ARGS(fence),
 
 	TP_STRUCT__entry(
-		__string(driver, fence->ops->get_driver_name(fence))
-		__string(timeline, fence->ops->get_timeline_name(fence))
+		__string(driver, dma_fence_driver_name(fence))
+		__string(timeline, dma_fence_timeline_name(fence))
 		__field(unsigned int, context)
 		__field(unsigned int, seqno)
 	),
-- 
2.34.1


