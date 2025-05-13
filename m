Return-Path: <linux-media+bounces-32358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A01AB4D33
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 09:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 445127AB7D8
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 07:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18A51F1908;
	Tue, 13 May 2025 07:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="IOuZuxtR"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2091E7C06
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 07:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747122341; cv=none; b=kVjOevICX3Mte9HPWuwUFZvcxNpKn18oJy8E1TKVv8Ue07S0ulzqJSSSk0jawc67EvNpDljaBe3mTHrRMxRKvh70+LlW+RerJLRT3lb0v2bGrHM9e/5ol7m/YF5hBFsxFB4Nop/gMejM8T9WjeePu9yljbYY8i1Eo69q8S1K84o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747122341; c=relaxed/simple;
	bh=9xAim9qFKq+GXzLYQkh1Hr4y8Sop555SEtwmQpfrznU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZiGQzuVFirwRKffDw3E9MfLumFOvU0wLoItLbW/kzDyRCNvpGxSGYYCwXhhsWX0LiB1QSgop+i83srV9bmpHV08ZurHK1JML+wGJtoP86fUYBxhR+Vo8O9OnIdF0PPTDxzncCxBOXFP+16SUGjUi90xLJmSGIxwRoIjSojhsleQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=IOuZuxtR; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=EPZUhcHZz5J18YXZcXSttjeThfGPK4eY4uhnv4dAazA=; b=IOuZuxtRiMUh6m0X/ja4tHsfqn
	dJAaAPjXbioKgFLx890AVTLf3kHTRis5eQkeUSARGMFH4AF0OcLmjgHxNnkFcT1oj1TjV3G7RhIo5
	P8pey/9UuxSOC2rwxZYtckIo67AGxLp6zKLQI4IFx9imNhdwYpRNWsXpE8cKO0SIBlczmIZtBgkPb
	NFlPGuj0VGOsOSdxhdfN6bhLoykTwxRr1V3Jb08kHSbQujylfeYjSrRriqjVDTHFD5T/UW0JHVd5T
	K1Y5kYTrE19kqcjbez52nKO7f6W4HoyuGkoMqYnqO2D27bas4sFIfw1EMIpHCnG9gEnyc796HuI32
	6+lS4gZA==;
Received: from [81.79.92.254] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uEkF1-007Tuw-PW; Tue, 13 May 2025 09:45:26 +0200
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
Subject: [RFC v3 03/10] dma-fence: Add helpers for accessing driver and timeline name
Date: Tue, 13 May 2025 08:45:06 +0100
Message-ID: <20250513074513.81727-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250513074513.81727-1-tvrtko.ursulin@igalia.com>
References: <20250513074513.81727-1-tvrtko.ursulin@igalia.com>
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
index 33661658f684..dc2456f68685 100644
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


