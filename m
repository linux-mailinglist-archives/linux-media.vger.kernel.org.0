Return-Path: <linux-media+bounces-59303-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDwTK0Gj6GngOAIAu9opvQ
	(envelope-from <linux-media+bounces-59303-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 12:30:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B21A444B77
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 12:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0BBA3301B908
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 10:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31BD366061;
	Wed, 22 Apr 2026 10:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVzK5mAS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAE9346AE1
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 10:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776853817; cv=none; b=Hz6ka54/IaZXHnTg38DQyGAKvtUGKar8pc3JAudvbB9lZmn6UWfaU/RN3X2GLlLIbsfsqvZkoDOWrY7qBblxxiTFuw8+oqRpzeGLe2SyN7KwkGmTEeUK0EetHCm71Hgq+Ey6FgqG6psXzK+5rd/Pe/Ubvc/RMjMAxBvs5rWV5Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776853817; c=relaxed/simple;
	bh=J2P2kkQQ62L18Z+/1Rs2V9e3LdVbRljw/2o9GlGlyRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PUZoSQEJf/XqVeXH0gsvj/VMT07PrMwXzfld06M2jot/NGIoZll/7se8R119fqqYs0dfHbotJDQX4js9n++OisOPfj5c3PhZh3zxreRtTGla5/yWqoYKyUnBklrRREbBxwe8rn/X75lsh7baXx0tcntTEWqE1tFGXGsBXKIy6zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVzK5mAS; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-441209fb77eso1127288f8f.1
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 03:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776853814; x=1777458614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u5EkC/29S44h/d7Ni2SqoG2DCC3TxCGRvqnl3YG/8w8=;
        b=LVzK5mAST8JqOjPy5a3TOLoV3+sMqn1IiejMM/wUvZjEwJBXFym7rv1d1CNnjPNRV0
         4e6BLRb64kgtzxYtOwU8fLuecra5WvCpbDTJXOq7FhQuNNlx7FQY3dCqivdGnlsLfceh
         fjbfoZeStAE764HwdjcZ9rHB11ojSdH0lzo4vN9Sk+PDgBbRe5aC2VOt09paAbCw0rlU
         WRje+i4lkE7/23XeDqxpUhJPexMrfFslxbnYRC/ivpyOb9n7qidlnCjtU8cP3i78BqrV
         /adbHuxbbyFqGJUmj+2aP4zj8T9qi30qmRBUtQGBLPLkPc3efuFFRstcVF5N6U0Yf8Sk
         rE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776853814; x=1777458614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5EkC/29S44h/d7Ni2SqoG2DCC3TxCGRvqnl3YG/8w8=;
        b=iJ8hntgtDb/mHgaddMq0OKDNNgtiDAACDh4JixR9oJdMsMCZ+L6d9y1X6zuGfcshJa
         7pkmrxW8+qAzl6Am2ce7zvMX98guLgBWCOBpyDwwTqkM8eB8xylJ6pcQZVtRyRnQYHwA
         ZtHuiubeTboYuCGmOB59NxBrmQ41FqzuXpPwM7J21Z2G7UToK3Soe4htwaKlqiBMQIEf
         rqfr4nt90i7GdowCPAF40HXUFyCaRFZIzzRSYXANVTG5DiDE+GGakBeWvg/aZSwAppcM
         TJswBcOm0KGu5WFt/SdSRiwt9jWB24Ug7gIvBt05mmR2cdkTyzgZaWNmUmH8wIhHhhmP
         /TKw==
X-Forwarded-Encrypted: i=1; AFNElJ/FoXEHOl/8MfLdPEzkCdYIKF8wDvSA76gf/daKNtKQiUp9Pq8t7b8wWp8LrK/iChOyIVJ6A7dyCunXwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5foqm0qZ5ZdIKoU/q4oLNBcvHW618ajvEAmjARC30ZP/TUoiG
	dUaxuqpYaZDUdKpIhx667abEttmB0b3j1WHhAP4ebIiCHawc9cUKhYff
X-Gm-Gg: AeBDieut5yhlE7rJ8/jdqyjVbIZlZmgZ+ZFaDMsGxMJEtDdCo3zYAKA1OhhyaO7UcHL
	hFt70v6zKxu5Wwz5fa77oXN8k7i9Z5Jlw0/oh3LgbQpnYn2G5DJzUDn/8Hx/Ck9p+14cw4OBvIg
	ALZpP7Pkh+V5k0zgbCc6LAw2qho3vgaRRBYGbQV75Ls3ig1q9BygtBZmO3x7IQ7SG0RfZO2+JBg
	DyX9KaCgrSBxmuHP/sPEoirC8SXv7W2dxNGw9FGzMIGMlGgYmlAzDkERrXBaJfJdWrnZFi/dLs6
	nmFMTCGjaJwObjkQjV0rUKLJt0y0QDtC8Xe0YuHAlmC8GjlmZ2tomReDkqUIOPffpQ1z7W7dAGS
	LqcAwOK4rrQ5HN1GKUjAeq/KdVzknm2Ra3kAyjUNPzQ8YFYM/s2fP2hCzINxm2lnaVb5x1WhLxK
	szIDJwrKicgAjhoMti09Sm1iGIdB0P6PqNpwREQ4sfzFbsvQ==
X-Received: by 2002:a05:6000:40da:b0:43d:1df7:e3af with SMTP id ffacd0b85a97d-43fe4088b01mr33049560f8f.22.1776853813543;
        Wed, 22 Apr 2026 03:30:13 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15c7:5100:eecf:fda8:2b8:432b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4daf2sm43439037f8f.33.2026.04.22.03.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 03:30:12 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: tursulin@ursulin.net,
	sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/2] dma-buf/dma_fence_array: remove unused functionality v3
Date: Wed, 22 Apr 2026 12:30:10 +0200
Message-ID: <20260422103012.1647-1-christian.koenig@amd.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-59303-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 2B21A444B77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Amdgpu was the only user of the signal on any feature and we dropped
that use case recently, so we can remove that functionality.

v2: update num_pending only after the fence is signaled
v3: separate out simplifying dma_fence_array implementation

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-array.c              | 13 ++++---------
 drivers/dma-buf/dma-fence-unwrap.c             |  3 +--
 drivers/dma-buf/dma-resv.c                     |  3 +--
 drivers/dma-buf/st-dma-fence-unwrap.c          |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c |  3 +--
 drivers/gpu/drm/xe/xe_sync.c                   |  2 +-
 drivers/gpu/drm/xe/xe_vm.c                     |  4 ++--
 include/linux/dma-fence-array.h                |  6 ++----
 8 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 089f69469524..5e10e8df372f 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -190,15 +190,13 @@ EXPORT_SYMBOL(dma_fence_array_alloc);
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
 
@@ -222,7 +220,7 @@ void dma_fence_array_init(struct dma_fence_array *array,
 	 */
 	lockdep_set_class(&array->base.inline_lock, &dma_fence_array_lock_key);
 
-	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
+	atomic_set(&array->num_pending, num_fences);
 	array->fences = fences;
 
 	array->base.error = PENDING_ERROR;
@@ -249,7 +247,6 @@ EXPORT_SYMBOL(dma_fence_array_init);
  * @fences:		[in]	array containing the fences
  * @context:		[in]	fence context to use
  * @seqno:		[in]	sequence number to use
- * @signal_on_any:	[in]	signal on any fence in the array
  *
  * Allocate a dma_fence_array object and initialize the base fence with
  * dma_fence_init().
@@ -264,8 +261,7 @@ EXPORT_SYMBOL(dma_fence_array_init);
  */
 struct dma_fence_array *dma_fence_array_create(int num_fences,
 					       struct dma_fence **fences,
-					       u64 context, unsigned seqno,
-					       bool signal_on_any)
+					       u64 context, unsigned seqno)
 {
 	struct dma_fence_array *array;
 
@@ -273,8 +269,7 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 	if (!array)
 		return NULL;
 
-	dma_fence_array_init(array, num_fences, fences,
-			     context, seqno, signal_on_any);
+	dma_fence_array_init(array, num_fences, fences, context, seqno);
 
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
index 51c87869b7b8..4e7ee25372ba 100644
--- a/drivers/dma-buf/st-dma-fence-unwrap.c
+++ b/drivers/dma-buf/st-dma-fence-unwrap.c
@@ -64,7 +64,7 @@ static struct dma_fence *mock_array(unsigned int num_fences, ...)
 
 	array = dma_fence_array_create(num_fences, fences,
 				       dma_fence_context_alloc(1),
-				       1, false);
+				       1);
 	if (!array)
 		goto error_free;
 	return &array->base;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 942f4eed817f..4a1a9031f9db 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -3205,8 +3205,7 @@ eb_composite_fence_create(struct i915_execbuffer *eb, int out_fence_fd)
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
index 56e2db50bb36..8f472911469d 100644
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
@@ -3414,7 +3414,7 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 
 	xe_assert(vm->xe, current_fence == n_fence);
 	dma_fence_array_init(cf, n_fence, fences, dma_fence_context_alloc(1),
-			     1, false);
+			     1);
 	fence = &cf->base;
 
 	for_each_tile(tile, vm->xe, id) {
diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index 370b3d2bba37..1b1d87579c38 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -81,13 +81,11 @@ to_dma_fence_array(struct dma_fence *fence)
 struct dma_fence_array *dma_fence_array_alloc(int num_fences);
 void dma_fence_array_init(struct dma_fence_array *array,
 			  int num_fences, struct dma_fence **fences,
-			  u64 context, unsigned seqno,
-			  bool signal_on_any);
+			  u64 context, unsigned seqno);
 
 struct dma_fence_array *dma_fence_array_create(int num_fences,
 					       struct dma_fence **fences,
-					       u64 context, unsigned seqno,
-					       bool signal_on_any);
+					       u64 context, unsigned seqno);
 
 bool dma_fence_match_context(struct dma_fence *fence, u64 context);
 
-- 
2.43.0


