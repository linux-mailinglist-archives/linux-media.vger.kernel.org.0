Return-Path: <linux-media+bounces-32145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B635AB18B9
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 17:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 653551899465
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 15:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D628322F77A;
	Fri,  9 May 2025 15:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="T5x5BmvK"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBDA22DA0E
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 15:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746804864; cv=none; b=Xp6XBzkBc7I6A+2Z91hvmMMbhOkXn7X0mzra9a/fhZ5ga5XDxK+Oj+AGbCXEisZxAA533Bfxt08fQX9r+STVY4Soccap8Tu+EVZP9DKlKSjFJgYn79JPd6dQ9HXN1iL92//MHLAFVsWcl6viZAiR80b7E0utR67mPk+HfVilrLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746804864; c=relaxed/simple;
	bh=kWsyHgj1l2wfxiTnENWNqJbpuIVYIMuKXHaxlKESmb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ErELdGOBxDJ2bJUsntmVTNy4+ZGSaBvpm9NHk+KyyLOktjsaGsitslZiFnTlC7pyh0jV1/cXiMsAiqUseVSu+lzinrAEjGgwUUywHiPd5VLZHyYPQaho8qZlEZzk19nC9qOV1vbwO+EkkP0irrwAeOkfmeJOIpJTOwULn/DcFnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=T5x5BmvK; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ZweQKa6AfgM5VXc5Xs0L090EODD4U3p5fCC+wID0D+w=; b=T5x5BmvKWzxYipRnZ6ERupZm15
	S6m6OtxvZKvxcahUI5xrM31Aymvp0RgCDtwOzSgCb3Vxdq23K6nuafdMINBc3EXKqIr9s83fQFGAW
	fbq+3FOhofv38EmvPDTxUvWcOt8apHDWqi7svgT4ifFesWAou5/DMWtte9d123J5YcDbvk/yuBR9s
	Yl8fxldsNoy3TKlrBU3awffSs5fScMpHOVQNs598o79BlYoGIqn85FVGDjIp2kKidqw5U/MEzduYK
	TS+d4r6TyaqSQBmxCzzs5HVzFybk6FusrKxepfKlo5RoZ7Yh3alWhTk2YzrI9ljh78WLQ7Z2m8IuI
	I2wal6Xw==;
Received: from [81.79.92.254] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uDPfK-005oF1-FX; Fri, 09 May 2025 17:34:11 +0200
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
Subject: [RFC v2 06/13] dma-fence: Use driver and timeline name helpers internally
Date: Fri,  9 May 2025 16:33:45 +0100
Message-ID: <20250509153352.7187-7-tvrtko.ursulin@igalia.com>
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

Make the implementation use the previously added helper for accessing the
driver and timeline name. This will enable more coverage later when
asserts will be added into them.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/dma-buf/dma-fence.c      | 9 +++++----
 include/trace/events/dma_fence.h | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

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


