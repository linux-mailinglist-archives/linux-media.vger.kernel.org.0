Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ACB4426728
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 11:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236118AbhJHJwP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 05:52:15 -0400
Received: from mga01.intel.com ([192.55.52.88]:33869 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229869AbhJHJwO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Oct 2021 05:52:14 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="249834350"
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; 
   d="scan'208";a="249834350"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2021 02:50:18 -0700
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; 
   d="scan'208";a="478920486"
Received: from tocallag-mobl2.ger.corp.intel.com (HELO tursulin-mobl2.home) ([10.213.250.80])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2021 02:50:16 -0700
From:   Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To:     Intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-resv: Fix dma_resv_get_fences and dma_resv_copy_fences after conversion
Date:   Fri,  8 Oct 2021 10:50:07 +0100
Message-Id: <20211008095007.972693-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Cache the count of shared fences in the iterator to avoid dereferencing
the dma_resv_object outside the RCU protection. Otherwise iterator and its
users can observe an incosistent state which makes it impossible to use
safely. Such as:

<6> [187.517041] [IGT] gem_sync: executing
<7> [187.536343] i915 0000:00:02.0: [drm:i915_gem_context_create_ioctl [i915]] HW context 1 created
<7> [187.536793] i915 0000:00:02.0: [drm:i915_gem_context_create_ioctl [i915]] HW context 1 created
<6> [187.551235] [IGT] gem_sync: starting subtest basic-many-each
<1> [188.935462] BUG: kernel NULL pointer dereference, address: 0000000000000010
<1> [188.935485] #PF: supervisor write access in kernel mode
<1> [188.935495] #PF: error_code(0x0002) - not-present page
<6> [188.935504] PGD 0 P4D 0
<4> [188.935512] Oops: 0002 [#1] PREEMPT SMP NOPTI
<4> [188.935521] CPU: 2 PID: 1467 Comm: gem_sync Not tainted 5.15.0-rc4-CI-Patchwork_21264+ #1
<4> [188.935535] Hardware name:  /NUC6CAYB, BIOS AYAPLCEL.86A.0049.2018.0508.1356 05/08/2018
<4> [188.935546] RIP: 0010:dma_resv_get_fences+0x116/0x2d0
<4> [188.935560] Code: 10 85 c0 7f c9 be 03 00 00 00 e8 15 8b df ff eb bd e8 8e c6 ff ff eb b6 41 8b 04 24 49 8b 55 00 48 89 e7 8d 48 01 41 89 0c 24 <4c> 89 34 c2 e8 41 f2 ff ff 49 89 c6 48 85 c0 75 8c 48 8b 44 24 10
<4> [188.935583] RSP: 0018:ffffc900011dbcc8 EFLAGS: 00010202
<4> [188.935593] RAX: 0000000000000000 RBX: 00000000ffffffff RCX: 0000000000000001
<4> [188.935603] RDX: 0000000000000010 RSI: ffffffff822e343c RDI: ffffc900011dbcc8
<4> [188.935613] RBP: ffffc900011dbd48 R08: ffff88812d255bb8 R09: 00000000fffffffe
<4> [188.935623] R10: 0000000000000001 R11: 0000000000000000 R12: ffffc900011dbd44
<4> [188.935633] R13: ffffc900011dbd50 R14: ffff888113d29cc0 R15: 0000000000000000
<4> [188.935643] FS:  00007f68d17e9700(0000) GS:ffff888277900000(0000) knlGS:0000000000000000
<4> [188.935655] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4> [188.935665] CR2: 0000000000000010 CR3: 000000012d0a4000 CR4: 00000000003506e0
<4> [188.935676] Call Trace:
<4> [188.935685]  i915_gem_object_wait+0x1ff/0x410 [i915]
<4> [188.935988]  i915_gem_wait_ioctl+0xf2/0x2a0 [i915]
<4> [188.936272]  ? i915_gem_object_wait+0x410/0x410 [i915]
<4> [188.936533]  drm_ioctl_kernel+0xae/0x140
<4> [188.936546]  drm_ioctl+0x201/0x3d0
<4> [188.936555]  ? i915_gem_object_wait+0x410/0x410 [i915]
<4> [188.936820]  ? __fget_files+0xc2/0x1c0
<4> [188.936830]  ? __fget_files+0xda/0x1c0
<4> [188.936839]  __x64_sys_ioctl+0x6d/0xa0
<4> [188.936848]  do_syscall_64+0x3a/0xb0
<4> [188.936859]  entry_SYSCALL_64_after_hwframe+0x44/0xae

If the shared object has changed during the RCU unlocked period
callers will correctly handle the restart on the next iteration.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Fixes: 96601e8a4755 ("dma-buf: use new iterator in dma_resv_copy_fences")
Fixes: d3c80698c9f5 ("dma-buf: use new iterator in dma_resv_get_fences v3")
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/4274
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/dma-buf/dma-resv.c | 18 ++++++++++--------
 include/linux/dma-resv.h   |  5 ++++-
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index a480af9581bd..7b6d881c8904 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -333,10 +333,14 @@ static void dma_resv_iter_restart_unlocked(struct dma_resv_iter *cursor)
 {
 	cursor->seq = read_seqcount_begin(&cursor->obj->seq);
 	cursor->index = -1;
-	if (cursor->all_fences)
+	cursor->shared_count = 0;
+	if (cursor->all_fences) {
 		cursor->fences = dma_resv_shared_list(cursor->obj);
-	else
+		if (cursor->fences)
+			cursor->shared_count = cursor->fences->shared_count;
+	} else {
 		cursor->fences = NULL;
+	}
 	cursor->is_restarted = true;
 }
 
@@ -363,7 +367,7 @@ static void dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor)
 				continue;
 
 		} else if (!cursor->fences ||
-			   cursor->index >= cursor->fences->shared_count) {
+			   cursor->index >= cursor->shared_count) {
 			cursor->fence = NULL;
 			break;
 
@@ -448,10 +452,8 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 			dma_resv_list_free(list);
 			dma_fence_put(excl);
 
-			if (cursor.fences) {
-				unsigned int cnt = cursor.fences->shared_count;
-
-				list = dma_resv_list_alloc(cnt);
+			if (cursor.shared_count) {
+				list = dma_resv_list_alloc(cursor.shared_count);
 				if (!list) {
 					dma_resv_iter_end(&cursor);
 					return -ENOMEM;
@@ -522,7 +524,7 @@ int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **fence_excl,
 			if (fence_excl)
 				dma_fence_put(*fence_excl);
 
-			count = cursor.fences ? cursor.fences->shared_count : 0;
+			count = cursor.shared_count;
 			count += fence_excl ? 0 : 1;
 
 			/* Eventually re-allocate the array */
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 8b6c20636a79..3e1bff147428 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -170,9 +170,12 @@ struct dma_resv_iter {
 	/** @index: index into the shared fences */
 	unsigned int index;
 
-	/** @fences: the shared fences */
+	/** @fences: the shared fences; private, *MUST* not dereference  */
 	struct dma_resv_list *fences;
 
+	/** @shared_count: number of shared fences */
+	unsigned int shared_count;
+
 	/** @is_restarted: true if this is the first returned fence */
 	bool is_restarted;
 };
-- 
2.30.2

