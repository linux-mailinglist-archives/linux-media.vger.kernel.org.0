Return-Path: <linux-media+bounces-32569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C72CAB8349
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 11:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0ADF4C70BC
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 09:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B77D297A70;
	Thu, 15 May 2025 09:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Z/9bUz99"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9181FCFFC
	for <linux-media@vger.kernel.org>; Thu, 15 May 2025 09:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747302629; cv=none; b=RanLcvwtMK5LtGIPZLrROb7k9t9hkLjaq0EgIQhnKlDUgx6JkkuwdgV++WGOIZ4e3jIcOEAbfOPJJcGf+5DpE8xP3qxf1BKbs8oBGjUThGE15kv9Felg3bhlHhWb9gRCdcNteoMav1SLs/whxbsEgXQpvpdwRu/AqqdB7zuxKbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747302629; c=relaxed/simple;
	bh=mXXdV6zRcjUd+Upu4ybGJ+qx/BqTh9pAwzTiajZBZPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O62c6RbrDaKjxVXVUPiT3IXfkF9CeXySFcEKVowWbf2GkvQ79VdaskSdal884B0Bpm6/9yozMpfzfZja3Bn374cKx4fiOdPEFWrxi6rVPn6rXLynkvANeJ1BK9/MStVF1cEpoggUEOqGGUnSrz0QzWM1p4ZBaCmIeYAzg9MqeAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Z/9bUz99; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=eK8P6rG/SHpOGj0SzFWuzR93cCJgzO35wZEuiyCb1j8=; b=Z/9bUz99YhKayFw2IpJcELvo8Z
	H6JOhm+cWqRl2UXNLGAtHhC0ldegO3hRmlEF9rc5HoBHiii/a01P9ZtiIJNzg8wrLd9xUvwCNPZFv
	W20YGJBpTp1p8RcJi+iOHdMrFhK5bFI1hacMUNCZHuGKjvyEuI9qm2oO7wqFbQtSVIEjKURtJ/z/h
	FDoPR8YmlxyZuRI4Qjroma1VD9vs6F4OAXZ3CoETTa/mgQrncrV4tzJF/cUd+LkmWzweE/DPdVoE3
	v7mLJirwIJGwMNSpz0lX0WupkhKmJXnEriwd6XMjyiHS70JUUfBlYf/IqsR6UD0ruxY36s+gL5Xnd
	+nZfFwnw==;
Received: from [81.79.92.254] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uFV8Q-008ZQl-F9; Thu, 15 May 2025 11:50:08 +0200
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
Subject: [PATCH v4 3/9] dma-fence: Add helpers for accessing driver and timeline name
Date: Thu, 15 May 2025 10:49:58 +0100
Message-ID: <20250515095004.28318-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
References: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add some helpers in order to enable preventing dma-fence users accessing
the implementation details directly and make the implementation itself use
them.

This will also enable later adding some asserts to a consolidated
location.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c      |  9 +++++----
 include/linux/dma-fence.h        | 10 ++++++++++
 include/trace/events/dma_fence.h |  4 ++--
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 705b59787731..74f9e4b665e3 100644
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
 
@@ -983,8 +983,9 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
 void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
 {
 	seq_printf(seq, "%s %s seq %llu %ssignalled\n",
-		   fence->ops->get_driver_name(fence),
-		   fence->ops->get_timeline_name(fence), fence->seqno,
+		   dma_fence_driver_name(fence),
+		   dma_fence_timeline_name(fence),
+		   fence->seqno,
 		   dma_fence_is_signaled(fence) ? "" : "un");
 }
 EXPORT_SYMBOL(dma_fence_describe);
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index a34a0dcdc446..c5ac37e10d85 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -377,6 +377,16 @@ bool dma_fence_remove_callback(struct dma_fence *fence,
 			       struct dma_fence_cb *cb);
 void dma_fence_enable_sw_signaling(struct dma_fence *fence);
 
+static inline const char *dma_fence_driver_name(struct dma_fence *fence)
+{
+	return fence->ops->get_driver_name(fence);
+}
+
+static inline const char *dma_fence_timeline_name(struct dma_fence *fence)
+{
+	return fence->ops->get_timeline_name(fence);
+}
+
 /**
  * dma_fence_is_signaled_locked - Return an indication if the fence
  *                                is signaled yet.
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
2.48.0


