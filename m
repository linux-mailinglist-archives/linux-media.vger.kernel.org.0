Return-Path: <linux-media+bounces-62314-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SF8HKdjZDWrE4AUAu9opvQ
	(envelope-from <linux-media+bounces-62314-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 17:57:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C81C6591539
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 17:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A05032CA02C
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4C03F1AB0;
	Wed, 20 May 2026 15:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwZfEvNn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30DA3F0765
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 15:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779290273; cv=none; b=pUPQZo1hPLHhVp1MrIamaKMaxqgYtY9LiXvLRBLizzD2Ag2osJid8tItuqDzECWWw62n9nv4mcuRsN7Y7krKFrrw7f6w8L4PTq0gMtF8AS3Cy8wS/GAnKRlG+NEquiFR9/rowA0QsaugMi+a9wsaBhyoZ1XbYTCxvbSclsTFHgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779290273; c=relaxed/simple;
	bh=EFeEJkQiEqspN2K1pxO/W1A+nKY7wi9XdYP/GPgLqCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QalsUdkEzoCUrhqBTYTuCuIvxzbKKy9E7FlTzm7pAwlEt/DrscoC4e8xuiNFTNw7q0PfADjESxT/ydLeh8bHuYxfK3ILK6/rg1tPwWW1aUyqbAdVRO3qW8KFVrpTY/6p5/Kq8strJYTXgSiNxJeWQ0+YJfSKI7JLt+2dPHDzDzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwZfEvNn; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a8704dc3a8so5305079e87.3
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 08:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779290270; x=1779895070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyVPZSX7MwDddJkv/HM4B88jEPRd96zpfMtgKanmjaM=;
        b=UwZfEvNnrk71SErlbZYM0Z8OAgOvv9x5KsvbRBz9WIn2H8ODK0/PNId9vX+AuXpV3t
         +eLfPMMNLvQZRC03RSgVu8O+530mFVJ4ksizXHHz/SUtzLvPKm0M95RtuiD0U0rlvcFM
         7eXi+kq/OF8znjlgZvQdmOkfuUSyi2FSOAWamQRGjqtsaV1nt3d51b/yLbZfSaGy+vvm
         jqtJCSQoJfL8ISaUkeKuWHocJJhQrutJ3OBW71BuWYnHwvV3wHqQud1ac85/AdL4ig73
         UgPshFH1vfF0GIqz2Jqx3NHUAoXjtezhkT1dlJ0TwvI0DhVTNUAhk1F9vYY9kowQvpeq
         9tmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779290270; x=1779895070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fyVPZSX7MwDddJkv/HM4B88jEPRd96zpfMtgKanmjaM=;
        b=aVhSzjfiaNxkQWtybicdM4J26JZhfmq8qrF6/Vd72/GmwRE6SGAfbOE+THcucDW4KN
         ImoyvZvWI519FSe7VKePblaVqxThhqlRnVv03D3BVIMf/LwyLlVw8s3EZbFNDPv4lRl3
         kjN4FKwG1TkWLHAEBKaxF8dF7CzaEiHNCJ0Iww772obbO+bwP/AMMAqouaTInryc2ylT
         qOlRgYBxH+U+ZuVmvKJ1m4yveTg9cnV6/LI4z46Lttyloxg79tLvw7oflnKgTPROCJQh
         k4gVCqwMpsrh3fwYnRfhg7lv+jHYxBneYQw0afLAfCtuUJyIE0Yy/tf6JuYfWHwTQlJG
         tapQ==
X-Forwarded-Encrypted: i=1; AFNElJ8WtGG6ee7NFXmTPEoE8bNAkkhd5Z864QM9QqDwesbAv/zLDzRmi/N3y9X4HMf30o+mdhqW6QUhDb7XHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLcLpDnqM/+PGvovqFh2f1PXVLVIhJL8uofJkAqfJ6Oupc56sw
	3Tlyg5oCoUMDDfJoUdwaKcUYEAehSVZWuwQmWE4hMnM2dSFeE/kLWt4/
X-Gm-Gg: Acq92OGT/fU8o/53VH1WIEC6r47X/91fdPZ2QsYDJ8fRjOmIrTFFec5pYYmxUKDVVxO
	n2vzuIh8LWvjlM7eUavedXmrsfnO1KV8iOaGMLxB/yTNftLmHUfzn3m+xGREAlkXxsb+GNNJfw2
	9s1tkaD+ldp1PeAecdhqVTcORLXkE+GGwnGHJ/YMSqtVXn0IBKLRl5Pgv2sfEhiU1lUTUbL2uPS
	nvBZu4KPC/ETWkvmE0c82SkzUly+oPXvgTZ8a7JLHCxiGaB9a6yynLrCIbNUTZ23RbfFqre6BE8
	MS4sJNzYeHGQA/l2V61zDX4W5mHxEJojXaA/ALH7yYtTVkhWxacisn/fMPE4auhRZWM3RMMc+6K
	wWL0q1AFvtZ3xNH9/HY9MobpWjzdCOVNjeisVYIHRGjmTvKptSoXYqXZ0HE4qo1oAcgt751p2wB
	R6OagTWqHyxljaHIkxNvJdHAx7FsLgvlZR
X-Received: by 2002:a05:6512:1053:b0:5a3:ffed:8440 with SMTP id 2adb3069b0e04-5aa0e73d549mr8445759e87.12.1779290269709;
        Wed, 20 May 2026 08:17:49 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c8b2sm5022470e87.17.2026.05.20.08.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:17:49 -0700 (PDT)
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
Subject: [PATCH v3 1/2] drm/amdgpu: convert amdgpu_vm_lock_by_pasid() to drm_exec
Date: Wed, 20 May 2026 20:17:39 +0500
Message-ID: <20260520151741.50575-2-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520151741.50575-1-mikhail.v.gavrilov@gmail.com>
References: <20260429143743.50743-1-mikhail.v.gavrilov@gmail.com>
 <20260520151741.50575-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-62314-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linaro.org,vger.kernel.org,lists.linaro.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mikhailvgavrilov@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C81C6591539
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

amdgpu_vm_lock_by_pasid() looks up a VM by PASID and reserves its root
PD with a bare amdgpu_bo_reserve(), returning the still-reserved root to
the caller. A caller that then needs to reserve further BOs (for example
the devcoredump IB dump) ends up nesting reservation_ww_class_mutex
acquires without a ww_acquire_ctx, which lockdep flags as recursive
locking.

Convert the helper to take a drm_exec context and lock the root PD via
amdgpu_vm_lock_pd() instead. Callers now run it inside a
drm_exec_until_all_locked() loop and can lock additional BOs in the same
ww ticket, so there is no nested ww_mutex acquire.

The only existing caller, amdgpu_vm_handle_fault(), is updated
accordingly. Its is_compute_context path, which previously dropped the
root reservation around svm_range_restore_pages() and re-took it, now
finalises the drm_exec context and re-initialises a fresh one; behaviour
is otherwise unchanged.

No functional change intended for the page-fault path.

Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 72 ++++++++++++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h |  3 +-
 2 files changed, 51 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 9ba9de16a27a..3a22670b733f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2950,14 +2950,22 @@ int amdgpu_vm_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 }
 
 /**
- * amdgpu_vm_lock_by_pasid - return an amdgpu_vm and its root bo from a pasid, if possible.
+ * amdgpu_vm_lock_by_pasid - look up a VM by PASID and lock its root PD
  * @adev: amdgpu device pointer
- * @root: root BO of the VM
+ * @root: out: reference to the VM's root BO, dropped by the caller
  * @pasid: PASID of the VM
- * The caller needs to unreserve and unref the root bo on success.
+ * @exec: drm_exec context to lock the root PD in
+ *
+ * Must be called from within a drm_exec_until_all_locked() loop; the caller
+ * runs drm_exec_retry_on_contention() afterwards and drops the *root
+ * reference once the drm_exec context is finalised.
+ *
+ * Return: the VM on success, or NULL if the PASID has no VM, the VM is being
+ * torn down, or locking the root PD failed.
  */
 struct amdgpu_vm *amdgpu_vm_lock_by_pasid(struct amdgpu_device *adev,
-					  struct amdgpu_bo **root, u32 pasid)
+					  struct amdgpu_bo **root, u32 pasid,
+					  struct drm_exec *exec)
 {
 	unsigned long irqflags;
 	struct amdgpu_vm *vm;
@@ -2971,9 +2979,11 @@ struct amdgpu_vm *amdgpu_vm_lock_by_pasid(struct amdgpu_device *adev,
 	if (!*root)
 		return NULL;
 
-	r = amdgpu_bo_reserve(*root, true);
-	if (r)
-		goto error_unref;
+	r = amdgpu_vm_lock_pd(vm, exec, 0);
+	if (r) {
+		amdgpu_bo_unref(root);
+		return NULL;
+	}
 
 	/* Double check that the VM still exists */
 	xa_lock_irqsave(&adev->vm_manager.pasids, irqflags);
@@ -2981,16 +2991,12 @@ struct amdgpu_vm *amdgpu_vm_lock_by_pasid(struct amdgpu_device *adev,
 	if (vm && vm->root.bo != *root)
 		vm = NULL;
 	xa_unlock_irqrestore(&adev->vm_manager.pasids, irqflags);
-	if (!vm)
-		goto error_unlock;
+	if (!vm) {
+		amdgpu_bo_unref(root);
+		return NULL;
+	}
 
 	return vm;
-error_unlock:
-	amdgpu_bo_unreserve(*root);
-
-error_unref:
-	amdgpu_bo_unref(root);
-	return NULL;
 }
 
 /**
@@ -3013,20 +3019,32 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
 {
 	bool is_compute_context = false;
 	struct amdgpu_bo *root;
+	struct drm_exec exec;
 	uint64_t value, flags;
 	struct amdgpu_vm *vm;
 	int r;
 
-	vm = amdgpu_vm_lock_by_pasid(adev, &root, pasid);
-	if (!vm)
+	drm_exec_init(&exec, 0, 0);
+	drm_exec_until_all_locked(&exec) {
+		vm = amdgpu_vm_lock_by_pasid(adev, &root, pasid, &exec);
+		drm_exec_retry_on_contention(&exec);
+		if (!vm)
+			break;
+	}
+	if (!vm) {
+		drm_exec_fini(&exec);
 		return false;
+	}
 
 	is_compute_context = vm->is_compute_context;
 
 	if (is_compute_context) {
-		/* Unreserve root since svm_range_restore_pages might try to reserve it. */
-		/* TODO: rework svm_range_restore_pages so that this isn't necessary. */
-		amdgpu_bo_unreserve(root);
+		/* Release the root PD lock since svm_range_restore_pages
+		 * might try to take it.
+		 * TODO: rework svm_range_restore_pages so that this isn't
+		 * necessary.
+		 */
+		drm_exec_fini(&exec);
 
 		if (!svm_range_restore_pages(adev, pasid, vmid,
 					     node_id, addr >> PAGE_SHIFT, ts, write_fault)) {
@@ -3036,9 +3054,17 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
 		amdgpu_bo_unref(&root);
 
 		/* Re-acquire the VM lock, could be that the VM was freed in between. */
-		vm = amdgpu_vm_lock_by_pasid(adev, &root, pasid);
-		if (!vm)
+		drm_exec_init(&exec, 0, 0);
+		drm_exec_until_all_locked(&exec) {
+			vm = amdgpu_vm_lock_by_pasid(adev, &root, pasid, &exec);
+			drm_exec_retry_on_contention(&exec);
+			if (!vm)
+				break;
+		}
+		if (!vm) {
+			drm_exec_fini(&exec);
 			return false;
+		}
 	}
 
 	addr /= AMDGPU_GPU_PAGE_SIZE;
@@ -3076,7 +3102,7 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
 	r = amdgpu_vm_update_pdes(adev, vm, true);
 
 error_unlock:
-	amdgpu_bo_unreserve(root);
+	drm_exec_fini(&exec);
 	if (r < 0)
 		dev_err(adev->dev, "Can't handle page fault (%d)\n", r);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index d083d7aab75c..af292c2fc521 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -593,7 +593,8 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
 			    bool write_fault);
 
 struct amdgpu_vm *amdgpu_vm_lock_by_pasid(struct amdgpu_device *adev,
-					  struct amdgpu_bo **root, u32 pasid);
+					  struct amdgpu_bo **root, u32 pasid,
+					  struct drm_exec *exec);
 
 void amdgpu_vm_set_task_info(struct amdgpu_vm *vm);
 
-- 
2.54.0


