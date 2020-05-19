Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8D051DA3EB
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 23:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728378AbgESVrX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 17:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728361AbgESVrW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 17:47:22 -0400
Received: from Galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1ED2C08C5C0;
        Tue, 19 May 2020 14:47:21 -0700 (PDT)
Received: from [5.158.153.53] (helo=debian-buster-darwi.lab.linutronix.de.)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
        (Exim 4.80)
        (envelope-from <a.darwish@linutronix.de>)
        id 1jbA4c-0002kf-Q2; Tue, 19 May 2020 23:46:54 +0200
From:   "Ahmed S. Darwish" <a.darwish@linutronix.de>
To:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        "Sebastian A. Siewior" <bigeasy@linutronix.de>,
        Steven Rostedt <rostedt@goodmis.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH v1 13/25] dma-buf: Use sequence counter with associated wound/wait mutex
Date:   Tue, 19 May 2020 23:45:35 +0200
Message-Id: <20200519214547.352050-14-a.darwish@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200519214547.352050-1-a.darwish@linutronix.de>
References: <20200519214547.352050-1-a.darwish@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A sequence counter write side critical section must be protected by some
form of locking to serialize writers. If the serialization primitive is
not disabling preemption implicitly, preemption has to be explicitly
disabled before entering the sequence counter write side critical
section.

The dma-buf reservation subsystem uses plain sequence counters to manage
updates to reservations. Writer serialization is accomplished through a
wound/wait mutex.

Acquiring a wound/wait mutex does not disable preemption, so this needs
to be done manually before and after the write side critical section.

Use the newly-added seqcount_ww_mutex_t instead:

  - It associates the ww_mutex with the sequence count, which enables
    lockdep to validate that the write side critical section is properly
    serialized.

  - It removes the need to explicitly add preempt_disable/enable()
    around the write side critical section because the write_begin/end()
    functions for this new data type automatically do this.

If lockdep is disabled this ww_mutex lock association is compiled out
and has neither storage size nor runtime overhead.

Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
---
 drivers/dma-buf/dma-resv.c                       | 8 +-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 2 --
 include/linux/dma-resv.h                         | 2 +-
 3 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 590ce7ad60a0..3aba2b2bfc48 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -128,7 +128,7 @@ subsys_initcall(dma_resv_lockdep);
 void dma_resv_init(struct dma_resv *obj)
 {
 	ww_mutex_init(&obj->lock, &reservation_ww_class);
-	seqcount_init(&obj->seq);
+	seqcount_ww_mutex_init(&obj->seq, &obj->lock);
 
 	RCU_INIT_POINTER(obj->fence, NULL);
 	RCU_INIT_POINTER(obj->fence_excl, NULL);
@@ -259,7 +259,6 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
 	fobj = dma_resv_get_list(obj);
 	count = fobj->shared_count;
 
-	preempt_disable();
 	write_seqcount_begin(&obj->seq);
 
 	for (i = 0; i < count; ++i) {
@@ -281,7 +280,6 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
 	smp_store_mb(fobj->shared_count, count);
 
 	write_seqcount_end(&obj->seq);
-	preempt_enable();
 	dma_fence_put(old);
 }
 EXPORT_SYMBOL(dma_resv_add_shared_fence);
@@ -308,14 +306,12 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 	if (fence)
 		dma_fence_get(fence);
 
-	preempt_disable();
 	write_seqcount_begin(&obj->seq);
 	/* write_seqcount_begin provides the necessary memory barrier */
 	RCU_INIT_POINTER(obj->fence_excl, fence);
 	if (old)
 		old->shared_count = 0;
 	write_seqcount_end(&obj->seq);
-	preempt_enable();
 
 	/* inplace update, no shared fences */
 	while (i--)
@@ -393,13 +389,11 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 	src_list = dma_resv_get_list(dst);
 	old = dma_resv_get_excl(dst);
 
-	preempt_disable();
 	write_seqcount_begin(&dst->seq);
 	/* write_seqcount_begin provides the necessary memory barrier */
 	RCU_INIT_POINTER(dst->fence_excl, new);
 	RCU_INIT_POINTER(dst->fence, dst_list);
 	write_seqcount_end(&dst->seq);
-	preempt_enable();
 
 	dma_resv_list_free(src_list);
 	dma_fence_put(old);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 9dff792c9290..87fd32aae8f9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -258,11 +258,9 @@ static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
 	new->shared_count = k;
 
 	/* Install the new fence list, seqcount provides the barriers */
-	preempt_disable();
 	write_seqcount_begin(&resv->seq);
 	RCU_INIT_POINTER(resv->fence, new);
 	write_seqcount_end(&resv->seq);
-	preempt_enable();
 
 	/* Drop the references to the removed fences or move them to ef_list */
 	for (i = j, k = 0; i < old->shared_count; ++i) {
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index a6538ae7d93f..d44a77e8a7e3 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -69,7 +69,7 @@ struct dma_resv_list {
  */
 struct dma_resv {
 	struct ww_mutex lock;
-	seqcount_t seq;
+	seqcount_ww_mutex_t seq;
 
 	struct dma_fence __rcu *fence_excl;
 	struct dma_resv_list __rcu *fence;
-- 
2.20.1

