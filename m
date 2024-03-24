Return-Path: <linux-media+bounces-7684-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B802887C35
	for <lists+linux-media@lfdr.de>; Sun, 24 Mar 2024 11:16:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0CDC1F214E6
	for <lists+linux-media@lfdr.de>; Sun, 24 Mar 2024 10:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3963C1756A;
	Sun, 24 Mar 2024 10:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="U1WcW0Ob"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E73B7F9
	for <linux-media@vger.kernel.org>; Sun, 24 Mar 2024 10:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711275390; cv=none; b=PnF4g8WX1dDuFfnjmiosgxVocX1mC2tvogmidKAtgfiX0o6CtyqbRK6hCcpS00oSvSq/43U739X4HAykTz6CowJgCfYLuU1BP0VhrS6SFoX20NUx4fEbjGnjT5dIWUUzj/CepMlJEsVK1+tQpYyOjPMck9X2sI00amnix2eWIBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711275390; c=relaxed/simple;
	bh=e/JvR9Oyf+Z/Chl/AwPhQewY5IdArIdlAGy1aPhdqAg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=El1LXdy7PJaR326aMawK//7MfWJccWzzMeWtBX68kVcNRbT99ozEBQh9lX041nto2D7HL7gAFwZzM0yPQR0i/aUfuqr+QC8nrNlpBhtkbq7szoSGQC/fbqqE1mjUPcT2gY2i9N0NXenvSEsJAvGYrBt/C9JSkFqNATfMdHBtw58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=U1WcW0Ob; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=oY4SJi9AIMg301q2BVCxFk7k68ii7lEN4kwL/NqC6Aw=; b=U1WcW0ObASDH0oefc+oPtbpV5O
	o2h4UKGpzD8IsFdOy5MeHnRWEX5XnTTs0wkxgi1l3LiZhgX8UnnhrNw+tu7m1aN4Stlzy/tA2PU0a
	b+C75OROgeyw9rWuMSfemL/qncwEzze6hiz+eaECuUdM8OPmPwQ7FPFt2JhFI+Rf8Em1iZz/zsqIT
	bmR+P5xo43ayrkdggabB3RnfnCDk0hSN63MXqYYV/nNZXv64oqq+J5use8tnsfb5k+VTnSwdbzCNn
	dDxXfCxaKuDa1OEVVZP/sUDfmo9jHO8aAiIEXt856PKvZhqrq71TGWrD+3bcrSAP8N5cpFCWpGa4g
	2EzvZlmQ==;
Received: from [179.93.184.165] (helo=quatroqueijos..)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1roKtY-00EjCQ-5o; Sun, 24 Mar 2024 11:16:04 +0100
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	kernel-dev@igalia.com,
	Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
	Chris Wilson <chris@chris-wilson.co.uk>,
	Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
	Rob Clark <robdclark@chromium.org>
Subject: [PATCH] dma-buf/sw_sync: Add a reference when adding fence to timeline list
Date: Sun, 24 Mar 2024 07:15:33 -0300
Message-Id: <20240324101533.3271056-1-cascardo@igalia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit e531fdb5cd5e ("dma-buf/sw_sync: Avoid recursive lock during fence
signal") fixed a recursive locking when a signal callback released a fence.
It did it by taking an extra reference while traversing it on the list and
holding the timeline lock.

However, this is racy and may end up adding to a kref that is 0, triggering
a well deserved warning, as later that reference would be put again.

CPU 0					CPU 1
sync_file_release			sync_timeline_signal
  dma_fence_put
    timeline_fence_release
					  spin_lock_irq(&obj->lock)
					  dma_fence_get(&pt->base)
    spin_lock_irqsave(fence->lock, flags)

As shown above, it is possible for the last reference to be dropped, but
sync_timeline_signal take the lock before timeline_fence_release, which
will lead to a 0->1 kref transition, which is not allowed.

This is because there is still a pointer to the fence object in the list,
which should be accounted as a reference.

In previous discussions about this [3], it was called out that keeping such
a reference was not a good idea because the fence also holds a reference to
the timeline, hence leading to a loop. However, accounting for that
reference doesn't change that the loop already exists. And userspace holds
references in the form of file descriptors, so it is still possible to
avoid potential memory leaks.

This fix also avoids other issues. The nested locking is still possible to
trigger when closing the timeline, as sw_sync_debugfs_release also calls
dma_fence_signal_locked while holding the lock. By holding a reference and
releasing it only after doing the signal, that nested locking is avoided.

There are a few quirks about the reference counting here, though.

In the simple case when sync_pt_create adds a new fence to the list, it
returns with 2 references instead of 1. That is dealt with as
sw_sync_ioctl_create_fence always puts a reference after calling
sync_file_create. That is necessary for multiple reasons.

One is that it takes care of the error case when sync_file_create fails.
The extra reference is put, while the fence is still held on the list, so
its last reference will be put when it is removed from the list either in
sync_timeline_signal or sw_sync_debugfs_release.

It also avoids the race when a signal may come in between sync_pt_create
and sync_file_create as the lock is dropped. If that happens, the fence
will be removed from the list, but a reference will still be kept as
sync_file_create takes a reference.

Then, there is the case when a fence with the given seqno already exists.
sync_pt_create returns with an extra reference to it, that we later put.
Similar reasoning can be applied here. That one extra reference is
necessary to avoid a race with signaling (and release), and we later put
that extra reference.

Finally, there is the case when the fence is already signaled and not added
to the list. In such case, sync_pt_create must return with a single
reference as this fence has not been added to the timeline list. It will
either be freed in case sync_file_create fails or the file will keep its
reference, which is later put when the file is released.

This is based on Chris Wilson attempt [2] to fix recursive locking during
timeline signal. Hence, their signoff.

Link: https://lore.kernel.org/all/20200714154102.450826-1-bas@basnieuwenhuizen.nl/ [1]
Link: https://lore.kernel.org/all/20200715100432.13928-2-chris@chris-wilson.co.uk/ [2]
Link: https://lore.kernel.org/all/20230817213729.110087-1-robdclark@gmail.com/T/ [3]
Fixes: e531fdb5cd5e ("dma-buf/sw_sync: Avoid recursive lock during fence signal")
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Cc: Rob Clark <robdclark@chromium.org>
---
 drivers/dma-buf/sw_sync.c | 42 ++++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index c353029789cf..83b624ac4faa 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -151,16 +151,7 @@ static const char *timeline_fence_get_timeline_name(struct dma_fence *fence)
 
 static void timeline_fence_release(struct dma_fence *fence)
 {
-	struct sync_pt *pt = dma_fence_to_sync_pt(fence);
 	struct sync_timeline *parent = dma_fence_parent(fence);
-	unsigned long flags;
-
-	spin_lock_irqsave(fence->lock, flags);
-	if (!list_empty(&pt->link)) {
-		list_del(&pt->link);
-		rb_erase(&pt->node, &parent->pt_tree);
-	}
-	spin_unlock_irqrestore(fence->lock, flags);
 
 	sync_timeline_put(parent);
 	dma_fence_free(fence);
@@ -229,7 +220,6 @@ static const struct dma_fence_ops timeline_fence_ops = {
  */
 static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
 {
-	LIST_HEAD(signalled);
 	struct sync_pt *pt, *next;
 
 	trace_sync_timeline(obj);
@@ -242,20 +232,14 @@ static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
 		if (!timeline_fence_signaled(&pt->base))
 			break;
 
-		dma_fence_get(&pt->base);
-
-		list_move_tail(&pt->link, &signalled);
+		list_del(&pt->link);
 		rb_erase(&pt->node, &obj->pt_tree);
 
 		dma_fence_signal_locked(&pt->base);
+		dma_fence_put(&pt->base);
 	}
 
 	spin_unlock_irq(&obj->lock);
-
-	list_for_each_entry_safe(pt, next, &signalled, link) {
-		list_del_init(&pt->link);
-		dma_fence_put(&pt->base);
-	}
 }
 
 /**
@@ -299,13 +283,11 @@ static struct sync_pt *sync_pt_create(struct sync_timeline *obj,
 			} else if (cmp < 0) {
 				p = &parent->rb_left;
 			} else {
-				if (dma_fence_get_rcu(&other->base)) {
-					sync_timeline_put(obj);
-					kfree(pt);
-					pt = other;
-					goto unlock;
-				}
-				p = &parent->rb_left;
+				/* This is later put in sw_sync_ioctl_create_fence. */
+				dma_fence_get(&other->base);
+				dma_fence_put(&pt->base);
+				pt = other;
+				goto unlock;
 			}
 		}
 		rb_link_node(&pt->node, parent, p);
@@ -314,6 +296,8 @@ static struct sync_pt *sync_pt_create(struct sync_timeline *obj,
 		parent = rb_next(&pt->node);
 		list_add_tail(&pt->link,
 			      parent ? &rb_entry(parent, typeof(*pt), node)->link : &obj->pt_list);
+		/* Adding to the list requires a reference. */
+		dma_fence_get(&pt->base);
 	}
 unlock:
 	spin_unlock_irq(&obj->lock);
@@ -354,6 +338,7 @@ static int sw_sync_debugfs_release(struct inode *inode, struct file *file)
 	list_for_each_entry_safe(pt, next, &obj->pt_list, link) {
 		dma_fence_set_error(&pt->base, -ENOENT);
 		dma_fence_signal_locked(&pt->base);
+		dma_fence_put(&pt->base);
 	}
 
 	spin_unlock_irq(&obj->lock);
@@ -386,7 +371,14 @@ static long sw_sync_ioctl_create_fence(struct sync_timeline *obj,
 	}
 
 	sync_file = sync_file_create(&pt->base);
+
+	/*
+	 * Puts the extra reference returned by sync_pt_create. This is necessary
+	 * to avoid a race where the fence is signaled, removed from the list and
+	 * released right after sync_pt_create releases the lock and returns.
+	 */
 	dma_fence_put(&pt->base);
+
 	if (!sync_file) {
 		err = -ENOMEM;
 		goto err;
-- 
2.34.1


