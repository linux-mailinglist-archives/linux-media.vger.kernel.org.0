Return-Path: <linux-media+bounces-63007-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKxAOvE2GWogtAgAu9opvQ
	(envelope-from <linux-media+bounces-63007-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 08:49:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 640D75FE28D
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 08:49:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 85A0D30D2B5E
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 06:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97323AB293;
	Fri, 29 May 2026 06:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iy4BXyoS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826373ACA4D
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 06:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780037307; cv=none; b=G5AKVIo3XUjcMiuSsZ7gSXP7DZCSsN/BJIUchVBC8wlip6mKwN+5/1VU9Yhxrixje3wRb5yexgkyAfSQBoxyL7j5yiumGslaRX102tqwsmi2M4Bw/JmPJfu5oN7OH4L0yzKDPHLUacEHp5YvNe+gR7Sm3vOaUt294ovKAZkuz8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780037307; c=relaxed/simple;
	bh=XnmuBqyTezi+9eQjbJlkpvAZoXxxgwskhrT5L1ibFug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h2n6U1qLjGMBygEkUQFSJ7+WFZ+v/lC7SqZ5uDOxkxjN9vXmwIjT4W80qOijzEAErou4sOwWuAB2V4DMg8iCpYWiTWkfm3TqEiMpMauEszezrFKG/U9Jtruuzn+uBEZ911SQG9hqxJZpCeeQYXYZ0JBV33R/gQdU18nNWyLdaOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iy4BXyoS; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a877510541so14834976e87.2
        for <linux-media@vger.kernel.org>; Thu, 28 May 2026 23:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780037304; x=1780642104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJUei/KuumAUMNhgELgEfVVLFOVaFW7qqMv2FxIHEpg=;
        b=iy4BXyoSqRjVW2HpSmG2MROpvHalE9UODTEVX0/uU4xcHClf4hE1ATXlWOoIYWM+K5
         lNo8gtvktsFo0EOVWZVDdVKbzfRxBsQXYFsQZX3UeHkUBuwF+c5jAWlpxM2t9jdHWwr0
         YrUE3/+NZF43oFW7FeNW7B9ZZ75FTIJAJMcUgwCt1HeyMmMgEqVDrHL4XP9e5TObOc2Q
         O6YlxwCb0FtSOjYP8Bx8eVg0VFyLta3HtjTXu02z1q95F5do5r48g5752kqLWmhwT1rC
         3sxRmt9vpUPQBasfmdENVFhLsMQ15wBv5BBKeJ9UjLv7DVokbsJiAr0IWMn29uFFmgYz
         cXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780037304; x=1780642104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pJUei/KuumAUMNhgELgEfVVLFOVaFW7qqMv2FxIHEpg=;
        b=bfQKuB0E7cFrFKtG5QVDARRMaHh/p5GT6bIR3KeHd4knkAx+gAwC3KfZNRFZEqw5/o
         DIlN4PwTR5iXt0vgYBTyjCB6xPgx9tmJjNhBGCkP2d6+9L5UgPRuPcHuajBt6loDU4nb
         qJrAIbyC4ErWXAkriGBQ2xeVkxYNOp+Xv+GUH2+CGvJlbb6NGp5HOuqQWQPY1QbLq+f+
         TgFUWKElAsk8JUt9hdONKclAh8b+bjcqs5iiVX5vlYZRrevSI+i9VubK7gqysrQwpz7z
         wrdaczk/JR+Ns4YM70bQRoQ/O4jPQzUpoNWJfhk40N0SA6h06Owj+AyBjTrMkqxe/Y+Q
         gHhw==
X-Forwarded-Encrypted: i=1; AFNElJ+aQ3c2nk+eavySVpOrHxiaZR5+F9cpkKsugOG/KoH6pNxitrkdZscFW1oNwboMTv7PWQMXWIKMp1319Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFTW1dZpgQgkX2UsjSuKQSf5UAnipvSPaeyvLeAQJkSknsvSBC
	qPVq4wRETW8AjSZH9payCKbUfc7ryh42OX2h2uTwt9DNzFYYS4lJPd2L
X-Gm-Gg: Acq92OF9IiGcQIMDebltm8ZQ8G5zsCUkpd0tRDvtad5Na3jPxm5NW55BHXoC2kvf3kW
	PqedcNkxenHAb6rqVjayQyLMBKit7pdOr0sy+eZv2tGmFVpxOC9FrhbkSlrx/WO4JsPsDB5H7k5
	Nl3JDvf3zIUPMS/YxZ9S/xuY2LdBQtjWL0yQQkgcpeFFZ7pHFSrArY1CG+RKr5X1UCFBCw6VHYD
	jJWbh2Ol9lkTiauMfvn4KLDu7V0FApKSyOLfPxcRRpBsCgPrpm8WbOTWV/Qlp03YqE4q752814e
	vyWtSW4x9lOy9cTW5oSR/GYDP3VNbVMSFu+cH72RuuHJeSxgy3lkwjpI7fw5eSQpVz5813vMA0P
	Q4KqfBqCHOEb8XGg/v9gxThkUvwdzvXQFYkW2sjLe+0v5PYeetqLgWmYapHdCZiyL2ed3GPk3nn
	MFRTdnXM92mkepLC2/9/y2uQDVkKaiLyjE5ggvGc4IjD0=
X-Received: by 2002:a05:6512:a8c:b0:5aa:106f:87bb with SMTP id 2adb3069b0e04-5aa59475a96mr400169e87.3.1780037303600;
        Thu, 28 May 2026 23:48:23 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b79f04dsm72147e87.83.2026.05.28.23.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 23:48:23 -0700 (PDT)
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
Subject: [PATCH v6 2/2] drm/amdgpu: fix recursive ww_mutex acquire in amdgpu_devcoredump_format
Date: Fri, 29 May 2026 11:47:39 +0500
Message-ID: <20260529064740.25060-3-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529064740.25060-1-mikhail.v.gavrilov@gmail.com>
References: <20260521150841.20625-1-mikhail.v.gavrilov@gmail.com>
 <20260529064740.25060-1-mikhail.v.gavrilov@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63007-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amd.com:email]
X-Rspamd-Queue-Id: 640D75FE28D
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
and blocks forever. With amdgpu.gpu_recovery=0 the timeout handler
refires every ~2 s and each invocation produces this splat, drowning the
kernel ring buffer.

Now that amdgpu_vm_lock_by_pasid() takes a drm_exec context, move the IB
dumping into a separate helper that locks the root PD and every IB BO
together in a single drm_exec ticket. DRM_EXEC_IGNORE_DUPLICATES handles
IB BOs that share a dma_resv (e.g. always-valid BOs, or two IBs backed
by the same BO). Every lock is now a top-level acquire under one
ww_acquire_ctx, so the recursive ww_mutex condition is gone, and the
per-IB amdgpu_bo_reserve()/amdgpu_bo_unref() dance -- including a BO
refcount leak on the amdgpu_bo_reserve() failure path -- is removed.

Fixes: 7b15fc2d1f1a ("drm/amdgpu: dump job ibs in the devcoredump")
Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 215 ++++++++++--------
 1 file changed, 126 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
index d386bc775d03..c7d43796d603 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
@@ -24,6 +24,7 @@
 
 #include <generated/utsrelease.h>
 #include <linux/devcoredump.h>
+#include <drm/drm_exec.h>
 #include "amdgpu_dev_coredump.h"
 #include "atom.h"
 
@@ -207,23 +208,137 @@ static void amdgpu_devcoredump_fw_info(struct amdgpu_device *adev,
 	}
 }
 
+static void
+amdgpu_devcoredump_print_ibs(struct drm_printer *p,
+			     struct amdgpu_coredump_info *coredump,
+			     bool sizing_pass)
+{
+	struct amdgpu_device *adev = coredump->adev;
+	struct amdgpu_bo_va_mapping *mapping;
+	struct amdgpu_bo *abo;
+	struct drm_exec exec;
+	struct amdgpu_vm *vm;
+	u32 *ib_content;
+	u64 va_start, offset;
+	u8 *kptr;
+	u32 off;
+	int r;
+
+	/*
+	 * On the sizing pass there is no VM to look up and no BO to lock; the
+	 * size estimate doesn't depend on whether the IB BOs are reachable.
+	 * Just emit the per-IB headers (the content is not written anywhere).
+	 */
+	if (sizing_pass) {
+		for (int i = 0; i < coredump->num_ibs; i++) {
+			drm_printf(p, "\nIB #%d 0x%llx %d dw\n", i,
+				   coredump->ibs[i].gpu_addr,
+				   coredump->ibs[i].ib_size_dw);
+		}
+		return;
+	}
+
+	/*
+	 * Lock the VM root PD and every IB BO together in a single drm_exec
+	 * ticket. Reserving the IB BOs one by one while the root PD is held
+	 * would be a recursive reservation_ww_class_mutex acquire without a
+	 * ww_acquire_ctx, which trips lockdep and self-deadlocks for IB BOs
+	 * that share their dma_resv with the root PD (always-valid BOs).
+	 */
+	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 1 + coredump->num_ibs);
+	drm_exec_until_all_locked(&exec) {
+		vm = amdgpu_vm_lock_by_pasid(adev, coredump->pasid, &exec);
+		if (!vm)
+			goto unlock;
+
+		for (int i = 0; i < coredump->num_ibs; i++) {
+			u64 pfn = (coredump->ibs[i].gpu_addr &
+				   AMDGPU_GMC_HOLE_MASK) / AMDGPU_GPU_PAGE_SIZE;
+
+			mapping = amdgpu_vm_bo_lookup_mapping(vm, pfn);
+			if (!mapping)
+				continue;
+
+			abo = mapping->bo_va->base.bo;
+			r = drm_exec_lock_obj(&exec, &abo->tbo.base);
+			drm_exec_retry_on_contention(&exec);
+			if (r)
+				goto unlock;
+		}
+	}
+
+	for (int i = 0; i < coredump->num_ibs; i++) {
+		bool emit_content = false;
+
+		ib_content = kvmalloc_array(coredump->ibs[i].ib_size_dw, 4,
+					    GFP_KERNEL);
+		if (!ib_content)
+			continue;
+
+		va_start = coredump->ibs[i].gpu_addr & AMDGPU_GMC_HOLE_MASK;
+		mapping = amdgpu_vm_bo_lookup_mapping(vm,
+						      va_start / AMDGPU_GPU_PAGE_SIZE);
+		if (!mapping)
+			goto output_ib_content;
+
+		abo = mapping->bo_va->base.bo;
+		offset = va_start - mapping->start * AMDGPU_GPU_PAGE_SIZE;
+
+		if (abo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS) {
+			struct amdgpu_res_cursor cursor;
+
+			off = 0;
+
+			if (abo->tbo.resource->mem_type != TTM_PL_VRAM)
+				goto output_ib_content;
+
+			amdgpu_res_first(abo->tbo.resource, offset,
+					 coredump->ibs[i].ib_size_dw * 4, &cursor);
+			while (cursor.remaining) {
+				amdgpu_device_mm_access(adev, cursor.start / 4,
+							&ib_content[off], cursor.size / 4,
+							false);
+				off += cursor.size;
+				amdgpu_res_next(&cursor, cursor.size);
+			}
+			emit_content = true;
+		} else {
+			r = ttm_bo_kmap(&abo->tbo, 0, PFN_UP(abo->tbo.base.size),
+					&abo->kmap);
+			if (r)
+				goto output_ib_content;
+
+			kptr = amdgpu_bo_kptr(abo);
+			kptr += offset;
+			memcpy(ib_content, kptr, coredump->ibs[i].ib_size_dw * 4);
+
+			amdgpu_bo_kunmap(abo);
+			emit_content = true;
+		}
+
+output_ib_content:
+		drm_printf(p, "\nIB #%d 0x%llx %d dw\n", i,
+			   coredump->ibs[i].gpu_addr, coredump->ibs[i].ib_size_dw);
+		if (emit_content) {
+			for (int j = 0; j < coredump->ibs[i].ib_size_dw; j++)
+				drm_printf(p, "0x%08x\n", ib_content[j]);
+		}
+		kvfree(ib_content);
+	}
+
+unlock:
+	drm_exec_fini(&exec);
+}
+
 static ssize_t
 amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_info *coredump)
 {
-	struct amdgpu_device *adev = coredump->adev;
 	struct drm_printer p;
 	struct drm_print_iterator iter;
 	struct amdgpu_vm_fault_info *fault_info;
-	struct amdgpu_bo_va_mapping *mapping;
 	struct amdgpu_ip_block *ip_block;
-	struct amdgpu_res_cursor cursor;
-	struct amdgpu_bo *abo, *root;
-	uint64_t va_start, offset;
 	struct amdgpu_ring *ring;
-	struct amdgpu_vm *vm;
-	u32 *ib_content;
-	uint8_t *kptr;
-	int ver, i, j, r;
+	int ver, i, j;
 	u32 ring_idx, off;
 	bool sizing_pass;
 
@@ -342,86 +457,8 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
 	else if (coredump->reset_vram_lost)
 		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
 
-	if (coredump->num_ibs) {
-		/* Don't try to lookup the VM or map the BOs when calculating the
-		 * size required to store the devcoredump.
-		 */
-		if (sizing_pass)
-			vm = NULL;
-		else
-			vm = amdgpu_vm_lock_by_pasid(adev, &root, coredump->pasid);
-
-		for (int i = 0; i < coredump->num_ibs && (sizing_pass || vm); i++) {
-			ib_content = kvmalloc_array(coredump->ibs[i].ib_size_dw, 4,
-						    GFP_KERNEL);
-			if (!ib_content)
-				continue;
-
-			/* vm=NULL can only happen when 'sizing_pass' is true. Skip to the
-			 * drm_printf() calls (ib_content doesn't need to be initialized
-			 * as its content won't be written anywhere).
-			 */
-			if (!vm)
-				goto output_ib_content;
-
-			va_start = coredump->ibs[i].gpu_addr & AMDGPU_GMC_HOLE_MASK;
-			mapping = amdgpu_vm_bo_lookup_mapping(vm, va_start / AMDGPU_GPU_PAGE_SIZE);
-			if (!mapping)
-				goto free_ib_content;
-
-			offset = va_start - (mapping->start * AMDGPU_GPU_PAGE_SIZE);
-			abo = amdgpu_bo_ref(mapping->bo_va->base.bo);
-			r = amdgpu_bo_reserve(abo, false);
-			if (r)
-				goto free_ib_content;
-
-			if (abo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS) {
-				off = 0;
-
-				if (abo->tbo.resource->mem_type != TTM_PL_VRAM)
-					goto unreserve_abo;
-
-				amdgpu_res_first(abo->tbo.resource, offset,
-						 coredump->ibs[i].ib_size_dw * 4,
-						 &cursor);
-				while (cursor.remaining) {
-					amdgpu_device_mm_access(adev, cursor.start / 4,
-								&ib_content[off], cursor.size / 4,
-								false);
-					off += cursor.size;
-					amdgpu_res_next(&cursor, cursor.size);
-				}
-			} else {
-				r = ttm_bo_kmap(&abo->tbo, 0,
-						PFN_UP(abo->tbo.base.size),
-						&abo->kmap);
-				if (r)
-					goto unreserve_abo;
-
-				kptr = amdgpu_bo_kptr(abo);
-				kptr += offset;
-				memcpy(ib_content, kptr,
-				       coredump->ibs[i].ib_size_dw * 4);
-
-				amdgpu_bo_kunmap(abo);
-			}
-
-output_ib_content:
-			drm_printf(&p, "\nIB #%d 0x%llx %d dw\n",
-				   i, coredump->ibs[i].gpu_addr, coredump->ibs[i].ib_size_dw);
-			for (int j = 0; j < coredump->ibs[i].ib_size_dw; j++)
-				drm_printf(&p, "0x%08x\n", ib_content[j]);
-unreserve_abo:
-			if (vm)
-				amdgpu_bo_unreserve(abo);
-free_ib_content:
-			kvfree(ib_content);
-		}
-		if (vm) {
-			amdgpu_bo_unreserve(root);
-			amdgpu_bo_unref(&root);
-		}
-	}
+	if (coredump->num_ibs)
+		amdgpu_devcoredump_print_ibs(&p, coredump, sizing_pass);
 
 	return count - iter.remain;
 }
-- 
2.54.0


