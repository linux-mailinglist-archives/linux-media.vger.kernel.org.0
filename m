Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD68A3EFDE2
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 09:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238718AbhHRHkx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 03:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238224AbhHRHkw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 03:40:52 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FBAFC061764;
        Wed, 18 Aug 2021 00:40:18 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id u1so1294154plr.1;
        Wed, 18 Aug 2021 00:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+V7VHTmfbYqxcJ76dou/taP9ZefhBvJ0ABxX4BEFPg8=;
        b=m7n8Xew0QgjJED5UdrcOheshCPBH0tOTHhxv660xjAbgyIpemb6WWMkWeOjM3nvhhi
         YBjY0Vw0mJFYYfhOB6GFTpmXrcR+S5UftwQpJUdjC9CP5vhdSBj88Fd7nUGahEFzZuKW
         4gqVic6J3w0xZojmhuJzQ7aiMxKPoMaoQcmarwrsEmdpNNw7CS0U/dM55b0Si0LYcaNv
         hYeoPp1t8rlOl1BuCXVgd/S4J0vIXLK1ToRPRmS5zni6OrP4BxM8jnWGsu6XodZQCzS8
         KEkr5hi6W6AElILHnDc9tP044YmuoT1hNaikI98llUuJ2y7FCwQy3gb1mPUl3Lo56iI9
         iAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+V7VHTmfbYqxcJ76dou/taP9ZefhBvJ0ABxX4BEFPg8=;
        b=Icc1icZmcfHf+h/kjQkAbVxk/cMFEQ82LvBPKkDItZtMSJGtsjyJpStGx5WkKQewmP
         BS9zUdzONrVFGOi9G25lIt+yKt3DxXv8Iz28qS+/AX1zTuDGIYQQJgJ+p3J8sK9+1uQI
         FKl7ox3lnPbYSMZRr1UwGb/mcU98zAKPWSYsF8MnhLw8Y8UKX8lVx3vm5CCPG9avlN4P
         SpymwFNRZZQAH9Dw5L8IrG31jNdXpnkdyCYo/aMOYJEoLSGWFqSY2mYTPiTjrEqjL9D4
         iFXp+PDiycq4hU1k205Jk/kKiwH9NYhp3dI7ta580PmS/8do9xoITq/lnkgcX4dudg82
         eWkQ==
X-Gm-Message-State: AOAM533MMQ49PbiOVAg87XCQHbfyXa+clT1d/sDmmKXunc9JiYQKpAI6
        TFyZc73iRGnxY4Ib3lVubXI=
X-Google-Smtp-Source: ABdhPJxykdwOQoyj/vaukkauBj0yW2JddlxJ9QU5ekI6Ur/DK3dD/PNFCCoHKHLsE4Eb+yPsJaq8ww==
X-Received: by 2002:a17:90a:6684:: with SMTP id m4mr8131277pjj.226.1629272418090;
        Wed, 18 Aug 2021 00:40:18 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id u3sm3886729pjr.2.2021.08.18.00.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 00:40:17 -0700 (PDT)
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
Subject: [PATCH v3 1/9] drm: move master_lookup_lock into drm_device
Date:   Wed, 18 Aug 2021 15:38:16 +0800
Message-Id: <20210818073824.1560124-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The master_lookup_lock spinlock can be useful as an inner lock for
other attributes that are currently protected by
drm_device.master_mutex.

However, since the spinlock belongs to struct drm_file, its use case
is limited to serializing accesses by a single drm_file. Moving this
lock into struct drm_device allows us to use it for structures that
are accessed by multiple drm_files, such as drm_master.magic_map.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c | 18 +++++++++---------
 drivers/gpu/drm/drm_drv.c  |  1 +
 drivers/gpu/drm/drm_file.c |  1 -
 include/drm/drm_device.h   |  3 +++
 include/drm/drm_file.h     | 10 ++++------
 5 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 60a6b21474b1..8efb58aa7d95 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -63,7 +63,7 @@
 
 static bool drm_is_current_master_locked(struct drm_file *fpriv)
 {
-	lockdep_assert_once(lockdep_is_held(&fpriv->master_lookup_lock) ||
+	lockdep_assert_once(lockdep_is_held(&fpriv->minor->dev->master_lookup_lock) ||
 			    lockdep_is_held(&fpriv->minor->dev->master_mutex));
 
 	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
@@ -83,9 +83,9 @@ bool drm_is_current_master(struct drm_file *fpriv)
 {
 	bool ret;
 
-	spin_lock(&fpriv->master_lookup_lock);
+	spin_lock(&fpriv->minor->dev->master_lookup_lock);
 	ret = drm_is_current_master_locked(fpriv);
-	spin_unlock(&fpriv->master_lookup_lock);
+	spin_unlock(&fpriv->minor->dev->master_lookup_lock);
 
 	return ret;
 }
@@ -174,9 +174,9 @@ static int drm_new_set_master(struct drm_device *dev, struct drm_file *fpriv)
 	new_master = drm_master_create(dev);
 	if (!new_master)
 		return -ENOMEM;
-	spin_lock(&fpriv->master_lookup_lock);
+	spin_lock(&dev->master_lookup_lock);
 	fpriv->master = new_master;
-	spin_unlock(&fpriv->master_lookup_lock);
+	spin_unlock(&dev->master_lookup_lock);
 
 	fpriv->is_master = 1;
 	fpriv->authenticated = 1;
@@ -338,9 +338,9 @@ int drm_master_open(struct drm_file *file_priv)
 	if (!dev->master) {
 		ret = drm_new_set_master(dev, file_priv);
 	} else {
-		spin_lock(&file_priv->master_lookup_lock);
+		spin_lock(&dev->master_lookup_lock);
 		file_priv->master = drm_master_get(dev->master);
-		spin_unlock(&file_priv->master_lookup_lock);
+		spin_unlock(&dev->master_lookup_lock);
 	}
 	mutex_unlock(&dev->master_mutex);
 
@@ -405,13 +405,13 @@ struct drm_master *drm_file_get_master(struct drm_file *file_priv)
 {
 	struct drm_master *master = NULL;
 
-	spin_lock(&file_priv->master_lookup_lock);
+	spin_lock(&file_priv->minor->dev->master_lookup_lock);
 	if (!file_priv->master)
 		goto unlock;
 	master = drm_master_get(file_priv->master);
 
 unlock:
-	spin_unlock(&file_priv->master_lookup_lock);
+	spin_unlock(&file_priv->minor->dev->master_lookup_lock);
 	return master;
 }
 EXPORT_SYMBOL(drm_file_get_master);
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 7a5097467ba5..218c16f11c80 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -612,6 +612,7 @@ static int drm_dev_init(struct drm_device *dev,
 	mutex_init(&dev->filelist_mutex);
 	mutex_init(&dev->clientlist_mutex);
 	mutex_init(&dev->master_mutex);
+	spin_lock_init(&dev->master_lookup_lock);
 
 	ret = drmm_add_action(dev, drm_dev_init_release, NULL);
 	if (ret)
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index ed25168619fc..b8679bbaea69 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -176,7 +176,6 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 	init_waitqueue_head(&file->event_wait);
 	file->event_space = 4096; /* set aside 4k for event buffer */
 
-	spin_lock_init(&file->master_lookup_lock);
 	mutex_init(&file->event_read_lock);
 
 	if (drm_core_check_feature(dev, DRIVER_GEM))
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 604b1d1b2d72..506eb2784819 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -152,6 +152,9 @@ struct drm_device {
 	 */
 	struct mutex master_mutex;
 
+	/** @master_lookup_lock: Serializes &drm_file.master. */
+	spinlock_t master_lookup_lock;
+
 	/**
 	 * @open_count:
 	 *
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index a3acb7ac3550..0536e9612a46 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -227,15 +227,16 @@ struct drm_file {
 	 * @master:
 	 *
 	 * Master this node is currently associated with. Protected by struct
-	 * &drm_device.master_mutex, and serialized by @master_lookup_lock.
+	 * &drm_device.master_mutex, and serialized by
+	 * &drm_device.master_lookup_lock.
 	 *
 	 * Only relevant if drm_is_primary_client() returns true. Note that
 	 * this only matches &drm_device.master if the master is the currently
 	 * active one.
 	 *
 	 * To update @master, both &drm_device.master_mutex and
-	 * @master_lookup_lock need to be held, therefore holding either of
-	 * them is safe and enough for the read side.
+	 * &drm_device.master_lookup_lock need to be held, therefore holding
+	 * either of them is safe and enough for the read side.
 	 *
 	 * When dereferencing this pointer, either hold struct
 	 * &drm_device.master_mutex for the duration of the pointer's use, or
@@ -248,9 +249,6 @@ struct drm_file {
 	 */
 	struct drm_master *master;
 
-	/** @master_lock: Serializes @master. */
-	spinlock_t master_lookup_lock;
-
 	/** @pid: Process that opened this file. */
 	struct pid *pid;
 
-- 
2.25.1

