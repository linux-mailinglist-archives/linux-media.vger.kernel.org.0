Return-Path: <linux-media+bounces-59304-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEhmKUej6GkaOQIAu9opvQ
	(envelope-from <linux-media+bounces-59304-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 12:30:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B09F444B7F
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 12:30:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 207C0301F48B
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 10:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25CDC346AE1;
	Wed, 22 Apr 2026 10:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eo8z4O9x"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0553634D90F
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 10:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776853817; cv=none; b=e174dehf1Xn3M/IfFD+WVOLg1aZRs90iCw9kJZ/Q6KaS/iPSDy/PxBPHHa3oUXHjNppNscTCCL9MQ5HZWAZy1DU+tyDO6c/2/b1oj1xynClMhrr4EQHJj/U4CKAcac9w6wUUuVj516h9S2GKltHbplP5kXO2zPtogS5gttbrCew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776853817; c=relaxed/simple;
	bh=cmatnVHc0PnaIK9WD4s15vRyEdenWoB5IzDIBZ78ryw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NElcApTgl/5ZmdE3sgsl+QaEZakZF1LcbOzRW2UheVbWt6RZHdFk6nf9goPxidh6Lyp+a01G+61yfsEy7UCDFoyJDIBKN+n+fTtePSPPW5CVKoXmtAuYhmITPJWgH9xdEHldemhrko2RRrE9z2vInKJGfwT/Gt+D2nna3c/K4U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eo8z4O9x; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d77f60944so4251044f8f.3
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 03:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776853814; x=1777458614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63KYhScVtjppyoQjYNb86QEpZuNNlTEDQMEwY5JRcz0=;
        b=Eo8z4O9xMbCrfUnjlMkKAIJKsjg4onmL23oxncDwjvq0PRkHyVbrPJRq2xkjltZ92v
         ldRVschRPKdLT06olGCI1Dhw/vFRV1UqzIDwO0Q3CUGdLth8H/PC9lTDKVGjowm90vHQ
         PG4QTcxZ/6glbcCB/bUzVMAKeFzycRcFdEx3YFjl/9VLx6Mv+Ar8OW3JuNVBGZdjSOE2
         60Drp/LGAw2CNJezfpRNjyX8x8k1c9tKoWjG+MNj9WuZVdOdf3V2ikFakE6Ac6ykSZp5
         kyzuBGDHycoKYSr9oxU08rmc48pTV4NLxOIi6dovhWOUc4BCcs5vcJMqZlsKGbPTLQ8+
         uHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776853814; x=1777458614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=63KYhScVtjppyoQjYNb86QEpZuNNlTEDQMEwY5JRcz0=;
        b=JRWSi/H3JNqxj+xWzeB2mvk25NOTp0d95GNZZium5cQ1CU2N6Qackf0dVtPJO0MsVK
         Xlw4zjGdhWyApOl7sMnRrqmqluAGbWkbBq2IkCPGnVC2sBnTMNaK7rj5d8MayMyH6yOb
         Hb593sJE2FWMEJqljpmzG8CKnLvAnUTjXGKBD2uNuhprFIyx3wg1B9P6e0MKpBc2dZaz
         F4mrbBCaloRbl17PCWWRF905K5GGQ00Q8ItsUY7YrH9qTKnQ37FcOcgipARerO2kQGP2
         3r2xri9Qs/gAM2bHNBKDaThoTU7ZDjM8KAGsQQ7h0lwsXo6oWUiVfysC42qokPpEC9PE
         uVaw==
X-Forwarded-Encrypted: i=1; AFNElJ+kJjE3noUA5/GBSSLdHrcQxf4feVQ2Ebi0S8MqEQCi9tTVqGBTSuotAm1aHYA+i+/GhEHG+5YSTokXAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzfWhTey7gJk1fiK8bf5yq0fXVr8tih64+bf5/KSZeSwzdFtN+
	O52jvvXk4ESBML7vr4fEPwaJs0QJRL7wayMP5buJxynYouH+e0iuARiO
X-Gm-Gg: AeBDieutRQqO7A9090up5Btd+U5cuqjEpcAqOYHscehKLcXyUyZAUDdHpQ1RRch5Yei
	Fe+7Z3+QtL4o5jyDpau5ZYcdPPDFOQE69NX9hjuWy4yAvH9zWTcpIHPzac+EGRUmtjlNQuow6CJ
	34zTDENVrTaL4TXhu6Cqyng8Qn2lfLM0Mfh9PfEc/WwHWJQuVFSQEDSc7kcsKrMJwMLS4wj7G8z
	B3sxG8Rj2w1n2lm4xex7ISYpQWCypfGnxhrS2lguqWwB1MGPlXCZsDIBxrKKSFjeuj90cK7mfEI
	dm1ehSwXdguq7w+6GMFzhlFNXNDmwn1wgTP/xOKvPY9EOvaRxNkaZ7OSMABAn6ZRdYplO3W5KgF
	ZfuxkRDbkXiEnYU9RfpkLaS1R84GmD8Rs8sMvnIH3YfKBGguMX+gx3SIc7wAiRrCIWmv2v8zxZZ
	QR8UDhBOWldpGcc4yXYuWnKOwb+ASEyussM6m2EgrJSddALQ==
X-Received: by 2002:a05:6000:2502:b0:43d:3113:6eed with SMTP id ffacd0b85a97d-43fe3dc84f4mr33871124f8f.4.1776853814292;
        Wed, 22 Apr 2026 03:30:14 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15c7:5100:eecf:fda8:2b8:432b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4daf2sm43439037f8f.33.2026.04.22.03.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 03:30:13 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: tursulin@ursulin.net,
	sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/2] dma-buf/dma_fence_array: optimize handling
Date: Wed, 22 Apr 2026 12:30:11 +0200
Message-ID: <20260422103012.1647-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260422103012.1647-1-christian.koenig@amd.com>
References: <20260422103012.1647-1-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-59304-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,amd.com:mid,amd.com:email]
X-Rspamd-Queue-Id: 3B09F444B7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Removing the signal on any feature allows to simplfy the dma_fence_array
code a lot and saves us from the need to install a callback on all fences
at the same time.

This results in less memory and CPU overhead.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-array.c | 130 +++++++++++++-----------------
 include/linux/dma-fence-array.h   |  22 ++---
 2 files changed, 59 insertions(+), 93 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 5e10e8df372f..f1b4b3296c87 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -42,97 +42,80 @@ static void dma_fence_array_clear_pending_error(struct dma_fence_array *array)
 	cmpxchg(&array->base.error, PENDING_ERROR, 0);
 }
 
-static void irq_dma_fence_array_work(struct irq_work *wrk)
+static void dma_fence_array_cb_func(struct dma_fence *f,
+				    struct dma_fence_cb *cb)
 {
-	struct dma_fence_array *array = container_of(wrk, typeof(*array), work);
+	struct dma_fence_array *array =
+		container_of(cb, struct dma_fence_array, callback);
 
-	dma_fence_array_clear_pending_error(array);
+	irq_work_queue(&array->work);
+}
+
+static void dma_fence_array_arm_cb(struct dma_fence_array *array)
+{
+	while (array->num_pending) {
+		struct dma_fence *f = array->fences[array->num_pending - 1];
+
+		if (!dma_fence_add_callback(f, &array->callback,
+					    dma_fence_array_cb_func))
+			return;
+
+		dma_fence_array_set_pending_error(array, f->error);
+		WRITE_ONCE(array->num_pending, array->num_pending - 1);
+	}
 
 	dma_fence_signal(&array->base);
 	dma_fence_put(&array->base);
 }
 
-static void dma_fence_array_cb_func(struct dma_fence *f,
-				    struct dma_fence_cb *cb)
+static void dma_fence_array_irq_work(struct irq_work *wrk)
 {
-	struct dma_fence_array_cb *array_cb =
-		container_of(cb, struct dma_fence_array_cb, cb);
-	struct dma_fence_array *array = array_cb->array;
-
-	dma_fence_array_set_pending_error(array, f->error);
+	struct dma_fence_array *array = container_of(wrk, typeof(*array), work);
 
-	if (atomic_dec_and_test(&array->num_pending))
-		irq_work_queue(&array->work);
-	else
-		dma_fence_put(&array->base);
+	WRITE_ONCE(array->num_pending, array->num_pending - 1);
+	dma_fence_array_arm_cb(array);
 }
 
 static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
 {
 	struct dma_fence_array *array = to_dma_fence_array(fence);
-	struct dma_fence_array_cb *cb = array->callbacks;
-	unsigned i;
-
-	for (i = 0; i < array->num_fences; ++i) {
-		cb[i].array = array;
-		/*
-		 * As we may report that the fence is signaled before all
-		 * callbacks are complete, we need to take an additional
-		 * reference count on the array so that we do not free it too
-		 * early. The core fence handling will only hold the reference
-		 * until we signal the array as complete (but that is now
-		 * insufficient).
-		 */
-		dma_fence_get(&array->base);
-		if (dma_fence_add_callback(array->fences[i], &cb[i].cb,
-					   dma_fence_array_cb_func)) {
-			int error = array->fences[i]->error;
-
-			dma_fence_array_set_pending_error(array, error);
-			dma_fence_put(&array->base);
-			if (atomic_dec_and_test(&array->num_pending)) {
-				dma_fence_array_clear_pending_error(array);
-				return false;
-			}
-		}
-	}
 
+	/*
+	 * As we may report that the fence is signaled before all
+	 * callbacks are complete, we need to take an additional
+	 * reference count on the array so that we do not free it too
+	 * early. The core fence handling will only hold the reference
+	 * until we signal the array as complete (but that is now
+	 * insufficient).
+	 */
+	dma_fence_get(&array->base);
+	dma_fence_array_arm_cb(array);
 	return true;
 }
 
 static bool dma_fence_array_signaled(struct dma_fence *fence)
 {
 	struct dma_fence_array *array = to_dma_fence_array(fence);
-	int num_pending;
+	int num_pending, error = 0;
 	unsigned int i;
 
 	/*
-	 * We need to read num_pending before checking the enable_signal bit
-	 * to avoid racing with the enable_signaling() implementation, which
-	 * might decrement the counter, and cause a partial check.
-	 * atomic_read_acquire() pairs with atomic_dec_and_test() in
-	 * dma_fence_array_enable_signaling()
-	 *
-	 * The !--num_pending check is here to account for the any_signaled case
-	 * if we race with enable_signaling(), that means the !num_pending check
-	 * in the is_signalling_enabled branch might be outdated (num_pending
-	 * might have been decremented), but that's fine. The user will get the
-	 * right value when testing again later.
+	 * Reading num_pending without a memory barrier here is correct since
+	 * that is only for optimization, it is perfectly acceptable to have a
+	 * stale value for it. In all other cases num_pending is accessed by a
+	 * single call chain.
 	 */
-	num_pending = atomic_read_acquire(&array->num_pending);
-	if (test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &array->base.flags)) {
-		if (num_pending <= 0)
-			goto signal;
-		return false;
-	}
+	num_pending = READ_ONCE(array->num_pending);
+	for (i = 0; i < num_pending; ++i) {
+		struct dma_fence *f = array->fences[i];
 
-	for (i = 0; i < array->num_fences; ++i) {
-		if (dma_fence_is_signaled(array->fences[i]) && !--num_pending)
-			goto signal;
-	}
-	return false;
+		if (!dma_fence_is_signaled(f))
+			return false;
 
-signal:
+		if (!error)
+			error = f->error;
+	}
+	dma_fence_array_set_pending_error(array, error);
 	dma_fence_array_clear_pending_error(array);
 	return true;
 }
@@ -171,15 +154,12 @@ EXPORT_SYMBOL(dma_fence_array_ops);
 
 /**
  * dma_fence_array_alloc - Allocate a custom fence array
- * @num_fences:		[in]	number of fences to add in the array
  *
  * Return dma fence array on success, NULL on failure
  */
-struct dma_fence_array *dma_fence_array_alloc(int num_fences)
+struct dma_fence_array *dma_fence_array_alloc(void)
 {
-	struct dma_fence_array *array;
-
-	return kzalloc_flex(*array, callbacks, num_fences);
+	return kzalloc_obj(struct dma_fence_array);
 }
 EXPORT_SYMBOL(dma_fence_array_alloc);
 
@@ -203,10 +183,13 @@ void dma_fence_array_init(struct dma_fence_array *array,
 	WARN_ON(!num_fences || !fences);
 
 	array->num_fences = num_fences;
+	array->num_pending = num_fences;
+	array->fences = fences;
+	array->base.error = PENDING_ERROR;
 
 	dma_fence_init(&array->base, &dma_fence_array_ops, NULL, context,
 		       seqno);
-	init_irq_work(&array->work, irq_dma_fence_array_work);
+	init_irq_work(&array->work, dma_fence_array_irq_work);
 
 	/*
 	 * dma_fence_array_enable_signaling() is invoked while holding
@@ -220,11 +203,6 @@ void dma_fence_array_init(struct dma_fence_array *array,
 	 */
 	lockdep_set_class(&array->base.inline_lock, &dma_fence_array_lock_key);
 
-	atomic_set(&array->num_pending, num_fences);
-	array->fences = fences;
-
-	array->base.error = PENDING_ERROR;
-
 	/*
 	 * dma_fence_array objects should never contain any other fence
 	 * containers or otherwise we run into recursion and potential kernel
@@ -265,7 +243,7 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 {
 	struct dma_fence_array *array;
 
-	array = dma_fence_array_alloc(num_fences);
+	array = dma_fence_array_alloc();
 	if (!array)
 		return NULL;
 
diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index 1b1d87579c38..3ee55c0e2fa4 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -15,16 +15,6 @@
 #include <linux/dma-fence.h>
 #include <linux/irq_work.h>
 
-/**
- * struct dma_fence_array_cb - callback helper for fence array
- * @cb: fence callback structure for signaling
- * @array: reference to the parent fence array object
- */
-struct dma_fence_array_cb {
-	struct dma_fence_cb cb;
-	struct dma_fence_array *array;
-};
-
 /**
  * struct dma_fence_array - fence to represent an array of fences
  * @base: fence base class
@@ -33,18 +23,17 @@ struct dma_fence_array_cb {
  * @num_pending: fences in the array still pending
  * @fences: array of the fences
  * @work: internal irq_work function
- * @callbacks: array of callback helpers
+ * @callback: callback structure for signaling
  */
 struct dma_fence_array {
 	struct dma_fence base;
 
-	unsigned num_fences;
-	atomic_t num_pending;
+	unsigned int num_fences;
+	unsigned int num_pending;
 	struct dma_fence **fences;
 
 	struct irq_work work;
-
-	struct dma_fence_array_cb callbacks[] __counted_by(num_fences);
+	struct dma_fence_cb callback;
 };
 
 /**
@@ -78,11 +67,10 @@ to_dma_fence_array(struct dma_fence *fence)
 	for (index = 0, fence = dma_fence_array_first(head); fence;	\
 	     ++(index), fence = dma_fence_array_next(head, index))
 
-struct dma_fence_array *dma_fence_array_alloc(int num_fences);
+struct dma_fence_array *dma_fence_array_alloc(void);
 void dma_fence_array_init(struct dma_fence_array *array,
 			  int num_fences, struct dma_fence **fences,
 			  u64 context, unsigned seqno);
-
 struct dma_fence_array *dma_fence_array_create(int num_fences,
 					       struct dma_fence **fences,
 					       u64 context, unsigned seqno);
-- 
2.43.0


