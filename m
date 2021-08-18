Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2C93EFDF2
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 09:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239284AbhHRHlg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 03:41:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239351AbhHRHld (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 03:41:33 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7EF8C061764;
        Wed, 18 Aug 2021 00:40:59 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id q2so1234256plr.11;
        Wed, 18 Aug 2021 00:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QEHuccOxvqNtSxSgci59cP9jo3dJUSb2vZvhFR8kmBM=;
        b=kyrTRnECEHbET1U8ahqUBcDC2k+PuuaNd2ZFISYrMAgnQWFXBkgRULnxtJd3D4A0Qk
         sv6Dy6gL1tZXoZf95+l5ZqMuBedFp7tD2JJ9vpU9tJZmG80Ru6fRUUErQa00tQF7JXal
         q4nkcdIu7vZAVlo48jb1ep26SNhQpD49gwhKdP9DhDK71KDMigl0pXVj+xgph1iYTpCV
         GEdyfy7nD9jCd6cWDxnfHI1Pl3E996Z52giWcXylPXYNY8AzLtKn/qEwWl6u46KGiJ2f
         tXSdXtqI2+YMaHhJ9XwkIBJrMaTN/Tr85hDUyG0oe6NBmufq+MqHUnY8beTAAQ7dkVvb
         zMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QEHuccOxvqNtSxSgci59cP9jo3dJUSb2vZvhFR8kmBM=;
        b=NUX0FzAKKTxUXyGgoRSw33fEnE4tFU2zdnslCQe7Mwj99X1Jj12URQO3oysjFL+leI
         o/DX2PHwZSXd3PgrIpBgZdga/9pFZOBzj2tYifXbBJU0BfohWiE4EzYdowAyLDbYimN6
         y1Xq7dKXCtAUNMd4BCN9aKVzWyT4AncMTi7vncmShv2xzkXMA7Hto9zfegtIs2uF/zaU
         DuCMIgPm1GikkWg7i0y3D9eDquuiZo+KfjxfMisEM88Tk7trmXYEw5Qk+5YBGq6xY81O
         ssQOdRjzLycSldSgPBcFI8CFEY01/nHhTbdPnhxCHJfiV/JTBreqX+haFRkqKDil4f7T
         U7Uw==
X-Gm-Message-State: AOAM5331xU8aPNGRNSzyVwLkGk0Y+GcK29526xbH8oH3mvT6S4HmmlIy
        0QX6mifuKiF+PetQjoZMnS0=
X-Google-Smtp-Source: ABdhPJxoBfNvfFHKP3I6P1QO1863L8cr1aqR7zIgRwfSUR+ThNMh9rENh0OPTK/qPRiwQJIg/iQTmg==
X-Received: by 2002:a17:90a:bf85:: with SMTP id d5mr8198209pjs.210.1629272459270;
        Wed, 18 Aug 2021 00:40:59 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id u3sm3886729pjr.2.2021.08.18.00.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 00:40:58 -0700 (PDT)
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
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v3 5/9] drm: protect magic_map,unique{_len} with master_lookup_lock
Date:   Wed, 18 Aug 2021 15:38:20 +0800
Message-Id: <20210818073824.1560124-6-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently, drm_device.master_mutex is used to serialize writes to the
drm_master.magic_map idr and to protect drm_master.unique{_len}.

In preparation for converting drm_device.master_mutex into an outer
rwsem that might be read locked before entering some of these
functions, we can instead serialize access to drm_master.magic_map and
drm_master.unique{_len} using drm_device.master_lookup_lock which is
an inner lock.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c  | 12 +++++++-----
 drivers/gpu/drm/drm_ioctl.c | 10 ++++++----
 include/drm/drm_auth.h      |  6 +++---
 include/drm/drm_device.h    |  7 ++++++-
 4 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index b7230604496b..0acb444fbbac 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -98,10 +98,10 @@ int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
 	struct drm_master *master;
 	int ret = 0;
 
-	mutex_lock(&dev->master_mutex);
+	spin_lock(&dev->master_lookup_lock);
 	master = file_priv->master;
 	if (!master) {
-		mutex_unlock(&dev->master_mutex);
+		spin_unlock(&dev->master_lookup_lock);
 		return -EINVAL;
 	}
 
@@ -112,7 +112,7 @@ int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
 			file_priv->magic = ret;
 	}
 	auth->magic = file_priv->magic;
-	mutex_unlock(&dev->master_mutex);
+	spin_unlock(&dev->master_lookup_lock);
 
 	DRM_DEBUG("%u\n", auth->magic);
 
@@ -127,13 +127,13 @@ int drm_authmagic(struct drm_device *dev, void *data,
 
 	DRM_DEBUG("%u\n", auth->magic);
 
-	mutex_lock(&dev->master_mutex);
+	spin_lock(&dev->master_lookup_lock);
 	file = idr_find(&file_priv->master->magic_map, auth->magic);
 	if (file) {
 		file->authenticated = 1;
 		idr_replace(&file_priv->master->magic_map, NULL, auth->magic);
 	}
-	mutex_unlock(&dev->master_mutex);
+	spin_unlock(&dev->master_lookup_lock);
 
 	return file ? 0 : -EINVAL;
 }
@@ -366,8 +366,10 @@ void drm_master_release(struct drm_file *file_priv)
 	if (!master)
 		goto unlock;
 
+	spin_lock(&dev->master_lookup_lock);
 	if (file_priv->magic)
 		idr_remove(&master->magic_map, file_priv->magic);
+	spin_unlock(&dev->master_lookup_lock);
 
 	if (!drm_is_current_master_locked(file_priv))
 		goto out;
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 4d029d3061d9..e5c3845b6e62 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -119,21 +119,21 @@ int drm_getunique(struct drm_device *dev, void *data,
 	struct drm_unique *u = data;
 	struct drm_master *master;
 
-	mutex_lock(&dev->master_mutex);
+	spin_lock(&dev->master_lookup_lock);
 	master = file_priv->master;
 	if (!master) {
-		mutex_unlock(&dev->master_mutex);
+		spin_unlock(&dev->master_lookup_lock);
 		return -EINVAL;
 	}
 
 	if (u->unique_len >= master->unique_len) {
 		if (copy_to_user(u->unique, master->unique, master->unique_len)) {
-			mutex_unlock(&dev->master_mutex);
+			spin_unlock(&dev->master_lookup_lock);
 			return -EFAULT;
 		}
 	}
 	u->unique_len = master->unique_len;
-	mutex_unlock(&dev->master_mutex);
+	spin_unlock(&dev->master_lookup_lock);
 
 	return 0;
 }
@@ -405,7 +405,9 @@ static int drm_setversion(struct drm_device *dev, void *data, struct drm_file *f
 			 * Version 1.1 includes tying of DRM to specific device
 			 * Version 1.4 has proper PCI domain support
 			 */
+			spin_lock(&dev->master_lookup_lock);
 			retcode = drm_set_busid(dev, file_priv);
+			spin_unlock(&dev->master_lookup_lock);
 			if (retcode)
 				goto done;
 		}
diff --git a/include/drm/drm_auth.h b/include/drm/drm_auth.h
index ba248ca8866f..f5be73153798 100644
--- a/include/drm/drm_auth.h
+++ b/include/drm/drm_auth.h
@@ -67,17 +67,17 @@ struct drm_master {
 	struct drm_device *dev;
 	/**
 	 * @unique: Unique identifier: e.g. busid. Protected by
-	 * &drm_device.master_mutex.
+	 * &drm_device.master_lookup_lock.
 	 */
 	char *unique;
 	/**
 	 * @unique_len: Length of unique field. Protected by
-	 * &drm_device.master_mutex.
+	 * &drm_device.master_lookup_lock.
 	 */
 	int unique_len;
 	/**
 	 * @magic_map: Map of used authentication tokens. Protected by
-	 * &drm_device.master_mutex.
+	 * &drm_device.master_lookup_lock.
 	 */
 	struct idr magic_map;
 	void *driver_priv;
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 506eb2784819..cf5d15aeb25f 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -152,7 +152,12 @@ struct drm_device {
 	 */
 	struct mutex master_mutex;
 
-	/** @master_lookup_lock: Serializes &drm_file.master. */
+	/**
+	 * @master_lookup_lock:
+	 *
+	 * Serializes &drm_file.master, &drm_master.magic_map,
+	 * &drm_master.unique, and &drm_master.unique_len.
+	 */
 	spinlock_t master_lookup_lock;
 
 	/**
-- 
2.25.1

