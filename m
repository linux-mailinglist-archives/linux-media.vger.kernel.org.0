Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 113E53FC3B0
	for <lists+linux-media@lfdr.de>; Tue, 31 Aug 2021 10:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239982AbhHaH0o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Aug 2021 03:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239965AbhHaH0n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Aug 2021 03:26:43 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C84B6C061575;
        Tue, 31 Aug 2021 00:25:48 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id x16so8423635pll.2;
        Tue, 31 Aug 2021 00:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FzExCBQE7rwMYVKetJ9aGi6+oVAsZBZjfgGFXxeHd5E=;
        b=LXe0f4nPVCe1oh3x5+e3cE7j/bEYgV/8zc80PbZ6LXQLG2n57Lx1fHt9akzFhqF06M
         vTvHuTvzUYHRxqmg69BlMsboB6VGAAGly8qOMokYCtmYecsc/TOUv+8JqRokhbx5GxOf
         7AygM2bgBVxhQiCJ+s58MVLwLzRG/hbTFKHxlKIBKZrVwYd8An/rad3jdSNesX1cumJH
         kim90j9snnZU2/XgbD1BGQHgdYI+34sJTM6Na8n8uyhqGf+YOlaw6x6qj5shKYDbrYDE
         /gEJcfnkwnbfBUfokZXQMndj6Ux36lZJFc0ABmo8rh6Fp59spcjw6h7Gh/LyKq5bjNxX
         cypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FzExCBQE7rwMYVKetJ9aGi6+oVAsZBZjfgGFXxeHd5E=;
        b=NyPnr+2SfD+QFZsfmUvn87mrY2DFytXtfe9EUyH7ADZB61mK0XjJZSGACmLYXi6jY/
         +e6cSAoBS/ibvBvR7XmlW1hulVVQPuFfmbKop0Maj/8L1TnvOYkDkB/qu9TDRoFq3mOi
         3sIlWmh8zL6jBBuT1ESZjV99wgFdgJUJsmn+vzULixkhw9Zil583k4Bly2Dh5yccI+pE
         WM4r6cYimlJTb0BKQOEBDu2x4UuF5d06x/Edtrb5/p4SipcZXkOUi9csKShQlwvJNVtl
         S7JKxkIYfEBA8HgWlk2s4yYHQH7XwYFw95O76p1lLohZA7tTjCJSmGVGO5vNaaHzf94Y
         2Nig==
X-Gm-Message-State: AOAM533v9ii4MNG15EqGwDRl4kJy62JMnmqeFOXNl72DaEfqE2yCW8cQ
        O7odjffzU1TJBuIPsE8OfK8=
X-Google-Smtp-Source: ABdhPJysGpkZ0cAY6VQlN8tnvez7JJZxx3OJmr6/KKxgL/wi48F5mbtV0mBFI6qvB9e1Z3DLUIq34w==
X-Received: by 2002:a17:90a:e64a:: with SMTP id ep10mr3657825pjb.167.1630394748361;
        Tue, 31 Aug 2021 00:25:48 -0700 (PDT)
Received: from sanitydock.wifi-cloud.jp ([210.160.217.69])
        by smtp.gmail.com with ESMTPSA id m11sm1720724pjn.2.2021.08.31.00.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 00:25:47 -0700 (PDT)
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v10 3/4] drm: lock drm_global_mutex earlier in the ioctl handler
Date:   Tue, 31 Aug 2021 15:25:00 +0800
Message-Id: <20210831072501.184211-4-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831072501.184211-1-desmondcheongzx@gmail.com>
References: <20210831072501.184211-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In a future patch, a read lock on drm_device.master_rwsem is
held in the ioctl handler before the check for ioctl
permissions. However, this inverts the lock hierarchy of
drm_global_mutex --> master_rwsem.

To avoid this, we do some prep work to grab the drm_global_mutex
before checking for ioctl permissions.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_ioctl.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 9fc00e36c5d6..fe9c4c0264a9 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -767,24 +767,27 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
 {
 	struct drm_file *file_priv = file->private_data;
 	struct drm_device *dev = file_priv->minor->dev;
+	bool locked_ioctl;
 	int retcode;
 
 	if (drm_dev_is_unplugged(dev))
 		return -ENODEV;
 
+	/* Enforce sane locking for modern driver ioctls. */
+	locked_ioctl = (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)) &&
+			!(flags & DRM_UNLOCKED));
+	if (locked_ioctl)
+		mutex_lock(&drm_global_mutex);
+
 	retcode = drm_ioctl_permit(flags, file_priv);
 	if (unlikely(retcode))
-		return retcode;
+		goto out;
 
-	/* Enforce sane locking for modern driver ioctls. */
-	if (likely(!drm_core_check_feature(dev, DRIVER_LEGACY)) ||
-	    (flags & DRM_UNLOCKED))
-		retcode = func(dev, kdata, file_priv);
-	else {
-		mutex_lock(&drm_global_mutex);
-		retcode = func(dev, kdata, file_priv);
+	retcode = func(dev, kdata, file_priv);
+
+out:
+	if (locked_ioctl)
 		mutex_unlock(&drm_global_mutex);
-	}
 	return retcode;
 }
 EXPORT_SYMBOL(drm_ioctl_kernel);
-- 
2.25.1

