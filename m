Return-Path: <linux-media+bounces-59979-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEmSKeoZ8mljnwEAu9opvQ
	(envelope-from <linux-media+bounces-59979-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 16:47:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B61496215
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 16:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB0BE30DBF71
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 14:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28947363C57;
	Wed, 29 Apr 2026 14:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIn2+E9Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8EF35CB87
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 14:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777473472; cv=none; b=aLtABSEvB7oBlDqVguaIKX/xAKH2yXawDC1jIIpm06rx4RpqCmET89j/+3zfkY37bSZCwxDRfd3j7ysxzRPKkVmzTTQB63EqnrQJVrC/i4/17l8CinVP2OgCLMq5sjlcbGNuWVWDL89mOylHHzsxm1JLnLSqL47pDOrpdiQs8yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777473472; c=relaxed/simple;
	bh=555/W+BMemM9dFXPM5vt5562cgfKbBCAyb6eVLJxrNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DBQB7gaBxOfNmq/SyO7leXBAg0sfIFUVXf5HCqu5HMErGYSXEKRKSF/jFbOkUaPN9GJaLeNvNEsiqsXzwEXZCsKfu/PRdWhy7GyTw2wP5fi6r5OglKojU520dmXY4X9Sj5TocQky1ICFUX4YeankiTxouSGx1EvF+uG4/eoSzdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aIn2+E9Z; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a283c44478so19703476e87.3
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 07:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777473468; x=1778078268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jll39Xqy18SFNSEMkkDeWu7wM9j7NCAIvdDzP0v4P/M=;
        b=aIn2+E9ZIlEAUcfdH/s6TqwVJBAmwanBkr/0r3aKjHjQQCytYgQ7o9xrnFmH5FN+oO
         Bu3dsSilvWvJuDE2woEUSV9s/bMaDyV0gr9pu0NHriR56vVCY4NH8U9Hn7vDfoicbILP
         ypjRwakGclSxP75JgP6JBTL+1HDB14+3Lme2mR40ils4MbJxDYy4pebAuN5why55xzt/
         d3MbjDnlV2L9CCaWcAThxQMP8/CaLxY3g4HlQQahYGu8u3oqTIfK9+0KINIoKFIvqb74
         d5uRUFcSLSlzENPfwDPiqhZaDp4ptK9h6LsflPtXZkWZlw3TKid17zER+LqJLTj0012U
         7eiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777473468; x=1778078268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jll39Xqy18SFNSEMkkDeWu7wM9j7NCAIvdDzP0v4P/M=;
        b=gq9T1ZfLcAEDdZCVlg1w6MJNU/3kaGA27N0vHOzrwpNIamyrHBBhjF0oWy1VHKhX5H
         cxsRbQOdFOBpa18dcS/c8naXMJjK5sdJOstW16ueBsZIqiLqG7bvdK2+H2HYhW7bhrqh
         pJcdH1X3SpYj9fvLgbfAVkXYuwP0ql/2fGEe0vj4EiqQOFEMV2IWrPKuRgWBT6kQdHlT
         B4gHFXq+iVHLasgGoN4YeE+rjLRcfXb973acADxQrw9hUcLVYfywt/7320d29D/BIkel
         jkeW8CT1ZH17wVsqmixn7XdkbIFSkPw5t2ERyazGDgsCTySPQQ9K9d1/hWEn0UnXVEM8
         2vEw==
X-Forwarded-Encrypted: i=1; AFNElJ/FzdWdnFCtOxFxNipcr+hIlFhAheVmQ5Xara28QONlrW8El2bOlujcLFxWG1t8yZbSfJ4l58GR/MuHRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8yQX3sUefKG6Js8AGkW1YS56g5fNraulgZAAXMrkpjp/todgT
	p7KUflquHYQ8+YBYiEKk4LFXbgGHoT3YrnwXGWk9rAf90h10MyPWezFg
X-Gm-Gg: AeBDiespVqdXHk6yhpTqh2yvMyHYXak1R02nRUp7PNiaPPDeoujYgzqREb/lxqerDdX
	NG5GqcXbPZlWAoGFI89QCQNooxJkxFM7Gr4H1V8BiXPZ9SLJcJJq5qd0Ul4jvWhnJ8Lo67Rqyy9
	jRG7QBoilpaq9H1C3ZK8vTf1AAKl6662lGNVuaPna2teP7fp0S7w6zgNMCrDvAREr+B2Fsy2tf/
	3QIBHWAQOmjwN98yXeJYap/whKLP+mgOWg97GhWt6WuEKDaRetDHx0/ex7RndmANW10PGcAC0Tg
	ukiutaiLJGBVKV7joCGeBeUkfys6q963ZOgnI19JrYeR4Wn1p8AbsY22uwn/45+thw5bhZI9DnL
	mCmUwIIcTGiiYDLxY2cRXJJEN8EBPGBmF0nb2XdBkubs91OoKT+IwzrLPSeVfKgHrAhNbFQp8am
	VS/vYiionlST7F8aVEbRwnUKl4NYMxsXRg4bi+vdDzo9VM
X-Received: by 2002:a05:6512:3502:b0:5a2:86a3:709f with SMTP id 2adb3069b0e04-5a74660cd3amr3134081e87.17.1777473467800;
        Wed, 29 Apr 2026 07:37:47 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a74a6f3019sm607425e87.20.2026.04.29.07.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:37:47 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
	stable@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH] drm/amdgpu: fix recursive ww_mutex acquire in amdgpu_devcoredump_format
Date: Wed, 29 Apr 2026 19:37:43 +0500
Message-ID: <20260429143743.50743-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 39B61496215
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59979-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,amd.com,ffwll.ch,linaro.org,lists.linaro.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhailvgavrilov@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]

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
   process_one_work
   worker_thread
   kthread

The two reservations are on different BOs in the captured trace, so the
splat is a lockdep-correctness warning, not an observed deadlock.  It
becomes a real self-deadlock whenever the IB BO shares its dma_resv
with the root PD (the always-valid case, see
amdgpu_vm_is_bo_always_valid()): amdgpu_bo_reserve(abo) re-acquires the
same ww_mutex without a ticket and blocks forever.

With amdgpu.gpu_recovery=0 the timeout handler refires every ~2 s and
each invocation produces this splat, drowning the kernel ring buffer.

Fix it by collecting the per-IB BO references under the root PD's
reservation, then releasing the root before reserving each IB BO
individually.  The walk over the VM mapping tree must remain under the
root lock (mappings can be torn down without it), but the actual
content copies do not need to nest inside it.  Each per-IB reservation
is now an independent top-level acquire, eliminating the nested
ww_mutex.

The collect/release logic is factored out into two small helpers
(amdgpu_devcoredump_collect_ib_refs / amdgpu_devcoredump_release_ib_refs)
to keep the main function's indentation reasonable.

This also fixes a BO refcount leak in the original code: when
amdgpu_bo_reserve() failed, control jumped to free_ib_content without
running amdgpu_bo_unref().  In the new structure the per-IB BO refs
are released unconditionally in the cleanup helper.

Reproducer (~150 LoC libdrm_amdgpu): submit a single GFX IB containing
PACKET3_INDIRECT_BUFFER chained at GPU VA 0 and wait for the fence.
The TDR fires within ~10 s and the deferred coredump worker produces
the splat above on every invocation.

Fixes: 7b15fc2d1f1a ("drm/amdgpu: dump job ibs in the devcoredump")
Cc: stable@vger.kernel.org # 7.1
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 147 +++++++++++++-----
 1 file changed, 110 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
index d386bc775d03..f6bb968de756 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
@@ -207,6 +207,72 @@ static void amdgpu_devcoredump_fw_info(struct amdgpu_device *adev,
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
+ * dropped before this function returns; the caller can then reserve each IB
+ * BO individually without nesting ww_mutex acquires on
+ * reservation_ww_class_mutex.
+ *
+ * Returns an array of num_ibs entries (each ib_refs[i].bo may be NULL if its
+ * mapping was not found), or NULL on allocation failure / VM lookup failure.
+ * The caller must release the BO refs and free the array.
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
 static ssize_t
 amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_info *coredump)
 {
@@ -214,13 +280,11 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
 	struct drm_printer p;
 	struct drm_print_iterator iter;
 	struct amdgpu_vm_fault_info *fault_info;
-	struct amdgpu_bo_va_mapping *mapping;
 	struct amdgpu_ip_block *ip_block;
 	struct amdgpu_res_cursor cursor;
-	struct amdgpu_bo *abo, *root;
-	uint64_t va_start, offset;
+	struct amdgpu_bo *abo;
+	uint64_t offset;
 	struct amdgpu_ring *ring;
-	struct amdgpu_vm *vm;
 	u32 *ib_content;
 	uint8_t *kptr;
 	int ver, i, j, r;
@@ -343,43 +407,52 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
 		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
 
 	if (coredump->num_ibs) {
-		/* Don't try to lookup the VM or map the BOs when calculating the
-		 * size required to store the devcoredump.
+		struct amdgpu_devcoredump_ib_ref *ib_refs = NULL;
+
+		/*
+		 * Snapshot per-IB BO references under the root PD's reservation,
+		 * then release the root before reserving each IB BO individually
+		 * to copy its contents.
+		 *
+		 * Reserving an IB BO while the root PD is still reserved would
+		 * be a nested ww_mutex acquire on reservation_ww_class_mutex
+		 * without a ww_acquire_ctx, which trips lockdep's recursive-
+		 * locking check and self-deadlocks for IB BOs that share their
+		 * dma_resv with the root PD (always-valid BOs).
+		 *
+		 * Skip lookup/reservation entirely on the sizing pass: it does
+		 * not write IB content, and the size estimate doesn't depend on
+		 * whether the BOs are reachable.
 		 */
-		if (sizing_pass)
-			vm = NULL;
-		else
-			vm = amdgpu_vm_lock_by_pasid(adev, &root, coredump->pasid);
+		if (!sizing_pass)
+			ib_refs = amdgpu_devcoredump_collect_ib_refs(adev, coredump);
 
-		for (int i = 0; i < coredump->num_ibs && (sizing_pass || vm); i++) {
+		for (int i = 0; i < coredump->num_ibs; i++) {
 			ib_content = kvmalloc_array(coredump->ibs[i].ib_size_dw, 4,
 						    GFP_KERNEL);
 			if (!ib_content)
 				continue;
 
-			/* vm=NULL can only happen when 'sizing_pass' is true. Skip to the
-			 * drm_printf() calls (ib_content doesn't need to be initialized
-			 * as its content won't be written anywhere).
-			 */
-			if (!vm)
+			if (sizing_pass)
 				goto output_ib_content;
 
-			va_start = coredump->ibs[i].gpu_addr & AMDGPU_GMC_HOLE_MASK;
-			mapping = amdgpu_vm_bo_lookup_mapping(vm, va_start / AMDGPU_GPU_PAGE_SIZE);
-			if (!mapping)
-				goto free_ib_content;
+			if (!ib_refs || !ib_refs[i].bo)
+				goto output_ib_content;
+
+			abo = ib_refs[i].bo;
+			offset = ib_refs[i].offset;
 
-			offset = va_start - (mapping->start * AMDGPU_GPU_PAGE_SIZE);
-			abo = amdgpu_bo_ref(mapping->bo_va->base.bo);
 			r = amdgpu_bo_reserve(abo, false);
 			if (r)
-				goto free_ib_content;
+				goto output_ib_content;
 
 			if (abo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS) {
 				off = 0;
 
-				if (abo->tbo.resource->mem_type != TTM_PL_VRAM)
-					goto unreserve_abo;
+				if (abo->tbo.resource->mem_type != TTM_PL_VRAM) {
+					amdgpu_bo_unreserve(abo);
+					goto output_ib_content;
+				}
 
 				amdgpu_res_first(abo->tbo.resource, offset,
 						 coredump->ibs[i].ib_size_dw * 4,
@@ -395,8 +468,10 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
 				r = ttm_bo_kmap(&abo->tbo, 0,
 						PFN_UP(abo->tbo.base.size),
 						&abo->kmap);
-				if (r)
-					goto unreserve_abo;
+				if (r) {
+					amdgpu_bo_unreserve(abo);
+					goto output_ib_content;
+				}
 
 				kptr = amdgpu_bo_kptr(abo);
 				kptr += offset;
@@ -406,21 +481,19 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
 				amdgpu_bo_kunmap(abo);
 			}
 
+			amdgpu_bo_unreserve(abo);
+
 output_ib_content:
 			drm_printf(&p, "\nIB #%d 0x%llx %d dw\n",
 				   i, coredump->ibs[i].gpu_addr, coredump->ibs[i].ib_size_dw);
-			for (int j = 0; j < coredump->ibs[i].ib_size_dw; j++)
-				drm_printf(&p, "0x%08x\n", ib_content[j]);
-unreserve_abo:
-			if (vm)
-				amdgpu_bo_unreserve(abo);
-free_ib_content:
+			if (!sizing_pass && ib_refs && ib_refs[i].bo) {
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
+		amdgpu_devcoredump_release_ib_refs(ib_refs, coredump->num_ibs);
 	}
 
 	return count - iter.remain;
-- 
2.54.0


