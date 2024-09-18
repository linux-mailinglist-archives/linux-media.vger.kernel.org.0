Return-Path: <linux-media+bounces-18387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6DB97BBCA
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 13:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A137E1C21AD1
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 11:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF64418950F;
	Wed, 18 Sep 2024 11:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8bO/jiB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A3817C991
	for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 11:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726660519; cv=none; b=od0l+sGhYwesAv7Aqy4BnEymCAespmezalAXIjrTqZ9tuJheNoWS9tS7r+o1dz/ZPFzz/CyntIoCwkd4fqPmkLXDEyTCMTCjo4ckRSqKeiRP3V4b5n3e9OhfQf2PE2xD5XPGYxtPhMbZRU9iahGCGw7zwivur7xtp8Elh39tnK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726660519; c=relaxed/simple;
	bh=NJ6Wr1gGZwWB5aqUw+F+IkrdRFxA43qW+HhlgBtXAVo=;
	h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type; b=K4ZSHeKcHrJ8cgJUiErG9uaz7bSX4N89wJbjVrnH/jqKuMEDSLMrdNYnzpMtxTb2UpIo6AHbSrIEzJWP7Yd9BRTnYWoLuU3oWrloNGW/vb002yL1wdi7LbxlKN7uqqri2q5eiaZp10EdlZXJoChNpyycGLynYgoRBpRsjL7uVXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8bO/jiB; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c3d20eed0bso7620999a12.0
        for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 04:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726660515; x=1727265315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Z7RJn/OX3EE3dFLS31Zgm+/e3Z34XMTjZ23ojfB1qo=;
        b=P8bO/jiBRr12lwP2DhAT5MD0SazRrh2oaCN1ALTkutsbAPEVA8evI/3A2cqQCv315V
         6Mqqe6YBs7Ns554HdqE9cAtdryQuqdmQ8dLA/mFNg9eHzhXRGt/fD9sC9exZnvuKn3TA
         HFLcvhBhCeDnxFuB/Ia2RcIrBAnhqRnPdrFMxJf9piJRyrXmPckcFsmA6GBUnBSBtgLo
         /JExiRlJaHXaTaMSxSERUHzSd/Q5qanfVb9gpswdHvB9SVL7/KhnI5qIYhhK3WrWvjDd
         XcP1pM+wIiBTvBhdB7UKubIH6YABe5yigQTWqd6EDr8zJARxBK19GmaH9iU5SvPf+sub
         NrFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726660515; x=1727265315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Z7RJn/OX3EE3dFLS31Zgm+/e3Z34XMTjZ23ojfB1qo=;
        b=EU9uoI+9XWRapqZC3IBwkELxdmGsoKB96638xc602baEO7WrMH5qoAoIhgBAAUGrKQ
         HxOD2Jb9oFX0XGyWXHi5YE4J6LoITkSzMtZDjKIUu8woXh1nKeTAeVWe2hUVskTPwk+9
         SCOxmkUygGyKANXSU2iw8vjWNihoMON1zQy9kQoCxWfkNpBHNjU8fj3EwEcCFgW2gNm6
         h2tYfW/tGRMyzNDZuvMA/S7ok8XmEFo3zU2aWifSl3GN9Y36NaIxeH0DX6vT8DPT2A1+
         blvZ3PaITDCFRIqR8w2carKlTHfsO25d82LIyMJxBhs6BhBrhlA8CQNeTzOwgOBwS66f
         rmpg==
X-Forwarded-Encrypted: i=1; AJvYcCULdpDQafyR+tDOjYPxxCfVQBAoZ8nKAYo/7SVeL/aRZ5Yko45UElA0gFqSOrOS2+GSjTVop6lG2GZ4SA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlyHWmnt9205GwEqgeMqyi5KGnsS8Aksb22HeEMrZI0stOcPNd
	cNRSmLTha7CbBj1Rw4/3LnlhNRmPIfvpkHoUZ3KbasjWI52CuLfQ
X-Google-Smtp-Source: AGHT+IG4wFN94Yv0d+PnVl2amsN4Hf6nb3weUX0u/t36QbB7MLTU/OpMM61Hp0PIh0fhSX7L080PuQ==
X-Received: by 2002:a17:907:26c3:b0:a72:50f7:3c6f with SMTP id a640c23a62f3a-a9029432757mr2260981866b.14.1726660515060;
        Wed, 18 Sep 2024 04:55:15 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:155d:1400:17ae:e091:3b52:93d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612df563sm575281966b.151.2024.09.18.04.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 04:55:14 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	daniel@ffwll.ch,
	tursulin@ursulin.net,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/2] dma-buf/dma-fence: remove unnecessary callbacks
Date: Wed, 18 Sep 2024 13:55:12 +0200
Message-Id: <20240918115513.2716-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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
index c353029789cf..f7ce4c6b8b8e 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -178,20 +178,6 @@ static bool timeline_fence_enable_signaling(struct dma_fence *fence)
 	return true;
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
@@ -214,8 +200,6 @@ static const struct dma_fence_ops timeline_fence_ops = {
 	.enable_signaling = timeline_fence_enable_signaling,
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
index e7ad819962e3..cf91cae6e30f 100644
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


