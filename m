Return-Path: <linux-media+bounces-39604-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A59B22ACB
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 16:39:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A68953AB57A
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 14:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2866E2EB5DB;
	Tue, 12 Aug 2025 14:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vi9mkfpb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D3122069A
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 14:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755009249; cv=none; b=fOX3mW4LnAtmCLXlTAsu0eEXlXl+FDcSVXdzJMsdcbwqHo1JduPs4IToTezGXm1ZYHudMdEuMtfOW69DT/6+Hr5vGQ/uWmQM5UPpo7vfZuz8Ln95xCh2RZwvfK1CjSd5JLSCO+n1yUp8fHfneyjf5nJi+ZoYtl6obMJi5jMYxO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755009249; c=relaxed/simple;
	bh=tGct3kCdEi+jZQTK2YLbkv4GKiwMNxja3GiEvZGa5Fg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WJHHeHyBmoITwhM/Xuw1zEWZiA/FnIOsdSnj3Kc5+4ZYP1S5lydG/DFqcLXWXbdgZC5xI7UBWReA2a5UsTxajStmrJqdHJUC66Zf3oxKCzgWlRPPe/dgotQlPmvcewsd7+qBLGaolY8Trb3eAZlpoBSZRqn+kuz3CF5plR2p06M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vi9mkfpb; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b79bddd604so3273346f8f.0
        for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 07:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755009244; x=1755614044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=d0Fxdv3cPozgk8mT38gBZEwehheZnULsN2Yve87rnLU=;
        b=Vi9mkfpbHG1PGx6dUQFfe98IepzrqrU/ltPb1k8GguALCKT3FmDJWlidtnZy6E+Pm/
         QFlVk9tvWB6eyLYH6MPqH1Gf52TBK5Otf5BB2usvnryQw80x7iKYHehwixPaaEanc1FC
         kYvAM9r8CwZWMxJ7UCLgiLTieQkw//jnL8Dxfj4gA0thCG8azm4zz/2Wa56vGLfTGmo/
         E7kQzYj97F/22iCZntKXyz5dUdxsUDNEGRiEHusLoyRyhgrQI6zGVHBgyLDvYjIykRh9
         tlKyGapCMEen8AfopkmseGkrXbtkIjxevze0zXqlkxMywTjvpZ0KV5YykzfQVTTUCdmN
         a8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755009244; x=1755614044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d0Fxdv3cPozgk8mT38gBZEwehheZnULsN2Yve87rnLU=;
        b=HbydY50aQeH1PWaU6k+YfF4+bHwOmWHmi3Raqu8B3PwPEWDKZ10M3izQlbRh55tjSg
         i7Ri0MbZrEo8giffB/cF3nDi/i1kYvSUBbFGcx/mFq/olyf8PMJKmRHYUCE/QhmxjB9J
         sTMZVvepvB+6ceuuDgCvBSqzMUqbT9UH9aTm+V6OnFldKwVNv1WNtW6EBmHnsjLzcVJo
         9WrM0b62xtrCJSLeJTWBX8rE+k86DTbCxOPMK9/VVUeLrwXlNlWDGb7LOsshnyKxBgTJ
         y083Pvmv7txC1oQtGJm7HXWQG7VSD44dLWPqWBKmPzyOyUzfP5pvMUdq58clrMEyrH3a
         dGtg==
X-Forwarded-Encrypted: i=1; AJvYcCXCzcDGbkiaPeLuOTmGbrQwpFoP7/vRZodFzJyBTNeH2ztsp0hgqZZVVdk2uP3txnJBOOTwfUdhgRxl3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMKcP/p7WWTlHB/e5BSmiKU6Nb0TuCa//8rl6JrbxGprZIlv2C
	qOUnMOO7148SchsWjnFOLwgSV30F3wPoGU3jjZwqfcQC+WESRfGWJX73
X-Gm-Gg: ASbGnctcdfYzOvZcsgZ5Sw6f03/7qIon/7Wwex1gwBvLTkmedn3Jd+2mCwFhhJzp8cS
	+ypaFtXkYKPlZqdrW43EHH/Su+skBpm2z485V3wM8eBPlyqvl99+lEZEQn7OcS+fR+48GuEnwQ6
	aFET4Z6StWXn0SSB25zVrlZTQ9Og7KtWngfpbF9BQUPQa9ABoMxRFmqwk4oZ6A4WLdmvHEKnRZl
	8V2YHdQCmC0Hoffpw6hHPsSI9nrZOGXNeXNsfXT+oeDCtckFGuBPIlMr+RBq6bqM+y5S4/jSgjg
	oiMOFetoNY78VNduH37RODIlU5+g50iUP2KV72dF5Wm+UtZpkY+4BlxXS6BILyXjFBoppc7PPq2
	WBzih4ISqU/+L16gbOlWo7F186VUpiMCOr5rBq5QqzCB8
X-Google-Smtp-Source: AGHT+IEN9W8QIdjCjiyzj5kO8EChyogAi2IS3EBC+8vieKm0sHbNVlz5nlzonsC8fWTgKgppdzS8kg==
X-Received: by 2002:a05:6000:178d:b0:3b7:8d2a:b33c with SMTP id ffacd0b85a97d-3b910fdb1a8mr2720033f8f.18.1755009243725;
        Tue, 12 Aug 2025 07:34:03 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15a5:9b00:5e00:c21:21a:c15b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8f5d7deaasm23714363f8f.65.2025.08.12.07.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 07:34:03 -0700 (PDT)
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
Subject: [PATCH 1/2] dma-buf/sw_sync: put fence signaling into work item
Date: Tue, 12 Aug 2025 16:34:01 +0200
Message-ID: <20250812143402.8619-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Christian König <ckoenig@able.fritz.box>

Offload signaling fence in the sw_sync component into a work item to
improve testing the real world signaling conditions.

Needs more testing before pushing it upstream!

Signed-off-by: Christian König <ckoenig@able.fritz.box>
---
 drivers/dma-buf/sw_sync.c    | 25 ++++++++++++++-----------
 drivers/dma-buf/sync_debug.h |  2 ++
 2 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 3c20f1d31cf5..43b8ac32482d 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -80,6 +80,7 @@ struct sw_sync_get_deadline {
 
 #define SW_SYNC_HAS_DEADLINE_BIT	DMA_FENCE_FLAG_USER_BITS
 
+static void sync_timeline_signal(struct work_struct *work);
 static const struct dma_fence_ops timeline_fence_ops;
 
 static inline struct sync_pt *dma_fence_to_sync_pt(struct dma_fence *fence)
@@ -110,6 +111,7 @@ static struct sync_timeline *sync_timeline_create(const char *name)
 
 	obj->pt_tree = RB_ROOT;
 	INIT_LIST_HEAD(&obj->pt_list);
+	INIT_WORK(&obj->signal_work, sync_timeline_signal);
 	spin_lock_init(&obj->lock);
 
 	sync_timeline_debug_add(obj);
@@ -123,6 +125,7 @@ static void sync_timeline_free(struct kref *kref)
 		container_of(kref, struct sync_timeline, kref);
 
 	sync_timeline_debug_remove(obj);
+	flush_work(&obj->signal_work);
 
 	kfree(obj);
 }
@@ -199,23 +202,20 @@ static const struct dma_fence_ops timeline_fence_ops = {
 
 /**
  * sync_timeline_signal() - signal a status change on a sync_timeline
- * @obj:	sync_timeline to signal
- * @inc:	num to increment on timeline->value
+ * @work: the work item
  *
- * A sync implementation should call this any time one of it's fences
- * has signaled or has an error condition.
+ * Signal all fences where the sequence number indicate to do so.
  */
-static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
+static void sync_timeline_signal(struct work_struct *work)
 {
+	struct sync_timeline *obj = container_of(work, typeof(*obj),
+						 signal_work);
 	LIST_HEAD(signalled);
 	struct sync_pt *pt, *next;
 
 	trace_sync_timeline(obj);
 
 	spin_lock_irq(&obj->lock);
-
-	obj->value += inc;
-
 	list_for_each_entry_safe(pt, next, &obj->pt_list, link) {
 		if (!timeline_fence_signaled(&pt->base))
 			break;
@@ -227,7 +227,6 @@ static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
 
 		dma_fence_signal_locked(&pt->base);
 	}
-
 	spin_unlock_irq(&obj->lock);
 
 	list_for_each_entry_safe(pt, next, &signalled, link) {
@@ -394,11 +393,15 @@ static long sw_sync_ioctl_inc(struct sync_timeline *obj, unsigned long arg)
 		return -EFAULT;
 
 	while (value > INT_MAX)  {
-		sync_timeline_signal(obj, INT_MAX);
+		obj->value += INT_MAX;
+
+		schedule_work(&obj->signal_work);
+		flush_work(&obj->signal_work);
 		value -= INT_MAX;
 	}
 
-	sync_timeline_signal(obj, value);
+	obj->value += value;
+	schedule_work(&obj->signal_work);
 
 	return 0;
 }
diff --git a/drivers/dma-buf/sync_debug.h b/drivers/dma-buf/sync_debug.h
index 02af347293d0..a1b03c48d82a 100644
--- a/drivers/dma-buf/sync_debug.h
+++ b/drivers/dma-buf/sync_debug.h
@@ -17,6 +17,7 @@
 #include <linux/rbtree.h>
 #include <linux/spinlock.h>
 #include <linux/dma-fence.h>
+#include <linux/workqueue.h>
 
 #include <linux/sync_file.h>
 #include <uapi/linux/sync_file.h>
@@ -40,6 +41,7 @@ struct sync_timeline {
 
 	struct rb_root		pt_tree;
 	struct list_head	pt_list;
+	struct work_struct	signal_work;
 	spinlock_t		lock;
 
 	struct list_head	sync_timeline_list;
-- 
2.43.0


