Return-Path: <linux-media+bounces-32354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC42EAB4D2E
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 09:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22CD517446C
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 07:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578FC1F12EF;
	Tue, 13 May 2025 07:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="mi8ofs/0"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618CA1BC4E
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 07:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747122337; cv=none; b=U/t3GTG6Wh5YTRIeGF9D3IO1E1AZ/hwPWGctaJdgj71O0HCACYd63T4EbMcqQ5t/4xNQoxucOjv58LKMXBSHTq/ZOPat5VjzolWrlwfsF6bs2PV/myzfFoeEoDAVIFG6DCMucLyyFj+nMPc4cZv877XMQLaJcGcVZMO5YcO9IBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747122337; c=relaxed/simple;
	bh=PXOjBC1zcpHu3MBNW0360uz2LAFqMOEV96e6x/7EfJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PJ4CME2FL0oK8UX4Q/UHNhzX/r03eh/FB6Z4ck5Iv+G4pEzWiw8S0eQ5hcJDAaO14ha0yNvUCSKiZv0Kj/WVP+HGIt+euTV0nzcfRpom57O103qgrekeMlnoqocikHzLnTp5NUFdtViq6HmTDIc6fdgK4pausAQSMk0O9ughS/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=mi8ofs/0; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=YqG3F1nwnJqHSQab4xMnAquojdAEH0nS8rKHczAwQco=; b=mi8ofs/0oA6a/2IDKfOGeIgfOE
	AXNEOp05GsCNpnbznaQCu4MncCLqTAqa+kWYl4S4DzOzdMTMoq7BzEQEu414gK/oooD0sF7DcDEeN
	ZZ22O7p06wbd10Bl1NZ6Cc0uiWmYs2P91eCLewUUc9KWiQlYykPUvyhAhEzbnWqNiO5DhyKzJwWJQ
	fxTYRBdbtTajDtATx5fbH2WpNoZvmQTxsmZjPzq8A4IJolbt6CUFVu3P7DF1czLJNIA38Ax3ZgWlW
	ztMjP5O9BDJ8EmD7dmZzoSy0BMORojlB7V+OvnKni92BeJjlBzvzWxKPNmSOqF8595tNOA6tkzTfd
	ql7oBy4g==;
Received: from [81.79.92.254] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uEkF1-007Tuo-1p; Tue, 13 May 2025 09:45:25 +0200
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
Subject: [RFC v3 02/10] dma-fence: Use a flag for 64-bit seqnos
Date: Tue, 13 May 2025 08:45:05 +0100
Message-ID: <20250513074513.81727-3-tvrtko.ursulin@igalia.com>
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

With the goal of reducing the need for drivers to touch (and dereference)
fence->ops, we move the 64-bit seqnos flag from struct dma_fence_ops to
the fence->flags.

Drivers which were setting this flag are changed to use new
dma_fence_init64() instead of dma_fence_init().

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-chain.c                |  5 ++---
 drivers/dma-buf/dma-fence.c                      |  9 +++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c |  5 ++---
 include/linux/dma-fence.h                        | 14 +++++---------
 4 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 90424f23fd73..a8a90acf4f34 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -218,7 +218,6 @@ static void dma_fence_chain_set_deadline(struct dma_fence *fence,
 }
 
 const struct dma_fence_ops dma_fence_chain_ops = {
-	.use_64bit_seqno = true,
 	.get_driver_name = dma_fence_chain_get_driver_name,
 	.get_timeline_name = dma_fence_chain_get_timeline_name,
 	.enable_signaling = dma_fence_chain_enable_signaling,
@@ -262,8 +261,8 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 			seqno = max(prev->seqno, seqno);
 	}
 
-	dma_fence_init(&chain->base, &dma_fence_chain_ops,
-		       &chain->lock, context, seqno);
+	dma_fence_init64(&chain->base, &dma_fence_chain_ops, &chain->lock,
+			 context, seqno);
 
 	/*
 	 * Chaining dma_fence_chain container together is only allowed through
diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index f0cdd3e99d36..33661658f684 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -1023,3 +1023,12 @@ dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
 	trace_dma_fence_init(fence);
 }
 EXPORT_SYMBOL(dma_fence_init);
+
+void
+dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
+		 spinlock_t *lock, u64 context, u64 seqno)
+{
+	dma_fence_init(fence, ops, lock, context, seqno);
+	__set_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags);
+}
+EXPORT_SYMBOL(dma_fence_init64);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
index 51cddfa3f1e8..5d26797356a3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
@@ -71,7 +71,6 @@ static void amdgpu_tlb_fence_work(struct work_struct *work)
 }
 
 static const struct dma_fence_ops amdgpu_tlb_fence_ops = {
-	.use_64bit_seqno = true,
 	.get_driver_name = amdgpu_tlb_fence_get_driver_name,
 	.get_timeline_name = amdgpu_tlb_fence_get_timeline_name
 };
@@ -101,8 +100,8 @@ void amdgpu_vm_tlb_fence_create(struct amdgpu_device *adev, struct amdgpu_vm *vm
 	INIT_WORK(&f->work, amdgpu_tlb_fence_work);
 	spin_lock_init(&f->lock);
 
-	dma_fence_init(&f->base, &amdgpu_tlb_fence_ops, &f->lock,
-		       vm->tlb_fence_context, atomic64_read(&vm->tlb_seq));
+	dma_fence_init64(&f->base, &amdgpu_tlb_fence_ops, &f->lock,
+			 vm->tlb_fence_context, atomic64_read(&vm->tlb_seq));
 
 	/* TODO: We probably need a separate wq here */
 	dma_fence_get(&f->base);
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 48b5202c531d..a34a0dcdc446 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -97,6 +97,7 @@ struct dma_fence {
 };
 
 enum dma_fence_flag_bits {
+	DMA_FENCE_FLAG_SEQNO64_BIT,
 	DMA_FENCE_FLAG_SIGNALED_BIT,
 	DMA_FENCE_FLAG_TIMESTAMP_BIT,
 	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
@@ -124,14 +125,6 @@ struct dma_fence_cb {
  *
  */
 struct dma_fence_ops {
-	/**
-	 * @use_64bit_seqno:
-	 *
-	 * True if this dma_fence implementation uses 64bit seqno, false
-	 * otherwise.
-	 */
-	bool use_64bit_seqno;
-
 	/**
 	 * @get_driver_name:
 	 *
@@ -262,6 +255,9 @@ struct dma_fence_ops {
 void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
 		    spinlock_t *lock, u64 context, u64 seqno);
 
+void dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
+		      spinlock_t *lock, u64 context, u64 seqno);
+
 void dma_fence_release(struct kref *kref);
 void dma_fence_free(struct dma_fence *fence);
 void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq);
@@ -454,7 +450,7 @@ static inline bool __dma_fence_is_later(struct dma_fence *fence, u64 f1, u64 f2)
 	 * 32bit sequence numbers. Use a 64bit compare when the driver says to
 	 * do so.
 	 */
-	if (fence->ops->use_64bit_seqno)
+	if (test_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags))
 		return f1 > f2;
 
 	return (int)(lower_32_bits(f1) - lower_32_bits(f2)) > 0;
-- 
2.48.0


