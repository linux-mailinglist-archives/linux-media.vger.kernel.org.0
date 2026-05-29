Return-Path: <linux-media+bounces-63006-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECaWKdY2GWrzswgAu9opvQ
	(envelope-from <linux-media+bounces-63006-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 08:48:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 279C95FE270
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 08:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0CE330ADFDD
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 06:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75E53AC0F8;
	Fri, 29 May 2026 06:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="deJKX4mJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D512D3AB29B
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 06:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780037304; cv=none; b=hY15Q3x+fvqnJLONWPJIBMb3ZGEvcIiIxFxOES6YyVeakOK+05dvf0z6OKEFCinM+ySXOg7yXNVxbOThIoXREsOzXJ0I7twQC9t0AgbNiubr0KYp4ayjq9XarGBNkzK3qOP6hQuKvMaw1j2zR2Gz9PzoYcoMGDcNbM5gDai5MVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780037304; c=relaxed/simple;
	bh=Cpi20G3hUtpGa0J80DAMLB46h6zNbwjq96KGIYnVB/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CJQ84HYC2jqlj+hkFd3duHafGYqWRUJzOqzWQYQaPNE+no8wvbaNuiEIFwl1w2PVnxLe5DEWvs7M0Y3TyQzTo3DggF/00mkvU9HRtJnxrwkiFPVSgvVjXUtJajKI4ZrJ0eQXwh6ybGxWs11KYJCw3f2wnyUa2UOonZqVirv0S1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=deJKX4mJ; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a884815606so14724275e87.0
        for <linux-media@vger.kernel.org>; Thu, 28 May 2026 23:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780037301; x=1780642101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+aMMV5ilmpFv8Pwd8WuxApxlzDJGWTTKgJEHknglssE=;
        b=deJKX4mJsN+T6F+YLL6nnDRmGf1a+YmI36XhEvp+sMZYKxZnJSC/X8dW5sm+42wR1K
         6h2MmKxTYiGO17z7Qrf6nei5nZplwlPn+ricvRzHxBtegYMQrGHlLOzRoSRrIfI9xl8R
         4JjLBckhYdbMteRfaolfthmAuti1+rQzFBtOemRtVNbFvQuRS4IxgWx8f+ZPaD5Q9rRG
         dKGvucEko2PL+hpMk5oK08y304n9333lzdaHeUxcJUiVMicFrvYIqeK7DQ2LN7N4S2K5
         M/f3LvDh95E6D8VwnvehKqfzqGIJ6fEVCjYgmKiELZdW+E6LIhypUbKH7rK0+Tr4szCe
         Y7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780037301; x=1780642101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+aMMV5ilmpFv8Pwd8WuxApxlzDJGWTTKgJEHknglssE=;
        b=pqs89GifQYXk130NgJRutFaj9xTBiS67lJM9xlXTpqDJTQCB51odQEL9Nxki60FnCW
         BjbW8IWFOcmo8SlIq6EX9GCDL8TW1ErVAcSBHOpzTV0KMVPsGzfYciAe1VKfJG4HKR1n
         8gQeguOQ3j2UOf7q14zOq4WVPHHtfm/lm5Et9Nraz4WiBxOc1J8VZeFbEOkgrb3IResR
         ngh+DCr0BztQ7M/CpkMsUwC2QVzg/gFLBXPt3kOzexQMsUel8P8KFxmEEEabYxfTOF1X
         2YfchzpA2GDIY6+iK0xal7FN0lsfEX1BlBJoh/R+8OKhXkbXEzVgk7ulXqevDfdN3HVs
         xy9Q==
X-Forwarded-Encrypted: i=1; AFNElJ8K1CiYDmpbGQYmQWJFz+R/eqQ/QncfYbsyJdlS2b+CFEiIBy+Arzas9CQ5/GFe2yX1gRhGnYUZisNEFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1G0UE5PIPejFLR7hyZqKqAVxQz5gRYER/XUVmPPTq4C/dykML
	+sFsyNliw0KmXdFZHC/upzXHFzODKtIfshWwfMnG/UCGcnw9p+2wUqaU
X-Gm-Gg: Acq92OHZcMRTvuaTAj2fSpIH2xQpO4qwTHzmiiEJWL/h9kZBoeCeec53pykxI9Jtifu
	DoaoLZ+pdaChvueHJjX2pJRsfvXCQveWvyICsDT+Eh9ZA7wbzVmlaQkmAf4vW+aeLn2ovUPbyp0
	38hxplEXMPQOzsL6yMMAiSOMJamaPMI22g7opMoEkYmhulMhnGj/rsr9Px1re0mZeLVNB1E8D99
	nrUNS5sz9p1U0I6O6sHs4KS+AYv+qDCJf3R+JpdE/Xt2sAM5lnIu0K6LeZBcb4PcLX/Mk0yDBbf
	3wJJZq32g4VQHLEVPEROGp9/E8c2I2qK29k1bMH3MAK0ieReVBJ3OPy03Z5lSNm8urYisZD0ETf
	gHe2/Q6AZiOTYd8w9IQ0ksFbO+tcOqEWPYpZANxQ0BpOy03WQrk2ZJWqgnG0w3qEUDOpG7u1VZ7
	LOMmV/PF3t60b8GH1y+bcAI+zFtmGBIO+wzuCKbr9ZVjY=
X-Received: by 2002:a05:6512:230c:b0:5a8:f6fd:eb15 with SMTP id 2adb3069b0e04-5aa594a7f4cmr457133e87.24.1780037300718;
        Thu, 28 May 2026 23:48:20 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b79f04dsm72147e87.83.2026.05.28.23.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 23:48:20 -0700 (PDT)
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
Subject: [PATCH v6 1/2] drm/amdgpu: convert amdgpu_vm_lock_by_pasid() to drm_exec
Date: Fri, 29 May 2026 11:47:38 +0500
Message-ID: <20260529064740.25060-2-mikhail.v.gavrilov@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63006-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amd.com:email]
X-Rspamd-Queue-Id: 279C95FE270
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

amdgpu_vm_lock_by_pasid() looks up a VM by PASID and reserves its root
PD with a bare amdgpu_bo_reserve(), returning the still-reserved root to
the caller. A caller that then needs to reserve further BOs (for example
the devcoredump IB dump) ends up nesting reservation_ww_class_mutex
acquires without a ww_acquire_ctx, which lockdep flags as recursive
locking.

Convert the helper to take a drm_exec context and lock the root PD with
drm_exec_lock_obj(). Callers now run it inside a
drm_exec_until_all_locked() loop and can lock additional BOs in the same
ww ticket, so there is no nested ww_mutex acquire.

The drm_exec context holds its own reference on the locked root BO, so
the helper no longer hands a root reference back to the caller: the
root output parameter is dropped, and the transient reference taken
across the PASID lookup is released before returning.

The only existing caller, amdgpu_vm_handle_fault(), is updated
accordingly. Its is_compute_context path, which previously dropped the
root reservation around svm_range_restore_pages() and re-took it, now
finalises the drm_exec context and re-initialises a fresh one; behaviour
is otherwise unchanged.

No functional change intended for the page-fault path.

Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 91 ++++++++++++++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h |  2 +-
 2 files changed, 58 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index fccd758b6699..b9d93b664daf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2950,47 +2950,56 @@ int amdgpu_vm_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 }
 
 /**
- * amdgpu_vm_lock_by_pasid - return an amdgpu_vm and its root bo from a pasid, if possible.
+ * amdgpu_vm_lock_by_pasid - look up a VM by PASID and lock its root PD
  * @adev: amdgpu device pointer
- * @root: root BO of the VM
  * @pasid: PASID of the VM
- * The caller needs to unreserve and unref the root bo on success.
+ * @exec: drm_exec context to lock the root PD in
+ *
+ * Must be called from within a drm_exec_until_all_locked() loop; the caller
+ * runs drm_exec_retry_on_contention() afterwards. The drm_exec context holds
+ * a reference on the root BO until it is finalised.
+ *
+ * Return: the VM on success, or NULL if the PASID has no VM, the VM is being
+ * torn down, or locking the root PD failed.
  */
 struct amdgpu_vm *amdgpu_vm_lock_by_pasid(struct amdgpu_device *adev,
-					  struct amdgpu_bo **root, u32 pasid)
+					  u32 pasid, struct drm_exec *exec)
 {
 	unsigned long irqflags;
+	struct amdgpu_bo *root;
 	struct amdgpu_vm *vm;
 	int r;
 
 	xa_lock_irqsave(&adev->vm_manager.pasids, irqflags);
 	vm = xa_load(&adev->vm_manager.pasids, pasid);
-	*root = vm ? amdgpu_bo_ref(vm->root.bo) : NULL;
+	root = vm ? amdgpu_bo_ref(vm->root.bo) : NULL;
 	xa_unlock_irqrestore(&adev->vm_manager.pasids, irqflags);
 
-	if (!*root)
+	if (!root)
 		return NULL;
 
-	r = amdgpu_bo_reserve(*root, true);
-	if (r)
-		goto error_unref;
+	r = drm_exec_lock_obj(exec, &root->tbo.base);
+	if (r) {
+		amdgpu_bo_unref(&root);
+		return NULL;
+	}
 
 	/* Double check that the VM still exists */
 	xa_lock_irqsave(&adev->vm_manager.pasids, irqflags);
 	vm = xa_load(&adev->vm_manager.pasids, pasid);
-	if (vm && vm->root.bo != *root)
+	if (vm && vm->root.bo != root)
 		vm = NULL;
 	xa_unlock_irqrestore(&adev->vm_manager.pasids, irqflags);
-	if (!vm)
-		goto error_unlock;
+	if (!vm) {
+		drm_exec_unlock_obj(exec, &root->tbo.base);
+		amdgpu_bo_unref(&root);
+		return NULL;
+	}
 
-	return vm;
-error_unlock:
-	amdgpu_bo_unreserve(*root);
+	/* The drm_exec context holds its own reference on the root BO. */
+	amdgpu_bo_unref(&root);
 
-error_unref:
-	amdgpu_bo_unref(root);
-	return NULL;
+	return vm;
 }
 
 /**
@@ -3012,33 +3021,49 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
 			    uint64_t ts, bool write_fault)
 {
 	bool is_compute_context = false;
-	struct amdgpu_bo *root;
+	struct drm_exec exec;
 	uint64_t value, flags;
 	struct amdgpu_vm *vm;
 	int r;
 
-	vm = amdgpu_vm_lock_by_pasid(adev, &root, pasid);
-	if (!vm)
+	drm_exec_init(&exec, 0, 1);
+	drm_exec_until_all_locked(&exec) {
+		vm = amdgpu_vm_lock_by_pasid(adev, pasid, &exec);
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
-					     node_id, addr >> PAGE_SHIFT, ts, write_fault)) {
-			amdgpu_bo_unref(&root);
+					     node_id, addr >> PAGE_SHIFT, ts, write_fault))
 			return true;
-		}
-		amdgpu_bo_unref(&root);
 
 		/* Re-acquire the VM lock, could be that the VM was freed in between. */
-		vm = amdgpu_vm_lock_by_pasid(adev, &root, pasid);
-		if (!vm)
+		drm_exec_init(&exec, 0, 1);
+		drm_exec_until_all_locked(&exec) {
+			vm = amdgpu_vm_lock_by_pasid(adev, pasid, &exec);
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
@@ -3062,7 +3087,7 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
 		value = 0;
 	}
 
-	r = dma_resv_reserve_fences(root->tbo.base.resv, 1);
+	r = dma_resv_reserve_fences(vm->root.bo->tbo.base.resv, 1);
 	if (r) {
 		pr_debug("failed %d to reserve fence slot\n", r);
 		goto error_unlock;
@@ -3076,12 +3101,10 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
 	r = amdgpu_vm_update_pdes(adev, vm, true);
 
 error_unlock:
-	amdgpu_bo_unreserve(root);
+	drm_exec_fini(&exec);
 	if (r < 0)
 		dev_err(adev->dev, "Can't handle page fault (%d)\n", r);
 
-	amdgpu_bo_unref(&root);
-
 	return false;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index d083d7aab75c..0c6e3e0368c7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -593,7 +593,7 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
 			    bool write_fault);
 
 struct amdgpu_vm *amdgpu_vm_lock_by_pasid(struct amdgpu_device *adev,
-					  struct amdgpu_bo **root, u32 pasid);
+					  u32 pasid, struct drm_exec *exec);
 
 void amdgpu_vm_set_task_info(struct amdgpu_vm *vm);
 
-- 
2.54.0


