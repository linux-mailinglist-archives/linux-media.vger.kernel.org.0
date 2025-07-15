Return-Path: <linux-media+bounces-37783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46848B05B74
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 15:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84548744E07
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 13:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8714A2E3365;
	Tue, 15 Jul 2025 13:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="07DEitz9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49991A5B9D;
	Tue, 15 Jul 2025 13:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752585554; cv=none; b=UeBCmffUMibdvRNk2qk7S480f92BdjB1ONCRACq1OmNLFjo1BWVqAzVoQWqfHigRRbo0v9KeCrMI9XssEsdEtVP0lA2HFy6Zm8Lk+9XIHeA1fefqQ229dGDxYOPON0GeYWLAAALXezaBPaDD+WpkjRZ7Y6MsPkP82LKNGuD7MW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752585554; c=relaxed/simple;
	bh=6WbNi4UC6RoVB5gJlEkPS8Ie36morY3WDyO3MuvQDAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BIrwRRQd2y/AKgpRDo9fUEkBT/4lLwaSg3mnXWKbXAC/q7mhOuI0hdPoWMdPGWh2W8NM9zfD4KmbEjpBkiXmjJfOMPd39T6fnejIG6HcWWi1zr2R/9/QfuqAmLBg1j2InfxvJHDwlVJuedqpgsU04L+BIq+pNAWmU5ZDrlHkA6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=07DEitz9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 044C2C4CEE3;
	Tue, 15 Jul 2025 13:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752585553;
	bh=6WbNi4UC6RoVB5gJlEkPS8Ie36morY3WDyO3MuvQDAQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=07DEitz9raF1cqjYiE3vKbLCjAtzTDBvkhMVL1SB2k5B6n5HOMYPhkvTF/KSio5F9
	 9vhsAl6JqpQG0IM8DL8tQXl2ewdjdpLJ26OiCIALWp7TFlHYvy6W9H0Cveeqs6CCKn
	 jm1zIpznlqo4NALSIylW8pf156gDdVUBEvk0KrxU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Bert Karwatzki <spasswolf@web.de>,
	Mario Limonciello <superm1@kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Anusha Srivatsa <asrivats@redhat.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 6.12 082/163] drm/framebuffer: Acquire internal references on GEM handles
Date: Tue, 15 Jul 2025 15:12:30 +0200
Message-ID: <20250715130812.020381063@linuxfoundation.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715130808.777350091@linuxfoundation.org>
References: <20250715130808.777350091@linuxfoundation.org>
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

6.12-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Thomas Zimmermann <tzimmermann@suse.de>

commit f6bfc9afc7510cb5e6fbe0a17c507917b0120280 upstream.

Acquire GEM handles in drm_framebuffer_init() and release them in
the corresponding drm_framebuffer_cleanup(). Ties the handle's
lifetime to the framebuffer. Not all GEM buffer objects have GEM
handles. If not set, no refcounting takes place. This is the case
for some fbdev emulation. This is not a problem as these GEM objects
do not use dma-bufs and drivers will not release them while fbdev
emulation is running. Framebuffer flags keep a bit per color plane
of which the framebuffer holds a GEM handle reference.

As all drivers use drm_framebuffer_init(), they will now all hold
dma-buf references as fixed in commit 5307dce878d4 ("drm/gem: Acquire
references on GEM handles for framebuffers").

In the GEM framebuffer helpers, restore the original ref counting
on buffer objects. As the helpers for handle refcounting are now
no longer called from outside the DRM core, unexport the symbols.

v3:
- don't mix internal flags with mode flags (Christian)
v2:
- track framebuffer handle refs by flag
- drop gma500 cleanup (Christian)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 5307dce878d4 ("drm/gem: Acquire references on GEM handles for framebuffers")
Reported-by: Bert Karwatzki <spasswolf@web.de>
Closes: https://lore.kernel.org/dri-devel/20250703115915.3096-1-spasswolf@web.de/
Tested-by: Bert Karwatzki <spasswolf@web.de>
Tested-by: Mario Limonciello <superm1@kernel.org>
Tested-by: Borislav Petkov (AMD) <bp@alien8.de>
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
Link: https://lore.kernel.org/r/20250707131224.249496-1-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/drm_framebuffer.c            |   31 ++++++++++++++++++++--
 drivers/gpu/drm/drm_gem.c                    |   38 +++++++++++++++++----------
 drivers/gpu/drm/drm_gem_framebuffer_helper.c |   16 ++++-------
 drivers/gpu/drm/drm_internal.h               |    2 -
 include/drm/drm_framebuffer.h                |    7 ++++
 5 files changed, 68 insertions(+), 26 deletions(-)

--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -860,11 +860,23 @@ void drm_framebuffer_free(struct kref *k
 int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
 			 const struct drm_framebuffer_funcs *funcs)
 {
+	unsigned int i;
 	int ret;
+	bool exists;
 
 	if (WARN_ON_ONCE(fb->dev != dev || !fb->format))
 		return -EINVAL;
 
+	for (i = 0; i < fb->format->num_planes; i++) {
+		if (drm_WARN_ON_ONCE(dev, fb->internal_flags & DRM_FRAMEBUFFER_HAS_HANDLE_REF(i)))
+			fb->internal_flags &= ~DRM_FRAMEBUFFER_HAS_HANDLE_REF(i);
+		if (fb->obj[i]) {
+			exists = drm_gem_object_handle_get_if_exists_unlocked(fb->obj[i]);
+			if (exists)
+				fb->internal_flags |= DRM_FRAMEBUFFER_HAS_HANDLE_REF(i);
+		}
+	}
+
 	INIT_LIST_HEAD(&fb->filp_head);
 
 	fb->funcs = funcs;
@@ -873,7 +885,7 @@ int drm_framebuffer_init(struct drm_devi
 	ret = __drm_mode_object_add(dev, &fb->base, DRM_MODE_OBJECT_FB,
 				    false, drm_framebuffer_free);
 	if (ret)
-		goto out;
+		goto err;
 
 	mutex_lock(&dev->mode_config.fb_lock);
 	dev->mode_config.num_fb++;
@@ -881,7 +893,16 @@ int drm_framebuffer_init(struct drm_devi
 	mutex_unlock(&dev->mode_config.fb_lock);
 
 	drm_mode_object_register(dev, &fb->base);
-out:
+
+	return 0;
+
+err:
+	for (i = 0; i < fb->format->num_planes; i++) {
+		if (fb->internal_flags & DRM_FRAMEBUFFER_HAS_HANDLE_REF(i)) {
+			drm_gem_object_handle_put_unlocked(fb->obj[i]);
+			fb->internal_flags &= ~DRM_FRAMEBUFFER_HAS_HANDLE_REF(i);
+		}
+	}
 	return ret;
 }
 EXPORT_SYMBOL(drm_framebuffer_init);
@@ -958,6 +979,12 @@ EXPORT_SYMBOL(drm_framebuffer_unregister
 void drm_framebuffer_cleanup(struct drm_framebuffer *fb)
 {
 	struct drm_device *dev = fb->dev;
+	unsigned int i;
+
+	for (i = 0; i < fb->format->num_planes; i++) {
+		if (fb->internal_flags & DRM_FRAMEBUFFER_HAS_HANDLE_REF(i))
+			drm_gem_object_handle_put_unlocked(fb->obj[i]);
+	}
 
 	mutex_lock(&dev->mode_config.fb_lock);
 	list_del(&fb->head);
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -197,23 +197,34 @@ static void drm_gem_object_handle_get(st
 }
 
 /**
- * drm_gem_object_handle_get_unlocked - acquire reference on user-space handles
+ * drm_gem_object_handle_get_if_exists_unlocked - acquire reference on user-space handle, if any
  * @obj: GEM object
  *
- * Acquires a reference on the GEM buffer object's handle. Required
- * to keep the GEM object alive. Call drm_gem_object_handle_put_unlocked()
- * to release the reference.
+ * Acquires a reference on the GEM buffer object's handle. Required to keep
+ * the GEM object alive. Call drm_gem_object_handle_put_if_exists_unlocked()
+ * to release the reference. Does nothing if the buffer object has no handle.
+ *
+ * Returns:
+ * True if a handle exists, or false otherwise
  */
-void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj)
+bool drm_gem_object_handle_get_if_exists_unlocked(struct drm_gem_object *obj)
 {
 	struct drm_device *dev = obj->dev;
 
 	guard(mutex)(&dev->object_name_lock);
 
-	drm_WARN_ON(dev, !obj->handle_count); /* first ref taken in create-tail helper */
+	/*
+	 * First ref taken during GEM object creation, if any. Some
+	 * drivers set up internal framebuffers with GEM objects that
+	 * do not have a GEM handle. Hence, this counter can be zero.
+	 */
+	if (!obj->handle_count)
+		return false;
+
 	drm_gem_object_handle_get(obj);
+
+	return true;
 }
-EXPORT_SYMBOL(drm_gem_object_handle_get_unlocked);
 
 /**
  * drm_gem_object_handle_free - release resources bound to userspace handles
@@ -246,7 +257,7 @@ static void drm_gem_object_exported_dma_
 }
 
 /**
- * drm_gem_object_handle_put_unlocked - releases reference on user-space handles
+ * drm_gem_object_handle_put_unlocked - releases reference on user-space handle
  * @obj: GEM object
  *
  * Releases a reference on the GEM buffer object's handle. Possibly releases
@@ -257,14 +268,14 @@ void drm_gem_object_handle_put_unlocked(
 	struct drm_device *dev = obj->dev;
 	bool final = false;
 
-	if (WARN_ON(READ_ONCE(obj->handle_count) == 0))
+	if (drm_WARN_ON(dev, READ_ONCE(obj->handle_count) == 0))
 		return;
 
 	/*
-	* Must bump handle count first as this may be the last
-	* ref, in which case the object would disappear before we
-	* checked for a name
-	*/
+	 * Must bump handle count first as this may be the last
+	 * ref, in which case the object would disappear before
+	 * we checked for a name.
+	 */
 
 	mutex_lock(&dev->object_name_lock);
 	if (--obj->handle_count == 0) {
@@ -277,7 +288,6 @@ void drm_gem_object_handle_put_unlocked(
 	if (final)
 		drm_gem_object_put(obj);
 }
-EXPORT_SYMBOL(drm_gem_object_handle_put_unlocked);
 
 /*
  * Called at device or object close to release the file's
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -99,7 +99,7 @@ void drm_gem_fb_destroy(struct drm_frame
 	unsigned int i;
 
 	for (i = 0; i < fb->format->num_planes; i++)
-		drm_gem_object_handle_put_unlocked(fb->obj[i]);
+		drm_gem_object_put(fb->obj[i]);
 
 	drm_framebuffer_cleanup(fb);
 	kfree(fb);
@@ -182,10 +182,8 @@ int drm_gem_fb_init_with_funcs(struct dr
 		if (!objs[i]) {
 			drm_dbg_kms(dev, "Failed to lookup GEM object\n");
 			ret = -ENOENT;
-			goto err_gem_object_handle_put_unlocked;
+			goto err_gem_object_put;
 		}
-		drm_gem_object_handle_get_unlocked(objs[i]);
-		drm_gem_object_put(objs[i]);
 
 		min_size = (height - 1) * mode_cmd->pitches[i]
 			 + drm_format_info_min_pitch(info, i, width)
@@ -195,22 +193,22 @@ int drm_gem_fb_init_with_funcs(struct dr
 			drm_dbg_kms(dev,
 				    "GEM object size (%zu) smaller than minimum size (%u) for plane %d\n",
 				    objs[i]->size, min_size, i);
-			drm_gem_object_handle_put_unlocked(objs[i]);
+			drm_gem_object_put(objs[i]);
 			ret = -EINVAL;
-			goto err_gem_object_handle_put_unlocked;
+			goto err_gem_object_put;
 		}
 	}
 
 	ret = drm_gem_fb_init(dev, fb, mode_cmd, objs, i, funcs);
 	if (ret)
-		goto err_gem_object_handle_put_unlocked;
+		goto err_gem_object_put;
 
 	return 0;
 
-err_gem_object_handle_put_unlocked:
+err_gem_object_put:
 	while (i > 0) {
 		--i;
-		drm_gem_object_handle_put_unlocked(objs[i]);
+		drm_gem_object_put(objs[i]);
 	}
 	return ret;
 }
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -153,7 +153,7 @@ void drm_sysfs_lease_event(struct drm_de
 
 /* drm_gem.c */
 int drm_gem_init(struct drm_device *dev);
-void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj);
+bool drm_gem_object_handle_get_if_exists_unlocked(struct drm_gem_object *obj);
 void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj);
 int drm_gem_handle_create_tail(struct drm_file *file_priv,
 			       struct drm_gem_object *obj,
--- a/include/drm/drm_framebuffer.h
+++ b/include/drm/drm_framebuffer.h
@@ -23,6 +23,7 @@
 #ifndef __DRM_FRAMEBUFFER_H__
 #define __DRM_FRAMEBUFFER_H__
 
+#include <linux/bits.h>
 #include <linux/ctype.h>
 #include <linux/list.h>
 #include <linux/sched.h>
@@ -100,6 +101,8 @@ struct drm_framebuffer_funcs {
 		     unsigned num_clips);
 };
 
+#define DRM_FRAMEBUFFER_HAS_HANDLE_REF(_i)	BIT(0u + (_i))
+
 /**
  * struct drm_framebuffer - frame buffer object
  *
@@ -189,6 +192,10 @@ struct drm_framebuffer {
 	 */
 	int flags;
 	/**
+	 * @internal_flags: Framebuffer flags like DRM_FRAMEBUFFER_HAS_HANDLE_REF.
+	 */
+	unsigned int internal_flags;
+	/**
 	 * @filp_head: Placed on &drm_file.fbs, protected by &drm_file.fbs_lock.
 	 */
 	struct list_head filp_head;



