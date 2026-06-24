Return-Path: <linux-media+bounces-65556-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vGbLNcvNO2qKdQgAu9opvQ
	(envelope-from <linux-media+bounces-65556-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:30:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2B66BE1BD
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:30:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ICxgkO9+;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65556-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65556-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DB7BA3027B75
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81AE93AC0C2;
	Wed, 24 Jun 2026 12:29:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6EF3AB47E
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 12:29:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782304172; cv=none; b=lLvQYHrxYOq7eDEDlFLEcmCl68WL1KZ1CBdhfgP4+OWF13cy5LY1lELAVZUic+aBbsHm7o6JbkARXp/3n+41AWO94an3Hd69wraCTLZuNOUIwz9x4RnaYsogz/IAQmzGUNnp6p5mj0GrUlRX36kS8uAHEtNj3v5qWtI0yKNZ7rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782304172; c=relaxed/simple;
	bh=uLuhqYNS0Xw9xczDXUkX6H5oJzjbylQ4FOmoHGva7lM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PPFTyfdqLV6Xi7/PUR9Es7xU59CIUdDU/rCbKRd+gA5av7hWZ3cdQhEyKO/zS6b5tvzzqZjsOzt+XMODNXFCf7yLqk5od/EcHkZQ1T/ZPkgOAguXhbI2WdrGvFkjVWru1bWYQiI1T7drxyA9SmGVUCQIkIHnbBEoTcI2zXc5o4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICxgkO9+; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b64c8311so12335835e9.3
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 05:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782304167; x=1782908967; darn=vger.kernel.org;
        h=content-transfer-encoding:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OoP6OwmVXvPFq532XbkIlEP1pYXalKnskygbXMI7MIQ=;
        b=ICxgkO9+zi6fA9dtEMci5CFXG+NQJO0Dsz5gDpoEFdVwnmim7EXYlZTEHfcvBsCyFp
         kU5NQNBoV2twZ7quSxjoOsfXU5T3AD7W1DqZXPisYJJ5j4BNfyd3UxP1LkNAwuZD1S4J
         qqqRri5AtV+lXlNbqbv32TA+aF8+tBWOo3P951xsoI3kTgcXoJkeyba+x2Uqy5FQHjiN
         WVI2GpntTxQXnuyPJd1K8xBPwl2OZq75vo7wa3KACESxxSNoqtH40NapQKHiR0uWr6bS
         2f3t8AhyXt8ab3WJaeFNvtoH7T+tguKlyi7eNPMOCDPWwfpCZpYkqGm2+tWjzU3FtE5W
         M0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782304167; x=1782908967;
        h=content-transfer-encoding:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OoP6OwmVXvPFq532XbkIlEP1pYXalKnskygbXMI7MIQ=;
        b=sv2TQBbICZ2YiHGtCXkcOYyvyVzAkbsTXeuiESw4xmnppQVDg6sp1YsMyJ4iD1Gsk5
         ii9ZSDqcF7RjOoUtwtI4lxc4YbXbsfTcR3ba/oPEHWJSQj1vBY++rXM5FfIbJjAFFZ6D
         q3WUcclXjXOIWb0yP5Or+1kLEZfe9c9SohtpfFu+fpG9HbAYs1+JgijElPGgtpRs6ijo
         2TM8vt6cisTRlIfRO+Cpkez9IlCkzvjYknE4qrkX9rkJ2nc1NkhZNqf4CbBQCILx4CVf
         1CtEPW/lgDYlFc1tUtrikx4IfWad/40Zlf9YvhripAshIuOPwV/dHOHqmoXD9Fjxkg6d
         +TBA==
X-Forwarded-Encrypted: i=1; AFNElJ//EK5CtpbSYwaVZTAjLvVD0yNV81zOAGDArjT/fibNhp+ZzjbeM5GtM5Ytrm9Ows0cPGjK3oaF/YIFgA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpf5h1FOZ6hdidaxZ5tGYz0dDdKJqfhOTbpbEG461w3Y8k+P/C
	u57qGnY0ouJH8bJRrVXwAY1OMc1CFkNzBumXczWg71ecjgCWuO70tbmQ
X-Gm-Gg: AfdE7ckkSbRVjyuUa7T0PB1hUz1rrF60kPp6MTmx8eVNbiUYO3HP8BaKhfgJPz26UJx
	aKzJzTGbTC+djCXbJ4FkhOEHt3JsJfq0SpFjMgcT8tgv81Y/QyG9ZnCdqQzUw7mrz5Lp5EkFdKE
	NLY8od1Xot4wh/oJLSHCGxXbcfSKPr5elYydqFJh2mvVHEfjhPW81KHCo7g/Nsk731e0Bs/h9SL
	cwwe2InZSyU4fXMc33bn3gz5S+EKAOzB8qJVeKcA5gSyDD+nqKtsSRNEGegDH0MiOMEwVmW/UsF
	D23FpmvR/9CUe1VbSchgMA+A0ZTD2ryfnAZ+dKHIAA2ygzUORSp/RuGbGuU0iu91/C0C62VSf+L
	nJ83G/4IG3cDz7FqziEYZIATCglJixZ6QHLhAb4VjzWEvtdJENUHspZANY/g4cJ15BWRCSvYzJA
	tnLQyrKQtG5zUYfPLKPjAOX4PaQBPES1SFEfgC
X-Received: by 2002:a05:600c:4f93:b0:492:455e:a161 with SMTP id 5b1f17b1804b1-4926086d0e8mr44185175e9.20.1782304167138;
        Wed, 24 Jun 2026 05:29:27 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:157e:3500:2be7:1a89:41c5:9239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c9787dddbsm3896530f8f.3.2026.06.24.05.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 05:29:26 -0700 (PDT)
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
Subject: [PATCH 08/10] dma-buf: remove signaling from dma_fence_is_signaled()
Date: Wed, 24 Jun 2026 13:13:32 +0200
Message-ID: <20260624122917.2483-9-christian.koenig@amd.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65556-lists,linux-media=lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:tvrtko.ursulin@igalia.com,m:dakr@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,amd.com:replyto,amd.com:email,amd.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA2B66BE1BD

Rename the dma_fence_ops.signaled callback into check_signaled and move
calling dma_fence_signal() into the actual drivers.

This way backends can do cleanup after calling dma_fence_signal().

For example it might be necessary to remove items from linked lists
and/or drop additional references, start work items etc...

It also gives backends a clean point to know when all registered callbacks are
finished.

No intended functional change.

Assisted-by: Claude Sonet 4
Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-array.c             | 10 +++----
 drivers/dma-buf/dma-fence-chain.c             | 16 +++++++-----
 drivers/dma-buf/sw_sync.c                     |  9 ++++---
 .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   |  8 +++---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c         |  7 ++---
 drivers/gpu/drm/i915/i915_request.c           |  7 ++---
 drivers/gpu/drm/msm/msm_fence.c               |  8 +++---
 drivers/gpu/drm/nouveau/nouveau_fence.c       | 12 +++++----
 drivers/gpu/drm/radeon/radeon_fence.c         |  8 +++---
 drivers/gpu/drm/vc4/vc4_fence.c               |  7 ++---
 drivers/gpu/drm/virtio/virtgpu_fence.c        |  5 ++--
 drivers/gpu/drm/xe/xe_hw_fence.c              | 17 ++++++------
 include/linux/dma-fence.h                     | 26 +++++++++----------
 13 files changed, 72 insertions(+), 68 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 5e10e8df372f..49ea2ba7c460 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -100,7 +100,7 @@ static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
 	return true;
 }
 
-static bool dma_fence_array_signaled(struct dma_fence *fence)
+static void dma_fence_array_signaled(struct dma_fence *fence)
 {
 	struct dma_fence_array *array = to_dma_fence_array(fence);
 	int num_pending;
@@ -123,18 +123,18 @@ static bool dma_fence_array_signaled(struct dma_fence *fence)
 	if (test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &array->base.flags)) {
 		if (num_pending <= 0)
 			goto signal;
-		return false;
+		return;
 	}
 
 	for (i = 0; i < array->num_fences; ++i) {
 		if (dma_fence_is_signaled(array->fences[i]) && !--num_pending)
 			goto signal;
 	}
-	return false;
+	return;
 
 signal:
 	dma_fence_array_clear_pending_error(array);
-	return true;
+	dma_fence_signal(fence);
 }
 
 static void dma_fence_array_release(struct dma_fence *fence)
@@ -163,7 +163,7 @@ const struct dma_fence_ops dma_fence_array_ops = {
 	.get_driver_name = dma_fence_array_get_driver_name,
 	.get_timeline_name = dma_fence_array_get_timeline_name,
 	.enable_signaling = dma_fence_array_enable_signaling,
-	.signaled = dma_fence_array_signaled,
+	.check_signaled = dma_fence_array_signaled,
 	.release = dma_fence_array_release,
 	.set_deadline = dma_fence_array_set_deadline,
 };
diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index a588f55ea4d3..ff4f02900237 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -161,18 +161,20 @@ static bool dma_fence_chain_enable_signaling(struct dma_fence *fence)
 	return false;
 }
 
-static bool dma_fence_chain_signaled(struct dma_fence *fence)
+static void dma_fence_chain_signaled(struct dma_fence *fence)
 {
-	dma_fence_chain_for_each(fence, fence) {
-		struct dma_fence *f = dma_fence_chain_contained(fence);
+	struct dma_fence *iter = fence;
+
+	dma_fence_chain_for_each(iter, iter) {
+		struct dma_fence *f = dma_fence_chain_contained(iter);
 
 		if (!dma_fence_is_signaled(f)) {
-			dma_fence_put(fence);
-			return false;
+			dma_fence_put(iter);
+			return;
 		}
 	}
 
-	return true;
+	dma_fence_signal(fence);
 }
 
 static void dma_fence_chain_release(struct dma_fence *fence)
@@ -221,7 +223,7 @@ const struct dma_fence_ops dma_fence_chain_ops = {
 	.get_driver_name = dma_fence_chain_get_driver_name,
 	.get_timeline_name = dma_fence_chain_get_timeline_name,
 	.enable_signaling = dma_fence_chain_enable_signaling,
-	.signaled = dma_fence_chain_signaled,
+	.check_signaled = dma_fence_chain_signaled,
 	.release = dma_fence_chain_release,
 	.set_deadline = dma_fence_chain_set_deadline,
 };
diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 243991bc1506..c3b2563f2541 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -167,11 +167,12 @@ static void timeline_fence_release(struct dma_fence *fence)
 	dma_fence_free(fence);
 }
 
-static bool timeline_fence_signaled(struct dma_fence *fence)
+static void timeline_fence_signaled(struct dma_fence *fence)
 {
 	struct sync_timeline *parent = dma_fence_parent(fence);
 
-	return !__dma_fence_is_later(fence, fence->seqno, parent->value);
+	if (!__dma_fence_is_later(fence, fence->seqno, parent->value))
+		dma_fence_signal(fence);
 }
 
 static void timeline_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
@@ -193,7 +194,7 @@ static void timeline_fence_set_deadline(struct dma_fence *fence, ktime_t deadlin
 static const struct dma_fence_ops timeline_fence_ops = {
 	.get_driver_name = timeline_fence_get_driver_name,
 	.get_timeline_name = timeline_fence_get_timeline_name,
-	.signaled = timeline_fence_signaled,
+	.check_signaled = timeline_fence_signaled,
 	.release = timeline_fence_release,
 	.set_deadline = timeline_fence_set_deadline,
 };
@@ -218,7 +219,7 @@ static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
 	obj->value += inc;
 
 	list_for_each_entry_safe(pt, next, &obj->pt_list, link) {
-		if (!timeline_fence_signaled(&pt->base))
+		if (__dma_fence_is_later(&pt->base, pt->base.seqno, obj->value))
 			break;
 
 		dma_fence_get(&pt->base);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index 2cc6552a6399..b0c904a74f7a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -311,7 +311,7 @@ static const char *amdgpu_userq_fence_get_timeline_name(struct dma_fence *f)
 	return fence->fence_drv->timeline_name;
 }
 
-static bool amdgpu_userq_fence_signaled(struct dma_fence *f)
+static void amdgpu_userq_fence_signaled(struct dma_fence *f)
 {
 	struct amdgpu_userq_fence *fence = to_amdgpu_userq_fence(f);
 	struct amdgpu_userq_fence_driver *fence_drv = fence->fence_drv;
@@ -321,9 +321,7 @@ static bool amdgpu_userq_fence_signaled(struct dma_fence *f)
 	wptr = fence->base.seqno;
 
 	if (rptr >= wptr)
-		return true;
-
-	return false;
+		dma_fence_signal(f);
 }
 
 static void amdgpu_userq_fence_free(struct rcu_head *rcu)
@@ -347,7 +345,7 @@ static void amdgpu_userq_fence_release(struct dma_fence *f)
 static const struct dma_fence_ops amdgpu_userq_fence_ops = {
 	.get_driver_name = amdgpu_userq_fence_get_driver_name,
 	.get_timeline_name = amdgpu_userq_fence_get_timeline_name,
-	.signaled = amdgpu_userq_fence_signaled,
+	.check_signaled = amdgpu_userq_fence_signaled,
 	.release = amdgpu_userq_fence_release,
 };
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index a891d4f1f843..4f19c4c2a232 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1153,11 +1153,12 @@ static const char *etnaviv_fence_get_timeline_name(struct dma_fence *fence)
 	return dev_name(f->gpu->dev);
 }
 
-static bool etnaviv_fence_signaled(struct dma_fence *fence)
+static void etnaviv_fence_signaled(struct dma_fence *fence)
 {
 	struct etnaviv_fence *f = to_etnaviv_fence(fence);
 
-	return (s32)(f->gpu->completed_fence - f->base.seqno) >= 0;
+	if ((s32)(f->gpu->completed_fence - f->base.seqno) >= 0)
+		dma_fence_signal(fence);
 }
 
 static void etnaviv_fence_release(struct dma_fence *fence)
@@ -1170,7 +1171,7 @@ static void etnaviv_fence_release(struct dma_fence *fence)
 static const struct dma_fence_ops etnaviv_fence_ops = {
 	.get_driver_name = etnaviv_fence_get_driver_name,
 	.get_timeline_name = etnaviv_fence_get_timeline_name,
-	.signaled = etnaviv_fence_signaled,
+	.check_signaled = etnaviv_fence_signaled,
 	.release = etnaviv_fence_release,
 };
 
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index d2c7b1090df0..c39a7f4b6dc7 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -87,9 +87,10 @@ static const char *i915_fence_get_timeline_name(struct dma_fence *fence)
 	return ctx->name;
 }
 
-static bool i915_fence_signaled(struct dma_fence *fence)
+static void i915_fence_signaled(struct dma_fence *fence)
 {
-	return i915_request_completed(to_request(fence));
+	if (i915_request_completed(to_request(fence)))
+		dma_fence_signal(fence);
 }
 
 static bool i915_fence_enable_signaling(struct dma_fence *fence)
@@ -176,7 +177,7 @@ const struct dma_fence_ops i915_fence_ops = {
 	.get_driver_name = i915_fence_get_driver_name,
 	.get_timeline_name = i915_fence_get_timeline_name,
 	.enable_signaling = i915_fence_enable_signaling,
-	.signaled = i915_fence_signaled,
+	.check_signaled = i915_fence_signaled,
 	.wait = i915_fence_wait,
 	.release = i915_fence_release,
 };
diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
index 3dca8e09c192..a3297d3194ca 100644
--- a/drivers/gpu/drm/msm/msm_fence.c
+++ b/drivers/gpu/drm/msm/msm_fence.c
@@ -123,10 +123,12 @@ static const char *msm_fence_get_timeline_name(struct dma_fence *fence)
 	return f->fctx->name;
 }
 
-static bool msm_fence_signaled(struct dma_fence *fence)
+static void msm_fence_signaled(struct dma_fence *fence)
 {
 	struct msm_fence *f = to_msm_fence(fence);
-	return msm_fence_completed(f->fctx, f->base.seqno);
+
+	if (msm_fence_completed(f->fctx, f->base.seqno))
+		dma_fence_signal(fence);
 }
 
 static void msm_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
@@ -167,7 +169,7 @@ static void msm_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
 static const struct dma_fence_ops msm_fence_ops = {
 	.get_driver_name = msm_fence_get_driver_name,
 	.get_timeline_name = msm_fence_get_timeline_name,
-	.signaled = msm_fence_signaled,
+	.check_signaled = msm_fence_signaled,
 	.set_deadline = msm_fence_set_deadline,
 };
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 6601ef52e301..64df1d7de460 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -455,7 +455,7 @@ static const char *nouveau_fence_get_timeline_name(struct dma_fence *f)
  * result. The drm node should still be there, so we can derive the index from
  * the fence context.
  */
-static bool nouveau_fence_is_signaled(struct dma_fence *f)
+static void nouveau_fence_is_signaled(struct dma_fence *f)
 {
 	struct nouveau_fence *fence = to_nouveau_fence(f);
 	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
@@ -468,7 +468,8 @@ static bool nouveau_fence_is_signaled(struct dma_fence *f)
 		ret = (int)(fctx->read(chan) - fence->base.seqno) >= 0;
 	rcu_read_unlock();
 
-	return ret;
+	if (ret)
+		dma_fence_signal(f);
 }
 
 static bool nouveau_fence_no_signaling(struct dma_fence *f)
@@ -486,7 +487,8 @@ static bool nouveau_fence_no_signaling(struct dma_fence *f)
 	 * being able to enable signaling. It will still get signaled eventually,
 	 * just not right away.
 	 */
-	if (nouveau_fence_is_signaled(f)) {
+	nouveau_fence_is_signaled(f);
+	if (dma_fence_test_signaled_flag(f)) {
 		list_del(&fence->head);
 
 		dma_fence_put(&fence->base);
@@ -509,7 +511,7 @@ static const struct dma_fence_ops nouveau_fence_ops_legacy = {
 	.get_driver_name = nouveau_fence_get_get_driver_name,
 	.get_timeline_name = nouveau_fence_get_timeline_name,
 	.enable_signaling = nouveau_fence_no_signaling,
-	.signaled = nouveau_fence_is_signaled,
+	.check_signaled = nouveau_fence_is_signaled,
 	.wait = nouveau_fence_wait_legacy,
 	.release = nouveau_fence_release
 };
@@ -536,6 +538,6 @@ static const struct dma_fence_ops nouveau_fence_ops_uevent = {
 	.get_driver_name = nouveau_fence_get_get_driver_name,
 	.get_timeline_name = nouveau_fence_get_timeline_name,
 	.enable_signaling = nouveau_fence_enable_signaling,
-	.signaled = nouveau_fence_is_signaled,
+	.check_signaled = nouveau_fence_is_signaled,
 	.release = nouveau_fence_release
 };
diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/radeon/radeon_fence.c
index 02a40e4750c7..45f01ebe5a78 100644
--- a/drivers/gpu/drm/radeon/radeon_fence.c
+++ b/drivers/gpu/drm/radeon/radeon_fence.c
@@ -350,7 +350,7 @@ static bool radeon_fence_seq_signaled(struct radeon_device *rdev,
 	return false;
 }
 
-static bool radeon_fence_is_signaled(struct dma_fence *f)
+static void radeon_fence_is_signaled(struct dma_fence *f)
 {
 	struct radeon_fence *fence = to_radeon_fence(f);
 	struct radeon_device *rdev = fence->rdev;
@@ -358,9 +358,7 @@ static bool radeon_fence_is_signaled(struct dma_fence *f)
 	u64 seq = fence->seq;
 
 	if (atomic64_read(&rdev->fence_drv[ring].last_seq) >= seq)
-		return true;
-
-	return false;
+		dma_fence_signal(f);
 }
 
 /**
@@ -1046,7 +1044,7 @@ const struct dma_fence_ops radeon_fence_ops = {
 	.get_driver_name = radeon_fence_get_driver_name,
 	.get_timeline_name = radeon_fence_get_timeline_name,
 	.enable_signaling = radeon_fence_enable_signaling,
-	.signaled = radeon_fence_is_signaled,
+	.check_signaled = radeon_fence_is_signaled,
 	.wait = radeon_fence_default_wait,
 	.release = NULL,
 };
diff --git a/drivers/gpu/drm/vc4/vc4_fence.c b/drivers/gpu/drm/vc4/vc4_fence.c
index 580214e2158c..3db2588906ac 100644
--- a/drivers/gpu/drm/vc4/vc4_fence.c
+++ b/drivers/gpu/drm/vc4/vc4_fence.c
@@ -33,16 +33,17 @@ static const char *vc4_fence_get_timeline_name(struct dma_fence *fence)
 	return "vc4-v3d";
 }
 
-static bool vc4_fence_signaled(struct dma_fence *fence)
+static void vc4_fence_signaled(struct dma_fence *fence)
 {
 	struct vc4_fence *f = to_vc4_fence(fence);
 	struct vc4_dev *vc4 = to_vc4_dev(f->dev);
 
-	return vc4->finished_seqno >= f->seqno;
+	if (vc4->finished_seqno >= f->seqno)
+		dma_fence_signal(fence);
 }
 
 const struct dma_fence_ops vc4_fence_ops = {
 	.get_driver_name = vc4_fence_get_driver_name,
 	.get_timeline_name = vc4_fence_get_timeline_name,
-	.signaled = vc4_fence_signaled,
+	.check_signaled = vc4_fence_signaled,
 };
diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index c3e66ef2133a..2118de27bd14 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -40,19 +40,18 @@ static const char *virtio_gpu_get_timeline_name(struct dma_fence *f)
 	return "controlq";
 }
 
-static bool virtio_gpu_fence_signaled(struct dma_fence *f)
+static void virtio_gpu_fence_signaled(struct dma_fence *f)
 {
 	/* leaked fence outside driver before completing
 	 * initialization with virtio_gpu_fence_emit.
 	 */
 	WARN_ON_ONCE(f->seqno == 0);
-	return false;
 }
 
 static const struct dma_fence_ops virtio_gpu_fence_ops = {
 	.get_driver_name     = virtio_gpu_get_driver_name,
 	.get_timeline_name   = virtio_gpu_get_timeline_name,
-	.signaled            = virtio_gpu_fence_signaled,
+	.check_signaled      = virtio_gpu_fence_signaled,
 };
 
 struct virtio_gpu_fence *virtio_gpu_fence_alloc(struct virtio_gpu_device *vgdev,
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index a4e0278559b8..bda2fde0b216 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -49,14 +49,15 @@ static void fence_free(struct rcu_head *rcu)
 		kmem_cache_free(xe_hw_fence_slab, fence);
 }
 
-static bool xe_hw_fence_signaled(struct dma_fence *dma_fence)
+static void xe_hw_fence_signaled(struct dma_fence *dma_fence)
 {
 	struct xe_hw_fence *fence = to_xe_hw_fence(dma_fence);
 	struct xe_device *xe = fence->xe;
 	u32 seqno = xe_map_rd(xe, &fence->seqno_map, 0, u32);
 
-	return dma_fence->error ||
-		!__dma_fence_is_later(dma_fence, dma_fence->seqno, seqno);
+	if (dma_fence->error ||
+	    !__dma_fence_is_later(dma_fence, dma_fence->seqno, seqno))
+		dma_fence_signal(dma_fence);
 }
 
 static void hw_fence_irq_run_cb(struct irq_work *work)
@@ -72,9 +73,8 @@ static void hw_fence_irq_run_cb(struct irq_work *work)
 			struct dma_fence *dma_fence = &fence->dma;
 
 			trace_xe_hw_fence_try_signal(fence);
-			if (dma_fence_test_signaled_flag(dma_fence) ||
-			    xe_hw_fence_signaled(dma_fence)) {
-				dma_fence_signal_locked(dma_fence);
+			xe_hw_fence_signaled(dma_fence);
+			if (dma_fence_test_signaled_flag(dma_fence)) {
 				trace_xe_hw_fence_signal(fence);
 				list_del_init(&fence->irq_link);
 				dma_fence_put(dma_fence);
@@ -163,7 +163,8 @@ static bool xe_hw_fence_enable_signaling(struct dma_fence *dma_fence)
 	list_add_tail(&fence->irq_link, &irq->pending);
 
 	/* SW completed (no HW IRQ) so kick handler to signal fence */
-	if (xe_hw_fence_signaled(dma_fence))
+	xe_hw_fence_signaled(dma_fence);
+	if (dma_fence_test_signaled_flag(dma_fence))
 		xe_hw_fence_irq_run(irq);
 
 	return true;
@@ -181,7 +182,7 @@ static const struct dma_fence_ops xe_hw_fence_ops = {
 	.get_driver_name = xe_hw_fence_get_driver_name,
 	.get_timeline_name = xe_hw_fence_get_timeline_name,
 	.enable_signaling = xe_hw_fence_enable_signaling,
-	.signaled = xe_hw_fence_signaled,
+	.check_signaled = xe_hw_fence_signaled,
 	.release = xe_hw_fence_release,
 };
 
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index ad69acbea218..e93ea4ac0636 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -195,21 +195,22 @@ struct dma_fence_ops {
 	bool (*enable_signaling)(struct dma_fence *fence);
 
 	/**
-	 * @signaled:
+	 * @check_signaled:
 	 *
 	 * Peek whether the fence is signaled, as a fastpath optimization for
-	 * e.g. dma_fence_wait() or dma_fence_add_callback(). Note that this
+	 * e.g. dma_fence_wait() or dma_fence_add_callback(). If the fence is
+	 * signaled, the implementation must call dma_fence_signal(). This
 	 * callback does not need to make any guarantees beyond that a fence
-	 * once indicates as signalled must always return true from this
-	 * callback. This callback may return false even if the fence has
-	 * completed already, in this case information hasn't propogated throug
-	 * the system yet. See also dma_fence_is_signaled().
+	 * that is signaled will have dma_fence_signal() called. The callback
+	 * may be called even if the fence has already been signaled, in which
+	 * case the dma_fence_signal() call will be a no-op. See also
+	 * dma_fence_is_signaled().
 	 *
-	 * May set &dma_fence.error if returning true.
+	 * May set &dma_fence.error before calling dma_fence_signal().
 	 *
 	 * This callback is optional.
 	 */
-	bool (*signaled)(struct dma_fence *fence);
+	void (*check_signaled)(struct dma_fence *fence);
 
 	/**
 	 * @wait:
@@ -517,14 +518,11 @@ dma_fence_is_signaled(struct dma_fence *fence)
 
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
-	if (ops && ops->signaled && ops->signaled(fence)) {
-		rcu_read_unlock();
-		dma_fence_signal(fence);
-		return true;
-	}
+	if (ops && ops->check_signaled)
+		ops->check_signaled(fence);
 	rcu_read_unlock();
 
-	return false;
+	return dma_fence_test_signaled_flag(fence);
 }
 
 /**
-- 
2.43.0


