Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 505113B6D18
	for <lists+linux-media@lfdr.de>; Tue, 29 Jun 2021 05:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232024AbhF2Dko (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Jun 2021 23:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232021AbhF2Dkm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Jun 2021 23:40:42 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30644C061767;
        Mon, 28 Jun 2021 20:38:15 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id l11so11532822pji.5;
        Mon, 28 Jun 2021 20:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e89hcvZxRiZ5Blo85VTbkHd9GG4LouPsbTHXMkcWyoA=;
        b=G0Cx3O4RZRxIvja4xrrosgMNsGwe3/2+TREWfgokq76RrCJkB5N527/IWVOagomnju
         YdkO1XiD2OR43x6xJZwQWUBqeK4dVKcaNZG8Px6/tM+rOxokSJtPfp8cF+nSQb0aKsTj
         p6Pf0nvV7JT+1zAqBYli6UrVvggPLZAX/ho4lvghsbZS7fnaoctoHNaj4lv3P860GmeG
         2eSxPkmEhMoeF+N4mmjQiXN/s9nBHRQ9BzjewfVLnaQ6g6dWsA4egGKFkiDy5x0do/gr
         y7rkbxsjkVxu6iwzGKnunDYQTZFJipjP0Hx+qhdrgADvHyX2sjbh27w8S7D2WgNAvzVF
         1uCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e89hcvZxRiZ5Blo85VTbkHd9GG4LouPsbTHXMkcWyoA=;
        b=dk57l354IuedPQMXJd2/X35VZyH0GAJpCvczeQ4U7U+0MVzwi7RWfYAbQIkYcage/j
         61nRELeytlO9UTjWKbOTWDVQMc3kFH1EkkOp42hPXjznUjWSlrWb2gdjI1+ityYNwu4F
         C43vkGnSqW7oNR3oXu2HRVq7sugx3ad8+e52rKJpoJK/WL78dTDUxtXCqj1mGdwBQpzb
         Cy9R1MIXIX8qc9isF/B/PFvFoVvD9/MkXdQP3tjds0CF/3Xoid+x1TGLnPWcMBfwIsk8
         5rcRrY2TRMHoXG0XY9VP913MY6I39PSWj82UWpKVi4cdhXJeJZvHVzXQWICW0MHrlEXg
         H7+w==
X-Gm-Message-State: AOAM531nwEJeKAAxIm9su3uS54rge61cRFnG21niHWCZkklEOq4vaLN0
        F9JFSNOi7CK8huL+TYGDTxM=
X-Google-Smtp-Source: ABdhPJwZLih7PT7j6HnuHpFvYYxk6ZWBH33LNHYAYqH4Y9iprMVib64xa1z8fIpPEJJZTu+1KGsMLg==
X-Received: by 2002:a17:902:a50f:b029:11a:b033:e158 with SMTP id s15-20020a170902a50fb029011ab033e158mr25760151plq.26.1624937894622;
        Mon, 28 Jun 2021 20:38:14 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id d129sm14769076pfd.218.2021.06.28.20.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 20:38:14 -0700 (PDT)
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        emil.l.velikov@gmail.com, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v5 3/3] drm: protect drm_master pointers in drm_lease.c
Date:   Tue, 29 Jun 2021 11:37:06 +0800
Message-Id: <20210629033706.20537-4-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629033706.20537-1-desmondcheongzx@gmail.com>
References: <20210629033706.20537-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently, direct copies of drm_file->master pointers should be
protected by drm_device.master_mutex when being dereferenced. This is
because drm_file->master is not invariant for the lifetime of
drm_file. If drm_file is not the creator of master, then
drm_file->is_master is false, and a call to drm_setmaster_ioctl will
invoke drm_new_set_master, which then allocates a new master for
drm_file and puts the old master.

Thus, without holding drm_device.master_mutex, the old value of
drm_file->master could be freed while it is being used by another
concurrent process.

In drm_lease.c, there are multiple instances where drm_file->master is
accessed and dereferenced while drm_device.master_mutex is not
held. This makes drm_lease.c vulnerable to use-after-free bugs.

We address this issue in 3 ways:

1. Clarify in the kerneldoc that drm_file->master is protected by
drm_device.master_mutex.

2. Add a new drm_file_get_master() function that calls drm_master_get
on drm_file->master while holding on to drm_device.master_mutex. Since
drm_master_get increments the reference count of master, this
prevents master from being freed until we unreference it with
drm_master_put.

3. In each case where drm_file->master is directly accessed and
eventually dereferenced in drm_lease.c, we wrap the access in a call
to the new drm_file_get_master function, then unreference the master
pointer once we are done using it.

Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c  | 25 ++++++++++++
 drivers/gpu/drm/drm_lease.c | 77 +++++++++++++++++++++++++++----------
 include/drm/drm_auth.h      |  1 +
 include/drm/drm_file.h      | 15 ++++++--
 4 files changed, 95 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index ab1863c5a5a0..c36a0b72be26 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -384,6 +384,31 @@ struct drm_master *drm_master_get(struct drm_master *master)
 }
 EXPORT_SYMBOL(drm_master_get);
 
+/**
+ * drm_file_get_master - reference &drm_file.master of @file_priv
+ * @file_priv: DRM file private
+ *
+ * Increments the reference count of @file_priv's &drm_file.master and returns
+ * the &drm_file.master. If @file_priv has no &drm_file.master, returns NULL.
+ *
+ * Master pointers returned from this function should be unreferenced using
+ * drm_master_put().
+ */
+struct drm_master *drm_file_get_master(struct drm_file *file_priv)
+{
+	struct drm_master *master = NULL;
+
+	mutex_lock(&file_priv->minor->dev->master_mutex);
+	if (!file_priv->master)
+		goto unlock;
+	master = drm_master_get(file_priv->master);
+
+unlock:
+	mutex_unlock(&file_priv->minor->dev->master_mutex);
+	return master;
+}
+EXPORT_SYMBOL(drm_file_get_master);
+
 static void drm_master_destroy(struct kref *kref)
 {
 	struct drm_master *master = container_of(kref, struct drm_master, refcount);
diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index 00fb433bcef1..cdcc87fa9685 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -106,10 +106,19 @@ static bool _drm_has_leased(struct drm_master *master, int id)
  */
 bool _drm_lease_held(struct drm_file *file_priv, int id)
 {
-	if (!file_priv || !file_priv->master)
+	bool ret;
+	struct drm_master *master;
+
+	if (!file_priv)
 		return true;
 
-	return _drm_lease_held_master(file_priv->master, id);
+	master = drm_file_get_master(file_priv);
+	if (master == NULL)
+		return true;
+	ret = _drm_lease_held_master(master, id);
+	drm_master_put(&master);
+
+	return ret;
 }
 
 /**
@@ -128,13 +137,20 @@ bool drm_lease_held(struct drm_file *file_priv, int id)
 	struct drm_master *master;
 	bool ret;
 
-	if (!file_priv || !file_priv->master || !file_priv->master->lessor)
+	if (!file_priv)
 		return true;
 
-	master = file_priv->master;
+	master = drm_file_get_master(file_priv);
+	if (master == NULL)
+		return true;
+	if (!master->lessor) {
+		drm_master_put(&master);
+		return true;
+	}
 	mutex_lock(&master->dev->mode_config.idr_mutex);
 	ret = _drm_lease_held_master(master, id);
 	mutex_unlock(&master->dev->mode_config.idr_mutex);
+	drm_master_put(&master);
 	return ret;
 }
 
@@ -154,10 +170,16 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
 	int count_in, count_out;
 	uint32_t crtcs_out = 0;
 
-	if (!file_priv || !file_priv->master || !file_priv->master->lessor)
+	if (!file_priv)
 		return crtcs_in;
 
-	master = file_priv->master;
+	master = drm_file_get_master(file_priv);
+	if (master == NULL)
+		return crtcs_in;
+	if (!master->lessor) {
+		drm_master_put(&master);
+		return crtcs_in;
+	}
 	dev = master->dev;
 
 	count_in = count_out = 0;
@@ -176,6 +198,7 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
 		count_in++;
 	}
 	mutex_unlock(&master->dev->mode_config.idr_mutex);
+	drm_master_put(&master);
 	return crtcs_out;
 }
 
@@ -489,7 +512,7 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 	size_t object_count;
 	int ret = 0;
 	struct idr leases;
-	struct drm_master *lessor = lessor_priv->master;
+	struct drm_master *lessor;
 	struct drm_master *lessee = NULL;
 	struct file *lessee_file = NULL;
 	struct file *lessor_file = lessor_priv->filp;
@@ -501,12 +524,6 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
-	/* Do not allow sub-leases */
-	if (lessor->lessor) {
-		DRM_DEBUG_LEASE("recursive leasing not allowed\n");
-		return -EINVAL;
-	}
-
 	/* need some objects */
 	if (cl->object_count == 0) {
 		DRM_DEBUG_LEASE("no objects in lease\n");
@@ -518,12 +535,22 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 		return -EINVAL;
 	}
 
+	lessor = drm_file_get_master(lessor_priv);
+	/* Do not allow sub-leases */
+	if (lessor->lessor) {
+		DRM_DEBUG_LEASE("recursive leasing not allowed\n");
+		ret = -EINVAL;
+		goto out_lessor;
+	}
+
 	object_count = cl->object_count;
 
 	object_ids = memdup_user(u64_to_user_ptr(cl->object_ids),
 			array_size(object_count, sizeof(__u32)));
-	if (IS_ERR(object_ids))
-		return PTR_ERR(object_ids);
+	if (IS_ERR(object_ids)) {
+		ret = PTR_ERR(object_ids);
+		goto out_lessor;
+	}
 
 	idr_init(&leases);
 
@@ -534,14 +561,15 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 	if (ret) {
 		DRM_DEBUG_LEASE("lease object lookup failed: %i\n", ret);
 		idr_destroy(&leases);
-		return ret;
+		goto out_lessor;
 	}
 
 	/* Allocate a file descriptor for the lease */
 	fd = get_unused_fd_flags(cl->flags & (O_CLOEXEC | O_NONBLOCK));
 	if (fd < 0) {
 		idr_destroy(&leases);
-		return fd;
+		ret = fd;
+		goto out_lessor;
 	}
 
 	DRM_DEBUG_LEASE("Creating lease\n");
@@ -577,6 +605,7 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 	/* Hook up the fd */
 	fd_install(fd, lessee_file);
 
+	drm_master_put(&lessor);
 	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl succeeded\n");
 	return 0;
 
@@ -586,6 +615,8 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 out_leases:
 	put_unused_fd(fd);
 
+out_lessor:
+	drm_master_put(&lessor);
 	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl failed: %d\n", ret);
 	return ret;
 }
@@ -608,7 +639,7 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
 	struct drm_mode_list_lessees *arg = data;
 	__u32 __user *lessee_ids = (__u32 __user *) (uintptr_t) (arg->lessees_ptr);
 	__u32 count_lessees = arg->count_lessees;
-	struct drm_master *lessor = lessor_priv->master, *lessee;
+	struct drm_master *lessor, *lessee;
 	int count;
 	int ret = 0;
 
@@ -619,6 +650,7 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
+	lessor = drm_file_get_master(lessor_priv);
 	DRM_DEBUG_LEASE("List lessees for %d\n", lessor->lessee_id);
 
 	mutex_lock(&dev->mode_config.idr_mutex);
@@ -642,6 +674,7 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
 		arg->count_lessees = count;
 
 	mutex_unlock(&dev->mode_config.idr_mutex);
+	drm_master_put(&lessor);
 
 	return ret;
 }
@@ -661,7 +694,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
 	struct drm_mode_get_lease *arg = data;
 	__u32 __user *object_ids = (__u32 __user *) (uintptr_t) (arg->objects_ptr);
 	__u32 count_objects = arg->count_objects;
-	struct drm_master *lessee = lessee_priv->master;
+	struct drm_master *lessee;
 	struct idr *object_idr;
 	int count;
 	void *entry;
@@ -675,6 +708,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
+	lessee = drm_file_get_master(lessee_priv);
 	DRM_DEBUG_LEASE("get lease for %d\n", lessee->lessee_id);
 
 	mutex_lock(&dev->mode_config.idr_mutex);
@@ -702,6 +736,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
 		arg->count_objects = count;
 
 	mutex_unlock(&dev->mode_config.idr_mutex);
+	drm_master_put(&lessee);
 
 	return ret;
 }
@@ -720,7 +755,7 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
 				void *data, struct drm_file *lessor_priv)
 {
 	struct drm_mode_revoke_lease *arg = data;
-	struct drm_master *lessor = lessor_priv->master;
+	struct drm_master *lessor;
 	struct drm_master *lessee;
 	int ret = 0;
 
@@ -730,6 +765,7 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
+	lessor = drm_file_get_master(lessor_priv);
 	mutex_lock(&dev->mode_config.idr_mutex);
 
 	lessee = _drm_find_lessee(lessor, arg->lessee_id);
@@ -750,6 +786,7 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
 
 fail:
 	mutex_unlock(&dev->mode_config.idr_mutex);
+	drm_master_put(&lessor);
 
 	return ret;
 }
diff --git a/include/drm/drm_auth.h b/include/drm/drm_auth.h
index 6bf8b2b78991..f99d3417f304 100644
--- a/include/drm/drm_auth.h
+++ b/include/drm/drm_auth.h
@@ -107,6 +107,7 @@ struct drm_master {
 };
 
 struct drm_master *drm_master_get(struct drm_master *master);
+struct drm_master *drm_file_get_master(struct drm_file *file_priv);
 void drm_master_put(struct drm_master **master);
 bool drm_is_current_master(struct drm_file *fpriv);
 
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index b81b3bfb08c8..e9931fca4ab7 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -226,9 +226,18 @@ struct drm_file {
 	/**
 	 * @master:
 	 *
-	 * Master this node is currently associated with. Only relevant if
-	 * drm_is_primary_client() returns true. Note that this only
-	 * matches &drm_device.master if the master is the currently active one.
+	 * Master this node is currently associated with. Protected by struct
+	 * &drm_device.master_mutex.
+	 *
+	 * Only relevant if drm_is_primary_client() returns true. Note that
+	 * this only matches &drm_device.master if the master is the currently
+	 * active one.
+	 *
+	 * When obtaining a copy of this pointer, it is recommended to either
+	 * hold struct &drm_device.master_mutex for the duration of the
+	 * pointer's use, or to use drm_file_get_master() if struct
+	 * &drm_device.master_mutex is not currently held and there is no other
+	 * need to hold it. This prevents @master from being freed during use.
 	 *
 	 * See also @authentication and @is_master and the :ref:`section on
 	 * primary nodes and authentication <drm_primary_node>`.
-- 
2.25.1

