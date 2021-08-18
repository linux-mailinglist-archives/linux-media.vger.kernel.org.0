Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2DD3EFDF8
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 09:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238878AbhHRHl4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 03:41:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239364AbhHRHls (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 03:41:48 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF634C0613CF;
        Wed, 18 Aug 2021 00:41:13 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id a5so1270589plh.5;
        Wed, 18 Aug 2021 00:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6qsW0sYS+QWl9YqcEcKPcEnVn6HLCKGFheZ9UsQK7Pw=;
        b=UOFTIL4BlsedoXnh4zHxO1Ey3z7ZulzCS5A0HofF4Pdc6KSOphdAQfUboSXTigN3QJ
         KV9GWvBIpiqXwe2DDYu2nmNE8CrFkYYFXVATDHFQup4d7oi9AssfF8qYtWT9XhKXgvqV
         hI0Q1Gq8wgxyphDTnoroV9F5koJtJ59wKMcWiCPDa1Bkq6RqPGY9N3aa8EV6KItNemMa
         gP5HwtFGnKuqLIsbCWkrhhrBrq+ZV++p+8hZ1RmRx/QEg7TYVGg0v9wiGESj2m60zwuM
         E0/lsPiZhzcN7BbB6TNJh84nkcOUcRh6VEIOKIcuc4++u7nT6silUQXPZR4R/jFnhWG0
         eMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6qsW0sYS+QWl9YqcEcKPcEnVn6HLCKGFheZ9UsQK7Pw=;
        b=ebZURKDm0juV4KL1EZfMH6OcqeCqXKS928bjOjb7YBlkViUAqJG7QsYKK+UwIN8f6t
         7e43rpKcRKlZWXhrV+O5XfwIJncbFvT43ojcsHIYdc/tlwqYjuy5krdWjmILdcctNWm6
         SQpe9pUxvUkVljpHPpRj9ABaA9mlaejAnjRx6oLJJFD+CKOit2kbPBuH3i0b7+SCFpDR
         fGJOORpJzskoZFpMUIEzOsTBHVU/3x0OXbk11NzNZRJJJTsO6upzHYXNJWTFMLglcVMZ
         TA6hzApNU+sC4etQWviFl9WtwOxKBnNP+0gmTDeCaw+dUVOxbBCF7CG1ZGjv5f5huHbi
         8PCw==
X-Gm-Message-State: AOAM531Dxgb3+pzqjmqW06wrVnfAt9lq4Zdarvzzqe13Nw4otYpmlB6U
        iWK7rFnSJJeTBkLT6mS4eLY=
X-Google-Smtp-Source: ABdhPJyoRQikktAIIYzk2SdRrsIHolgC6+oIsd/deH794I59G6Uc3YKKU+oqVIrW58xvLjcm506Y1A==
X-Received: by 2002:a17:902:d713:b029:12d:5b1a:c49 with SMTP id w19-20020a170902d713b029012d5b1a0c49mr6051047ply.70.1629272473538;
        Wed, 18 Aug 2021 00:41:13 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id u3sm3886729pjr.2.2021.08.18.00.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 00:41:13 -0700 (PDT)
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
Subject: [PATCH v3 7/9] drm: update global mutex lock in the ioctl handler
Date:   Wed, 18 Aug 2021 15:38:22 +0800
Message-Id: <20210818073824.1560124-8-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In a future patch, a read lock on drm_device.master_rwsem is
held in the ioctl handler before the check for ioctl
permissions. However, this produces the following lockdep splat:

======================================================
WARNING: possible circular locking dependency detected
5.14.0-rc6-CI-Patchwork_20831+ #1 Tainted: G     U
------------------------------------------------------
kms_lease/1752 is trying to acquire lock:
ffffffff827bad88 (drm_global_mutex){+.+.}-{3:3}, at: drm_open+0x64/0x280

but task is already holding lock:
ffff88812e350108 (&dev->master_rwsem){++++}-{3:3}, at:
drm_ioctl_kernel+0xfb/0x1a0

which lock already depends on the new lock.

the existing dependency chain (in reverse order) is:

-> #2 (&dev->master_rwsem){++++}-{3:3}:
       lock_acquire+0xd3/0x310
       down_read+0x3b/0x140
       drm_master_internal_acquire+0x1d/0x60
       drm_client_modeset_commit+0x10/0x40
       __drm_fb_helper_restore_fbdev_mode_unlocked+0x88/0xb0
       drm_fb_helper_set_par+0x34/0x40
       intel_fbdev_set_par+0x11/0x40 [i915]
       fbcon_init+0x270/0x4f0
       visual_init+0xc6/0x130
       do_bind_con_driver+0x1de/0x2c0
       do_take_over_console+0x10e/0x180
       do_fbcon_takeover+0x53/0xb0
       register_framebuffer+0x22d/0x310
       __drm_fb_helper_initial_config_and_unlock+0x36c/0x540
       intel_fbdev_initial_config+0xf/0x20 [i915]
       async_run_entry_fn+0x28/0x130
       process_one_work+0x26d/0x5c0
       worker_thread+0x37/0x390
       kthread+0x13b/0x170
       ret_from_fork+0x1f/0x30

-> #1 (&helper->lock){+.+.}-{3:3}:
       lock_acquire+0xd3/0x310
       __mutex_lock+0xa8/0x930
       __drm_fb_helper_restore_fbdev_mode_unlocked+0x44/0xb0
       intel_fbdev_restore_mode+0x2b/0x50 [i915]
       drm_lastclose+0x27/0x50
       drm_release_noglobal+0x42/0x60
       __fput+0x9e/0x250
       task_work_run+0x6b/0xb0
       exit_to_user_mode_prepare+0x1c5/0x1d0
       syscall_exit_to_user_mode+0x19/0x50
       do_syscall_64+0x46/0xb0
       entry_SYSCALL_64_after_hwframe+0x44/0xae

-> #0 (drm_global_mutex){+.+.}-{3:3}:
       validate_chain+0xb39/0x1e70
       __lock_acquire+0x5a1/0xb70
       lock_acquire+0xd3/0x310
       __mutex_lock+0xa8/0x930
       drm_open+0x64/0x280
       drm_stub_open+0x9f/0x100
       chrdev_open+0x9f/0x1d0
       do_dentry_open+0x14a/0x3a0
       dentry_open+0x53/0x70
       drm_mode_create_lease_ioctl+0x3cb/0x970
       drm_ioctl_kernel+0xc9/0x1a0
       drm_ioctl+0x201/0x3d0
       __x64_sys_ioctl+0x6a/0xa0
       do_syscall_64+0x37/0xb0
       entry_SYSCALL_64_after_hwframe+0x44/0xae

other info that might help us debug this:
Chain exists of:
  drm_global_mutex --> &helper->lock --> &dev->master_rwsem
 Possible unsafe locking scenario:
       CPU0                    CPU1
       ----                    ----
  lock(&dev->master_rwsem);
                               lock(&helper->lock);
                               lock(&dev->master_rwsem);
  lock(drm_global_mutex);

 *** DEADLOCK ***

The lock hierarchy inversion happens because we grab the
drm_global_mutex while already holding on to master_rwsem. To avoid
this, we do some prep work to grab the drm_global_mutex before
checking for ioctl permissions.

At the same time, we update the check for the global mutex to use the
drm_dev_needs_global_mutex helper function.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_ioctl.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 880fc565d599..2cb57378a787 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -779,19 +779,19 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
 	if (drm_dev_is_unplugged(dev))
 		return -ENODEV;
 
+	/* Enforce sane locking for modern driver ioctls. */
+	if (unlikely(drm_dev_needs_global_mutex(dev)) && !(flags & DRM_UNLOCKED))
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
+	if (unlikely(drm_dev_needs_global_mutex(dev)) && !(flags & DRM_UNLOCKED))
 		mutex_unlock(&drm_global_mutex);
-	}
 	return retcode;
 }
 EXPORT_SYMBOL(drm_ioctl_kernel);
-- 
2.25.1

