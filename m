Return-Path: <linux-media+bounces-62454-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cI2YFNfmDmopDAYAu9opvQ
	(envelope-from <linux-media+bounces-62454-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 13:04:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BE65A3BC2
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 13:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABB65313E6F3
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 10:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749033A7D74;
	Thu, 21 May 2026 10:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E200blCd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161AD3A6409
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 10:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779360229; cv=none; b=TjhEKNr3dr+qE1DI/K2kbMZ1ZkZ/E3xf9mr98g5hmtyEsRvj2cxaBNFN93i3qmaGYTEvxxH5s8V/+9fEEnGsMd1RCMKMm/HnBt5aZYXa5ezT+sjQUsCq8T6wYTQ3H7h1HU9HexQvHSxBoixb7qLGHY9HKOdobEvUQEEDBBAfzMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779360229; c=relaxed/simple;
	bh=jhawuaQE4VaUOaqBjSVJ7L9kHTPtT9q8QTpefJsl81M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b08IOaHZfJINZiMfgxhRTaNqvEPjEZSj3pPMb/MVQ1PCGvVEKriXJr/V9Byq501xVggoZ8JocYUWJcjMEBV6s+c8Fp5RawZi6s581dIdhQvazGtgO0gBZIsk38JKKUjW0BCclAodarRgFyNN3uwgAIaKiPtoftQXQjpY5pHIvKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E200blCd; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a40502e63bso6458128e87.0
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 03:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779360226; x=1779965026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2MVfvQBPeY6Pwia0clIRhZPiWkl2nWuf72y0t9gH4Q=;
        b=E200blCdoeXIVL9RK1c+3nx4PRCn43GPmMTmI0ShzuSNzY+mrw/G+Qh4v7E7n48qqo
         mkZ0EFWAr5ULbIAv8Hs/+EvhIlw3WNPguUTVVI6Gwmw1XsYAkLB7PAs3c5nrLqJdurcn
         NwzJGr53qGm2msnWSXWeeTRgRLe30ItTaV/w52Qa/MQtEI933NUScYDreSwkX5LW1kwP
         VtTlLnmcVQlxLqDipknMf95FbBoYo7EVRWWSdekwiL5YS/HydntqKkhO9REKPqZ7AK8H
         3YaPn5WYe42NUJ3g4UIr3Ln8Oop56lJ3aQCgq6yO1NmsZI/ExPL/TtJqvmJ49P3j+B/y
         +QiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779360226; x=1779965026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V2MVfvQBPeY6Pwia0clIRhZPiWkl2nWuf72y0t9gH4Q=;
        b=MjLinTxyIadD7wlgjtyqLdMP3NkyR/vEbyNf81i9h6yNHpKod4rZU22uBJ8VZUl/b+
         QXa3Y5mVuGRDNIF7TBi1+txcqzzJnIVDT611+vVpH8ZJoOULnkjX4SKWfRzzLcfFmN1I
         6kxEYdri+gSBQkKBTRXhMk1nSECS17O0bprnTqDW7GxqE0MxM2Lyo4SwvsDUsfbvn/1q
         YvPcTE//mSCtRE2uMQxqJahjuzmxCrPRaPACUFz4ImcLuYVTGn3VM3o91bgV8aac67H1
         vIJ5w/jppO4itw2iFJg5yOIYw35qD0Vyy+TlMOxt671+BpWluWM5oY3szghLttRDFVFr
         T5rg==
X-Forwarded-Encrypted: i=1; AFNElJ8XyA2yRYCm6CKFUb1MG7tvsbUVuThPMnCBCM6DVlerYS3q2Vb/a6JR9zq9/hi3t1HFyh2t5K3mjFH7BQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQlyRMJpKs6jAJirENBcQM4Z5c40FohOQhMFunaJi3GbeK4HAg
	+i1J5pHOJcI/09obVOfUnjYzcQKrXTjp/yWb3qZqUavR2wUXLRNi/CMs
X-Gm-Gg: Acq92OH3uVYZEosUKoZfq79x3j8q0kLu1bpf4Yx5J8niAdCOMzp8IaiA0BK6SdB5UT5
	nT36CaX4z+FVIuCbWUkm2dPAlDyEvF5eQr5EhpciUn6qe+72+zyN3TU64qeuKfgD2cLJAXrS/ji
	YqR5vaDjjkx+8O8PpY2dC+V5KS7KTKPz4iR+xswoKA3Aol5ZsN6HGhzBo5D8gfKx6Bd9AtFxuSE
	JvzE9TnJGewNt9iu5vWc/36a2x0M2wSj9JCU0W09P+wCG4ib/v6++PIVBzCJEpiK5wTefxSsZa7
	WWeST07swagC3BUF7OdyICO5AA36CCS/maDJjWzhnmIuXgr9IF8hsyHB7l8wYZkv2kU9aU7Wd2R
	YEk4AKBlPBH/W5681u/wprZzX235piAMjcxX1fbk5XjLl4onVGBjCrb+dES1Hq0DmWc+kDL4AGx
	N96QhtR1/y2UlIDiNvqEqsCA8iC/DsG45kQNkLgos5nkKK
X-Received: by 2002:ac2:46ea:0:b0:5a8:89ad:e172 with SMTP id 2adb3069b0e04-5aa2ba9afecmr629800e87.37.1779360225752;
        Thu, 21 May 2026 03:43:45 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395d0b49073sm1595611fa.31.2026.05.21.03.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 03:43:45 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH v4 2/2] drm/amdgpu: fix recursive ww_mutex acquire in amdgpu_devcoredump_format
Date: Thu, 21 May 2026 15:43:33 +0500
Message-ID: <20260521104335.28978-3-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521104335.28978-1-mikhail.v.gavrilov@gmail.com>
References: <20260520151741.50575-1-mikhail.v.gavrilov@gmail.com>
 <20260521104335.28978-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62454-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linaro.org,vger.kernel.org,lists.linaro.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhailvgavrilov@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:email]
X-Rspamd-Queue-Id: A2BE65A3BC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When dumping IB contents from a hung job, amdgpu_devcoredump_format()
acquired the VM root PD's reservation via amdgpu_vm_lock_by_pasid() and
then, for each IB, called amdgpu_bo_reserve() on the BO backing the IB.
Both reservations are reservation_ww_class_mutex objects and neither
used a ww_acquire_ctx, which trips lockdep:

  WARNING: possible recursive locking detected
  --------------------------------------------
  kworker/u128:0 is trying to acquire lock:
  ffff88838b16e1f0 (reservation_ww_class_mutex){+.+.}-{4:4},
    at: amdgpu_devcoredump_format+0x1594/0x23f0 [amdgpu]

  but task is already holding lock:
  ffff8882f82681f0 (reservation_ww_class_mutex){+.+.}-{4:4},
    at: amdgpu_devcoredump_format+0x1594/0x23f0 [amdgpu]

   Possible unsafe locking scenario:
         CPU0
         ----
    lock(reservation_ww_class_mutex);
    lock(reservation_ww_class_mutex);

   *** DEADLOCK ***
   May be due to missing lock nesting notation

  Workqueue: events_unbound amdgpu_devcoredump_deferred_work [amdgpu]
  Call Trace:
   __ww_mutex_lock.constprop.0
   ww_mutex_lock
   amdgpu_bo_reserve
   amdgpu_devcoredump_format+0x1594 [amdgpu]
   amdgpu_devcoredump_deferred_work+0xea [amdgpu]

The two reservations are on different BOs in the captured trace, so the
splat is a lockdep-correctness warning, not an observed deadlock. It
becomes a real self-deadlock whenever the IB BO shares its dma_resv with
the root PD (the always-valid case, see amdgpu_vm_is_bo_always_valid()):
amdgpu_bo_reserve(abo) re-acquires the same ww_mutex without a ticket
and blocks forever.

With amdgpu.gpu_recovery=0 the timeout handler refires every ~2 s and
each invocation produces this splat, drowning the kernel ring buffer.

Now that amdgpu_vm_lock_by_pasid() takes a drm_exec context, lock the
root PD and every IB BO together in a single drm_exec ticket.
DRM_EXEC_IGNORE_DUPLICATES handles IB BOs that share a dma_resv (e.g.
always-valid BOs, or two IBs backed by the same BO). Every lock is now
a top-level acquire under one ww_acquire_ctx, so the recursive ww_mutex
condition is gone, and the per-IB amdgpu_bo_reserve()/amdgpu_bo_unref()
dance -- including a BO refcount leak on the amdgpu_bo_reserve() failure
path -- is removed.

Reproducer (~150 LoC libdrm_amdgpu): submit a single GFX IB containing
PACKET3_INDIRECT_BUFFER chained at GPU VA 0 and wait for the fence. The
TDR fires within ~10 s and the deferred coredump worker produces the
splat above on every invocation; with this change applied the splat is
gone.

Fixes: 7b15fc2d1f1a ("drm/amdgpu: dump job ibs in the devcoredump")
Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 105 ++++++++++++------
 1 file changed, 71 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
index d386bc775d03..456ea9911d48 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
@@ -24,6 +24,7 @@
 
 #include <generated/utsrelease.h>
 #include <linux/devcoredump.h>
+#include <drm/drm_exec.h>
 #include "amdgpu_dev_coredump.h"
 #include "atom.h"
 
@@ -214,13 +215,9 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
 	struct drm_printer p;
 	struct drm_print_iterator iter;
 	struct amdgpu_vm_fault_info *fault_info;
-	struct amdgpu_bo_va_mapping *mapping;
 	struct amdgpu_ip_block *ip_block;
 	struct amdgpu_res_cursor cursor;
-	struct amdgpu_bo *abo, *root;
-	uint64_t va_start, offset;
 	struct amdgpu_ring *ring;
-	struct amdgpu_vm *vm;
 	u32 *ib_content;
 	uint8_t *kptr;
 	int ver, i, j, r;
@@ -343,43 +340,84 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
 		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
 
 	if (coredump->num_ibs) {
-		/* Don't try to lookup the VM or map the BOs when calculating the
-		 * size required to store the devcoredump.
+		struct amdgpu_bo_va_mapping *mapping;
+		struct amdgpu_bo *abo;
+		struct drm_exec exec;
+		struct amdgpu_vm *vm;
+		u64 va_start, offset;
+		bool locked = false;
+
+		/*
+		 * Lock the VM root PD and every IB BO together in a single
+		 * drm_exec ticket. Reserving the IB BOs one by one while the
+		 * root PD is held would be a recursive reservation_ww_class_mutex
+		 * acquire without a ww_acquire_ctx, which trips lockdep and
+		 * self-deadlocks for IB BOs that share their dma_resv with the
+		 * root PD (always-valid BOs).
+		 *
+		 * Skip locking entirely on the sizing pass: it does not write
+		 * IB content, so the size estimate doesn't depend on whether
+		 * the BOs are reachable.
 		 */
-		if (sizing_pass)
-			vm = NULL;
-		else
-			vm = amdgpu_vm_lock_by_pasid(adev, &root, coredump->pasid);
+		if (!sizing_pass) {
+			drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES,
+				      1 + coredump->num_ibs);
+			drm_exec_until_all_locked(&exec) {
+				vm = amdgpu_vm_lock_by_pasid(adev, coredump->pasid,
+							     &exec);
+				drm_exec_retry_on_contention(&exec);
+				if (!vm)
+					break;
+
+				for (int i = 0; i < coredump->num_ibs; i++) {
+					u64 pfn;
+
+					va_start = coredump->ibs[i].gpu_addr &
+						   AMDGPU_GMC_HOLE_MASK;
+					pfn = va_start / AMDGPU_GPU_PAGE_SIZE;
+					mapping = amdgpu_vm_bo_lookup_mapping(vm, pfn);
+					if (!mapping)
+						continue;
+
+					abo = mapping->bo_va->base.bo;
+					r = drm_exec_lock_obj(&exec, &abo->tbo.base);
+					drm_exec_retry_on_contention(&exec);
+					if (r)
+						break;
+				}
+				if (r)
+					break;
+			}
+			if (vm && !r)
+				locked = true;
+			else
+				drm_exec_fini(&exec);
+		}
+
+		for (int i = 0; i < coredump->num_ibs; i++) {
+			bool emit_content = sizing_pass;
 
-		for (int i = 0; i < coredump->num_ibs && (sizing_pass || vm); i++) {
 			ib_content = kvmalloc_array(coredump->ibs[i].ib_size_dw, 4,
 						    GFP_KERNEL);
 			if (!ib_content)
 				continue;
 
-			/* vm=NULL can only happen when 'sizing_pass' is true. Skip to the
-			 * drm_printf() calls (ib_content doesn't need to be initialized
-			 * as its content won't be written anywhere).
-			 */
-			if (!vm)
+			if (!locked)
 				goto output_ib_content;
 
 			va_start = coredump->ibs[i].gpu_addr & AMDGPU_GMC_HOLE_MASK;
 			mapping = amdgpu_vm_bo_lookup_mapping(vm, va_start / AMDGPU_GPU_PAGE_SIZE);
 			if (!mapping)
-				goto free_ib_content;
+				goto output_ib_content;
 
-			offset = va_start - (mapping->start * AMDGPU_GPU_PAGE_SIZE);
-			abo = amdgpu_bo_ref(mapping->bo_va->base.bo);
-			r = amdgpu_bo_reserve(abo, false);
-			if (r)
-				goto free_ib_content;
+			abo = mapping->bo_va->base.bo;
+			offset = va_start - mapping->start * AMDGPU_GPU_PAGE_SIZE;
 
 			if (abo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS) {
 				off = 0;
 
 				if (abo->tbo.resource->mem_type != TTM_PL_VRAM)
-					goto unreserve_abo;
+					goto output_ib_content;
 
 				amdgpu_res_first(abo->tbo.resource, offset,
 						 coredump->ibs[i].ib_size_dw * 4,
@@ -391,12 +429,13 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
 					off += cursor.size;
 					amdgpu_res_next(&cursor, cursor.size);
 				}
+				emit_content = true;
 			} else {
 				r = ttm_bo_kmap(&abo->tbo, 0,
 						PFN_UP(abo->tbo.base.size),
 						&abo->kmap);
 				if (r)
-					goto unreserve_abo;
+					goto output_ib_content;
 
 				kptr = amdgpu_bo_kptr(abo);
 				kptr += offset;
@@ -404,23 +443,21 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
 				       coredump->ibs[i].ib_size_dw * 4);
 
 				amdgpu_bo_kunmap(abo);
+				emit_content = true;
 			}
 
 output_ib_content:
 			drm_printf(&p, "\nIB #%d 0x%llx %d dw\n",
 				   i, coredump->ibs[i].gpu_addr, coredump->ibs[i].ib_size_dw);
-			for (int j = 0; j < coredump->ibs[i].ib_size_dw; j++)
-				drm_printf(&p, "0x%08x\n", ib_content[j]);
-unreserve_abo:
-			if (vm)
-				amdgpu_bo_unreserve(abo);
-free_ib_content:
+			if (emit_content) {
+				for (int j = 0; j < coredump->ibs[i].ib_size_dw; j++)
+					drm_printf(&p, "0x%08x\n", ib_content[j]);
+			}
 			kvfree(ib_content);
 		}
-		if (vm) {
-			amdgpu_bo_unreserve(root);
-			amdgpu_bo_unref(&root);
-		}
+
+		if (locked)
+			drm_exec_fini(&exec);
 	}
 
 	return count - iter.remain;
-- 
2.54.0


