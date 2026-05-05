Return-Path: <linux-media+bounces-60400-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAMPCjnS+WlHEQMAu9opvQ
	(envelope-from <linux-media+bounces-60400-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 13:19:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1384CC6F2
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 13:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D01A3190F63
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 11:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA89D38734A;
	Tue,  5 May 2026 11:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8EEapyE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695C837BE80
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 11:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777979313; cv=none; b=eNLU0wNMyZAJ12h3gxQi8bHKksoxI6/uoNn9G2neKLgsVMYNCOLUfSiMCfZDmZskiTvkKCSjH7Llbil7UkF1UKimy7kDoRd8q6jbpcLnzTtVKSuFm62lgYLZul1wDKGKrMoFzuEGV8YiM5DHBDn4OZl7xuOmz0MUr1fV87Sz6VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777979313; c=relaxed/simple;
	bh=tJISE19yuDZr25SLnJcbdgz/QR+fUppkwVOg3moqmUI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fnqbXVjl6OaZy9p3TB/Ck6vs5+aA5H4SvSs3524Hy4BI2bOYX0pZaRYkoKiNFOcKIrvAxhmRnK4M7vsbTp3ao6ALHpMCkb6y6WzZByuUcvBrA3/BNjrLGw/77qTsPw5F7HOrvvHNOk2uUdDJVVyyZq9gckulRjqqPWHg3StgxTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8EEapyE; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so49426345e9.2
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 04:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777979310; x=1778584110; darn=vger.kernel.org;
        h=content-transfer-encoding:reply-to:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OJh5/rreI+TnE1Afk0gjFXfS1bRtahc/HBf9EXQyMQA=;
        b=a8EEapyEBjxVYhTyyGPONp+4Mix34RZd7emdso3s+gS764tGCB5m+p6nR+1nWEhpg/
         qzcp09N2OFpXgURF0s0slZk/xHo4Lo/bwc13qPVrMaupeCVCVBwMncuMTY1DwJcseu+p
         NhQ1WMrDFJBfXhXZe1Xv0qLzYIUizHUwOscn+zclo8PC2ffsVbq6a1JG5q/ivMcmy6uA
         JMoRVUd+g4qlXfwNQi/VwjORJjCsmN9y0uzeQgxWEuoOUZuRWs11GyzjosMk7kOeBpg3
         H2KzO+Lg1YKsjtf8exOeyMTv78QQ0X/YdlVrHJ0BLLOwrymuwMtRbvWVV5hCro+lhq0d
         e0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777979310; x=1778584110;
        h=content-transfer-encoding:reply-to:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJh5/rreI+TnE1Afk0gjFXfS1bRtahc/HBf9EXQyMQA=;
        b=Q6/rH4pQjCTjQcDU08HdH0J6fIpEZoeLuHchqixE5QU84BYNhq8tkdz+hSzjm9dpaw
         40nlXLCzCrP87VMbRCxTXZ++MdgjsRNXmFej6ocIFGAW+kjJNr/dnYNbr5UB7CwuxNUS
         FM+tpuQRCTSoKSSMK2rD+1Ojtv96IBRYx0hiFCK0uNEhCuCwmb7t2ZGulxn/WUBbwRZY
         Fkds+8FxMaQXlzMt9+JAe5KVX4iP/TzQCfyTFUTShP8MpUAJ2oUP9zyqn24++OVju3Tb
         PH2lozj6E0Ej02MC+F5WjD+pdvPdJvd6MLX2Sl5WAwjzVQ8TIj+vwuFIuk/IeJBrO+Jd
         KF2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8zkLtKH1y2Qji48WekVhPlfS72uARvyd83+Ra5rAwkG8cqrKart6TMHQ629yB6OWdpgxq0kuc+nJ0n4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLFh7VJlPFU+81btOahvVJtEPFrWUKk9dMY2Mgz8faQf7LkYRq
	blOe0asyF0m7NKRBfs3OVlCs3LG1yDD0le1scU1ilnfgHeEzSJbAJYjQ
X-Gm-Gg: AeBDiesMgrvp1w55iD7KXySC17yIVxJktW0haPyX/WV++5K7GcQhT13XFgBaDkGSwt7
	Lf0lNfBzFLsdSMOMgCv9+oM5C/MmaL+o2dQ3OBl7vWng7XPdWJA6uT9SQ3PYtqniFbuswkqpY6c
	TzoqI5zpxwfIA4+XeLEQW45xSVt/FteZj9iLIqInzVdQcbxamFZE1+0mt0uBiIIj+U5MfaGDSbH
	L/OFnZBuVvx08qwsU2rdHEx9xs2qGxHcI4C7rzZB0/avKTmEX8npbc7ahILf0UhP7aqIF+v61u1
	Y3SSWeBAkIoVStebHEwdOTf1QqRVJ1HVLYzyal5bLAIeSyMi2kKbayF7qZzlmY01hbwmwrmHD5k
	otjGooLv8bIOmoxYnp4L/UhOL/FxUzBfjrN1tN14pqMTfKgwqhpap2vU2vkLt/wLNy/X8KBgALa
	90B1GpNKrchZg/kT83Sl49pN2j9v8wyJGNIS8EPx9aEPZnSgY=
X-Received: by 2002:a05:600c:8b58:b0:488:9bf8:7f17 with SMTP id 5b1f17b1804b1-48d18be5b32mr41261905e9.14.1777979309457;
        Tue, 05 May 2026 04:08:29 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1504:6f00:1b6a:5e22:9c81:d5ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82307f7csm399765765e9.12.2026.05.05.04.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 04:08:28 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: tursulin@ursulin.net,
	sumit.semwal@linaro.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf/dma_fence_array: optimize handling v2
Date: Tue,  5 May 2026 13:08:27 +0200
Message-ID: <20260505110828.1574-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9F1384CC6F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60400-lists,linux-media=lfdr.de];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:replyto,amd.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	HAS_REPLYTO(0.00)[christian.koenig@amd.com]

Removing the signal on any feature allows to simplfy the dma_fence_array
code a lot and saves us from the need to install a callback on all fences
at the same time.

This results is less memory and CPU overhead.

v2: fix potential double locking pointed out by Tvrtko

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-array.c | 134 +++++++++++++-----------------
 drivers/gpu/drm/xe/xe_vm.c        |   2 +-
 include/linux/dma-fence-array.h   |  22 ++---
 3 files changed, 66 insertions(+), 92 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 5e10e8df372f..8b94c6287482 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -42,97 +42,88 @@ static void dma_fence_array_clear_pending_error(struct dma_fence_array *array)
 	cmpxchg(&array->base.error, PENDING_ERROR, 0);
 }
 
-static void irq_dma_fence_array_work(struct irq_work *wrk)
+static void dma_fence_array_cb_func(struct dma_fence *f,
+				    struct dma_fence_cb *cb)
 {
-	struct dma_fence_array *array = container_of(wrk, typeof(*array), work);
-
-	dma_fence_array_clear_pending_error(array);
+	struct dma_fence_array *array =
+		container_of(cb, struct dma_fence_array, callback);
 
-	dma_fence_signal(&array->base);
-	dma_fence_put(&array->base);
+	irq_work_queue(&array->work);
 }
 
-static void dma_fence_array_cb_func(struct dma_fence *f,
-				    struct dma_fence_cb *cb)
+static bool dma_fence_array_try_add_cb(struct dma_fence_array *array)
 {
-	struct dma_fence_array_cb *array_cb =
-		container_of(cb, struct dma_fence_array_cb, cb);
-	struct dma_fence_array *array = array_cb->array;
+	while (array->num_pending) {
+		struct dma_fence *f = array->fences[array->num_pending - 1];
 
-	dma_fence_array_set_pending_error(array, f->error);
+		if (!dma_fence_add_callback(f, &array->callback,
+					    dma_fence_array_cb_func))
+			return true;
 
-	if (atomic_dec_and_test(&array->num_pending))
-		irq_work_queue(&array->work);
-	else
+		dma_fence_array_set_pending_error(array, f->error);
+		--array->num_pending;
+	}
+	return false;
+}
+
+static void dma_fence_array_irq_work(struct irq_work *wrk)
+{
+	struct dma_fence_array *array = container_of(wrk, typeof(*array), work);
+
+	--array->num_pending;
+	if (!dma_fence_array_try_add_cb(array)) {
+		dma_fence_signal(&array->base);
 		dma_fence_put(&array->base);
+	}
 }
 
 static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
 {
 	struct dma_fence_array *array = to_dma_fence_array(fence);
-	struct dma_fence_array_cb *cb = array->callbacks;
-	unsigned i;
 
-	for (i = 0; i < array->num_fences; ++i) {
-		cb[i].array = array;
+	/*
+	 * As we may report that the fence is signaled before all
+	 * callbacks are complete, we need to take an additional
+	 * reference count on the array so that we do not free it too
+	 * early. The core fence handling will only hold the reference
+	 * until we signal the array as complete (but that is now
+	 * insufficient).
+	 */
+	dma_fence_get(&array->base);
+	if (!dma_fence_array_try_add_cb(array)) {
 		/*
-		 * As we may report that the fence is signaled before all
-		 * callbacks are complete, we need to take an additional
-		 * reference count on the array so that we do not free it too
-		 * early. The core fence handling will only hold the reference
-		 * until we signal the array as complete (but that is now
-		 * insufficient).
+		 * When all fences are already signaled we can drop the reference again
+		 * and report to the caller that the array can be signaled as well.
 		 */
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
+		dma_fence_put(&array->base);
+		return false;
 	}
-
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
@@ -171,15 +162,12 @@ EXPORT_SYMBOL(dma_fence_array_ops);
 
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
 
@@ -203,10 +191,13 @@ void dma_fence_array_init(struct dma_fence_array *array,
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
@@ -220,11 +211,6 @@ void dma_fence_array_init(struct dma_fence_array *array,
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
@@ -265,7 +251,7 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 {
 	struct dma_fence_array *array;
 
-	array = dma_fence_array_alloc(num_fences);
+	array = dma_fence_array_alloc();
 	if (!array)
 		return NULL;
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 62a87a051be7..8f472911469d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3370,7 +3370,7 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 		goto err_trace;
 	}
 
-	cf = dma_fence_array_alloc(n_fence);
+	cf = dma_fence_array_alloc();
 	if (!cf) {
 		fence = ERR_PTR(-ENOMEM);
 		goto err_out;
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


