Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 420163F29D0
	for <lists+linux-media@lfdr.de>; Fri, 20 Aug 2021 12:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238920AbhHTKEb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Aug 2021 06:04:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238975AbhHTKE1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Aug 2021 06:04:27 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3FB2C061757;
        Fri, 20 Aug 2021 03:03:49 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id x1so3114488plg.10;
        Fri, 20 Aug 2021 03:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P/HLeCdm1ln+WDWlHx3gbH2c2TGPxEmJ7R7sNcfLOXw=;
        b=DTQmjYbeclJ/d85lmygNs7AQOxoVIEgJifRv2qQSOWvqZ2ZZ2rWY/looltY8Elkp94
         tBSeEkCIew/UhUnyrbqdFtHVhXWK9S/xgAOoa0cxD4dA26Cau+TwjwQ2MiKvSUp3UBOJ
         3ALHjolNoFTSFhdHZzTUXlBa4vlPqtchzwsSLBYQB9C/ZwNy7iDCtU2d3Pu8bWjY/F5f
         vDs6F8kL/cWPMz9qfbCTWsNRyab9mhiuGdsF6QrPf3hAScC1rHNgHcndN/OfZu8xIAE/
         FmAMJVxwiE4yvYhiC9HTr73nQS6OvqGHo5zvHigLOMsBzFIvEahGL09MXfi7a3fCyOAj
         GP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P/HLeCdm1ln+WDWlHx3gbH2c2TGPxEmJ7R7sNcfLOXw=;
        b=CKfa0LiSNk8IO1gev1n6SDPz2G9zgK2dV7/+2VrJdM69qE70WoT0E+km0vTZiOOhLC
         ElmYEmS+oQCtxvYdLMz24UEw/YS/KxvPp6yXSJCTKkSowV9YUGc6yfiTxD6RP6wHJ+Ox
         jDOMXPsfm0tR+xRSR9hpqJIaNeVpq+MLap66v1I38OL+hyESCjvOi+YpWgLAWonxeSez
         O5hT7g6zIO7Q5v6z7AxNu0dG3t/R1pLFuPiLuuGEwy1qIUD1k0rcB1C7kI65HVEIuXE+
         6qVT1aETVTB4tCN+vQm9eBzMukzsL9YWJW7gQOgeOrq+3FQHdBMEwSTU028qz/5FBn9v
         tq3A==
X-Gm-Message-State: AOAM531ydGkPirlPhZ4BkjFvxI+EyE91FpE9PIMeeLPJ+/+V4fDwHZcB
        P3DdB0GpesXWyscUg9Z87eE=
X-Google-Smtp-Source: ABdhPJxOTH91Pz0k0J62G0Pt+WjUnOM3YkdiIdgJpG/hwhsJm/R8BUkhMqNgSbA2rjecLZN1+wn50g==
X-Received: by 2002:a17:902:a604:b029:12c:dda2:30c4 with SMTP id u4-20020a170902a604b029012cdda230c4mr15447497plq.73.1629453829526;
        Fri, 20 Aug 2021 03:03:49 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id i8sm6503876pfo.117.2021.08.20.03.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 03:03:48 -0700 (PDT)
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v4 3/5] drm: lock drm_global_mutex earlier in the ioctl handler
Date:   Fri, 20 Aug 2021 18:02:49 +0800
Message-Id: <20210820100251.448346-4-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820100251.448346-1-desmondcheongzx@gmail.com>
References: <20210820100251.448346-1-desmondcheongzx@gmail.com>
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

