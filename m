Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB88A59964E
	for <lists+linux-media@lfdr.de>; Fri, 19 Aug 2022 09:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346201AbiHSHd6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Aug 2022 03:33:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242638AbiHSHd5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Aug 2022 03:33:57 -0400
Received: from mail-m11885.qiye.163.com (mail-m11885.qiye.163.com [115.236.118.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA8976BCF3;
        Fri, 19 Aug 2022 00:33:53 -0700 (PDT)
Received: from localhost (unknown [103.29.142.67])
        by mail-m11885.qiye.163.com (Hmail) with ESMTPA id 5AF324C02BD;
        Fri, 19 Aug 2022 15:33:51 +0800 (CST)
From:   Jeffy Chen <jeffy.chen@rock-chips.com>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Andy Yan <andy.yan@rock-chips.com>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Jeffy Chen <jeffy.chen@rock-chips.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-media@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3] drm/gem: Fix GEM handle release errors
Date:   Fri, 19 Aug 2022 15:28:34 +0800
Message-Id: <20220819072834.17888-1-jeffy.chen@rock-chips.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTh4fVk9MHk4fQxlKGE9DS1UTARMWGhIXJBQOD1
        lXWRgSC1lBWUpLSFVJQlVKT0lVTUxZV1kWGg8SFR0UWUFZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OQw6Hgw*IT0wCRYyFh9NEEMj
        DCswFDNVSlVKTU1LQ0JPT0hKQk9IVTMWGhIXVREeHR0CVRgTHhU7CRQYEFYYExILCFUYFBZFWVdZ
        EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQU1KT043Bg++
X-HM-Tid: 0a82b505c8ac2eb9kusn5af324c02bd
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently we are assuming a one to one mapping between dmabuf and
GEM handle when releasing GEM handles.

But that is not always true, since we would create extra handles for the
GEM obj in cases like gem_open() and getfb{,2}().

A similar issue was reported at:
https://lore.kernel.org/all/20211105083308.392156-1-jay.xu@rock-chips.com/

Another problem is that the imported dmabuf might not always have
gem_obj->dma_buf set, which would cause leaks in
drm_gem_remove_prime_handles().

Let's fix these for now by using handle to find the exact map to remove.

Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
Reviewed-by: Christian König <christian.koenig@amd.com>

---

Changes in v3:
Rewrite commit message a bit.

Changes in v2:
Fix a typo of rbtree.

 drivers/gpu/drm/drm_gem.c      | 17 +----------------
 drivers/gpu/drm/drm_internal.h |  4 ++--
 drivers/gpu/drm/drm_prime.c    | 20 ++++++++++++--------
 3 files changed, 15 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index eb0c2d041f13..ed39da383570 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -168,21 +168,6 @@ void drm_gem_private_object_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_gem_private_object_init);
 
-static void
-drm_gem_remove_prime_handles(struct drm_gem_object *obj, struct drm_file *filp)
-{
-	/*
-	 * Note: obj->dma_buf can't disappear as long as we still hold a
-	 * handle reference in obj->handle_count.
-	 */
-	mutex_lock(&filp->prime.lock);
-	if (obj->dma_buf) {
-		drm_prime_remove_buf_handle_locked(&filp->prime,
-						   obj->dma_buf);
-	}
-	mutex_unlock(&filp->prime.lock);
-}
-
 /**
  * drm_gem_object_handle_free - release resources bound to userspace handles
  * @obj: GEM object to clean up.
@@ -253,7 +238,7 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
 	if (obj->funcs->close)
 		obj->funcs->close(obj, file_priv);
 
-	drm_gem_remove_prime_handles(obj, file_priv);
+	drm_prime_remove_buf_handle(&file_priv->prime, id);
 	drm_vma_node_revoke(&obj->vma_node, file_priv);
 
 	drm_gem_object_handle_put_unlocked(obj);
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 1fbbc19f1ac0..7bb98e6a446d 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -74,8 +74,8 @@ int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 
 void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv);
 void drm_prime_destroy_file_private(struct drm_prime_file_private *prime_fpriv);
-void drm_prime_remove_buf_handle_locked(struct drm_prime_file_private *prime_fpriv,
-					struct dma_buf *dma_buf);
+void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
+				 uint32_t handle);
 
 /* drm_drv.c */
 struct drm_minor *drm_minor_acquire(unsigned int minor_id);
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index e3f09f18110c..bd5366b16381 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -190,29 +190,33 @@ static int drm_prime_lookup_buf_handle(struct drm_prime_file_private *prime_fpri
 	return -ENOENT;
 }
 
-void drm_prime_remove_buf_handle_locked(struct drm_prime_file_private *prime_fpriv,
-					struct dma_buf *dma_buf)
+void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
+				 uint32_t handle)
 {
 	struct rb_node *rb;
 
-	rb = prime_fpriv->dmabufs.rb_node;
+	mutex_lock(&prime_fpriv->lock);
+
+	rb = prime_fpriv->handles.rb_node;
 	while (rb) {
 		struct drm_prime_member *member;
 
-		member = rb_entry(rb, struct drm_prime_member, dmabuf_rb);
-		if (member->dma_buf == dma_buf) {
+		member = rb_entry(rb, struct drm_prime_member, handle_rb);
+		if (member->handle == handle) {
 			rb_erase(&member->handle_rb, &prime_fpriv->handles);
 			rb_erase(&member->dmabuf_rb, &prime_fpriv->dmabufs);
 
-			dma_buf_put(dma_buf);
+			dma_buf_put(member->dma_buf);
 			kfree(member);
-			return;
-		} else if (member->dma_buf < dma_buf) {
+			break;
+		} else if (member->handle < handle) {
 			rb = rb->rb_right;
 		} else {
 			rb = rb->rb_left;
 		}
 	}
+
+	mutex_unlock(&prime_fpriv->lock);
 }
 
 void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv)
-- 
2.20.1

