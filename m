Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0260E3FC28C
	for <lists+linux-media@lfdr.de>; Tue, 31 Aug 2021 08:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231849AbhHaGP4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Aug 2021 02:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230519AbhHaGPz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Aug 2021 02:15:55 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB366C061575;
        Mon, 30 Aug 2021 23:15:00 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id e7so572005plh.8;
        Mon, 30 Aug 2021 23:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8hkPxmWIahwpRPq8B7GtGqA3EkMAolIN63S2SawwkKE=;
        b=u3DHwM2oboAS0ZS+3mC5Troi4b9j425hyQBxoON5rcNg7gbRyz6bFb/HNVYcYgRjXe
         QRCLG33ItY/zhpfIEpoNB9usWhaAB9rV9XlRBp4eJEaP7mJFFlhLdOXbBKpl9kJ0vnxO
         9kpd9npyh9Qx6NhldeMLDO9kbZPERm5mel5aOlz46kOBFdM9PHtorvsCM+z9T+RF+mja
         zZd6FZTx2fo/nIzc4JovO0h9I4idoA45weme2RTDeEPL0Bcu1vXKWUhP1VZ84DJa77vu
         baujx/5CZlH+qX/QxlKFAyAOOgOhgXFy4BAcKCgFOtugIkWMKLGx6CgJ4VVwKwnI2OmV
         OJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8hkPxmWIahwpRPq8B7GtGqA3EkMAolIN63S2SawwkKE=;
        b=RaxNmXHI1LKcMKr23KN6uEOWiLuKUTVLwduMii643zyz1gq/Pb5k52ipE9FLdOXYCR
         JHK5ZCNzCG0mgCLw8qxo12DrFzPzpnFG7WbEMyP4//zNoDN7l19BIlSNrAn6ZXZUrccT
         U+Vzb1qZmUKphozvj8trgGPIKWRjopKExbHgt43QHE3ZkYyo1u+kE9uiR/sMxejXM3du
         ivSMoQAY+xKQw9HIjQLg03FOfRj/z3omTssMaNb0X/rglECduyp6qf/yOYGa7WO5105Q
         nwnjRNBaRzfyOfzOa/amBK9Vkdb4K+eTVFRgywOhuKtNGQ7gocq9JryvG3IxHR6hUKbK
         RHWA==
X-Gm-Message-State: AOAM531vDxosb0Qn5FHRpXg/WZSE8FpRA0HA4FihH9iN5V59MuMbMl6v
        ehQSYjkOxEr8xfrgwE+WsoM=
X-Google-Smtp-Source: ABdhPJxNS3Mwi+vwp6emNlPWYdac3Ef7YicUK0bPsOF/2GZ0ApJ2i4XbFY8HEZTR5UKZBZz2OdQrRA==
X-Received: by 2002:a17:90a:4a8a:: with SMTP id f10mr3424851pjh.195.1630390500318;
        Mon, 30 Aug 2021 23:15:00 -0700 (PDT)
Received: from sanitydock.wifi-cloud.jp ([210.160.217.69])
        by smtp.gmail.com with ESMTPSA id z7sm1405724pjr.42.2021.08.30.23.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 23:14:59 -0700 (PDT)
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
Subject: [PATCH v9 3/4] drm: lock drm_global_mutex earlier in the ioctl handler
Date:   Tue, 31 Aug 2021 14:13:47 +0800
Message-Id: <20210831061348.97696-4-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831061348.97696-1-desmondcheongzx@gmail.com>
References: <20210831061348.97696-1-desmondcheongzx@gmail.com>
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
index d25713b09b80..59c5aa850dd5 100644
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

