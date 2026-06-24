Return-Path: <linux-media+bounces-65555-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7LkGLePOO2oBdggAu9opvQ
	(envelope-from <linux-media+bounces-65555-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:34:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2462D6BE2B5
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:34:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="mPIwk3N/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65555-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65555-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B87EE316C1BB
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F263AEF2E;
	Wed, 24 Jun 2026 12:29:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF30A3AD50A
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 12:29:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782304172; cv=none; b=V+hIDfaOGEaqFlLMP+XZjZbfsX4XocLG16QppdmHj8LZcKpuAjKaGE/TAPhxO63+v3GkgU2vC1sto2//8HeDof+1PVrZLqk0FvvQxWHslzw+QX/A5L/dCWKpsUxIugUASegl34x7PhUEJXWKpHSsXSk/RW/kWltUbTbVupdO9hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782304172; c=relaxed/simple;
	bh=Xb+T41tv6iNRLkAzkIjX6/l8mdE3vRMzVG0vH9xXDKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hjEiEwQJ+NmYtT5OSmLoeLqFEfsPosFKy6EvEsydaqkD7C9bMjS8RYbDj9/Xe5SmoUKHXCrcCKkt4/A3t4eT8tpYWzHIWGNbXPv1Yjq3S5fQ1nGzxwPo7K1iLWx6ql/2JUUPx28dCFvKB9SfxV94c1pQrZOrBfRBG89YWwsScCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPIwk3N/; arc=none smtp.client-ip=209.85.221.47
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-46a0741a09bso340896f8f.0
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 05:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782304168; x=1782908968; darn=vger.kernel.org;
        h=content-transfer-encoding:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+5TLwQAluIRcvcOoLzQbDY5WIKNt2P7yBmdcUvo7STM=;
        b=mPIwk3N/YEsurkoEzM8m6tULVcOIa+ZsAU8wfpZXQaWOl6JiYM2EZ0gLW9b/5aTA6K
         wKGXURb8RbvQwFBr/8bMw5Fblhcn1dQ6ECsY4qlvawnsLlM6wNDlKSb/V6cPDxXMqidE
         UOc7g/jtTcYzCOoBngbkQnezGskKPXK6SwVauitfY3rr1PRD6QiCXPpaUBcqDUIR6Da1
         ICNQ1CIIRrPIIvNqTK0odYqro55I5PQ3dd4yJKUzPYKFSyvatldFZfa13/Ww9j4KsWil
         HKfgvY4zgQEQPIAGgNoLTrjluKQB+RLa91TezcYBz/OBpmtynKXaLITJ9UMxXN/qckFL
         cb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782304168; x=1782908968;
        h=content-transfer-encoding:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+5TLwQAluIRcvcOoLzQbDY5WIKNt2P7yBmdcUvo7STM=;
        b=UdUxuw4s5iMgWI2oMoo5lvdXksmGNMsy61iGS3iv9x4wD+jNBjrnltyK5UQ4qzislK
         ahFWslDuapYtCCKzlpTcW1K6r6DAU0Hewv2obiQqibeBLHuBrTM2s++3R/KK+CuPOwtc
         4/uY2JypdA3wxYOTyZaInrvN/bHD0afnzDbq+q5AJ3mwV1TFfg4pSe2wVZyBAgHqcgYs
         CA1zIQza42OTG3IrzU47qFyYHsr3fSsq8A7OtdxheT5kuBORvqGkZcSne5/ZRfA/L3Gv
         wtjC92s+OI0M5udaDJ3UpjDuPy5/8jubJ+6pBwi4zMoTBGhV4VeiQDUOzC3+eJkscCLA
         Irig==
X-Forwarded-Encrypted: i=1; AHgh+RqgSErsY5K9a93YiAoYuQM4QRkQ4RuVIHfFJZwnWKl4o0UL5AIIAQ+Vjszk2/qJSGr5BRso4KNGaI/RZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7SaQzZy5MLnVhMX/dErO16CwpS5N2Ok5sR7Mm3liThl28F2gZ
	R3B4Bym69tcuTPkdwuAVks22CyoIHZlkL4KmX7w8AfQv3AiH4h+D/qUs
X-Gm-Gg: AfdE7cm4Ju+tHY2UVlxzqlrDjcyMRaZwqc8haCNzEcIK592fSN2iuc6VrZkXCsJkUiA
	OlTew7k111BMOorg9KcU5wFosDJHAhktoJzTPNqSQkB5E7EsNO4Is7I6ZdTZ/FwLd9/c6x4SP9/
	oW+OCis3LP+Euj5JlarAyzbRxPW78IYPfcv1S00zw5CIyAez4V7s8BPbaHRH+f9gJ7urgNsm5hZ
	D5l0BdQSAYC5qZtZvYEeD1wNfunOkR1+XcoaRtpXmC/NTF+vTmXyzgfyMdhgCYySBWjZQ7OTnWN
	VUt+fAIs7nlv9WnQ5Ax5Q47GlZR7cSUFfGFpXMopHYM+x9kOckv3bR8Nk4Gp2Yoqe1sGTXG8NXN
	Km0fFzLHFzhzOK4G7DxX10cJpmK/4JAJY9AuWbfcZHuPSYly3yQ3D+xcX+hnTPxz421Co/1GZ2x
	8E7+wbioKufGLp5s68dJfyheaWqQ==
X-Received: by 2002:a05:6000:2381:b0:460:e0f:8d19 with SMTP id ffacd0b85a97d-46ad8a3a0b0mr11785454f8f.9.1782304168010;
        Wed, 24 Jun 2026 05:29:28 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:157e:3500:2be7:1a89:41c5:9239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c9787dddbsm3896530f8f.3.2026.06.24.05.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 05:29:27 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: phasta@kernel.org,
	simona@ffwll.ch,
	sumit.semwal@linaro.org,
	tvrtko.ursulin@igalia.com,
	dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 09/10] dma-buf: remove signaling from dma_fence_enable_signaling()
Date: Wed, 24 Jun 2026 13:13:33 +0200
Message-ID: <20260624122917.2483-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624122917.2483-1-christian.koenig@amd.com>
References: <20260624122917.2483-1-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65555-lists,linux-media=lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:tvrtko.ursulin@igalia.com,m:dakr@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[christian.koenig@amd.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:replyto,amd.com:email,amd.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2462D6BE2B5

Instead move the call into the backend implementations where necessary.

This way backends can do cleanup after calling dma_fence_signal().

For example it might be necessary to remove items from linked lists
and/or drop additional references, start work items etc...

It also gives backends a clean point to know when all registered callbacks
are finished.

No intended functional change.

Assisted-by: Claude Sonet 4
Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-array.c                |  7 +++----
 drivers/dma-buf/dma-fence-chain.c                | 16 +++++++++-------
 drivers/dma-buf/dma-fence.c                      | 16 +++++-----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c | 16 +++++++++-------
 .../gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c   |  3 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c        |  4 +---
 drivers/gpu/drm/i915/i915_request.c              |  5 +++--
 drivers/gpu/drm/nouveau/nouveau_fence.c          | 15 +++++----------
 drivers/gpu/drm/radeon/radeon_fence.c            | 12 +++++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c            |  6 +++---
 drivers/gpu/drm/xe/xe_hw_fence.c                 |  4 +---
 drivers/gpu/drm/xe/xe_preempt_fence.c            |  3 +--
 drivers/gpu/host1x/fence.c                       | 10 +++++-----
 include/linux/dma-fence.h                        | 12 ++++++------
 14 files changed, 59 insertions(+), 70 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 49ea2ba7c460..541c9c169624 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -67,7 +67,7 @@ static void dma_fence_array_cb_func(struct dma_fence *f,
 		dma_fence_put(&array->base);
 }
 
-static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
+static void dma_fence_array_enable_signaling(struct dma_fence *fence)
 {
 	struct dma_fence_array *array = to_dma_fence_array(fence);
 	struct dma_fence_array_cb *cb = array->callbacks;
@@ -92,12 +92,11 @@ static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
 			dma_fence_put(&array->base);
 			if (atomic_dec_and_test(&array->num_pending)) {
 				dma_fence_array_clear_pending_error(array);
-				return false;
+				dma_fence_signal_locked(fence);
+				return;
 			}
 		}
 	}
-
-	return true;
 }
 
 static void dma_fence_array_signaled(struct dma_fence *fence)
diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index ff4f02900237..6617f4150c73 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -9,7 +9,7 @@
 
 #include <linux/dma-fence-chain.h>
 
-static bool dma_fence_chain_enable_signaling(struct dma_fence *fence);
+static void dma_fence_chain_enable_signaling(struct dma_fence *fence);
 
 /**
  * dma_fence_chain_get_prev - use RCU to get a reference to the previous fence
@@ -122,13 +122,14 @@ static const char *dma_fence_chain_get_timeline_name(struct dma_fence *fence)
 static void dma_fence_chain_irq_work(struct irq_work *work)
 {
 	struct dma_fence_chain *chain;
+	unsigned long flags;
 
 	chain = container_of(work, typeof(*chain), work);
 
 	/* Try to rearm the callback */
-	if (!dma_fence_chain_enable_signaling(&chain->base))
-		/* Ok, we are done. No more unsignaled fences left */
-		dma_fence_signal(&chain->base);
+	dma_fence_lock_irqsave(&chain->base, flags);
+	dma_fence_chain_enable_signaling(&chain->base);
+	dma_fence_unlock_irqrestore(&chain->base, flags);
 	dma_fence_put(&chain->base);
 }
 
@@ -142,7 +143,7 @@ static void dma_fence_chain_cb(struct dma_fence *f, struct dma_fence_cb *cb)
 	dma_fence_put(f);
 }
 
-static bool dma_fence_chain_enable_signaling(struct dma_fence *fence)
+static void dma_fence_chain_enable_signaling(struct dma_fence *fence)
 {
 	struct dma_fence_chain *head = to_dma_fence_chain(fence);
 
@@ -153,12 +154,13 @@ static bool dma_fence_chain_enable_signaling(struct dma_fence *fence)
 		dma_fence_get(f);
 		if (!dma_fence_add_callback(f, &head->cb, dma_fence_chain_cb)) {
 			dma_fence_put(fence);
-			return true;
+			return;
 		}
 		dma_fence_put(f);
 	}
 	dma_fence_put(&head->base);
-	return false;
+	/* Ok, we are done. No more unsignaled fences left */
+	dma_fence_signal_locked(&head->base);
 }
 
 static void dma_fence_chain_signaled(struct dma_fence *fence)
diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 0ec81a568bbd..15b425984c36 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -626,7 +626,7 @@ void dma_fence_free(struct dma_fence *fence)
 }
 EXPORT_SYMBOL(dma_fence_free);
 
-static bool __dma_fence_enable_signaling(struct dma_fence *fence)
+static void __dma_fence_enable_signaling(struct dma_fence *fence)
 {
 	const struct dma_fence_ops *ops;
 	bool was_set;
@@ -637,22 +637,15 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
 				   &fence->flags);
 
 	if (dma_fence_test_signaled_flag(fence))
-		return false;
+		return;
 
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
 	if (!was_set && ops && ops->enable_signaling) {
 		trace_dma_fence_enable_signal(fence);
-
-		if (!ops->enable_signaling(fence)) {
-			rcu_read_unlock();
-			dma_fence_signal_locked(fence);
-			return false;
-		}
+		ops->enable_signaling(fence);
 	}
 	rcu_read_unlock();
-
-	return true;
 }
 
 /**
@@ -710,7 +703,8 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
 	}
 
 	dma_fence_lock_irqsave(fence, flags);
-	if (__dma_fence_enable_signaling(fence)) {
+	__dma_fence_enable_signaling(fence);
+	if (!dma_fence_test_signaled_flag(fence)) {
 		cb->func = func;
 		list_add_tail(&cb->node, &fence->cb_list);
 	} else {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
index 6a364357522b..15f546c9098e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
@@ -118,15 +118,17 @@ static const char *amdkfd_fence_get_timeline_name(struct dma_fence *f)
  *
  *  @f: dma_fence
  */
-static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
+static void amdkfd_fence_enable_signaling(struct dma_fence *f)
 {
 	struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
 
-	if (!fence)
-		return false;
+	if (!fence) {
+		dma_fence_signal_locked(f);
+		return;
+	}
 
 	if (dma_fence_is_signaled(f))
-		return true;
+		return;
 
 	/* if fence->svm_bo is NULL, means this fence is created through
 	 * init_kfd_vm() or amdgpu_amdkfd_gpuvm_restore_process_bos().
@@ -134,12 +136,12 @@ static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
 	 */
 	if (!fence->svm_bo) {
 		if (!kgd2kfd_schedule_evict_and_restore_process(fence->mm, fence->context_id, f))
-			return true;
+			return;
 	} else {
 		if (!svm_range_schedule_evict_svm_bo(fence))
-			return true;
+			return;
 	}
-	return false;
+	dma_fence_signal_locked(f);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
index f6b7522c3c82..ac2b337e0e8f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
@@ -40,12 +40,11 @@ amdgpu_eviction_fence_get_timeline_name(struct dma_fence *f)
 	return ef->timeline_name;
 }
 
-static bool amdgpu_eviction_fence_enable_signaling(struct dma_fence *f)
+static void amdgpu_eviction_fence_enable_signaling(struct dma_fence *f)
 {
 	struct amdgpu_eviction_fence *ev_fence = to_ev_fence(f);
 
 	schedule_work(&ev_fence->evf_mgr->suspend_work);
-	return true;
 }
 
 static const struct dma_fence_ops amdgpu_eviction_fence_ops = {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 1192b9800ff2..f7ddc3e50d34 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -833,12 +833,10 @@ static const char *amdgpu_fence_get_timeline_name(struct dma_fence *f)
  * to fence_queue that checks if this fence is signaled, and if so it
  * signals the fence and removes itself.
  */
-static bool amdgpu_fence_enable_signaling(struct dma_fence *f)
+static void amdgpu_fence_enable_signaling(struct dma_fence *f)
 {
 	if (!timer_pending(&to_amdgpu_fence(f)->ring->fence_drv.fallback_timer))
 		amdgpu_fence_schedule_fallback(to_amdgpu_fence(f)->ring);
-
-	return true;
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index c39a7f4b6dc7..d9ffcb0e40e3 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -93,9 +93,10 @@ static void i915_fence_signaled(struct dma_fence *fence)
 		dma_fence_signal(fence);
 }
 
-static bool i915_fence_enable_signaling(struct dma_fence *fence)
+static void i915_fence_enable_signaling(struct dma_fence *fence)
 {
-	return i915_request_enable_breadcrumb(to_request(fence));
+	if (!i915_request_enable_breadcrumb(to_request(fence)))
+		dma_fence_signal_locked(fence);
 }
 
 static signed long i915_fence_wait(struct dma_fence *fence,
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 64df1d7de460..7250f58ee443 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -472,7 +472,7 @@ static void nouveau_fence_is_signaled(struct dma_fence *f)
 		dma_fence_signal(f);
 }
 
-static bool nouveau_fence_no_signaling(struct dma_fence *f)
+static void nouveau_fence_no_signaling(struct dma_fence *f)
 {
 	struct nouveau_fence *fence = to_nouveau_fence(f);
 
@@ -492,10 +492,8 @@ static bool nouveau_fence_no_signaling(struct dma_fence *f)
 		list_del(&fence->head);
 
 		dma_fence_put(&fence->base);
-		return false;
+		dma_fence_signal_locked(f);
 	}
-
-	return true;
 }
 
 static void nouveau_fence_release(struct dma_fence *f)
@@ -516,22 +514,19 @@ static const struct dma_fence_ops nouveau_fence_ops_legacy = {
 	.release = nouveau_fence_release
 };
 
-static bool nouveau_fence_enable_signaling(struct dma_fence *f)
+static void nouveau_fence_enable_signaling(struct dma_fence *f)
 {
 	struct nouveau_fence *fence = to_nouveau_fence(f);
 	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
-	bool ret;
 
 	if (!fctx->notify_ref++)
 		nvif_event_allow(&fctx->event);
 
-	ret = nouveau_fence_no_signaling(f);
-	if (ret)
+	nouveau_fence_no_signaling(f);
+	if (!dma_fence_test_signaled_flag(f))
 		set_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags);
 	else if (!--fctx->notify_ref)
 		nvif_event_block(&fctx->event);
-
-	return ret;
 }
 
 static const struct dma_fence_ops nouveau_fence_ops_uevent = {
diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/radeon/radeon_fence.c
index 45f01ebe5a78..5a543d8ea0d9 100644
--- a/drivers/gpu/drm/radeon/radeon_fence.c
+++ b/drivers/gpu/drm/radeon/radeon_fence.c
@@ -369,13 +369,15 @@ static void radeon_fence_is_signaled(struct dma_fence *f)
  * to fence_queue that checks if this fence is signaled, and if so it
  * signals the fence and removes itself.
  */
-static bool radeon_fence_enable_signaling(struct dma_fence *f)
+static void radeon_fence_enable_signaling(struct dma_fence *f)
 {
 	struct radeon_fence *fence = to_radeon_fence(f);
 	struct radeon_device *rdev = fence->rdev;
 
-	if (atomic64_read(&rdev->fence_drv[fence->ring].last_seq) >= fence->seq)
-		return false;
+	if (atomic64_read(&rdev->fence_drv[fence->ring].last_seq) >= fence->seq) {
+		dma_fence_signal_locked(f);
+		return;
+	}
 
 	if (down_read_trylock(&rdev->exclusive_lock)) {
 		radeon_irq_kms_sw_irq_get(rdev, fence->ring);
@@ -387,7 +389,8 @@ static bool radeon_fence_enable_signaling(struct dma_fence *f)
 		if (atomic64_read(&rdev->fence_drv[fence->ring].last_seq) >= fence->seq) {
 			radeon_irq_kms_sw_irq_put(rdev, fence->ring);
 			up_read(&rdev->exclusive_lock);
-			return false;
+			dma_fence_signal_locked(f);
+			return;
 		}
 
 		up_read(&rdev->exclusive_lock);
@@ -403,7 +406,6 @@ static bool radeon_fence_enable_signaling(struct dma_fence *f)
 	fence->fence_wake.func = radeon_fence_check_signaled;
 	__add_wait_queue(&rdev->fence_queue, &fence->fence_wake);
 	dma_fence_get(f);
-	return true;
 }
 
 /**
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index 4ef84ff9b638..cb92232ca4ee 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -95,7 +95,7 @@ static const char *vmw_fence_get_timeline_name(struct dma_fence *f)
  * enabled. If interrupts were already enabled we just increment the number of
  * seqno waiters.
  */
-static bool vmw_fence_enable_signaling(struct dma_fence *f)
+static void vmw_fence_enable_signaling(struct dma_fence *f)
 {
 	u32 seqno;
 	struct vmw_fence_obj *fence =
@@ -110,13 +110,13 @@ static bool vmw_fence_enable_signaling(struct dma_fence *f)
 			vmw_seqno_waiter_remove(dev_priv);
 			fence->waiter_added = false;
 		}
-		return false;
+		dma_fence_signal_locked(f);
+		return;
 	} else if (!fence->waiter_added) {
 		fence->waiter_added = true;
 		if (vmw_seqno_waiter_add(dev_priv))
 			goto check_for_race;
 	}
-	return true;
 }
 
 static u32 __vmw_fences_update(struct vmw_fence_manager *fman);
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index bda2fde0b216..44563dfd75ab 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -154,7 +154,7 @@ static const char *xe_hw_fence_get_timeline_name(struct dma_fence *dma_fence)
 	return fence->name;
 }
 
-static bool xe_hw_fence_enable_signaling(struct dma_fence *dma_fence)
+static void xe_hw_fence_enable_signaling(struct dma_fence *dma_fence)
 {
 	struct xe_hw_fence *fence = to_xe_hw_fence(dma_fence);
 	struct xe_hw_fence_irq *irq = xe_hw_fence_irq(fence);
@@ -166,8 +166,6 @@ static bool xe_hw_fence_enable_signaling(struct dma_fence *dma_fence)
 	xe_hw_fence_signaled(dma_fence);
 	if (dma_fence_test_signaled_flag(dma_fence))
 		xe_hw_fence_irq_run(irq);
-
-	return true;
 }
 
 static void xe_hw_fence_release(struct dma_fence *dma_fence)
diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
index d6427b473ddd..c6e5472ec7ac 100644
--- a/drivers/gpu/drm/xe/xe_preempt_fence.c
+++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
@@ -67,7 +67,7 @@ preempt_fence_get_timeline_name(struct dma_fence *fence)
 	return "preempt";
 }
 
-static bool preempt_fence_enable_signaling(struct dma_fence *fence)
+static void preempt_fence_enable_signaling(struct dma_fence *fence)
 {
 	struct xe_preempt_fence *pfence =
 		container_of(fence, typeof(*pfence), base);
@@ -75,7 +75,6 @@ static bool preempt_fence_enable_signaling(struct dma_fence *fence)
 
 	pfence->error = q->ops->suspend(q);
 	queue_work(q->vm->xe->preempt_fence_wq, &pfence->preempt_work);
-	return true;
 }
 
 static const struct dma_fence_ops preempt_fence_ops = {
diff --git a/drivers/gpu/host1x/fence.c b/drivers/gpu/host1x/fence.c
index b9a7d0bf91f8..4a74df718540 100644
--- a/drivers/gpu/host1x/fence.c
+++ b/drivers/gpu/host1x/fence.c
@@ -30,12 +30,14 @@ static struct host1x_syncpt_fence *to_host1x_fence(struct dma_fence *f)
 	return container_of(f, struct host1x_syncpt_fence, base);
 }
 
-static bool host1x_syncpt_fence_enable_signaling(struct dma_fence *f)
+static void host1x_syncpt_fence_enable_signaling(struct dma_fence *f)
 {
 	struct host1x_syncpt_fence *sf = to_host1x_fence(f);
 
-	if (host1x_syncpt_is_expired(sf->sp, sf->threshold))
-		return false;
+	if (host1x_syncpt_is_expired(sf->sp, sf->threshold)) {
+		dma_fence_signal_locked(f);
+		return;
+	}
 
 	/* Reference for interrupt path. */
 	dma_fence_get(f);
@@ -62,8 +64,6 @@ static bool host1x_syncpt_fence_enable_signaling(struct dma_fence *f)
 	 * so we need to initialize all state used by signalling
 	 * before it.
 	 */
-
-	return true;
 }
 
 static const struct dma_fence_ops host1x_syncpt_fence_ops = {
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index e93ea4ac0636..c8e4d5a61d72 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -174,12 +174,12 @@ struct dma_fence_ops {
 	 * This is called with irq's disabled, so only spinlocks which disable
 	 * IRQ's can be used in the code outside of this callback.
 	 *
-	 * A return value of false indicates the fence already passed,
-	 * or some failure occurred that made it impossible to enable
-	 * signaling. True indicates successful enabling.
+	 * If the fence has already passed or if some failure occurred that
+	 * makes it impossible to enable signaling, the implementation must
+	 * call dma_fence_signal_locked() before returning.
 	 *
-	 * &dma_fence.error may be set in enable_signaling, but only when false
-	 * is returned.
+	 * &dma_fence.error may be set in enable_signaling before calling
+	 * dma_fence_signal_locked().
 	 *
 	 * Since many implementations can call dma_fence_signal() even when before
 	 * @enable_signaling has been called there's a race window, where the
@@ -192,7 +192,7 @@ struct dma_fence_ops {
 	 * This callback is optional. If this callback is not present, then the
 	 * driver must always have signaling enabled.
 	 */
-	bool (*enable_signaling)(struct dma_fence *fence);
+	void (*enable_signaling)(struct dma_fence *fence);
 
 	/**
 	 * @check_signaled:
-- 
2.43.0


