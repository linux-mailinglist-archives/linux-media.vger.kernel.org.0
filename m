Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49B943ADE05
	for <lists+linux-media@lfdr.de>; Sun, 20 Jun 2021 13:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbhFTLH2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Jun 2021 07:07:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbhFTLH1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Jun 2021 07:07:27 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC991C061574;
        Sun, 20 Jun 2021 04:05:14 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id v7so11727891pgl.2;
        Sun, 20 Jun 2021 04:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QdEeAyJvp98gW9MsCsFcUbBFLoaOp7KDNa8rsFezt8g=;
        b=HDFLYjYuPl+A+gCmumCr/IXehCHTQJ7xwyL+XPAfqocQ2F9fWvSf71X9VJcAJ5MpzT
         4pYwWidiB24i9HR5dU7Oc0wqlaQGwcQdTAZ2xUoy6uODDq9bwf3h+lxhA3UyUvPctzI+
         hDzLfazyWMGcfyv34x7YbE8jRVh9PkZ1PfQ43kwD7JDLLz6oBA6GkVOMszLJxcwuFnGn
         4pRYwIu8K29E4/OKu+WD7XEFWQc62mjEwJOdx6b9UZvhxZG3m9Lm0PHr2/dD9q2HSrO0
         cThFh6bhPtQu0P/fD5k3r1jiNmc3F5i9TaSJ3TrBAGxp3GXBBqR+u9639JCp9+FFPqcy
         Dp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QdEeAyJvp98gW9MsCsFcUbBFLoaOp7KDNa8rsFezt8g=;
        b=OYuhNv00ledOBK1TSuCCTI+xC2xiYqFLC/qbEuiTKMgQNfRlWyO+WXtdkdmYQALyYF
         r9j5H9D7Uz4iyLt8/t6MXEOMfy5ecdyBUi54bh2hl4hnyT3BxDm+nYImSRBUag44qNo9
         rO7KikhyvE4pzy0rOYE7yV8GIokEPzyw9FZ3iucFCyCxqU2jhGCLtABKlwVSKZaF5R/F
         3BsB99wlbWA5f9Uu3YFnUdEERfBFDrr1tXOFHjkhxcma7N4kZBmbBDhZv/Dwbjl+bLai
         3o8m2w0uD/+10/TXxC8CenikdjLZlJcvqOhbXtZrSyV6EArPjVYPwG+faxLoYVoWpdSS
         pb8A==
X-Gm-Message-State: AOAM533e233IkKajJdkekbH5QG2uXcxRehcOjG53pdKuEVTTTVrYZgbv
        yG02hSTk/nJ0pXZmGSrrDbE=
X-Google-Smtp-Source: ABdhPJyvmyogMygAVd6ehpn0EVt1WfMUiS3Btsf41oBLFjGCz1h+5sSm06GPr5hivd9r9vhvCvtLcw==
X-Received: by 2002:a05:6a00:1344:b029:2f6:5ce3:218e with SMTP id k4-20020a056a001344b02902f65ce3218emr14349473pfu.80.1624187114436;
        Sun, 20 Jun 2021 04:05:14 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id h22sm2644876pfc.21.2021.06.20.04.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jun 2021 04:05:14 -0700 (PDT)
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        emil.l.velikov@gmail.com, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v3 1/2] drm: add a locked version of drm_is_current_master
Date:   Sun, 20 Jun 2021 19:03:26 +0800
Message-Id: <20210620110327.4964-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620110327.4964-1-desmondcheongzx@gmail.com>
References: <20210620110327.4964-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While checking the master status of the DRM file in
drm_is_current_master(), the device's master mutex should be
held. Without the mutex, the pointer fpriv->master may be freed
concurrently by another process calling drm_setmaster_ioctl(). This
could lead to use-after-free errors when the pointer is subsequently
dereferenced in drm_lease_owner().

The callers of drm_is_current_master() from drm_auth.c hold the
device's master mutex, but external callers do not. Hence, we implement
drm_is_current_master_locked() to be used within drm_auth.c, and
modify drm_is_current_master() to grab the device's master mutex
before checking the master status.

Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/gpu/drm/drm_auth.c | 51 ++++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 232abbba3686..86d4b72e95cb 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -61,6 +61,35 @@
  * trusted clients.
  */
 
+static bool drm_is_current_master_locked(struct drm_file *fpriv)
+{
+	lockdep_assert_held_once(&fpriv->master->dev->master_mutex);
+
+	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
+}
+
+/**
+ * drm_is_current_master - checks whether @priv is the current master
+ * @fpriv: DRM file private
+ *
+ * Checks whether @fpriv is current master on its device. This decides whether a
+ * client is allowed to run DRM_MASTER IOCTLs.
+ *
+ * Most of the modern IOCTL which require DRM_MASTER are for kernel modesetting
+ * - the current master is assumed to own the non-shareable display hardware.
+ */
+bool drm_is_current_master(struct drm_file *fpriv)
+{
+	bool ret;
+
+	mutex_lock(&fpriv->master->dev->master_mutex);
+	ret = drm_is_current_master_locked(fpriv);
+	mutex_unlock(&fpriv->master->dev->master_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_is_current_master);
+
 int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
 {
 	struct drm_auth *auth = data;
@@ -223,7 +252,7 @@ int drm_setmaster_ioctl(struct drm_device *dev, void *data,
 	if (ret)
 		goto out_unlock;
 
-	if (drm_is_current_master(file_priv))
+	if (drm_is_current_master_locked(file_priv))
 		goto out_unlock;
 
 	if (dev->master) {
@@ -272,7 +301,7 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
 	if (ret)
 		goto out_unlock;
 
-	if (!drm_is_current_master(file_priv)) {
+	if (!drm_is_current_master_locked(file_priv)) {
 		ret = -EINVAL;
 		goto out_unlock;
 	}
@@ -321,7 +350,7 @@ void drm_master_release(struct drm_file *file_priv)
 	if (file_priv->magic)
 		idr_remove(&file_priv->master->magic_map, file_priv->magic);
 
-	if (!drm_is_current_master(file_priv))
+	if (!drm_is_current_master_locked(file_priv))
 		goto out;
 
 	drm_legacy_lock_master_cleanup(dev, master);
@@ -342,22 +371,6 @@ void drm_master_release(struct drm_file *file_priv)
 	mutex_unlock(&dev->master_mutex);
 }
 
-/**
- * drm_is_current_master - checks whether @priv is the current master
- * @fpriv: DRM file private
- *
- * Checks whether @fpriv is current master on its device. This decides whether a
- * client is allowed to run DRM_MASTER IOCTLs.
- *
- * Most of the modern IOCTL which require DRM_MASTER are for kernel modesetting
- * - the current master is assumed to own the non-shareable display hardware.
- */
-bool drm_is_current_master(struct drm_file *fpriv)
-{
-	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
-}
-EXPORT_SYMBOL(drm_is_current_master);
-
 /**
  * drm_master_get - reference a master pointer
  * @master: &struct drm_master
-- 
2.25.1

