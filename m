Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B68733EFDFF
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 09:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239320AbhHRHmF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 03:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239470AbhHRHmC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 03:42:02 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBC63C06179A;
        Wed, 18 Aug 2021 00:41:28 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id j187so1270955pfg.4;
        Wed, 18 Aug 2021 00:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1bkLMEw2t/totCFLQIzrVHXO8lyHlY0O9pr/RZGsdI0=;
        b=bLirg/ekc0It+7MhEmdqeKW1uskct7uSLEYEWb5Ts5xbzkUlwtt0MXY+lJk9DGWH0b
         Uqv9IwaVom6h+9HWW2VpWO/ZrDFqJx917Te1eyb59FUAVKaVVQ6cIDAYwQZGA/SqTxQ3
         okt1jnoVvDtYswWK6eXPFUwy4mbZ41c62jY+cFma3PrODfQ6olrM1dkWU8e+fnUdhuA6
         LcRvdhF2laqs5TgwKBgnqpmuons9CZfNplWWsgdfHzRXRlDU4/zxRj0MD2cYdlg/kgz6
         uQy/f3qvZI+gA9UJxHE+io77IuzIlxyEJuKlHcVdF3i4FEKKISV1yS+JwxrBszCcmW6+
         ed/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1bkLMEw2t/totCFLQIzrVHXO8lyHlY0O9pr/RZGsdI0=;
        b=qSkP/I+WErYgUBDLcAUsKxR7C4EsVEpplCGrHflvTHmeyoBOOXf05wXqX45XbmCC11
         xlBmz4GnDnqqyMb1Yo9vnomOZ9UVxRXxvh7Xbdzv5v38ZxBFvIR1EEvbdhQxrCWZGBBr
         R5oIyr6MmihvivqoAAZzvW11N7M+h/xvs3fKNIE6XnDssUz90XZF0FIz8Be+WRZF4/2J
         8c8v2L2r+AeNUX9DjFDEojAxfTeRzJcqhZrVscAvlb83NvA5STvZQtH6iDjX7vsBWipr
         NpNM8ePsJCcGt1HC/zltwhfF/+gtS+sNJAD2YoIKbOWoseZX9sIdHY76P90OcH3oFlNm
         rCbg==
X-Gm-Message-State: AOAM530BVhfJBVO7jgwXfHHX0tqgA2Urg0n0tBYQzXEtLQAonIt0/MpE
        gJbIKCcqEKXPcdWFpSDTwNs=
X-Google-Smtp-Source: ABdhPJys3HPHWTRsAjT+5YnD6rJNYZL136LiYwwEF8beumJZ6hVGWSIIaE7eeFYyLYOhAlW2I2XuJQ==
X-Received: by 2002:a05:6a00:181c:b029:3c6:2258:a844 with SMTP id y28-20020a056a00181cb02903c62258a844mr8044761pfa.6.1629272488381;
        Wed, 18 Aug 2021 00:41:28 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id u3sm3886729pjr.2.2021.08.18.00.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 00:41:27 -0700 (PDT)
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com, axboe@kernel.dk,
        oleg@redhat.com, tglx@linutronix.de, dvyukov@google.com,
        walter-zh.wu@mediatek.com
Cc:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v3 9/9] drm: avoid races with modesetting rights
Date:   Wed, 18 Aug 2021 15:38:24 +0800
Message-Id: <20210818073824.1560124-10-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In drm_client_modeset.c and drm_fb_helper.c,
drm_master_internal_{acquire,release} are used to avoid races with DRM
userspace. These functions hold onto drm_device.master_rwsem while
committing, and bail if there's already a master.

However, there are other places where modesetting rights can race. A
time-of-check-to-time-of-use error can occur if an ioctl that changes
the modeset has its rights revoked after it validates its permissions,
but before it completes.

There are four places where modesetting permissions can change:

- DROP_MASTER ioctl removes rights for a master and its leases

- REVOKE_LEASE ioctl revokes rights for a specific lease

- SET_MASTER ioctl sets the device master if the master role hasn't
been acquired yet

- drm_open which can create a new master for a device if one does not
currently exist

These races can be avoided using drm_device.master_rwsem: users that
perform modesetting should hold a read lock on the new
drm_device.master_rwsem, and users that change these permissions
should either hold a write lock, or should flush readers before
returning to userspace.

Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c     | 29 +++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_internal.h |  1 +
 drivers/gpu/drm/drm_ioctl.c    |  8 ++++++--
 drivers/gpu/drm/drm_lease.c    |  1 +
 include/drm/drm_device.h       | 10 +++++++++-
 5 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index b65681ff42fc..84d00275ff8a 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -29,6 +29,7 @@
  */
 
 #include <linux/slab.h>
+#include <linux/task_work.h>
 
 #include <drm/drm_auth.h>
 #include <drm/drm_drv.h>
@@ -127,6 +128,7 @@ int drm_authmagic(struct drm_device *dev, void *data,
 
 	DRM_DEBUG("%u\n", auth->magic);
 
+	lockdep_assert_held_once(&dev->master_rwsem);
 	spin_lock(&dev->master_lookup_lock);
 	file = idr_find(&file_priv->master->magic_map, auth->magic);
 	if (file) {
@@ -485,3 +487,30 @@ void drm_master_internal_release(struct drm_device *dev)
 	up_read(&dev->master_rwsem);
 }
 EXPORT_SYMBOL(drm_master_internal_release);
+
+/* After flushing, all readers that might have seen old master/lease
+ * permissions are guaranteed to have completed.
+ */
+static void master_flush(struct callback_head *cb)
+{
+	struct drm_device *dev = container_of(cb, struct drm_device,
+					      master_flush_work);
+
+	down_write(&dev->master_rwsem);
+	up_write(&dev->master_rwsem);
+}
+
+/* Queues up work to flush all readers of master/lease permissions. This work
+ * is run before this task returns to user mode. Calling this function when a
+ * task changes modesetting rights ensures that other processes that perform
+ * modesetting do not race with userspace.
+ */
+void drm_master_flush(struct drm_device *dev)
+{
+	init_task_work(&dev->master_flush_work, master_flush);
+	task_work_add(current, &dev->master_flush_work, TWA_RESUME);
+	/* If task_work_add fails, then the task is exiting. In this case, it
+	 * doesn't matter if master_flush is run, so we don't need an
+	 * alternative mechanism for flushing.
+	 */
+}
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 17f3548c8ed2..b1cd39338756 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -144,6 +144,7 @@ int drm_master_open(struct drm_file *file_priv);
 void drm_master_release(struct drm_file *file_priv);
 bool drm_master_internal_acquire(struct drm_device *dev);
 void drm_master_internal_release(struct drm_device *dev);
+void drm_master_flush(struct drm_device *dev);
 
 /* drm_sysfs.c */
 extern struct class *drm_class;
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 2cb57378a787..7f523e1c5650 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -390,7 +390,7 @@ static int drm_setversion(struct drm_device *dev, void *data, struct drm_file *f
 	struct drm_set_version *sv = data;
 	int if_version, retcode = 0;
 
-	down_read(&dev->master_rwsem);
+	lockdep_assert_held_once(&dev->master_rwsem);
 	if (sv->drm_di_major != -1) {
 		if (sv->drm_di_major != DRM_IF_MAJOR ||
 		    sv->drm_di_minor < 0 || sv->drm_di_minor > DRM_IF_MINOR) {
@@ -427,7 +427,6 @@ static int drm_setversion(struct drm_device *dev, void *data, struct drm_file *f
 	sv->drm_di_minor = DRM_IF_MINOR;
 	sv->drm_dd_major = dev->driver->major;
 	sv->drm_dd_minor = dev->driver->minor;
-	up_read(&dev->master_rwsem);
 
 	return retcode;
 }
@@ -783,6 +782,9 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
 	if (unlikely(drm_dev_needs_global_mutex(dev)) && !(flags & DRM_UNLOCKED))
 		mutex_lock(&drm_global_mutex);
 
+	if (unlikely(flags & DRM_MASTER))
+		down_read(&dev->master_rwsem);
+
 	retcode = drm_ioctl_permit(flags, file_priv);
 	if (unlikely(retcode))
 		goto out;
@@ -790,6 +792,8 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
 	retcode = func(dev, kdata, file_priv);
 
 out:
+	if (unlikely(flags & DRM_MASTER))
+		up_read(&dev->master_rwsem);
 	if (unlikely(drm_dev_needs_global_mutex(dev)) && !(flags & DRM_UNLOCKED))
 		mutex_unlock(&drm_global_mutex);
 	return retcode;
diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index dee4f24a1808..983701198ffd 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -723,6 +723,7 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
 	}
 
 	_drm_lease_revoke(lessee);
+	drm_master_flush(dev);
 
 fail:
 	mutex_unlock(&dev->mode_config.idr_mutex);
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index f1ae4570a20a..617f7fe1d3bf 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -151,10 +151,18 @@ struct drm_device {
 	 * Synchronizes modesetting rights between multiple users. Users that
 	 * can change the modeset or display state must hold a read lock on
 	 * @master_rwsem, and users that change modesetting rights should hold
-	 * a write lock.
+	 * a write lock or flush readers before returning to userspace.
 	 */
 	struct rw_semaphore master_rwsem;
 
+	/**
+	 * @master_flush_work:
+	 *
+	 * Callback structure used internally to queue work to flush readers of
+	 * master/lease permissions.
+	 */
+	struct callback_head master_flush_work;
+
 	/**
 	 * @master_lookup_lock:
 	 *
-- 
2.25.1

