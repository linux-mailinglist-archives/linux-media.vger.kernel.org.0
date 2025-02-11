Return-Path: <linux-media+bounces-26014-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1171A3116D
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 17:31:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81DE2162D00
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 16:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E752566CA;
	Tue, 11 Feb 2025 16:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhfUgxuK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8B7253B77
	for <linux-media@vger.kernel.org>; Tue, 11 Feb 2025 16:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291478; cv=none; b=q9j8IfQt1Ml6vh3BxDdkN04yP9gLY8vDc889h5qwVk1x/+vHv0wzGvjGgSlcku4Fa0JNNSK/wYxEgWn/D8qpliaGa3rGZxKpjvLX1yQJd66EVULv0s47wjxFV1hYl8Kd76qt4oz8iYDKorjSD8AvvGFvS/eyzTl2SmDJn4lD+7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291478; c=relaxed/simple;
	bh=/UJufU9Xxbi9+7qOGZ2QIrYxQzqG0pDjXfewSz29e5w=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QpjiW4ZgFKpYIbx5yI8ldEuaj3FB3LRZPpb8EEX1nYaAzPOWVmgbs+G5l4jIkS+yB9BRRU2oWyJJhK5mhCeheYfWnhRBrVIuWIAxGPxsxoDNQbf1zrUwE3q55GaPileJoAfNqUJ7l9cp0M0QSU1HKq/QqGjxFayHBTBCukHSl2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhfUgxuK; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5de6e26d4e4so5641252a12.1
        for <linux-media@vger.kernel.org>; Tue, 11 Feb 2025 08:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739291475; x=1739896275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6SZKMir/CCVtFZIbZW4Fj8Q80/bYL9FqnHdhMsDaITQ=;
        b=IhfUgxuKCSP8/2ogLphX6r1WWpN3bBHTiwU0Gi1v4W80WVQ8eUQaiCGt4jElxleCy5
         33czY0NiJr8Gt7BV+RjrOsInZ/fCbcP3pdhe+70jQyHLoQHBWySyZaS9e8/yy3qyNXFp
         cN51OxwG5ljjP+H3ZjmyuhgMOs8iT5FCxhK0RdCnojfTbXhpdCbtgnvx4oNPpItUgDG4
         Ge2Z4e73RRTwyHlWWDHGBG1QMumux9rYzsc6nWVu2omyOi5+XSP/DRZ8Vdr20VFmdh/G
         XwqweTthGvevQ3OcQR7tb1Z1n1W7mrVXIcPPIc1OD/Is1unuR1NMXm7o0MAKwacp2lwy
         744A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739291475; x=1739896275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6SZKMir/CCVtFZIbZW4Fj8Q80/bYL9FqnHdhMsDaITQ=;
        b=IzEgiiRvoJe9dNJq2wMvwMjZ1B4e9YwWiRdL43PgSBp2/5DbB3JwYbXeD1TnRsOgck
         rM0UCbpX/LFEb+23IVQ6wOKuBmb8jDQeeWI4OBdi/r2igfgoT7K1PdtT75EbKkviO+8i
         chbDui5bJWa5vVWFgqI2rVUKaUX/lD669mrXmHQT7aoaStJDDDprXkobyaS5zQ4zAtpb
         aFBrqCljLwcC0JOM6r4RnEinfiuE5to5qYf4bdITRPPsjCHHmJRVBU1p7P6OlXVdlw3c
         1HWod+qEw+CBu3173JRcch4Ivc2dZLPs64Dc1PZnEbneWdOKJSiytZ4oxjmQSpG/Yu8Y
         H58g==
X-Forwarded-Encrypted: i=1; AJvYcCVtXyPAy5e8SMayy6QgFqXKtJ/UAv0bKfTNW2DFwVD/0NggL/W9dKwNnQJdo++LEBwclNyT6O+U8rxcEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQfu9gWO+ltT6WjZd4AodwSNRTulXfJkBcmvllTxf3yLf4Qli+
	J+cB2EHo3CvMSVEkukaC1dMKjqpRIR1shpNrJYaRFbcygcbrMBYb
X-Gm-Gg: ASbGncvhI42uI5Xp4K0RPxBHuByli5xNQEyrTq/5FVaxy6dh8O+022N5rtkxjWWAiUs
	0/20gJfSTOKsMVFwVsaDYJE/Sq5P5yQ+V4hWVUg3gZlp1lrj8bpVJlHwQfBQtPLZN+kyruq+Aso
	rEkojCiGCxCZ6SMHxAjBtNbkrkwgKG5Whaq00VmmRh/EWaP/x7jxq3Kf8A6jIZBjhp76J15GIEb
	wlDmBtmbVJnAdI+OQqcfTYmqx6ginZF+pHJ4cqkYyNCwKEm7SX4sbjctrTNwPkqd502ewMIp4ia
	e4c7BOZ+/GZQbuyych1nUkwNNu22
X-Google-Smtp-Source: AGHT+IEpS2WYCCXVKPTuo/qumvE+XCs2EJBxozM2SlFTakSrMGFjjYts4TVIa5Yz3Yb26t4kH7nU+A==
X-Received: by 2002:a05:6402:42c8:b0:5dc:1289:7f1c with SMTP id 4fb4d7f45d1cf-5de450d6951mr20692891a12.29.1739291474370;
        Tue, 11 Feb 2025 08:31:14 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:154a:1300:5b91:7670:e404:c65a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b7ade9sm9838748a12.25.2025.02.11.08.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:31:13 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	tzimmermann@suse.de,
	simona@ffwll.ch,
	dmitry.osipenko@collabora.com,
	tvrtko.ursulin@igalia.com,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/4] dma-buf/dma-fence: remove unnecessary callbacks
Date: Tue, 11 Feb 2025 17:31:07 +0100
Message-Id: <20250211163109.12200-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211163109.12200-1-christian.koenig@amd.com>
References: <20250211163109.12200-1-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The fence_value_str and timeline_value_str callbacks were just an
unnecessary abstraction in the SW sync implementation.

The only caller of those callbacks already knew that the fence in
questions is a timeline_fence. So print the values directly instead
of using a redirection.

Additional to that remove the implementations from virtgpu and vgem.
As far as I can see those were never used in the first place.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/sw_sync.c              | 16 ----------------
 drivers/dma-buf/sync_debug.c           | 21 ++-------------------
 drivers/gpu/drm/vgem/vgem_fence.c      | 15 ---------------
 drivers/gpu/drm/virtio/virtgpu_fence.c | 16 ----------------
 include/linux/dma-fence.h              | 21 ---------------------
 5 files changed, 2 insertions(+), 87 deletions(-)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index f5905d67dedb..849280ae79a9 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -173,20 +173,6 @@ static bool timeline_fence_signaled(struct dma_fence *fence)
 	return !__dma_fence_is_later(fence->seqno, parent->value, fence->ops);
 }
 
-static void timeline_fence_value_str(struct dma_fence *fence,
-				    char *str, int size)
-{
-	snprintf(str, size, "%lld", fence->seqno);
-}
-
-static void timeline_fence_timeline_value_str(struct dma_fence *fence,
-					     char *str, int size)
-{
-	struct sync_timeline *parent = dma_fence_parent(fence);
-
-	snprintf(str, size, "%d", parent->value);
-}
-
 static void timeline_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
 {
 	struct sync_pt *pt = dma_fence_to_sync_pt(fence);
@@ -208,8 +194,6 @@ static const struct dma_fence_ops timeline_fence_ops = {
 	.get_timeline_name = timeline_fence_get_timeline_name,
 	.signaled = timeline_fence_signaled,
 	.release = timeline_fence_release,
-	.fence_value_str = timeline_fence_value_str,
-	.timeline_value_str = timeline_fence_timeline_value_str,
 	.set_deadline = timeline_fence_set_deadline,
 };
 
diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_debug.c
index 237bce21d1e7..270daae7d89a 100644
--- a/drivers/dma-buf/sync_debug.c
+++ b/drivers/dma-buf/sync_debug.c
@@ -82,25 +82,8 @@ static void sync_print_fence(struct seq_file *s,
 		seq_printf(s, "@%lld.%09ld", (s64)ts64.tv_sec, ts64.tv_nsec);
 	}
 
-	if (fence->ops->timeline_value_str &&
-		fence->ops->fence_value_str) {
-		char value[64];
-		bool success;
-
-		fence->ops->fence_value_str(fence, value, sizeof(value));
-		success = strlen(value);
-
-		if (success) {
-			seq_printf(s, ": %s", value);
-
-			fence->ops->timeline_value_str(fence, value,
-						       sizeof(value));
-
-			if (strlen(value))
-				seq_printf(s, " / %s", value);
-		}
-	}
-
+	seq_printf(s, ": %lld", fence->seqno);
+	seq_printf(s, " / %d", parent->value);
 	seq_putc(s, '\n');
 }
 
diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
index e15754178395..5298d995faa7 100644
--- a/drivers/gpu/drm/vgem/vgem_fence.c
+++ b/drivers/gpu/drm/vgem/vgem_fence.c
@@ -53,25 +53,10 @@ static void vgem_fence_release(struct dma_fence *base)
 	dma_fence_free(&fence->base);
 }
 
-static void vgem_fence_value_str(struct dma_fence *fence, char *str, int size)
-{
-	snprintf(str, size, "%llu", fence->seqno);
-}
-
-static void vgem_fence_timeline_value_str(struct dma_fence *fence, char *str,
-					  int size)
-{
-	snprintf(str, size, "%llu",
-		 dma_fence_is_signaled(fence) ? fence->seqno : 0);
-}
-
 static const struct dma_fence_ops vgem_fence_ops = {
 	.get_driver_name = vgem_fence_get_driver_name,
 	.get_timeline_name = vgem_fence_get_timeline_name,
 	.release = vgem_fence_release,
-
-	.fence_value_str = vgem_fence_value_str,
-	.timeline_value_str = vgem_fence_timeline_value_str,
 };
 
 static void vgem_fence_timeout(struct timer_list *t)
diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index f28357dbde35..44c1d8ef3c4d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -49,26 +49,10 @@ static bool virtio_gpu_fence_signaled(struct dma_fence *f)
 	return false;
 }
 
-static void virtio_gpu_fence_value_str(struct dma_fence *f, char *str, int size)
-{
-	snprintf(str, size, "[%llu, %llu]", f->context, f->seqno);
-}
-
-static void virtio_gpu_timeline_value_str(struct dma_fence *f, char *str,
-					  int size)
-{
-	struct virtio_gpu_fence *fence = to_virtio_gpu_fence(f);
-
-	snprintf(str, size, "%llu",
-		 (u64)atomic64_read(&fence->drv->last_fence_id));
-}
-
 static const struct dma_fence_ops virtio_gpu_fence_ops = {
 	.get_driver_name     = virtio_gpu_get_driver_name,
 	.get_timeline_name   = virtio_gpu_get_timeline_name,
 	.signaled            = virtio_gpu_fence_signaled,
-	.fence_value_str     = virtio_gpu_fence_value_str,
-	.timeline_value_str  = virtio_gpu_timeline_value_str,
 };
 
 struct virtio_gpu_fence *virtio_gpu_fence_alloc(struct virtio_gpu_device *vgdev,
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index e230af0d123f..8778e2d758da 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -238,27 +238,6 @@ struct dma_fence_ops {
 	 */
 	void (*release)(struct dma_fence *fence);
 
-	/**
-	 * @fence_value_str:
-	 *
-	 * Callback to fill in free-form debug info specific to this fence, like
-	 * the sequence number.
-	 *
-	 * This callback is optional.
-	 */
-	void (*fence_value_str)(struct dma_fence *fence, char *str, int size);
-
-	/**
-	 * @timeline_value_str:
-	 *
-	 * Fills in the current value of the timeline as a string, like the
-	 * sequence number. Note that the specific fence passed to this function
-	 * should not matter, drivers should only use it to look up the
-	 * corresponding timeline structures.
-	 */
-	void (*timeline_value_str)(struct dma_fence *fence,
-				   char *str, int size);
-
 	/**
 	 * @set_deadline:
 	 *
-- 
2.34.1


