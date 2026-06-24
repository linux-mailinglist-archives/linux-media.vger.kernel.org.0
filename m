Return-Path: <linux-media+bounces-65557-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +fK1FurOO2oDdggAu9opvQ
	(envelope-from <linux-media+bounces-65557-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:34:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D6A6BE2BF
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:34:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LWAO03Pm;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65557-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65557-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4A4B316EC55
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA823AEF57;
	Wed, 24 Jun 2026 12:29:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AE63AEB32
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 12:29:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782304173; cv=none; b=hmPS+WeMt6dlT0Fkqvua54WAWwZGCc4renRp8OqUA05t2djoF63Z0V8Om3tpf/GC1HWIba14gYWhyjDyMZVPqZxZmFi7fj7IIdFKCtz1Nxq/bRKDqtMI23gm932F/2g9MHIgyM4cFvm4gFuQNRuzGbwjpsaz5+1y+a4Wzdvr1RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782304173; c=relaxed/simple;
	bh=VzeGkcNCENR+/N5AckUSrrSB6nK3jbubmgO6Kgt47X0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EVNClTup/Gv5qVE5I3wYFXsnW3ptoladf0EBSgzfmOGkI6QDNqU56wOUhzJw1ZgGvzV0JHeHFUusR8TO1vFs3BQWEcVsxU9flTfk+FOQpcDJ66BWfc5RT2K1oGkzgtxlINsecWO0itswD08OLRg8YfvjLok3RDpGAdbF5Rwt09Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWAO03Pm; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-491609cdd8fso6260225e9.2
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 05:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782304169; x=1782908969; darn=vger.kernel.org;
        h=content-transfer-encoding:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jiviaW6vSIjKPsCI2h5HxDG6Qe0InuCjPOQWwHPX/W4=;
        b=LWAO03PmlBwGdfb8VQHEHtes2ffJ/zfvzCCBe6b1kv/B82q6X5Y2a7XMphRjO8KU+1
         U9h0rLOHUSOaDL0IwY6SUFxdFnJ/MDXGDtsP5wR/FBjMYaYqUeTMG7v/B6Y5n/il/OVy
         yfmxYSkAPzhr+fuXLnloFLN36oFvwsX+FJ2T/NCp/sHdcAFRKOKpdfsVtFp9uhz9/+lr
         xC4S/nqUYb7E6ZnDAjsZjFViy5zulwCaJEoTzsdV3z40hJnyPgA/H1nyGL/f3WD4QopU
         J3P1YGfbgkN12f/U9eHTFx2vSzFuqhqMJ7TG3+qNPYbhaoSw6FCY7IF73/5M1podzrwt
         PdNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782304169; x=1782908969;
        h=content-transfer-encoding:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jiviaW6vSIjKPsCI2h5HxDG6Qe0InuCjPOQWwHPX/W4=;
        b=oW6ZCtwOVujJMIpXd4I59fjwx3IjVH4+p5BqK7uA+NJTj88wPWXhiNlT4zcA8qt1TN
         RvyZ+FUXJPlzmDT321MVm4lwpR0V/jEfuY7uAR4K4xrIAPZPo5UU5EfO2MZxlz2Cqq1d
         ib/8g2TmC7RItEFP4klnLVxXlOMjahyJE9AT9697wVUfbd2/BnSifgomFMzKzWOX7+JH
         ZFE4KUKLDfR0AUyEq0CYy62oeopTvpHQd7PwR5Qwr6KUJ0ptlMNa2u1fbehNcx9mYosy
         f3dWhYDImk70Dm1J3aIDeXryM271Xx5HCkK5FJLLp0ckVhfsC7DDEGDLHHZ90TafuT3Z
         lHrA==
X-Forwarded-Encrypted: i=1; AFNElJ/A+H2amsvX+2jhYCE133EZG6v0gA6cBSgtukO7Qw4lSe9URw1pAij1JUKVsj7m9xY4wTgvSRbTMzPv5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyW8MqKxobeiMrqS81Udq67QkaAtd+tGTWOZ/akUC8i5Wlc4Wp0
	UBQL+vlvnvDcrPyRdsv2gcc4++EQ6bwddBquCsAcCp2YAkQpyd3D61Bi
X-Gm-Gg: AfdE7cn9OflJliSQqC73eJRXEybQ3BM4xNII+KYGF/rQzpeqlfhS3ahozgoxSr8pZsl
	ZwZfDsYs4stvvTAr3Yu2Oy+YYVWnmsLCcmWOfiO9394gJJQPn0FbxTREz3s9lVyzqvfyCGosMVt
	XecXaJDZw2C+q/3CtEQNlh49P2Pcslhm1SBB9gNBuml5Qfq1haWL4APTu6PrgWWHwkOW+ESWlKE
	ik719lZspkXwSNqmn7GqFOP/8qgZkMrit5AUuKa+D0uhicpPSH4nd7axPh1XRbTshNIYzTJCoAI
	JYp5GTmQt0CPWIp6nN/iIfUY/ttGVUdV2oxJdhWz6kb/TlS+d/ERH8x22eRaTa43l0AQXSeWTfG
	EuQU/J8W8pYKqn4TOTpp0BSNnNeG+4gvtPoZB/3LrjLbWAtt/WbbDh4Ef8vFscblWfN0OJvX/Dr
	nsLfPoQWNCYJGgTvOm96otu2aizQ==
X-Received: by 2002:a05:600c:c04d:b0:492:2ffd:8f8 with SMTP id 5b1f17b1804b1-4926084ce2emr29159085e9.15.1782304168876;
        Wed, 24 Jun 2026 05:29:28 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:157e:3500:2be7:1a89:41c5:9239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c9787dddbsm3896530f8f.3.2026.06.24.05.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 05:29:28 -0700 (PDT)
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
Subject: [PATCH 10/10] dma-buf: move locking into dma_fence_ops.enable_signaling
Date: Wed, 24 Jun 2026 13:13:34 +0200
Message-ID: <20260624122917.2483-11-christian.koenig@amd.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65557-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:replyto,amd.com:email,amd.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E2D6A6BE2BF

Make the callback responsible for acquiring the fence lock when needed.

This gives backends control over their locking strategy and allows them to
nest locks in their desired order.

This caused quite some trouble in the past and is the reason for
multiple workarounds.

As a start for cleanup this patch also removes the lockdep anotation
workaround from dma_fence_chain and dma_fence_array since it isn't
necessary any more.

Assisted-by: Claude Sonet 4
Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-array.c             | 16 +---------
 drivers/dma-buf/dma-fence-chain.c             | 19 ++---------
 drivers/dma-buf/dma-fence.c                   | 32 +++++++------------
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  | 18 +++++------
 drivers/gpu/drm/i915/i915_request.c           |  4 +++
 drivers/gpu/drm/nouveau/nouveau_fence.c       | 16 ++++++++--
 drivers/gpu/drm/radeon/radeon_fence.c         |  6 ++++
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c         |  6 +++-
 drivers/gpu/drm/xe/xe_hw_fence.c              |  3 ++
 drivers/gpu/drm/xe/xe_preempt_fence.c         |  3 ++
 drivers/gpu/host1x/fence.c                    |  6 ++++
 include/linux/dma-fence.h                     | 10 ++++--
 12 files changed, 71 insertions(+), 68 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 541c9c169624..fcda2dcc6010 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -92,7 +92,7 @@ static void dma_fence_array_enable_signaling(struct dma_fence *fence)
 			dma_fence_put(&array->base);
 			if (atomic_dec_and_test(&array->num_pending)) {
 				dma_fence_array_clear_pending_error(array);
-				dma_fence_signal_locked(fence);
+				dma_fence_signal(fence);
 				return;
 			}
 		}
@@ -197,8 +197,6 @@ void dma_fence_array_init(struct dma_fence_array *array,
 			  int num_fences, struct dma_fence **fences,
 			  u64 context, unsigned seqno)
 {
-	static struct lock_class_key dma_fence_array_lock_key;
-
 	WARN_ON(!num_fences || !fences);
 
 	array->num_fences = num_fences;
@@ -207,18 +205,6 @@ void dma_fence_array_init(struct dma_fence_array *array,
 		       seqno);
 	init_irq_work(&array->work, irq_dma_fence_array_work);
 
-	/*
-	 * dma_fence_array_enable_signaling() is invoked while holding
-	 * array->base.inline_lock and may call dma_fence_add_callback()
-	 * on the underlying fences, which takes their inline_lock.
-	 *
-	 * Since both locks share the same lockdep class, this legitimate
-	 * nesting confuses lockdep and triggers a recursive locking
-	 * warning. Assign a separate lockdep class to the array lock
-	 * to model this hierarchy correctly.
-	 */
-	lockdep_set_class(&array->base.inline_lock, &dma_fence_array_lock_key);
-
 	atomic_set(&array->num_pending, num_fences);
 	array->fences = fences;
 
diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 6617f4150c73..943ec919138d 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -122,14 +122,11 @@ static const char *dma_fence_chain_get_timeline_name(struct dma_fence *fence)
 static void dma_fence_chain_irq_work(struct irq_work *work)
 {
 	struct dma_fence_chain *chain;
-	unsigned long flags;
 
 	chain = container_of(work, typeof(*chain), work);
 
 	/* Try to rearm the callback */
-	dma_fence_lock_irqsave(&chain->base, flags);
 	dma_fence_chain_enable_signaling(&chain->base);
-	dma_fence_unlock_irqrestore(&chain->base, flags);
 	dma_fence_put(&chain->base);
 }
 
@@ -159,8 +156,9 @@ static void dma_fence_chain_enable_signaling(struct dma_fence *fence)
 		dma_fence_put(f);
 	}
 	dma_fence_put(&head->base);
+
 	/* Ok, we are done. No more unsignaled fences left */
-	dma_fence_signal_locked(&head->base);
+	dma_fence_signal(&head->base);
 }
 
 static void dma_fence_chain_signaled(struct dma_fence *fence)
@@ -246,7 +244,6 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 			  struct dma_fence *fence,
 			  uint64_t seqno)
 {
-	static struct lock_class_key dma_fence_chain_lock_key;
 	struct dma_fence_chain *prev_chain = to_dma_fence_chain(prev);
 	uint64_t context;
 
@@ -268,18 +265,6 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 	dma_fence_init64(&chain->base, &dma_fence_chain_ops, NULL,
 			 context, seqno);
 
-	/*
-	 * dma_fence_chain_enable_signaling() is invoked while holding
-	 * chain->base.inline_lock and may call dma_fence_add_callback()
-	 * on the underlying fences, which takes their inline_lock.
-	 *
-	 * Since both locks share the same lockdep class, this legitimate
-	 * nesting confuses lockdep and triggers a recursive locking
-	 * warning. Assign a separate lockdep class to the chain lock
-	 * to model this hierarchy correctly.
-	 */
-	lockdep_set_class(&chain->base.inline_lock, &dma_fence_chain_lock_key);
-
 	/*
 	 * Chaining dma_fence_chain container together is only allowed through
 	 * the prev fence and not through the contained fence.
diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 15b425984c36..f201dff75247 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -626,13 +626,19 @@ void dma_fence_free(struct dma_fence *fence)
 }
 EXPORT_SYMBOL(dma_fence_free);
 
-static void __dma_fence_enable_signaling(struct dma_fence *fence)
+/**
+ * dma_fence_enable_signaling - enable signaling on fence
+ * @fence: the fence to enable
+ *
+ * This will request for sw signaling to be enabled, to make the fence
+ * complete as soon as possible. This calls &dma_fence_ops.enable_signaling
+ * internally.
+ */
+void dma_fence_enable_signaling(struct dma_fence *fence)
 {
 	const struct dma_fence_ops *ops;
 	bool was_set;
 
-	dma_fence_assert_held(fence);
-
 	was_set = test_and_set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
 				   &fence->flags);
 
@@ -647,23 +653,6 @@ static void __dma_fence_enable_signaling(struct dma_fence *fence)
 	}
 	rcu_read_unlock();
 }
-
-/**
- * dma_fence_enable_signaling - enable signaling on fence
- * @fence: the fence to enable
- *
- * This will request for sw signaling to be enabled, to make the fence
- * complete as soon as possible. This calls &dma_fence_ops.enable_signaling
- * internally.
- */
-void dma_fence_enable_signaling(struct dma_fence *fence)
-{
-	unsigned long flags;
-
-	dma_fence_lock_irqsave(fence, flags);
-	__dma_fence_enable_signaling(fence);
-	dma_fence_unlock_irqrestore(fence, flags);
-}
 EXPORT_SYMBOL(dma_fence_enable_signaling);
 
 /**
@@ -702,8 +691,9 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
 		return -ENOENT;
 	}
 
+	dma_fence_enable_signaling(fence);
+
 	dma_fence_lock_irqsave(fence, flags);
-	__dma_fence_enable_signaling(fence);
 	if (!dma_fence_test_signaled_flag(fence)) {
 		cb->func = func;
 		list_add_tail(&cb->node, &fence->cb_list);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
index 15f546c9098e..368c2083b4bd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
@@ -121,27 +121,27 @@ static const char *amdkfd_fence_get_timeline_name(struct dma_fence *f)
 static void amdkfd_fence_enable_signaling(struct dma_fence *f)
 {
 	struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
+	unsigned long flags;
 
-	if (!fence) {
-		dma_fence_signal_locked(f);
-		return;
-	}
-
-	if (dma_fence_is_signaled(f))
-		return;
+	dma_fence_lock_irqsave(f, flags);
 
 	/* if fence->svm_bo is NULL, means this fence is created through
 	 * init_kfd_vm() or amdgpu_amdkfd_gpuvm_restore_process_bos().
 	 * Therefore, this fence is amdgpu_amdkfd_fence->eviction_fence.
 	 */
 	if (!fence->svm_bo) {
-		if (!kgd2kfd_schedule_evict_and_restore_process(fence->mm, fence->context_id, f))
+		if (!kgd2kfd_schedule_evict_and_restore_process(fence->mm, fence->context_id, f)) {
+			dma_fence_unlock_irqrestore(f, flags);
 			return;
+		}
 	} else {
-		if (!svm_range_schedule_evict_svm_bo(fence))
+		if (!svm_range_schedule_evict_svm_bo(fence)) {
+			dma_fence_unlock_irqrestore(f, flags);
 			return;
+		}
 	}
 	dma_fence_signal_locked(f);
+	dma_fence_unlock_irqrestore(f, flags);
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index d9ffcb0e40e3..9218a4d6ef11 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -95,8 +95,12 @@ static void i915_fence_signaled(struct dma_fence *fence)
 
 static void i915_fence_enable_signaling(struct dma_fence *fence)
 {
+	unsigned long flags;
+
+	dma_fence_lock_irqsave(fence, flags);
 	if (!i915_request_enable_breadcrumb(to_request(fence)))
 		dma_fence_signal_locked(fence);
+	dma_fence_unlock_irqrestore(fence, flags);
 }
 
 static signed long i915_fence_wait(struct dma_fence *fence,
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 7250f58ee443..f494281d0ed2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -472,7 +472,7 @@ static void nouveau_fence_is_signaled(struct dma_fence *f)
 		dma_fence_signal(f);
 }
 
-static void nouveau_fence_no_signaling(struct dma_fence *f)
+static void __nouveau_fence_no_signaling(struct dma_fence *f)
 {
 	struct nouveau_fence *fence = to_nouveau_fence(f);
 
@@ -496,6 +496,15 @@ static void nouveau_fence_no_signaling(struct dma_fence *f)
 	}
 }
 
+static void nouveau_fence_no_signaling(struct dma_fence *f)
+{
+	unsigned long flags;
+
+	dma_fence_lock_irqsave(f, flags);
+	__nouveau_fence_no_signaling(f);
+	dma_fence_unlock_irqrestore(f, flags);
+}
+
 static void nouveau_fence_release(struct dma_fence *f)
 {
 	struct nouveau_fence *fence = to_nouveau_fence(f);
@@ -518,15 +527,18 @@ static void nouveau_fence_enable_signaling(struct dma_fence *f)
 {
 	struct nouveau_fence *fence = to_nouveau_fence(f);
 	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
+	unsigned long flags;
 
 	if (!fctx->notify_ref++)
 		nvif_event_allow(&fctx->event);
 
-	nouveau_fence_no_signaling(f);
+	dma_fence_lock_irqsave(f, flags);
+	__nouveau_fence_no_signaling(f);
 	if (!dma_fence_test_signaled_flag(f))
 		set_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags);
 	else if (!--fctx->notify_ref)
 		nvif_event_block(&fctx->event);
+	dma_fence_unlock_irqrestore(f, flags);
 }
 
 static const struct dma_fence_ops nouveau_fence_ops_uevent = {
diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/radeon/radeon_fence.c
index 5a543d8ea0d9..bf48bd2556ec 100644
--- a/drivers/gpu/drm/radeon/radeon_fence.c
+++ b/drivers/gpu/drm/radeon/radeon_fence.c
@@ -373,9 +373,13 @@ static void radeon_fence_enable_signaling(struct dma_fence *f)
 {
 	struct radeon_fence *fence = to_radeon_fence(f);
 	struct radeon_device *rdev = fence->rdev;
+	unsigned long flags;
+
+	dma_fence_lock_irqsave(f, flags);
 
 	if (atomic64_read(&rdev->fence_drv[fence->ring].last_seq) >= fence->seq) {
 		dma_fence_signal_locked(f);
+		dma_fence_unlock_irqrestore(f, flags);
 		return;
 	}
 
@@ -390,6 +394,7 @@ static void radeon_fence_enable_signaling(struct dma_fence *f)
 			radeon_irq_kms_sw_irq_put(rdev, fence->ring);
 			up_read(&rdev->exclusive_lock);
 			dma_fence_signal_locked(f);
+			dma_fence_unlock_irqrestore(f, flags);
 			return;
 		}
 
@@ -406,6 +411,7 @@ static void radeon_fence_enable_signaling(struct dma_fence *f)
 	fence->fence_wake.func = radeon_fence_check_signaled;
 	__add_wait_queue(&rdev->fence_queue, &fence->fence_wake);
 	dma_fence_get(f);
+	dma_fence_unlock_irqrestore(f, flags);
 }
 
 /**
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index cb92232ca4ee..c88999098bb5 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -100,9 +100,11 @@ static void vmw_fence_enable_signaling(struct dma_fence *f)
 	u32 seqno;
 	struct vmw_fence_obj *fence =
 		container_of(f, struct vmw_fence_obj, base);
-
 	struct vmw_fence_manager *fman = fman_from_fence(fence);
 	struct vmw_private *dev_priv = fman->dev_priv;
+	unsigned long flags;
+
+	dma_fence_lock_irqsave(f, flags);
 check_for_race:
 	seqno = vmw_fence_read(dev_priv);
 	if (seqno - fence->base.seqno < VMW_FENCE_WRAP) {
@@ -111,12 +113,14 @@ static void vmw_fence_enable_signaling(struct dma_fence *f)
 			fence->waiter_added = false;
 		}
 		dma_fence_signal_locked(f);
+		dma_fence_unlock_irqrestore(f, flags);
 		return;
 	} else if (!fence->waiter_added) {
 		fence->waiter_added = true;
 		if (vmw_seqno_waiter_add(dev_priv))
 			goto check_for_race;
 	}
+	dma_fence_unlock_irqrestore(f, flags);
 }
 
 static u32 __vmw_fences_update(struct vmw_fence_manager *fman);
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index 44563dfd75ab..5356553001cb 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -158,7 +158,9 @@ static void xe_hw_fence_enable_signaling(struct dma_fence *dma_fence)
 {
 	struct xe_hw_fence *fence = to_xe_hw_fence(dma_fence);
 	struct xe_hw_fence_irq *irq = xe_hw_fence_irq(fence);
+	unsigned long flags;
 
+	dma_fence_lock_irqsave(dma_fence, flags);
 	dma_fence_get(dma_fence);
 	list_add_tail(&fence->irq_link, &irq->pending);
 
@@ -166,6 +168,7 @@ static void xe_hw_fence_enable_signaling(struct dma_fence *dma_fence)
 	xe_hw_fence_signaled(dma_fence);
 	if (dma_fence_test_signaled_flag(dma_fence))
 		xe_hw_fence_irq_run(irq);
+	dma_fence_unlock_irqrestore(dma_fence, flags);
 }
 
 static void xe_hw_fence_release(struct dma_fence *dma_fence)
diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
index c6e5472ec7ac..ea0b9ed9d8cd 100644
--- a/drivers/gpu/drm/xe/xe_preempt_fence.c
+++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
@@ -72,9 +72,12 @@ static void preempt_fence_enable_signaling(struct dma_fence *fence)
 	struct xe_preempt_fence *pfence =
 		container_of(fence, typeof(*pfence), base);
 	struct xe_exec_queue *q = pfence->q;
+	unsigned long flags;
 
+	dma_fence_lock_irqsave(fence, flags);
 	pfence->error = q->ops->suspend(q);
 	queue_work(q->vm->xe->preempt_fence_wq, &pfence->preempt_work);
+	dma_fence_unlock_irqrestore(fence, flags);
 }
 
 static const struct dma_fence_ops preempt_fence_ops = {
diff --git a/drivers/gpu/host1x/fence.c b/drivers/gpu/host1x/fence.c
index 4a74df718540..75b101aae756 100644
--- a/drivers/gpu/host1x/fence.c
+++ b/drivers/gpu/host1x/fence.c
@@ -33,9 +33,13 @@ static struct host1x_syncpt_fence *to_host1x_fence(struct dma_fence *f)
 static void host1x_syncpt_fence_enable_signaling(struct dma_fence *f)
 {
 	struct host1x_syncpt_fence *sf = to_host1x_fence(f);
+	unsigned long flags;
+
+	dma_fence_lock_irqsave(f, flags);
 
 	if (host1x_syncpt_is_expired(sf->sp, sf->threshold)) {
 		dma_fence_signal_locked(f);
+		dma_fence_unlock_irqrestore(f, flags);
 		return;
 	}
 
@@ -64,6 +68,8 @@ static void host1x_syncpt_fence_enable_signaling(struct dma_fence *f)
 	 * so we need to initialize all state used by signalling
 	 * before it.
 	 */
+
+	dma_fence_unlock_irqrestore(f, flags);
 }
 
 static const struct dma_fence_ops host1x_syncpt_fence_ops = {
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index c8e4d5a61d72..e6b17aa1b769 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -171,12 +171,16 @@ struct dma_fence_ops {
 	 * implementation know that there is another driver waiting on the
 	 * signal (ie. hw->sw case).
 	 *
-	 * This is called with irq's disabled, so only spinlocks which disable
-	 * IRQ's can be used in the code outside of this callback.
+	 * The callback is responsible for acquiring the fence lock if needed
+	 * using dma_fence_lock_irqsave(). This gives drivers control over their
+	 * locking strategy and allows them to minimize the critical section if
+	 * they have complex logic.
 	 *
 	 * If the fence has already passed or if some failure occurred that
 	 * makes it impossible to enable signaling, the implementation must
-	 * call dma_fence_signal_locked() before returning.
+	 * call dma_fence_signal_locked() before returning. Note that
+	 * dma_fence_signal_locked() requires the fence lock to be held, so
+	 * implementations calling it MUST acquire the lock first.
 	 *
 	 * &dma_fence.error may be set in enable_signaling before calling
 	 * dma_fence_signal_locked().
-- 
2.43.0


