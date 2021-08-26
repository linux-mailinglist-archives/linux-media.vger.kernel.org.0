Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A01C03F8031
	for <lists+linux-media@lfdr.de>; Thu, 26 Aug 2021 04:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237045AbhHZCDM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 22:03:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236938AbhHZCDL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 22:03:11 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68A15C061757;
        Wed, 25 Aug 2021 19:02:25 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id x16so1344710pfh.2;
        Wed, 25 Aug 2021 19:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bkFQht7vR3ZjKExLOYXZei3qepyeU4QeAm6JOJ26wAc=;
        b=CZj5njVvvzCOKgW/2cEYJQNYUf4Rt5BxRiwUCSowCswSGJc8bUjFiaLeyL9kLM0H89
         jfSINVSh3QoLPyU9ppcdJQd6iD9JenUd+Dz1/9JQ+9itHhtmssYbyhRtkl/96mibARO7
         Y2+9efxyspgAllk+fOlnKs2nY2Bc50oRjxprtAhylWubkkYcHkY9z30gCCFxB4s/e+ed
         ABSzmjKb29ui8D0LdbT1zbO0CbzInm0o93Psi7iFKEvpuTYgp8AU8ANKEHrd1XVoP+eG
         VTpMXSyZU+SaTP/Pda84LkHEUlicx0KwjihxIXKhZTSGKDT3pI2YZIQLfVh2uQIdql2Q
         T0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bkFQht7vR3ZjKExLOYXZei3qepyeU4QeAm6JOJ26wAc=;
        b=R65kB2PLGOzZ5fzJJ5cBbdUC296WgS8pxFojKL+akPGjlHBzXL09V8kmtGm3GUq6Sj
         JFM9d+iOhyySzKxNwh5mF4EbfwcF+0fs3yxt1YaZQytR688Zyob9S6HYBW9z4lUkMuJm
         JI3YDTPdrjoCUSAKr9lvFrjm23pVsip/mLSl1uPmaDQ/2OC5fe1jnCQmXUWTt13bX9EN
         b6VVSWHrM+5FpufdrbuKMgG53QZr7VycNilFGSHVWmhnTd52TM2caMM/hIbLfBh6BWGf
         tDSgVKiG/be3M4A31BWUxHWIElkQTxGZtbcXhiVqHqYOFwodv3sfAlWax35Wm/yevGCL
         iUyA==
X-Gm-Message-State: AOAM532+jd80EKZxI08Bk36Y/U0ZZRL/Ilq54xGRvvm7poXTSQCSOQeo
        toSXF4AJ1LTU48k5jtFGenc=
X-Google-Smtp-Source: ABdhPJxFGiK5YKYyzzX3B0wVHISPAq27dzLpp65DbeX+Q1gxnr9cNM4xPVSpsoDi4+/Aj9xCJLY3Bw==
X-Received: by 2002:a62:4e0f:0:b0:3ee:668d:b841 with SMTP id c15-20020a624e0f000000b003ee668db841mr1370637pfb.48.1629943344858;
        Wed, 25 Aug 2021 19:02:24 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id i11sm721973pjj.19.2021.08.25.19.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 19:02:24 -0700 (PDT)
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, chris@chris-wilson.co.uk,
        ville.syrjala@linux.intel.com, matthew.auld@intel.com,
        dan.carpenter@oracle.com, tvrtko.ursulin@intel.com,
        matthew.d.roper@intel.com, lucas.demarchi@intel.com,
        karthik.b.s@intel.com, jose.souza@intel.com,
        manasi.d.navare@intel.com, airlied@redhat.com,
        aditya.swarup@intel.com, andrescj@chromium.org,
        linux-graphics-maintainer@vmware.com, zackr@vmware.com
Cc:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v8 2/7] drm: convert drm_device.master_mutex into a rwsem
Date:   Thu, 26 Aug 2021 10:01:17 +0800
Message-Id: <20210826020122.1488002-3-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210826020122.1488002-1-desmondcheongzx@gmail.com>
References: <20210826020122.1488002-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

drm_device.master_mutex currently protects the following:
- drm_device.master
- drm_file.master
- drm_file.was_master
- drm_file.is_master
- drm_master.unique
- drm_master.unique_len
- drm_master.magic_map

There is a clear separation between functions that read or change
these attributes. Hence, convert master_mutex into a rwsem to enable
concurrent readers.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c    | 35 ++++++++++++++++++-----------------
 drivers/gpu/drm/drm_debugfs.c |  4 ++--
 drivers/gpu/drm/drm_drv.c     |  3 +--
 drivers/gpu/drm/drm_ioctl.c   | 10 +++++-----
 include/drm/drm_auth.h        |  6 +++---
 include/drm/drm_device.h      | 10 ++++++----
 include/drm/drm_file.h        | 12 ++++++------
 7 files changed, 41 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 60a6b21474b1..73ade0513ccb 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -64,7 +64,7 @@
 static bool drm_is_current_master_locked(struct drm_file *fpriv)
 {
 	lockdep_assert_once(lockdep_is_held(&fpriv->master_lookup_lock) ||
-			    lockdep_is_held(&fpriv->minor->dev->master_mutex));
+			    lockdep_is_held(&fpriv->minor->dev->master_rwsem));
 
 	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
 }
@@ -96,7 +96,7 @@ int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
 	struct drm_auth *auth = data;
 	int ret = 0;
 
-	mutex_lock(&dev->master_mutex);
+	down_write(&dev->master_rwsem);
 	if (!file_priv->magic) {
 		ret = idr_alloc(&file_priv->master->magic_map, file_priv,
 				1, 0, GFP_KERNEL);
@@ -104,7 +104,7 @@ int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
 			file_priv->magic = ret;
 	}
 	auth->magic = file_priv->magic;
-	mutex_unlock(&dev->master_mutex);
+	up_write(&dev->master_rwsem);
 
 	DRM_DEBUG("%u\n", auth->magic);
 
@@ -119,13 +119,13 @@ int drm_authmagic(struct drm_device *dev, void *data,
 
 	DRM_DEBUG("%u\n", auth->magic);
 
-	mutex_lock(&dev->master_mutex);
+	down_write(&dev->master_rwsem);
 	file = idr_find(&file_priv->master->magic_map, auth->magic);
 	if (file) {
 		file->authenticated = 1;
 		idr_replace(&file_priv->master->magic_map, NULL, auth->magic);
 	}
-	mutex_unlock(&dev->master_mutex);
+	up_write(&dev->master_rwsem);
 
 	return file ? 0 : -EINVAL;
 }
@@ -167,7 +167,7 @@ static int drm_new_set_master(struct drm_device *dev, struct drm_file *fpriv)
 	struct drm_master *old_master;
 	struct drm_master *new_master;
 
-	lockdep_assert_held_once(&dev->master_mutex);
+	lockdep_assert_held_once(&dev->master_rwsem);
 
 	WARN_ON(fpriv->is_master);
 	old_master = fpriv->master;
@@ -249,7 +249,7 @@ int drm_setmaster_ioctl(struct drm_device *dev, void *data,
 {
 	int ret;
 
-	mutex_lock(&dev->master_mutex);
+	down_write(&dev->master_rwsem);
 
 	ret = drm_master_check_perm(dev, file_priv);
 	if (ret)
@@ -281,7 +281,7 @@ int drm_setmaster_ioctl(struct drm_device *dev, void *data,
 
 	drm_set_master(dev, file_priv, false);
 out_unlock:
-	mutex_unlock(&dev->master_mutex);
+	up_write(&dev->master_rwsem);
 	return ret;
 }
 
@@ -298,7 +298,7 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
 {
 	int ret;
 
-	mutex_lock(&dev->master_mutex);
+	down_write(&dev->master_rwsem);
 
 	ret = drm_master_check_perm(dev, file_priv);
 	if (ret)
@@ -321,8 +321,9 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
 	}
 
 	drm_drop_master(dev, file_priv);
+
 out_unlock:
-	mutex_unlock(&dev->master_mutex);
+	up_write(&dev->master_rwsem);
 	return ret;
 }
 
@@ -334,7 +335,7 @@ int drm_master_open(struct drm_file *file_priv)
 	/* if there is no current master make this fd it, but do not create
 	 * any master object for render clients
 	 */
-	mutex_lock(&dev->master_mutex);
+	down_write(&dev->master_rwsem);
 	if (!dev->master) {
 		ret = drm_new_set_master(dev, file_priv);
 	} else {
@@ -342,7 +343,7 @@ int drm_master_open(struct drm_file *file_priv)
 		file_priv->master = drm_master_get(dev->master);
 		spin_unlock(&file_priv->master_lookup_lock);
 	}
-	mutex_unlock(&dev->master_mutex);
+	up_write(&dev->master_rwsem);
 
 	return ret;
 }
@@ -352,7 +353,7 @@ void drm_master_release(struct drm_file *file_priv)
 	struct drm_device *dev = file_priv->minor->dev;
 	struct drm_master *master;
 
-	mutex_lock(&dev->master_mutex);
+	down_write(&dev->master_rwsem);
 	master = file_priv->master;
 	if (file_priv->magic)
 		idr_remove(&file_priv->master->magic_map, file_priv->magic);
@@ -375,7 +376,7 @@ void drm_master_release(struct drm_file *file_priv)
 	/* drop the master reference held by the file priv */
 	if (file_priv->master)
 		drm_master_put(&file_priv->master);
-	mutex_unlock(&dev->master_mutex);
+	up_write(&dev->master_rwsem);
 }
 
 /**
@@ -450,9 +451,9 @@ EXPORT_SYMBOL(drm_master_put);
 /* Used by drm_client and drm_fb_helper */
 bool drm_master_internal_acquire(struct drm_device *dev)
 {
-	mutex_lock(&dev->master_mutex);
+	down_read(&dev->master_rwsem);
 	if (dev->master) {
-		mutex_unlock(&dev->master_mutex);
+		up_read(&dev->master_rwsem);
 		return false;
 	}
 
@@ -463,6 +464,6 @@ EXPORT_SYMBOL(drm_master_internal_acquire);
 /* Used by drm_client and drm_fb_helper */
 void drm_master_internal_release(struct drm_device *dev)
 {
-	mutex_unlock(&dev->master_mutex);
+	up_read(&dev->master_rwsem);
 }
 EXPORT_SYMBOL(drm_master_internal_release);
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index b0a826489488..b34c9c263188 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -55,7 +55,7 @@ static int drm_name_info(struct seq_file *m, void *data)
 	struct drm_device *dev = minor->dev;
 	struct drm_master *master;
 
-	mutex_lock(&dev->master_mutex);
+	down_read(&dev->master_rwsem);
 	master = dev->master;
 	seq_printf(m, "%s", dev->driver->name);
 	if (dev->dev)
@@ -65,7 +65,7 @@ static int drm_name_info(struct seq_file *m, void *data)
 	if (dev->unique)
 		seq_printf(m, " unique=%s", dev->unique);
 	seq_printf(m, "\n");
-	mutex_unlock(&dev->master_mutex);
+	up_read(&dev->master_rwsem);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 7a5097467ba5..4556bf42954c 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -570,7 +570,6 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
 	/* Prevent use-after-free in drm_managed_release when debugging is
 	 * enabled. Slightly awkward, but can't really be helped. */
 	dev->dev = NULL;
-	mutex_destroy(&dev->master_mutex);
 	mutex_destroy(&dev->clientlist_mutex);
 	mutex_destroy(&dev->filelist_mutex);
 	mutex_destroy(&dev->struct_mutex);
@@ -611,7 +610,7 @@ static int drm_dev_init(struct drm_device *dev,
 	mutex_init(&dev->struct_mutex);
 	mutex_init(&dev->filelist_mutex);
 	mutex_init(&dev->clientlist_mutex);
-	mutex_init(&dev->master_mutex);
+	init_rwsem(&dev->master_rwsem);
 
 	ret = drmm_add_action(dev, drm_dev_init_release, NULL);
 	if (ret)
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 26f3a9ede8fe..d25713b09b80 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -119,16 +119,16 @@ int drm_getunique(struct drm_device *dev, void *data,
 	struct drm_unique *u = data;
 	struct drm_master *master;
 
-	mutex_lock(&dev->master_mutex);
+	down_read(&dev->master_rwsem);
 	master = file_priv->master;
 	if (u->unique_len >= master->unique_len) {
 		if (copy_to_user(u->unique, master->unique, master->unique_len)) {
-			mutex_unlock(&dev->master_mutex);
+			up_read(&dev->master_rwsem);
 			return -EFAULT;
 		}
 	}
 	u->unique_len = master->unique_len;
-	mutex_unlock(&dev->master_mutex);
+	up_read(&dev->master_rwsem);
 
 	return 0;
 }
@@ -385,7 +385,7 @@ static int drm_setversion(struct drm_device *dev, void *data, struct drm_file *f
 	struct drm_set_version *sv = data;
 	int if_version, retcode = 0;
 
-	mutex_lock(&dev->master_mutex);
+	down_write(&dev->master_rwsem);
 	if (sv->drm_di_major != -1) {
 		if (sv->drm_di_major != DRM_IF_MAJOR ||
 		    sv->drm_di_minor < 0 || sv->drm_di_minor > DRM_IF_MINOR) {
@@ -420,7 +420,7 @@ static int drm_setversion(struct drm_device *dev, void *data, struct drm_file *f
 	sv->drm_di_minor = DRM_IF_MINOR;
 	sv->drm_dd_major = dev->driver->major;
 	sv->drm_dd_minor = dev->driver->minor;
-	mutex_unlock(&dev->master_mutex);
+	up_write(&dev->master_rwsem);
 
 	return retcode;
 }
diff --git a/include/drm/drm_auth.h b/include/drm/drm_auth.h
index ba248ca8866f..f0a89e5fcaad 100644
--- a/include/drm/drm_auth.h
+++ b/include/drm/drm_auth.h
@@ -67,17 +67,17 @@ struct drm_master {
 	struct drm_device *dev;
 	/**
 	 * @unique: Unique identifier: e.g. busid. Protected by
-	 * &drm_device.master_mutex.
+	 * &drm_device.master_rwsem.
 	 */
 	char *unique;
 	/**
 	 * @unique_len: Length of unique field. Protected by
-	 * &drm_device.master_mutex.
+	 * &drm_device.master_rwsem.
 	 */
 	int unique_len;
 	/**
 	 * @magic_map: Map of used authentication tokens. Protected by
-	 * &drm_device.master_mutex.
+	 * &drm_device.master_rwsem.
 	 */
 	struct idr magic_map;
 	void *driver_priv;
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 604b1d1b2d72..142fb2f6e74d 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -107,7 +107,7 @@ struct drm_device {
 	 * @master:
 	 *
 	 * Currently active master for this device.
-	 * Protected by &master_mutex
+	 * Protected by &master_rwsem
 	 */
 	struct drm_master *master;
 
@@ -146,11 +146,13 @@ struct drm_device {
 	struct mutex struct_mutex;
 
 	/**
-	 * @master_mutex:
+	 * @master_rwsem:
 	 *
-	 * Lock for &drm_minor.master and &drm_file.is_master
+	 * Lock for &drm_device.master, &drm_file.was_master,
+	 * &drm_file.is_master, &drm_file.master, &drm_master.unique,
+	 * &drm_master.unique_len, and &drm_master.magic_map.
 	 */
-	struct mutex master_mutex;
+	struct rw_semaphore master_rwsem;
 
 	/**
 	 * @open_count:
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index a3acb7ac3550..d12bb2ba7814 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -205,7 +205,7 @@ struct drm_file {
 	 * @was_master:
 	 *
 	 * This client has or had, master capability. Protected by struct
-	 * &drm_device.master_mutex.
+	 * &drm_device.master_rwsem.
 	 *
 	 * This is used to ensure that CAP_SYS_ADMIN is not enforced, if the
 	 * client is or was master in the past.
@@ -216,7 +216,7 @@ struct drm_file {
 	 * @is_master:
 	 *
 	 * This client is the creator of @master. Protected by struct
-	 * &drm_device.master_mutex.
+	 * &drm_device.master_rwsem.
 	 *
 	 * See also the :ref:`section on primary nodes and authentication
 	 * <drm_primary_node>`.
@@ -227,19 +227,19 @@ struct drm_file {
 	 * @master:
 	 *
 	 * Master this node is currently associated with. Protected by struct
-	 * &drm_device.master_mutex, and serialized by @master_lookup_lock.
+	 * &drm_device.master_rwsem, and serialized by @master_lookup_lock.
 	 *
 	 * Only relevant if drm_is_primary_client() returns true. Note that
 	 * this only matches &drm_device.master if the master is the currently
 	 * active one.
 	 *
-	 * To update @master, both &drm_device.master_mutex and
+	 * To update @master, both &drm_device.master_rwsem and
 	 * @master_lookup_lock need to be held, therefore holding either of
 	 * them is safe and enough for the read side.
 	 *
 	 * When dereferencing this pointer, either hold struct
-	 * &drm_device.master_mutex for the duration of the pointer's use, or
-	 * use drm_file_get_master() if struct &drm_device.master_mutex is not
+	 * &drm_device.master_rwsem for the duration of the pointer's use, or
+	 * use drm_file_get_master() if struct &drm_device.master_rwsem is not
 	 * currently held and there is no other need to hold it. This prevents
 	 * @master from being freed during use.
 	 *
-- 
2.25.1

