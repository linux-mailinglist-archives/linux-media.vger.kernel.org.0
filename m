Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDA603F773C
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 16:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241394AbhHYO0M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 10:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241406AbhHYOYE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 10:24:04 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80271C0617AE;
        Wed, 25 Aug 2021 07:23:14 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id 28-20020a17090a031cb0290178dcd8a4d1so4065075pje.0;
        Wed, 25 Aug 2021 07:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P/HLeCdm1ln+WDWlHx3gbH2c2TGPxEmJ7R7sNcfLOXw=;
        b=mtusQYTEk4rQj6pUM/lQl90/Exg1KKKi8S2bYy3beGnr6kEdJP6PRRWD2uPXm6vUTd
         acRmdwv1/IRfDGhkvgFSgxkhY1u5OZ9A2cdbTpq2r/Xm+wBxHNYVDcgBZCAqcABPAYfv
         4ebW71RUeuvZTYhf148UsxkEr/hPn3G0E4Ki1dTPAQf0K+VfY1ljuPmezRzWhABmkfFY
         n5gRqnw2GeT/Jb0RtFtX4rmX9JHuCdCfnY+jreWEZnHqE1UCvNrP0AgTb5a4p1E9NZVD
         P5rY4Re6UlxNz6kJWStphT7vrrT4Q+YZRZwM5+NrMKRe2asFn9/XcfQ3Wl70sM5W4VLA
         Q4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P/HLeCdm1ln+WDWlHx3gbH2c2TGPxEmJ7R7sNcfLOXw=;
        b=M2iRDbCHjFT4X5zVdFyvLp9him859OBMIEltMxPuziJhj8g+sur5GK95Opeza4+YDP
         /rpittagaAcUDN1qgvqg2dp7g3ysKWP7NVDebPFODxgmO0Of3otVPRCeDgaAiz0sLpu7
         dcAraJCMhWljhuXvRXCaWyAMlCUoCXA6vhabvShuVegQ5fdYSJwORfALwcZrDIkkWZ9M
         +0mu6ZDJLksnvCFUOT3vb15RDfynUyWko4qVKyjdnC9tVkDIA2cYDx2WYbTAIkaIaLIz
         aXNYZ8UG7+mqaawjiGsrVd9iqL219U6HZAb1+6Z7oWRnsQQfruch1f1g/KpZPQMnDV48
         0i3Q==
X-Gm-Message-State: AOAM533XVZQqclMHjEvBgAoZI03pgZRAbOh+PIztBY8VJ/W6YBXt/kat
        FbHwPS03nY3b+kicCbqKc9g=
X-Google-Smtp-Source: ABdhPJzQnYaYnevO8OAbWnnCMUEI3RT7xGhLZk59sUi6P6kDpoTEqTSVhl51BWqj4TosZGsYPBXG9A==
X-Received: by 2002:a17:902:850a:b029:12c:8da9:8bd2 with SMTP id bj10-20020a170902850ab029012c8da98bd2mr38657273plb.58.1629901394081;
        Wed, 25 Aug 2021 07:23:14 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id n3sm54431pfo.101.2021.08.25.07.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 07:23:13 -0700 (PDT)
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
Subject: [PATCH v7 3/7] drm: lock drm_global_mutex earlier in the ioctl handler
Date:   Wed, 25 Aug 2021 22:22:01 +0800
Message-Id: <20210825142205.1376789-4-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825142205.1376789-1-desmondcheongzx@gmail.com>
References: <20210825142205.1376789-1-desmondcheongzx@gmail.com>
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

