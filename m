Return-Path: <linux-media+bounces-37789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25609B05E64
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 15:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44F79175293
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 13:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4082E54CF;
	Tue, 15 Jul 2025 13:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZzvMvOuO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C845A1A5B9D;
	Tue, 15 Jul 2025 13:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752586888; cv=none; b=uvU+evMJ13/PJNwnQnPyMytgCpDAvGgHufHrCz5HmcS1qUxfmvy2CSxXn1bY4i/gnpt0i302IGvd+OvWYzwOX/o53Z1WCssHFdHGDENofnVVyKpYoBMBNidcjICUUx9s7TesxtKa5P1aEm5k4+sDnDsojL3dTclovK+rfq8Pea4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752586888; c=relaxed/simple;
	bh=6SVTdv2PHH1o4vCL0tIukxTMNTheFe5amjAULzo2Up8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ab+qlz332OGrkSqVyvX/2wE8zSgnZRWnxBxAdXYf0iZ2+jFKCl0ue2Mc2PUe9A++tLdDQwqu0HYkENjUErBe4uOkDJDisYQGygIG7M611ZYMhU7c+mUg6cbZXuOjvZ2eUBnxaidsncT5Nms6vpgrrx3OdQqQFiOFZnMKzMtcWVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZzvMvOuO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D711C4CEE3;
	Tue, 15 Jul 2025 13:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752586888;
	bh=6SVTdv2PHH1o4vCL0tIukxTMNTheFe5amjAULzo2Up8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZzvMvOuO2M+c/h1mDl57XcVHRXhKQP4nfHVLiU8Py0fneS9OdOv+WH0wddYlqyz+q
	 0Itl3JKjGEJPB+wF4K6NXr2Xp/B9Aa4Pv80y8D2cscpo4XUGpzQ650o71sLApiwuZ6
	 ZhZbJz91jKmhYb2rwi5ZeLT275oUbDhJUTcMtgVM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Anusha Srivatsa <asrivats@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 6.15 085/192] drm/gem: Acquire references on GEM handles for framebuffers
Date: Tue, 15 Jul 2025 15:13:00 +0200
Message-ID: <20250715130818.327986464@linuxfoundation.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715130814.854109770@linuxfoundation.org>
References: <20250715130814.854109770@linuxfoundation.org>
User-Agent: quilt/0.68
X-stable: review
X-Patchwork-Hint: ignore
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

6.15-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 5307dce878d4126e1b375587318955bd019c3741 upstream.

A GEM handle can be released while the GEM buffer object is attached
to a DRM framebuffer. This leads to the release of the dma-buf backing
the buffer object, if any. [1] Trying to use the framebuffer in further
mode-setting operations leads to a segmentation fault. Most easily
happens with driver that use shadow planes for vmap-ing the dma-buf
during a page flip. An example is shown below.

[  156.791968] ------------[ cut here ]------------
[  156.796830] WARNING: CPU: 2 PID: 2255 at drivers/dma-buf/dma-buf.c:1527 dma_buf_vmap+0x224/0x430
[...]
[  156.942028] RIP: 0010:dma_buf_vmap+0x224/0x430
[  157.043420] Call Trace:
[  157.045898]  <TASK>
[  157.048030]  ? show_trace_log_lvl+0x1af/0x2c0
[  157.052436]  ? show_trace_log_lvl+0x1af/0x2c0
[  157.056836]  ? show_trace_log_lvl+0x1af/0x2c0
[  157.061253]  ? drm_gem_shmem_vmap+0x74/0x710
[  157.065567]  ? dma_buf_vmap+0x224/0x430
[  157.069446]  ? __warn.cold+0x58/0xe4
[  157.073061]  ? dma_buf_vmap+0x224/0x430
[  157.077111]  ? report_bug+0x1dd/0x390
[  157.080842]  ? handle_bug+0x5e/0xa0
[  157.084389]  ? exc_invalid_op+0x14/0x50
[  157.088291]  ? asm_exc_invalid_op+0x16/0x20
[  157.092548]  ? dma_buf_vmap+0x224/0x430
[  157.096663]  ? dma_resv_get_singleton+0x6d/0x230
[  157.101341]  ? __pfx_dma_buf_vmap+0x10/0x10
[  157.105588]  ? __pfx_dma_resv_get_singleton+0x10/0x10
[  157.110697]  drm_gem_shmem_vmap+0x74/0x710
[  157.114866]  drm_gem_vmap+0xa9/0x1b0
[  157.118763]  drm_gem_vmap_unlocked+0x46/0xa0
[  157.123086]  drm_gem_fb_vmap+0xab/0x300
[  157.126979]  drm_atomic_helper_prepare_planes.part.0+0x487/0xb10
[  157.133032]  ? lockdep_init_map_type+0x19d/0x880
[  157.137701]  drm_atomic_helper_commit+0x13d/0x2e0
[  157.142671]  ? drm_atomic_nonblocking_commit+0xa0/0x180
[  157.147988]  drm_mode_atomic_ioctl+0x766/0xe40
[...]
[  157.346424] ---[ end trace 0000000000000000 ]---

Acquiring GEM handles for the framebuffer's GEM buffer objects prevents
this from happening. The framebuffer's cleanup later puts the handle
references.

Commit 1a148af06000 ("drm/gem-shmem: Use dma_buf from GEM object
instance") triggers the segmentation fault easily by using the dma-buf
field more widely. The underlying issue with reference counting has
been present before.

v2:
- acquire the handle instead of the BO (Christian)
- fix comment style (Christian)
- drop the Fixes tag (Christian)
- rename err_ gotos
- add missing Link tag

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://elixir.bootlin.com/linux/v6.15/source/drivers/gpu/drm/drm_gem.c#L241 # [1]
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Anusha Srivatsa <asrivats@redhat.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: <stable@vger.kernel.org>
Reviewed-by: Christian König <christian.koenig@amd.com>
Link: https://lore.kernel.org/r/20250630084001.293053-1-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/drm_gem.c                    |   44 ++++++++++++++++++++++++---
 drivers/gpu/drm/drm_gem_framebuffer_helper.c |   16 +++++----
 drivers/gpu/drm/drm_internal.h               |    2 +
 3 files changed, 51 insertions(+), 11 deletions(-)

--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -212,6 +212,35 @@ void drm_gem_private_object_fini(struct
 }
 EXPORT_SYMBOL(drm_gem_private_object_fini);
 
+static void drm_gem_object_handle_get(struct drm_gem_object *obj)
+{
+	struct drm_device *dev = obj->dev;
+
+	drm_WARN_ON(dev, !mutex_is_locked(&dev->object_name_lock));
+
+	if (obj->handle_count++ == 0)
+		drm_gem_object_get(obj);
+}
+
+/**
+ * drm_gem_object_handle_get_unlocked - acquire reference on user-space handles
+ * @obj: GEM object
+ *
+ * Acquires a reference on the GEM buffer object's handle. Required
+ * to keep the GEM object alive. Call drm_gem_object_handle_put_unlocked()
+ * to release the reference.
+ */
+void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj)
+{
+	struct drm_device *dev = obj->dev;
+
+	guard(mutex)(&dev->object_name_lock);
+
+	drm_WARN_ON(dev, !obj->handle_count); /* first ref taken in create-tail helper */
+	drm_gem_object_handle_get(obj);
+}
+EXPORT_SYMBOL(drm_gem_object_handle_get_unlocked);
+
 /**
  * drm_gem_object_handle_free - release resources bound to userspace handles
  * @obj: GEM object to clean up.
@@ -242,8 +271,14 @@ static void drm_gem_object_exported_dma_
 	}
 }
 
-static void
-drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
+/**
+ * drm_gem_object_handle_put_unlocked - releases reference on user-space handles
+ * @obj: GEM object
+ *
+ * Releases a reference on the GEM buffer object's handle. Possibly releases
+ * the GEM buffer object and associated dma-buf objects.
+ */
+void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
 {
 	struct drm_device *dev = obj->dev;
 	bool final = false;
@@ -268,6 +303,7 @@ drm_gem_object_handle_put_unlocked(struc
 	if (final)
 		drm_gem_object_put(obj);
 }
+EXPORT_SYMBOL(drm_gem_object_handle_put_unlocked);
 
 /*
  * Called at device or object close to release the file's
@@ -389,8 +425,8 @@ drm_gem_handle_create_tail(struct drm_fi
 	int ret;
 
 	WARN_ON(!mutex_is_locked(&dev->object_name_lock));
-	if (obj->handle_count++ == 0)
-		drm_gem_object_get(obj);
+
+	drm_gem_object_handle_get(obj);
 
 	/*
 	 * Get the user-visible handle using idr.  Preload and perform
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -99,7 +99,7 @@ void drm_gem_fb_destroy(struct drm_frame
 	unsigned int i;
 
 	for (i = 0; i < fb->format->num_planes; i++)
-		drm_gem_object_put(fb->obj[i]);
+		drm_gem_object_handle_put_unlocked(fb->obj[i]);
 
 	drm_framebuffer_cleanup(fb);
 	kfree(fb);
@@ -182,8 +182,10 @@ int drm_gem_fb_init_with_funcs(struct dr
 		if (!objs[i]) {
 			drm_dbg_kms(dev, "Failed to lookup GEM object\n");
 			ret = -ENOENT;
-			goto err_gem_object_put;
+			goto err_gem_object_handle_put_unlocked;
 		}
+		drm_gem_object_handle_get_unlocked(objs[i]);
+		drm_gem_object_put(objs[i]);
 
 		min_size = (height - 1) * mode_cmd->pitches[i]
 			 + drm_format_info_min_pitch(info, i, width)
@@ -193,22 +195,22 @@ int drm_gem_fb_init_with_funcs(struct dr
 			drm_dbg_kms(dev,
 				    "GEM object size (%zu) smaller than minimum size (%u) for plane %d\n",
 				    objs[i]->size, min_size, i);
-			drm_gem_object_put(objs[i]);
+			drm_gem_object_handle_put_unlocked(objs[i]);
 			ret = -EINVAL;
-			goto err_gem_object_put;
+			goto err_gem_object_handle_put_unlocked;
 		}
 	}
 
 	ret = drm_gem_fb_init(dev, fb, mode_cmd, objs, i, funcs);
 	if (ret)
-		goto err_gem_object_put;
+		goto err_gem_object_handle_put_unlocked;
 
 	return 0;
 
-err_gem_object_put:
+err_gem_object_handle_put_unlocked:
 	while (i > 0) {
 		--i;
-		drm_gem_object_put(objs[i]);
+		drm_gem_object_handle_put_unlocked(objs[i]);
 	}
 	return ret;
 }
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -161,6 +161,8 @@ void drm_sysfs_lease_event(struct drm_de
 
 /* drm_gem.c */
 int drm_gem_init(struct drm_device *dev);
+void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj);
+void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj);
 int drm_gem_handle_create_tail(struct drm_file *file_priv,
 			       struct drm_gem_object *obj,
 			       u32 *handlep);



