Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 621933F730A
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 12:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239954AbhHYK1U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 06:27:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239934AbhHYK1P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 06:27:15 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51495C061757;
        Wed, 25 Aug 2021 03:26:29 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id b9so9677772plx.2;
        Wed, 25 Aug 2021 03:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P/HLeCdm1ln+WDWlHx3gbH2c2TGPxEmJ7R7sNcfLOXw=;
        b=mcrlqXx2veIFAPIuR1zZjjMGBGC3pLIA2IFrCCQwW8jK9wRON0L+mvneUtG9EWMRx+
         7d7b5AXWPfLm1KEB+5LTnOhEipuf9Di9/CY1lUxuUiDbu4v9A0doKF0Qm6poKea5VseM
         ko4jRSDZrGQ2WXvHQx7y+9kGiXJtIFws3WUyprbvinMgQ4n6Qa9xbgJM1o7xdsImwYt+
         jNyeTWPF5243/7Qr5xB2lsXL4BXLNs/euuJ3AId/5+8W+fGHy+mP8eAJf8vH4fD8GXIa
         7zXINxn+uv8DZbkky03Hg1aWUm/9c9gILHsj+0dX8m4Jw3w8F3dvcfvnnKkpIajiXCE7
         0Z8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P/HLeCdm1ln+WDWlHx3gbH2c2TGPxEmJ7R7sNcfLOXw=;
        b=mch9WhXWsuuHN9YF4y2YdhorQwfFDRGsMHa8ZvRZmbcsuuwqejQhROgHygk07GNgyQ
         yyEwg3owWn1+NEXRwPxvMVWe79t+ruAo3Oy99IndhpnXA1fyDfmTBY6gPVR5L/qTEkuv
         TPA2H0xrsIQr9XpM1jmLSRJENjFMzFxaxYSHHcSBIQgDNocikL0OWkkDEArRgff7ueCw
         hKPG1NegTaQPf66v2KJz1/fnlX8T33fE0zkUMPygp0Cbx6HuKKwyWdVT9cF1h/Jtb3LO
         veD3O9gtM9KZKkMqoh6M2yxZJk7phucLfJHrOYPFb0gHiL/a3nxLzEJhNJ3SZqD5SYcK
         pMSw==
X-Gm-Message-State: AOAM5306evBofVa5uQWmaIhdTeL9U2327aQeHIvvYJq3hsWUun9KnXQm
        H5WonxQP6DpIp2OkbYyp7CE=
X-Google-Smtp-Source: ABdhPJzePDrz0gmAXJF/b1c+ZQtAypG8eji/dWUqtQ+OfAnYEoiu9NXIpjQUuVh17nWzvMUuZRXSnQ==
X-Received: by 2002:a17:902:bcc5:b0:133:1943:b48b with SMTP id o5-20020a170902bcc500b001331943b48bmr17088082pls.52.1629887188912;
        Wed, 25 Aug 2021 03:26:28 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id t42sm10228377pfg.30.2021.08.25.03.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 03:26:28 -0700 (PDT)
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
Subject: [PATCH v6 3/7] drm: lock drm_global_mutex earlier in the ioctl handler
Date:   Wed, 25 Aug 2021 18:24:07 +0800
Message-Id: <20210825102411.1084220-4-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825102411.1084220-1-desmondcheongzx@gmail.com>
References: <20210825102411.1084220-1-desmondcheongzx@gmail.com>
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

