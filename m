Return-Path: <linux-media+bounces-39605-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA112B22ACC
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 16:39:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2FE73BF039
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 14:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA2E72EBBA2;
	Tue, 12 Aug 2025 14:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8Em1G54"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D8F2D8377
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 14:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755009250; cv=none; b=hias2caqzm9vbTgF7kNgSc/jdgmR8p5yLxjGCa8pTioh+iAtkNIV9Ra5625yHc32oSesfdfVEu9HpxtptQ/WEMa/RaFneOv5Oi+UNIqOyi4KxINXubN1anFymCNF73hJKHXS8q20lHzuiEWKkuzisxK20rtBa0H6EsTvbFlCUBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755009250; c=relaxed/simple;
	bh=u1JyKRZ3jTjZCHpu1bQPYyCBhVGBpBcHfMsVyfA8VGE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K9ZX/b+KKAVABVbRCAsqdbEs/lYF+nK7aP9t4iAHoWF8Xntaj058tiDk7z2Bk/wDBi9vqkBbLXWMpBgwcB0cjhtW7xSGM2HK0bAtwgEF6y8+5yZes6AO09+Uxkos0li3m/I1xL0Ke6ZA0+MQjs3V8iYY1OxMTUfTPGaaALaLU+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8Em1G54; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-458bc3ce3beso33635725e9.1
        for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 07:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755009245; x=1755614045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ie8ytEuLla3veFaeUidif5HtgJBgoIaiWwWBtQdYgU=;
        b=K8Em1G54iTOEK7LwMJnhHIdPbTUC6f8XO8XC/+jUtAcu7JxksBKJhQWmuxv6eMSUrN
         rRpMR2HfFLzfTtj/1adCqMoU8wmR+Hm84NiRKgxXXMqK3Ds68pN4CdkVq2wAULscEwpk
         EB4c0yegKgRT4IJM409gBcHGy4BwcHVvxmA4AcY7le2EVR8lXL7gy5YMih78bAS/9yt1
         05FDZXZFfOITjx3ecDR6IyKhhzHtCTEqneWHreRh8Z9TYLtc64RlcmSXLZk1nF9wrEU8
         8pOuCrvlIQn8RQ5Fp6CLx4myQLs3KDFCMKHqWYTVpqg+drCaYXZiNb825ctEiZP4udfb
         HvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755009245; x=1755614045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ie8ytEuLla3veFaeUidif5HtgJBgoIaiWwWBtQdYgU=;
        b=hOMn02gg7tQHf8rIScSVbK30zr7p4EaNQpoEDKVOMAtFVSUMNMjQXr2H3vWQB5rA97
         e5O+hxCjKUh4rdtLahQ5IU9TftXQ6GCJpvHQ0SO81KjUoyXs18Pa+WMdqOQUx+yaCWjD
         41wG94F5bUxjMkn+pL8vXnTBLA0C2G+cLuJzNmF8yc3nvj1qOPC91K1jwxgavK7BV3Gq
         pPctM6r7xV+pLcPi9cisHH1ReiP2t01GvO73Stw3E4PdtrpU83MaAtrz/fziHkYt0dPj
         MDfXXqICZb9m1K0OcutWoXhr8zkCz9g0NkOD8iAETetgu4KZMPlU7C36C4kMXr0qc9c1
         dMqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxREyIwgA2ubfO61/7c5ojZqJ4LrgB9pSwtOFKkVpg0RpER6wqrai61JVqAC7yKz4IvCT3I0ADDI8uQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtc+qAOJEGoiBXo7wIp30zvY4ZwgDniVMD2f9WrMpht07oTAaV
	+CdN11LJnKEev6R//7iXKMkdxBtxAe6b2ISFo6Y3KW8Kud85PufHOtKz
X-Gm-Gg: ASbGncvRfmFiJGXWBP6CMtnWQJcPthhclvC55Ey5sh7Rq/lqfDogl5aSfUoCAMTMtC4
	qOMpzZzr91zDH1/A9c+VHrT/Pg+QO0ndhV2ExitU2+QXUllKkOJYo8clACjLdmRJY3WWj08A8HE
	z/dlNYyWVHcjCrVvelbI31uoYsqDLTptE6uqVLhdq/OW9DU6+4qC3tBhXLASILZhHpEtsFf1Prw
	o8Pevr7p6NPq5Kbb8X9kr6IpajBi6ZV3ZXvOaGXOnnOTA5qCV2iZyOzL65/0b49OXmIp6MHjaJv
	DAXPsvO4dyb72zxQelUO8T46MfkzpPV+pD96p5CdWXajTGdzwMwtxdPJSyF9oBdxE7eRNvsnLc4
	am0R6FbUsbDmKytrHRiYXpLTntHp/zbJ4quN+iByMW+bM
X-Google-Smtp-Source: AGHT+IGXgbHfN3vs+VEYkOYnhLRddATAsfEDJ3pDVnW6g65mrXY1sdPZRJj0cMV4GaSK86Pzkfo4yQ==
X-Received: by 2002:a05:600c:4744:b0:458:bc58:850c with SMTP id 5b1f17b1804b1-45a15b05dafmr605185e9.1.1755009244569;
        Tue, 12 Aug 2025 07:34:04 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15a5:9b00:5e00:c21:21a:c15b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8f5d7deaasm23714363f8f.65.2025.08.12.07.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 07:34:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: simona.vetter@ffwll.ch,
	tvrtko.ursulin@igalia.com,
	phasta@mailbox.org,
	airlied@gmail.com,
	dakr@kernel.org,
	sumit.semwal@linaro.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org
Subject: [PATCH 2/2] dma-buf: add warning when dma_fence is signaled from IOCTL
Date: Tue, 12 Aug 2025 16:34:02 +0200
Message-ID: <20250812143402.8619-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250812143402.8619-1-christian.koenig@amd.com>
References: <20250812143402.8619-1-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Christian König <ckoenig@able.fritz.box>

We have the re-occurring problem that people try to invent a
DMA-fences implementation which signals fences based on an userspace
IOCTL.

This is well known as source of hard to track down crashes and is
documented to be an invalid approach. The problem is that it seems
to work during initial testing and only long term tests points out
why this can never work correctly.

So give at least a warning when people try to signal a fence from
task context and not from interrupts or a work item. This check is
certainly not perfect but better than nothing.

Signed-off-by: Christian König <ckoenig@able.fritz.box>
---
 drivers/dma-buf/dma-fence.c | 59 +++++++++++++++++++++++++++----------
 include/linux/dma-fence.h   |  9 ++++--
 2 files changed, 51 insertions(+), 17 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 3f78c56b58dc..2bce620eacac 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -345,33 +345,23 @@ void __dma_fence_might_wait(void)
 }
 #endif
 
-
 /**
- * dma_fence_signal_timestamp_locked - signal completion of a fence
+ * dma_fence_signal_internal - internal signal completion of a fence
  * @fence: the fence to signal
  * @timestamp: fence signal timestamp in kernel's CLOCK_MONOTONIC time domain
  *
- * Signal completion for software callbacks on a fence, this will unblock
- * dma_fence_wait() calls and run all the callbacks added with
- * dma_fence_add_callback(). Can be called multiple times, but since a fence
- * can only go from the unsignaled to the signaled state and not back, it will
- * only be effective the first time. Set the timestamp provided as the fence
- * signal timestamp.
- *
- * Unlike dma_fence_signal_timestamp(), this function must be called with
- * &dma_fence.lock held.
+ * Internal signal the dma_fence without error checking. Should *NEVER* be used
+ * by drivers or external code directly.
  *
  * Returns 0 on success and a negative error value when @fence has been
  * signalled already.
  */
-int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
-				      ktime_t timestamp)
+int dma_fence_signal_internal(struct dma_fence *fence, ktime_t timestamp)
 {
 	struct dma_fence_cb *cur, *tmp;
 	struct list_head cb_list;
 
 	lockdep_assert_held(fence->lock);
-
 	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
 				      &fence->flags)))
 		return -EINVAL;
@@ -390,7 +380,46 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 
 	return 0;
 }
-EXPORT_SYMBOL(dma_fence_signal_timestamp_locked);
+EXPORT_SYMBOL(dma_fence_signal_internal);
+
+/**
+ * dma_fence_signal_timestamp_locked - signal completion of a fence
+ * @fence: the fence to signal
+ * @timestamp: fence signal timestamp in kernel's CLOCK_MONOTONIC time domain
+ *
+ * Signal completion for software callbacks on a fence, this will unblock
+ * dma_fence_wait() calls and run all the callbacks added with
+ * dma_fence_add_callback(). Can be called multiple times, but since a fence
+ * can only go from the unsignaled to the signaled state and not back, it will
+ * only be effective the first time. Set the timestamp provided as the fence
+ * signal timestamp.
+ *
+ * Unlike dma_fence_signal_timestamp(), this function must be called with
+ * &dma_fence.lock held.
+ *
+ * Returns 0 on success and a negative error value when @fence has been
+ * signalled already.
+ */
+int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
+				      ktime_t timestamp)
+{
+	/*
+	 * We have the re-occurring problem that people try to invent a
+	 * DMA-fences implementation which signals fences based on an userspace
+	 * IOCTL.
+	 *
+	 * This is well known as source of hard to track down crashes and is
+	 * documented to be an invalid approach. The problem is that it seems
+	 * to work during initial testing and only long term tests points out
+	 * why this can never work correctly.
+	 *
+	 * So give at least a warning when people try to signal a fence from
+	 * task context and not from interrupts or a work item. This check is
+	 * certainly not perfect but better than nothing.
+	 */
+	WARN_ON_ONCE(!in_interrupt() && !current_work());
+	return dma_fence_signal_internal(fence, timestamp);
+}
 
 /**
  * dma_fence_signal_timestamp - signal completion of a fence
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 64639e104110..8dbcd66989b8 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -369,6 +369,7 @@ int dma_fence_signal_locked(struct dma_fence *fence);
 int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
 int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 				      ktime_t timestamp);
+int dma_fence_signal_internal(struct dma_fence *fence, ktime_t timestamp);
 signed long dma_fence_default_wait(struct dma_fence *fence,
 				   bool intr, signed long timeout);
 int dma_fence_add_callback(struct dma_fence *fence,
@@ -422,7 +423,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
 		return true;
 
 	if (fence->ops->signaled && fence->ops->signaled(fence)) {
-		dma_fence_signal_locked(fence);
+		dma_fence_signal_internal(fence, ktime_get());
 		return true;
 	}
 
@@ -448,11 +449,15 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
 static inline bool
 dma_fence_is_signaled(struct dma_fence *fence)
 {
+	unsigned long flags;
+
 	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 		return true;
 
 	if (fence->ops->signaled && fence->ops->signaled(fence)) {
-		dma_fence_signal(fence);
+		spin_lock_irqsave(fence->lock, flags);
+		dma_fence_signal_internal(fence, ktime_get());
+		spin_unlock_irqrestore(fence->lock, flags);
 		return true;
 	}
 
-- 
2.43.0


