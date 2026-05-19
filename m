Return-Path: <linux-media+bounces-62171-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Df3Bu6TDGp1jAUAu9opvQ
	(envelope-from <linux-media+bounces-62171-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 18:46:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A10582966
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 18:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 246A6316B7DC
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 16:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66707407CE6;
	Tue, 19 May 2026 16:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5+mwzCg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A53C407CED
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 16:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779207363; cv=none; b=Ur15W9IUJnPIguWuRGkMCimnBB8cKcx3xLUWdyHCnliM52gPr1R1vdTzzVXt5ZpXuecq6iqcF8KLz+g8nRVOFnee3x0ku/xdjGB9rqwSnBWE/75ZraDOAlf10IMyZqLBxPgwZegoS23qleOFXSRTmzLWySV1tqLJz4s60KEvBMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779207363; c=relaxed/simple;
	bh=8oB0ZVPBhFN4AWxuaWgssbg7aCzCyr+6nVcFQx4xqh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VA0XJgszfac+EOaqxGicJ1g29AkA/5ZK9CAbbjsVGdEv+dpk5sjNKZ5armCdeHZvo1B0uHqEsQQ1+R/YAkvyBaUFbMubKW1kebF7TKiQdfkDrbeTy3crF645YPEc50j6cv8NlPdoUjX8VPAUkV3/y6KHUjaihmzdIr/ySDFO14s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5+mwzCg; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-393925cb1baso44890171fa.0
        for <linux-media@vger.kernel.org>; Tue, 19 May 2026 09:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779207360; x=1779812160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uDjM1EcMOi30GaXc68xaMNS0uV90e3QyVWS7Pj4PBk=;
        b=W5+mwzCgB74OTmUjx9htEHCA5OSrgtL9HU+6/2ZHDm9tBrcMK9r5jmQpcK/gj9fCOX
         nTzYYIfra6Kw5dMPz/QqYRYCZIC3p1ub5DVCQY3OrfiXsrwVCRQmd2vv4d+Y7fcBVbMj
         Dp/MOr7fzVXv1GoUTTbdgqgaeByvP8YhI5MdTuVO1aMNMp7oUdBMDCiaxc3SsijXdVtB
         1aRiA9s4Rsk+6cnRthOwbIOFxX5x6wbu8f9uUmrSUAZP9BmNeZQ2+UFdoiROFd4lVCb4
         V4fXut396x+UgnnzWsQufmr0M1kOak0AnuyECbAz69XEr7tVIng5ORzejZvuJD8A3dM4
         vANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779207360; x=1779812160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0uDjM1EcMOi30GaXc68xaMNS0uV90e3QyVWS7Pj4PBk=;
        b=Tx7dzL6bgFl41b0C42IBkIesd/a1ynw9aHAJ/LApofmwyGFvgOw6hDK1gNmvMqrxw/
         NSJIxcBd1o68YHKAWpQZb8Z7VmhKWD91IwE7tQcLDLOLyLqNxTMawKuZ4Z9UFfbGIxHx
         Pz96f7Lg6dHBD39RQnpB2DOfERAf/d3ol/onzRTS7mqoPyz/886nI0BbTB3CNgbrvrav
         QcU7O/LKJDEeaXXsB+PPbW1wFgPKeYabDhyUEH9+rP26nam6gzpX9Rxi+sqU7Q2sTek4
         A8+GuaxZEYasOU2z7wffJN0wZuzkwhqBcRNB6rGZFUSTboi9nNPt2E7diUb/ps57r0Fn
         8VYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/x7NxDPkXVoaHP34fAV4nZYL30AVUYuWFiGEl/pt+6lNr4HSVVTQyjUlSOlPUXf19vJal7iDTpmfXrUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyT8vcI4MgSdi20RaIBbmd4Cl65mcPOZc/EV7nNhKhiCCR6x3WZ
	iOPplns87KuenwMuqFksW+AxU9LWv7RdpqhZeq6SAGc4dvZdkpCn4ZxJ
X-Gm-Gg: Acq92OFeJzNi+u3LT3QtGthxojTFpWf67djT8vSMMwZw5sWOj86vAva4TjmLVnUIs6G
	BxR8UFyk8BAehxb641N1+bF2wO6eoKc8+3egnkcgsAcgRxNi22/mCEkxC8GDzRi73pgUBuHJlVD
	Hu6daEJx90tLlfaTaMynZV5kJoj0R4RcN+lOK7YJvJWgb9PkrsQuNpcZ76LoIPM2vqHTzdQjSeN
	CLreM8Qktv4uvkv2fnVHoO18mRyzJsZ3fnMmP1wqk1EvmqmvMLciAVKhfKCL6Bne0vGgownUrqZ
	h6351DK4C0EGld7nsaqiUpJunZSj7xuF78ZvP14jfg1tw3iIgCZxR9yMKOCmvs7htWN/CbADtgs
	DCUhH6QcRy8vk0UaxjlMkyn7fSF2kL4thvuGKgK8+d2ZEoBbAUnHUm5eqGxBRnoR78k/bkB5Oe3
	GY+qeR5LLBERhbKJbMDZcpYUo+Mp3RHVDpjz6a+OWzKbw=
X-Received: by 2002:a05:651c:1543:b0:393:77ef:9079 with SMTP id 38308e7fff4ca-39561f57db0mr66667601fa.28.1779207359359;
        Tue, 19 May 2026 09:15:59 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395882c41c1sm20823091fa.12.2026.05.19.09.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 09:15:57 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v2] drm/amdgpu: fix recursive ww_mutex acquire in amdgpu_devcoredump_format
Date: Tue, 19 May 2026 21:15:40 +0500
Message-ID: <20260519161541.19994-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429143743.50743-1-mikhail.v.gavrilov@gmail.com>
References: <20260429143743.50743-1-mikhail.v.gavrilov@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62171-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[gmail.com,amd.com,ffwll.ch,linaro.org,vger.kernel.org,lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhailvgavrilov@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:email]
X-Rspamd-Queue-Id: 76A10582966
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When dumping IB contents from a hung job, amdgpu_devcoredump_format()
acquires the VM root PD's reservation lock via amdgpu_vm_lock_by_pasid()
and then, for each IB referenced by the job, calls amdgpu_bo_reserve()
on the BO that backs the IB.  Both reservations are taken on
reservation_ww_class_mutex objects but neither uses a ww_acquire_ctx,
which trips lockdep:

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
splat is a lockdep-correctness warning, not an observed deadlock.  It
becomes a real self-deadlock whenever the IB BO shares its dma_resv
with the root PD (the always-valid case, see
amdgpu_vm_is_bo_always_valid()): amdgpu_bo_reserve(abo) re-acquires the
same ww_mutex without a ticket and blocks forever.

Fix it in two steps:

1. Collect per-IB BO references under the root PD's reservation, then
   release the root before locking the IB BOs.  The walk over the VM
   mapping tree must remain under the root lock (mappings can be torn
   down without it), but the actual content copies do not.

2. Lock all the IB BOs together using drm_exec(9) with a single
   ww_acquire_ctx.  DRM_EXEC_IGNORE_DUPLICATES handles the case where
   IB BOs share a dma_resv (e.g. always-valid BOs).  Each lock attempt
   is now a top-level acquire under one ticket, with retry-on-
   contention handled by drm_exec; the recursive ww_mutex condition
   is gone.

The collect/lock/release logic is factored out into three small helpers
(amdgpu_devcoredump_{collect,lock,release}_ib_refs) to keep the main
function readable and within the kernel coding style indentation
guideline.

This also fixes a BO refcount leak in the original code: when
amdgpu_bo_reserve() failed, control jumped to free_ib_content without
running amdgpu_bo_unref().  In the new structure the per-IB BO refs
are released unconditionally in the cleanup helper.

Reproducer (~150 LoC libdrm_amdgpu): submit a single GFX IB containing
PACKET3_INDIRECT_BUFFER chained at GPU VA 0 and wait for the fence.
The TDR fires within ~10 s and the deferred coredump worker produces
the splat above on every invocation.

v2: switch from per-IB amdgpu_bo_reserve() to drm_exec for the IB BO
    locking as suggested by Christian König; the snapshot approach
    for collecting BO references under the root PD's reservation is
    retained.

Fixes: 7b15fc2d1f1a ("drm/amdgpu: dump job ibs in the devcoredump")
Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 187 ++++++++++++++----
 1 file changed, 148 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
index d386bc775d03..9ac958cf09fd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
@@ -24,6 +24,7 @@
 
 #include <generated/utsrelease.h>
 #include <linux/devcoredump.h>
+#include <drm/drm_exec.h>
 #include "amdgpu_dev_coredump.h"
 #include "atom.h"
 
@@ -207,6 +208,108 @@ static void amdgpu_devcoredump_fw_info(struct amdgpu_device *adev,
 	}
 }
 
+struct amdgpu_devcoredump_ib_ref {
+	struct amdgpu_bo	*bo;
+	u64			offset;
+};
+
+/*
+ * Walk the VM's mapping tree under the root PD's reservation to obtain the BO
+ * that backs each IB and pin it with a refcount. The root PD reservation is
+ * dropped before this function returns; the caller can then lock each IB BO
+ * via drm_exec without nesting reservations on reservation_ww_class_mutex.
+ *
+ * Returns an array of num_ibs entries (each ib_refs[i].bo may be NULL if its
+ * mapping was not found), or NULL on allocation failure / VM lookup failure.
+ * The caller must release the BO refs and free the array via
+ * amdgpu_devcoredump_release_ib_refs().
+ */
+static struct amdgpu_devcoredump_ib_ref *
+amdgpu_devcoredump_collect_ib_refs(struct amdgpu_device *adev,
+				   struct amdgpu_coredump_info *coredump)
+{
+	struct amdgpu_devcoredump_ib_ref *ib_refs;
+	struct amdgpu_bo_va_mapping *mapping;
+	struct amdgpu_bo *root;
+	struct amdgpu_vm *vm;
+	u64 va_start;
+
+	ib_refs = kcalloc(coredump->num_ibs, sizeof(*ib_refs), GFP_KERNEL);
+	if (!ib_refs)
+		return NULL;
+
+	vm = amdgpu_vm_lock_by_pasid(adev, &root, coredump->pasid);
+	if (!vm) {
+		kfree(ib_refs);
+		return NULL;
+	}
+
+	for (int i = 0; i < coredump->num_ibs; i++) {
+		va_start = coredump->ibs[i].gpu_addr & AMDGPU_GMC_HOLE_MASK;
+		mapping = amdgpu_vm_bo_lookup_mapping(vm, va_start / AMDGPU_GPU_PAGE_SIZE);
+		if (!mapping)
+			continue;
+
+		ib_refs[i].bo = amdgpu_bo_ref(mapping->bo_va->base.bo);
+		ib_refs[i].offset = va_start -
+				    mapping->start * AMDGPU_GPU_PAGE_SIZE;
+	}
+
+	amdgpu_bo_unreserve(root);
+	amdgpu_bo_unref(&root);
+
+	return ib_refs;
+}
+
+static void
+amdgpu_devcoredump_release_ib_refs(struct amdgpu_devcoredump_ib_ref *ib_refs,
+				   int num_ibs)
+{
+	if (!ib_refs)
+		return;
+
+	for (int i = 0; i < num_ibs; i++)
+		if (ib_refs[i].bo)
+			amdgpu_bo_unref(&ib_refs[i].bo);
+	kfree(ib_refs);
+}
+
+/*
+ * Lock all collected IB BOs together using a single drm_exec ticket. This
+ * eliminates the nested ww_mutex acquire that lockdep flags as recursive
+ * locking (and that becomes a real self-deadlock for IB BOs sharing their
+ * dma_resv with the root PD).
+ *
+ * Returns 0 if drm_exec was initialised and the BOs are locked; the caller
+ * must call drm_exec_fini() on success. Returns non-zero on failure, in which
+ * case drm_exec is already torn down.
+ */
+static int
+amdgpu_devcoredump_lock_ib_refs(struct drm_exec *exec,
+				struct amdgpu_devcoredump_ib_ref *ib_refs,
+				int num_ibs)
+{
+	int r = 0;
+
+	drm_exec_init(exec, DRM_EXEC_IGNORE_DUPLICATES, num_ibs);
+	drm_exec_until_all_locked(exec) {
+		r = 0;
+		for (int i = 0; i < num_ibs; i++) {
+			if (!ib_refs[i].bo)
+				continue;
+			r = drm_exec_lock_obj(exec, &ib_refs[i].bo->tbo.base);
+			drm_exec_retry_on_contention(exec);
+			if (r)
+				break;
+		}
+		if (r)
+			break;
+	}
+	if (r)
+		drm_exec_fini(exec);
+	return r;
+}
+
 static ssize_t
 amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_info *coredump)
 {
@@ -214,13 +317,9 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
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
@@ -343,43 +442,52 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
 		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
 
 	if (coredump->num_ibs) {
-		/* Don't try to lookup the VM or map the BOs when calculating the
-		 * size required to store the devcoredump.
+		struct amdgpu_devcoredump_ib_ref *ib_refs = NULL;
+		struct drm_exec exec;
+		bool ibs_locked = false;
+
+		/*
+		 * Collect the BO that backs each IB under the root PD's
+		 * reservation, drop the root reservation, then lock all the
+		 * IB BOs together in one drm_exec ticket. This avoids nesting
+		 * amdgpu_bo_reserve() inside the root PD's reservation, which
+		 * would be a recursive reservation_ww_class_mutex acquire
+		 * without a ww_acquire_ctx (lockdep splat, and a real
+		 * self-deadlock for always-valid BOs that share their dma_resv
+		 * with the root PD).
+		 *
+		 * Skip lookup/locking entirely on the sizing pass: it does not
+		 * write IB content, and the size estimate doesn't depend on
+		 * whether the BOs are reachable.
 		 */
-		if (sizing_pass)
-			vm = NULL;
-		else
-			vm = amdgpu_vm_lock_by_pasid(adev, &root, coredump->pasid);
+		if (!sizing_pass) {
+			ib_refs = amdgpu_devcoredump_collect_ib_refs(adev, coredump);
+			if (ib_refs) {
+				r = amdgpu_devcoredump_lock_ib_refs(&exec, ib_refs,
+								    coredump->num_ibs);
+				if (!r)
+					ibs_locked = true;
+			}
+		}
+
+		for (int i = 0; i < coredump->num_ibs; i++) {
+			struct amdgpu_bo *abo = ibs_locked ? ib_refs[i].bo : NULL;
+			u64 offset = ibs_locked ? ib_refs[i].offset : 0;
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
+			if (!abo)
 				goto output_ib_content;
 
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
 			if (abo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS) {
 				off = 0;
 
 				if (abo->tbo.resource->mem_type != TTM_PL_VRAM)
-					goto unreserve_abo;
+					goto output_ib_content;
 
 				amdgpu_res_first(abo->tbo.resource, offset,
 						 coredump->ibs[i].ib_size_dw * 4,
@@ -391,12 +499,13 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
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
@@ -404,23 +513,23 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
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
+		if (ibs_locked)
+			drm_exec_fini(&exec);
+
+		amdgpu_devcoredump_release_ib_refs(ib_refs, coredump->num_ibs);
 	}
 
 	return count - iter.remain;
-- 
2.54.0


