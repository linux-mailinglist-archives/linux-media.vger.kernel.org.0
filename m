Return-Path: <linux-media+bounces-56095-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yK7XM8BquWmvEQIAu9opvQ
	(envelope-from <linux-media+bounces-56095-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 15:52:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B612AC649
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 15:52:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 16310304A0E4
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E9FD3E95A7;
	Tue, 17 Mar 2026 14:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gnnbeve4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CCD3E92A7
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 14:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759045; cv=none; b=RiRlAuBgwRMIvXSAn+4UmU1ApIqeWw6uyTwNEs7ctgH6s8OjzsxlOdOJRkOIYztq/tcbqRHmmXOQZNRuCi6BqEU+rdsMvJq5LHdvRuWgnGZ2dsnr5AlK7iZ4cOsXiecGNHZj/ey26/oYYgiQ6EKMqdKdsC3kSN+LQ67xwsTM7wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759045; c=relaxed/simple;
	bh=VrYkgjqVjtlvJorxvm+4GDdehKM+dOmHH4SLy1CZGgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LH/Q6Si5cJI0WDTroMaUD+sxIwQnw4SdFMBxlRR1aRdndGEDBusZUeSQvtqszMG65wxoZewz2tE0DUo3V5OxfkLMCq5dW7xhtrZWzeYC9r0wHDpgkcCJP8URxl6HavS4GKdP1nBhlZT4bs78MbpAqIBx148FsSZ00iyTcfcD2yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gnnbeve4; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43b43f5990dso1456608f8f.2
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 07:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773759041; x=1774363841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dUxNOL2IrjrQfbVkxtxChP73czQMzPEPeCmnfCZMjz8=;
        b=Gnnbeve40vjo/KeYwax1MXfuYWPtPffW5OYZsjJhH3hI5uBwqIO4dPVwYGt1+touRM
         Ao3oKZ1qN5iuDJcnjamqD6C/rs783HsmJd/Ebw3KS/jl8dxuu7BT0jvWVDV/Jtz351QN
         jHZGd7T1PPdtzk2sz8dqY4oIsrQI4kAODbaTbm2Eb0ZrWcE5+LqlW62gBZDF5lEqjiob
         oPxDxmCdtwJzABIcXioc1lhalEnFtPCld1eueGYiBjdnd5aWzGdoTstdeSXz6egP/v2I
         1m9PK3gySb+Mze8iYJpsq6z5/sLFx7QNK0NjO0Av9fwT+F1zCJOcI/mv4GMGXvIoiA7t
         HikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773759041; x=1774363841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUxNOL2IrjrQfbVkxtxChP73czQMzPEPeCmnfCZMjz8=;
        b=jB4ooVJSHbN6Tuj8QPxb5S2KeMz46r0AdAudZwPv++vtWEF1jJO0fi1YfuFWKGqEaA
         I53vtqegE5b7FFYZBRdhqZkus/6udWpKOlLMieqAWq0NY7GoiEvQKTowe2w6vbd6DGYu
         xhm9mfZiamrt5IQN4RWkBcYWBjfnimMIFLJDlzYPk4rlV1hX2rNaof3Ny4izaCkmCKLQ
         hyjFMdN7EQ6yo6bxmsZbveJZjG+71I+XYEUcKZplM27ZdhChoSZ65uaXuNT4RDwgluH2
         dOAOhuA56kxx+AzmINOXnM41tiiGIJL2SRGBcKnaYcKHZn0pra1DF2eXMcVufVUPN7PT
         IghA==
X-Forwarded-Encrypted: i=1; AJvYcCXRSXmtB9lufezrt+vpTkWXozYudlZq9M9VL3KfEjE+aMrWqs3SQPdJnPy3zu0Ozky3u5AA/DQoJmeiLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLOigYz/kdeuMUZ51xo3SjAyDFSmzxeApt47o6BM2xzeJDd4uF
	LriugrgXKeYb7MIKxAjyNG0uLz2e4onViBjpAn8WM0wUonVbT3v5cfmzhmTbrg==
X-Gm-Gg: ATEYQzx+t+gaeMvliOUqnv2kS0BFn6bGl+hkoqy1ClwB7PPsAXucmOFYmhHea1SfGrC
	SDnLx4/AcbTV7cCdt2X+JG76ez94seOZKzHY5yeETXTa5/GhjtEr7DtHurk42HJ5BY7bWSzWSiv
	pCv6eyAkn+uueWhKaaTzkYrp/0Gkx/oBFCrdWYhNDNGq+Z68xab/c6++aO7rXWuczjBRVHN4UkY
	tZ/aaMui2nAsYn/Wj8Tyw+TT+qzHF6VvRh0zokVk48/ndSQW7dNRf2T3TPRAVV8j9atNXbeUm6E
	/DKVjw+Is5Egnhq8dwI0sg/LLeh/VVKw+dhbli+38zzgsiRP+d7bGUtSoXAHASktmYq6qbaZWvF
	wG9MSnIOppkTc6ZPy+2gpgra2SCQzMLUJFza+16PFArWEOpcmtfrK9ybfh2552wWSivglWam1hQ
	aHXojv0BIoBjvc8ETAFxfb76WgddgrmnCKlRc=
X-Received: by 2002:a5d:5d13:0:b0:439:a95b:3c43 with SMTP id ffacd0b85a97d-43a04d86498mr29811262f8f.21.1773759041130;
        Tue, 17 Mar 2026 07:50:41 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1570:2300:d8a4:3e2d:eba7:95e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2186e3sm57315469f8f.26.2026.03.17.07.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:50:40 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: tursulin@ursulin.net,
	sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf/dma_fence_array: remove unused functionality
Date: Tue, 17 Mar 2026 15:50:39 +0100
Message-ID: <20260317145039.2418-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-56095-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 91B612AC649
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Amdgpu was the only user of the signal on any feature and we dropped
that use case recently, so we can remove that functionality again.

This allows to simplfy the dma_fence_array code a lot and saves us from
the need to install a callback on all fences at the same time.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-array.c             | 133 +++++++-----------
 drivers/dma-buf/dma-fence-unwrap.c            |   3 +-
 drivers/dma-buf/dma-resv.c                    |   3 +-
 drivers/dma-buf/st-dma-fence-unwrap.c         |   2 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   3 +-
 drivers/gpu/drm/xe/xe_sync.c                  |   2 +-
 drivers/gpu/drm/xe/xe_vm.c                    |   4 +-
 include/linux/dma-fence-array.h               |  28 +---
 8 files changed, 63 insertions(+), 115 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 089f69469524..0d54bf2e47ba 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -42,97 +42,71 @@ static void dma_fence_array_clear_pending_error(struct dma_fence_array *array)
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
-
-	dma_fence_signal(&array->base);
-	dma_fence_put(&array->base);
+	irq_work_queue(&array->work);
 }
 
-static void dma_fence_array_cb_func(struct dma_fence *f,
-				    struct dma_fence_cb *cb)
+static void irq_dma_fence_array_work(struct irq_work *wrk)
 {
-	struct dma_fence_array_cb *array_cb =
-		container_of(cb, struct dma_fence_array_cb, cb);
-	struct dma_fence_array *array = array_cb->array;
+	struct dma_fence_array *array = container_of(wrk, typeof(*array), work);
 
-	dma_fence_array_set_pending_error(array, f->error);
+	while (array->num_pending--) {
+		struct dma_fence *f = array->fences[array->num_pending];
 
-	if (atomic_dec_and_test(&array->num_pending))
-		irq_work_queue(&array->work);
-	else
-		dma_fence_put(&array->base);
+		if (!dma_fence_add_callback(f, &array->callback,
+					    dma_fence_array_cb_func))
+			return;
+
+		dma_fence_array_set_pending_error(array, f->error);
+	}
+
+	dma_fence_signal(&array->base);
+	dma_fence_put(&array->base);
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
+	irq_dma_fence_array_work(&array->work);
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
+	 * Reading num_pending is just an optimization, it is perfectly
+	 * acceptable to have a stale value for it.
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
@@ -171,15 +145,12 @@ EXPORT_SYMBOL(dma_fence_array_ops);
 
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
 
@@ -190,21 +161,22 @@ EXPORT_SYMBOL(dma_fence_array_alloc);
  * @fences:		[in]	array containing the fences
  * @context:		[in]	fence context to use
  * @seqno:		[in]	sequence number to use
- * @signal_on_any:	[in]	signal on any fence in the array
  *
  * Implementation of @dma_fence_array_create without allocation. Useful to init
  * a preallocated dma fence array in the path of reclaim or dma fence signaling.
  */
 void dma_fence_array_init(struct dma_fence_array *array,
 			  int num_fences, struct dma_fence **fences,
-			  u64 context, unsigned seqno,
-			  bool signal_on_any)
+			  u64 context, unsigned seqno)
 {
 	static struct lock_class_key dma_fence_array_lock_key;
 
 	WARN_ON(!num_fences || !fences);
 
 	array->num_fences = num_fences;
+	array->num_pending = num_fences;
+	array->fences = fences;
+	array->base.error = PENDING_ERROR;
 
 	dma_fence_init(&array->base, &dma_fence_array_ops, NULL, context,
 		       seqno);
@@ -222,11 +194,6 @@ void dma_fence_array_init(struct dma_fence_array *array,
 	 */
 	lockdep_set_class(&array->base.inline_lock, &dma_fence_array_lock_key);
 
-	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
-	array->fences = fences;
-
-	array->base.error = PENDING_ERROR;
-
 	/*
 	 * dma_fence_array objects should never contain any other fence
 	 * containers or otherwise we run into recursion and potential kernel
@@ -249,7 +216,6 @@ EXPORT_SYMBOL(dma_fence_array_init);
  * @fences:		[in]	array containing the fences
  * @context:		[in]	fence context to use
  * @seqno:		[in]	sequence number to use
- * @signal_on_any:	[in]	signal on any fence in the array
  *
  * Allocate a dma_fence_array object and initialize the base fence with
  * dma_fence_init().
@@ -264,17 +230,16 @@ EXPORT_SYMBOL(dma_fence_array_init);
  */
 struct dma_fence_array *dma_fence_array_create(int num_fences,
 					       struct dma_fence **fences,
-					       u64 context, unsigned seqno,
-					       bool signal_on_any)
+					       u64 context, unsigned seqno)
 {
 	struct dma_fence_array *array;
 
-	array = dma_fence_array_alloc(num_fences);
+	array = dma_fence_array_alloc();
 	if (!array)
 		return NULL;
 
 	dma_fence_array_init(array, num_fences, fences,
-			     context, seqno, signal_on_any);
+			     context, seqno);
 
 	return array;
 }
diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
index 07fe9bf45aea..53bb40e70b27 100644
--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -180,8 +180,7 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 
 	if (count > 1) {
 		result = dma_fence_array_create(count, array,
-						dma_fence_context_alloc(1),
-						1, false);
+						dma_fence_context_alloc(1), 1);
 		if (!result) {
 			for (i = 0; i < count; i++)
 				dma_fence_put(array[i]);
diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index ce9e6c04897f..39a92d9f2413 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -648,8 +648,7 @@ int dma_resv_get_singleton(struct dma_resv *obj, enum dma_resv_usage usage,
 	}
 
 	array = dma_fence_array_create(count, fences,
-				       dma_fence_context_alloc(1),
-				       1, false);
+				       dma_fence_context_alloc(1), 1);
 	if (!array) {
 		while (count--)
 			dma_fence_put(fences[count]);
diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
index 9c74195f47fd..45413666970e 100644
--- a/drivers/dma-buf/st-dma-fence-unwrap.c
+++ b/drivers/dma-buf/st-dma-fence-unwrap.c
@@ -65,7 +65,7 @@ static struct dma_fence *mock_array(unsigned int num_fences, ...)
 
 	array = dma_fence_array_create(num_fences, fences,
 				       dma_fence_context_alloc(1),
-				       1, false);
+				       1);
 	if (!array)
 		goto error_free;
 	return &array->base;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index e7918f896a26..1ac91a46d87f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -3203,8 +3203,7 @@ eb_composite_fence_create(struct i915_execbuffer *eb, int out_fence_fd)
 	fence_array = dma_fence_array_create(eb->num_batches,
 					     fences,
 					     eb->context->parallel.fence_context,
-					     eb->context->parallel.seqno++,
-					     false);
+					     eb->context->parallel.seqno++);
 	if (!fence_array) {
 		kfree(fences);
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 24d6d9af20d6..37866768d64c 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -376,7 +376,7 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
 		xe_assert(vm->xe, current_fence == num_fence);
 		cf = dma_fence_array_create(num_fence, fences,
 					    dma_fence_context_alloc(1),
-					    1, false);
+					    1);
 		if (!cf)
 			goto err_out;
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 548b0769b3ef..b916a9d90104 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3196,7 +3196,7 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 		goto err_trace;
 	}
 
-	cf = dma_fence_array_alloc(n_fence);
+	cf = dma_fence_array_alloc();
 	if (!cf) {
 		fence = ERR_PTR(-ENOMEM);
 		goto err_out;
@@ -3240,7 +3240,7 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 
 	xe_assert(vm->xe, current_fence == n_fence);
 	dma_fence_array_init(cf, n_fence, fences, dma_fence_context_alloc(1),
-			     1, false);
+			     1);
 	fence = &cf->base;
 
 	for_each_tile(tile, vm->xe, id) {
diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index 370b3d2bba37..3ee55c0e2fa4 100644
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
@@ -78,16 +67,13 @@ to_dma_fence_array(struct dma_fence *fence)
 	for (index = 0, fence = dma_fence_array_first(head); fence;	\
 	     ++(index), fence = dma_fence_array_next(head, index))
 
-struct dma_fence_array *dma_fence_array_alloc(int num_fences);
+struct dma_fence_array *dma_fence_array_alloc(void);
 void dma_fence_array_init(struct dma_fence_array *array,
 			  int num_fences, struct dma_fence **fences,
-			  u64 context, unsigned seqno,
-			  bool signal_on_any);
-
+			  u64 context, unsigned seqno);
 struct dma_fence_array *dma_fence_array_create(int num_fences,
 					       struct dma_fence **fences,
-					       u64 context, unsigned seqno,
-					       bool signal_on_any);
+					       u64 context, unsigned seqno);
 
 bool dma_fence_match_context(struct dma_fence *fence, u64 context);
 
-- 
2.43.0


