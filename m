Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1E803F8034
	for <lists+linux-media@lfdr.de>; Thu, 26 Aug 2021 04:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236938AbhHZCDV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 22:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235823AbhHZCDV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 22:03:21 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFB3BC061757;
        Wed, 25 Aug 2021 19:02:34 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id q3so792658plx.4;
        Wed, 25 Aug 2021 19:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P/HLeCdm1ln+WDWlHx3gbH2c2TGPxEmJ7R7sNcfLOXw=;
        b=CT7h6MBpAMDIzIkV8lMUMCjYQ166pfsg2+w0kUZlShHVyArnL+WjVrSIfMoU4JnlZ6
         6bPBRWqj0e3eOeUtjM3d24seYloYJPfjNpUKpWtnwUkUHD6iUXCPSX44W8kUrA0CGCgt
         LtQJZd4cGVCCUpyQZBLrpKgjNSmayak1iXZaJS2CMPIjouy2VJhpTuBbpdd/YHtD6beK
         dd04Kl0M4LQ4Yfs1VgdcmIMO8bNiWpLP54v0OHeYyVExW2djCkhTl9Psq4/em9ZKjlCK
         LzqXnyTFpjCOtvtKeHELyI3nKD2pD6pAtrDa+6RC9JtHGqG6hggk8IUfp0klqHWQrpPd
         sJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P/HLeCdm1ln+WDWlHx3gbH2c2TGPxEmJ7R7sNcfLOXw=;
        b=WtfWjPWXsJ189PTUWzn1uKdBsQJ6IDUQIN842zK55GwMp39NBItkxouJSejzRataV0
         FV6wJvV8GDdjj8Vf48GqN2yNLNDYs/tK0xoP0N9R+0ysCyKUlkKN8WCDB/KB/ViJP7gb
         vOtZw0Uj+xplj11H06A2x/yWiGsgmPsEmfRL5vz9Yp55xOh304ugDWIYRNei4XcPARtJ
         j05rTCZrEWumEzrt79qG4UVfx68b/aUdVydT+37pu/xKsgKdK5B0qtYC2wQARqsuUEEe
         wWOGHrXt4w0qfLaqqao/TAIhgYKxNtDQmduMty+SG5fdguGyw0oSntswi6y0PVvPavO1
         lWsw==
X-Gm-Message-State: AOAM531/CxEZiQmbJDWQGp+GJ07vS0zY0AKN4iKhtoyudHsiICRxvvr5
        ZaV/vyooaOSiVwRR3d/Na/4=
X-Google-Smtp-Source: ABdhPJzmR2y3ikzBJknZrPk9wq+3ldlOQum+iet+txHL0F0oPreTZxXgS8lPn2WuOpIGYazbm9/lAw==
X-Received: by 2002:a17:90a:9411:: with SMTP id r17mr1401311pjo.49.1629943354485;
        Wed, 25 Aug 2021 19:02:34 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id i11sm721973pjj.19.2021.08.25.19.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 19:02:34 -0700 (PDT)
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
Subject: [PATCH v8 3/7] drm: lock drm_global_mutex earlier in the ioctl handler
Date:   Thu, 26 Aug 2021 10:01:18 +0800
Message-Id: <20210826020122.1488002-4-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210826020122.1488002-1-desmondcheongzx@gmail.com>
References: <20210826020122.1488002-1-desmondcheongzx@gmail.com>
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
---
 drivers/gpu/drm/drm_ioctl.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index d25713b09b80..158629d88319 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -772,19 +772,19 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
 	if (drm_dev_is_unplugged(dev))
 		return -ENODEV;
 
+	/* Enforce sane locking for modern driver ioctls. */
+	if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)) && !(flags & DRM_UNLOCKED))
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
+	if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)) && !(flags & DRM_UNLOCKED))
 		mutex_unlock(&drm_global_mutex);
-	}
 	return retcode;
 }
 EXPORT_SYMBOL(drm_ioctl_kernel);
-- 
2.25.1

