Return-Path: <linux-media+bounces-62531-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QO7mCPQ0D2qSHgYAu9opvQ
	(envelope-from <linux-media+bounces-62531-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 18:38:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8735D5A96C1
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 18:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DEBCE36ECD9C
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 15:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5C633EB1B;
	Thu, 21 May 2026 15:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TdviwDXV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4104D32BF52
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 15:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779376134; cv=none; b=moIN3vNJfi/UzFBpD3wH7yrwUnACxzOV6qf3qH/yy5XgDZ2Vx7JRfReiDvUL9sDoCKDN3U28w/44i130nrYji/m3pLrt2VV74dIKUU9HbHE+Fndntfn6pIhkMMd1LZfdhh4VeO+b+2yMeCUSzXEHMAuaitUYTBuvXeQXSALtaC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779376134; c=relaxed/simple;
	bh=jhawuaQE4VaUOaqBjSVJ7L9kHTPtT9q8QTpefJsl81M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D9pkNrDJJwjvB1CqpGQcfhfpMDTmIn6n2PntKjEZRjPIo+VTWhngopkSdVKfvllWU7SY8ZGW+fFCAo1IN13zwfSZH6G9vGZ3IlWm11GFouR0oMTgYUdwnDYxSxMx2buwoxjeBda4bHW2o8WOqe3RYsPftkCz7LMs8JS3bkAv7wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TdviwDXV; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a887ebb416so7559298e87.2
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 08:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779376130; x=1779980930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2MVfvQBPeY6Pwia0clIRhZPiWkl2nWuf72y0t9gH4Q=;
        b=TdviwDXVIHPeaDNfUcwJJOO/rRX1Pj2G/9FpNHhuNiL26KcIAKBuyb4W8BmhtTjpmN
         zo8xb6acZRgZXhLzrMLTxj+sINpr2Kc3ekAn/eaTmNWJxuoIckZnXynUncu3+X4q1nTp
         WnrwRZjZAssoef44K1pgkmpZVr6wFJ140cyuWNn4AxOBAMPomV6LmJw6JQKUbWGXwlny
         8h0Xb066367eIX2++TxrUWKE69ACbJhVgUR+k+byruT0O5UxsB+pmwzTPkkW9Qv5/Su5
         QIWWvkw05RipsT5tWq4HTW96XejbNNSC5Rq687N5777KvKXs8PIV9iKU5RI/bQqNCMdg
         2SGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779376130; x=1779980930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V2MVfvQBPeY6Pwia0clIRhZPiWkl2nWuf72y0t9gH4Q=;
        b=pqbcT0wsr9QABg2SHqjUNRdN7HZ7/OScV8zFvp80UEt7ZrJB4xR/O8R3Exi9+r9HwC
         4KItW+k6I9x5s8NUUsWSyZODeUwG5/A35JZYcsHAK4HvcBPw3IQ47fJLq271Vbtrnr7P
         b+DjvHARucJk/o/42wQuCFosKgJEzQ7eJmtvjmyxK5+zV7hvi9avXq4xAUuL3vxu5P6I
         fJlTfJQt5N+bKL7esS2FcZzbIgXkZHDL4Y3Ti+d6Qmj+VVOUbgusucy2I6iY0b1Vit/O
         6dSZ9ZxxUgePc8VuM/HmJL3dD2A7dHUgP7ebYWgECI/WhvlczvFgPlA8BBz3XJfvfPjm
         MEPg==
X-Forwarded-Encrypted: i=1; AFNElJ/LF+/v1bgjV8tQbgQ+rxkvdjvA5w6d1UJXNVbWfjP+p9ImWiIdaQNRZ1oj9+af2vtcHhzdsesUBBQX8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxviBHpc9whJeNT0CO9uWusPIHDTCmuKAhcDEbMYBTCc38TQSp6
	CivMnrZCPJaNLTCmT9zo/p2kqSOle8bJet6dNf/KlTf5EmXa1wQL026N
X-Gm-Gg: Acq92OHrDJR9AiFEw0KHWwF+WXqEWf9vI05jnJYlXBqcFVr9gJNGpdr72iL+2KYF4gS
	cVqv1JX08P+4zEoyV9UPW1LZgHvKVIs+2ik1c2R0RpZm587hDuDuFvqXZnxomoRo/o4QxnhqdpP
	7Rh+4bYKyosoJDGsAQ3N6Zqkd5lXmeJMqkz8apHuJy8VzEa9i2CK6HI3ABZVdZiYkR79r7UrUqg
	eXG6XvufIMNrJlLRjAo6l9B8eLtIf83b9MaByzjs6ea62XPvUXhfkhpvppDH6BxfCPtFshzEiEG
	PGXvQzWNhY/h+mmIila6OCjeojh0szfPqO4An90txZgfU4uLK6/RXFX4UDFdXKE9DybxzNm4G+G
	PQKim8B9HblReIDawBY4TrWl5wVY2Mw+25tgWUBEshis5hpVBjbmV8OTDTqsLUhQ3rJFxvqAxX8
	/snW0TwMxm5trbvcmfS4N749Ra+ZnLpbdx
X-Received: by 2002:ac2:5dcd:0:b0:5a8:a754:f9d5 with SMTP id 2adb3069b0e04-5aa2ba9ac3bmr843915e87.39.1779376130152;
        Thu, 21 May 2026 08:08:50 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa2f120c6esm335686e87.19.2026.05.21.08.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:08:49 -0700 (PDT)
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
Subject: [PATCH v5 2/2] drm/amdgpu: fix recursive ww_mutex acquire in amdgpu_devcoredump_format
Date: Thu, 21 May 2026 20:08:40 +0500
Message-ID: <20260521150841.20625-3-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521150841.20625-1-mikhail.v.gavrilov@gmail.com>
References: <20260521104335.28978-1-mikhail.v.gavrilov@gmail.com>
 <20260521150841.20625-1-mikhail.v.gavrilov@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62531-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8735D5A96C1
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


