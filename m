Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7109D3EB319
	for <lists+linux-media@lfdr.de>; Fri, 13 Aug 2021 11:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239899AbhHMJDI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Aug 2021 05:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239892AbhHMJDH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Aug 2021 05:03:07 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02C22C061756;
        Fri, 13 Aug 2021 02:02:41 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so19742419pjr.1;
        Fri, 13 Aug 2021 02:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O8WE4JThttpC0auzAMsH7OUVsbA+QtrsjGiuV7h3U84=;
        b=OEmLLlIzDteGG9Dhu0ASxOzJvr3+7CAUaXkCKVJaeO9WeM44o7ujRgwJ8jn842LJFY
         ufzi88H3ffOMaRfm5WIYCS6oEV6z/Ci5ZhnJD/s9uVrYGDdOIa/MJnv3gVqbnbQU3WGY
         LfJ2BCkh41/Ck5+SrcjS2RmBeOrZAKAEIsSjNu894bwi6p93N+JVR0XSvA+831BjWKyV
         vScPI10Jp30cAVfZAA6sPDZwNEoJ20vd7ONTgcILNJQWyzwyDb3kVHTYNrO3aX+Y5ufc
         Lu+nt6stw9tVAVB2DU3DrKWGYAY9hM4Io7JC6slFIAzM6173AxnW50LHpKIdqYrTU9hZ
         3JtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O8WE4JThttpC0auzAMsH7OUVsbA+QtrsjGiuV7h3U84=;
        b=Wt87GuTW02coSoz9JWC8bAtx+v7SKGHMoGuX/zv+8NXwuCcmOUbXEk0OzHH6tPnehq
         a7Hj/jFA0Z4NFv2Z5GmeMy8hzRJ3CK7fDwIgLz7iGcsMerHCc5d0M7xy0aUxqP4HC03h
         /q/L9KiZYVGTWn/AAoZVRr5RiGV8nd323UvJRH0zt3iKeZLIyuDiw+3oZ1+czsNRKCJ7
         5n5f2cY7akyxMvYSZutjamGnibErNsQlZCUmFgLgqHaJG4qGTuh2YrTfJfQ8VCk33Mt6
         2S11NWMbFsWDl1nFyIJGLHFlPkB9X2UGGO2OZ4rF7zJ0kXmjLvEX6mLQxojOCyJ3IfBc
         vegQ==
X-Gm-Message-State: AOAM5329XKqi3LVB6wAHRdr+37uEnOPoN2o1KHqck3eg1+qN2fi7jxmk
        JpAlIofgc29p2opN8Au/NXM=
X-Google-Smtp-Source: ABdhPJxCoxOtjobzjtFOX6Y1yM1ByjOfNZ3FaL0wJWPc7CI4WWs/SqYk4RakQhnBFzlFI/y5LUJafw==
X-Received: by 2002:a63:460d:: with SMTP id t13mr1441285pga.41.1628845360624;
        Fri, 13 Aug 2021 02:02:40 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id 31sm1818428pgy.26.2021.08.13.02.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 02:02:40 -0700 (PDT)
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        intel-gfx@lists.freedesktop.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 2/2] drm: unexport drm_ioctl_permit
Date:   Fri, 13 Aug 2021 16:54:50 +0800
Message-Id: <20210813085450.32494-3-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210813085450.32494-1-desmondcheongzx@gmail.com>
References: <20210813085450.32494-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since the last user of drm_ioctl_permit was removed, and it's now only
used in drm_ioctl.c, unexport the symbol.

Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_ioctl.c | 15 +--------------
 include/drm/drm_ioctl.h     |  1 -
 2 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index eb4ec3fab7d1..fe271f6f96ab 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -522,19 +522,7 @@ int drm_version(struct drm_device *dev, void *data,
 	return err;
 }
 
-/**
- * drm_ioctl_permit - Check ioctl permissions against caller
- *
- * @flags: ioctl permission flags.
- * @file_priv: Pointer to struct drm_file identifying the caller.
- *
- * Checks whether the caller is allowed to run an ioctl with the
- * indicated permissions.
- *
- * Returns:
- * Zero if allowed, -EACCES otherwise.
- */
-int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
+static int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
 {
 	/* ROOT_ONLY is only for CAP_SYS_ADMIN */
 	if (unlikely((flags & DRM_ROOT_ONLY) && !capable(CAP_SYS_ADMIN)))
@@ -557,7 +545,6 @@ int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
 
 	return 0;
 }
-EXPORT_SYMBOL(drm_ioctl_permit);
 
 #define DRM_IOCTL_DEF(ioctl, _func, _flags)	\
 	[DRM_IOCTL_NR(ioctl)] = {		\
diff --git a/include/drm/drm_ioctl.h b/include/drm/drm_ioctl.h
index 13a68cdcea36..fd29842127e5 100644
--- a/include/drm/drm_ioctl.h
+++ b/include/drm/drm_ioctl.h
@@ -174,7 +174,6 @@ struct drm_ioctl_desc {
 		.name = #ioctl						\
 	}
 
-int drm_ioctl_permit(u32 flags, struct drm_file *file_priv);
 long drm_ioctl(struct file *filp, unsigned int cmd, unsigned long arg);
 long drm_ioctl_kernel(struct file *, drm_ioctl_t, void *, u32);
 #ifdef CONFIG_COMPAT
-- 
2.25.1

