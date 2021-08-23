Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD2F3F4F3B
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 19:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231709AbhHWRQO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 13:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231403AbhHWRQM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 13:16:12 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D4DC061575;
        Mon, 23 Aug 2021 10:15:29 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id a21so15941132pfh.5;
        Mon, 23 Aug 2021 10:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P/HLeCdm1ln+WDWlHx3gbH2c2TGPxEmJ7R7sNcfLOXw=;
        b=c0f4kiiXc4IkYgZ7SwV50fvg9X1ZxF8YmeWTnH1aY4zr7f7CxUhhKSV/ZxhYEciPsx
         R4qVFbmzrhrtFLWu5p5Y0++tTcd6CaIj04UjTLFpXvsk9ker44OElUT1FAhJ1Rt0VW+L
         kJjfeN5Gn7i6bWpucmWiFYyQ16P3Jy332p1OBTQKhgyhWGok75i5BFP08s/R0+IH7OWo
         NtrYk744ZrR0r4l/25XjPCpwbOubap2eD0VpfKj1KT4MhXwPEorZId01Rru6W+3wAJk1
         h5BxeL35p/7pwLyuFfPvEvQyytrwmRi+vPiLjPoshVtby2FB5ccCGeT+9IpVO3fPjaEI
         IBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P/HLeCdm1ln+WDWlHx3gbH2c2TGPxEmJ7R7sNcfLOXw=;
        b=PmZj6BVtD7Sioily5f5dH4NCebu2UTCz0huIj1mW6QccWpBQL4FwdUzkZJh5S25dmR
         tMLNoQRrg5v0agBqU8ScaRZ6qSCacG7ho9e4uRzGoK7FHPU2J2prAwbH6jR0XhGKpwT5
         IPEaHeJ5jB30S5PgCz92N3oFtJDPh4j74nCa/kA3aPUIv8xKBhgDIpS0Wi7K14TdJ0Sg
         qWDSg9+IK9dgAKJej/FTtuwbAFq3OM81pZahIgMyuphyI9GWDe1oamj37lJSNSB/c0sy
         glytvQ0EEm9R4anhW4JWvVni74+D5H+jsjZUUR9UQcxJDfefzyFv3xEfWO5AkbNcbDKa
         VY2g==
X-Gm-Message-State: AOAM533AX4Xf9CSkzB1frRQjpHtOrP8nlkTsMVLD/KV/G8m/CmdtvVPS
        WP6tb403pRqENK68U1sdVZQ=
X-Google-Smtp-Source: ABdhPJxHInaVZCTCItEa4Eu561qYx8GvC70vOUyW+CghTAjRug2jVLVxRcc+W6Xrpc1RMGrYbv9O9A==
X-Received: by 2002:aa7:94ac:0:b0:3e0:f21a:e6ff with SMTP id a12-20020aa794ac000000b003e0f21ae6ffmr33941216pfl.76.1629738929457;
        Mon, 23 Aug 2021 10:15:29 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id q4sm14290830pjd.52.2021.08.23.10.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 10:15:29 -0700 (PDT)
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
Subject: [PATCH v5 3/6] drm: lock drm_global_mutex earlier in the ioctl handler
Date:   Tue, 24 Aug 2021 01:14:34 +0800
Message-Id: <20210823171437.829404-4-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823171437.829404-1-desmondcheongzx@gmail.com>
References: <20210823171437.829404-1-desmondcheongzx@gmail.com>
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

