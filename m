Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F24C3B94E8
	for <lists+linux-media@lfdr.de>; Thu,  1 Jul 2021 18:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbhGAQ5E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jul 2021 12:57:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbhGAQ5E (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jul 2021 12:57:04 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80050C061762;
        Thu,  1 Jul 2021 09:54:33 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id b14-20020a17090a7aceb029017261c7d206so1254488pjl.5;
        Thu, 01 Jul 2021 09:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vc5xi5ftWnxZlU1gt0+b48wT38LyZFngC4JD9PKuX7I=;
        b=XSI+quGbHhOHhJUhLMEFgKiAjU7ZWtY5gdFSDEnU2n0Qm6PybNqbvktJWF0XqrYyBR
         fM3tU5ZfsQ8kuOEzLk6+UmIMshjj09iaE8M0s63LbaZErj7JMvkJH4zexMx5xkaN3rYd
         ZWxy2XpsyReXtzXcCRHhHY/LTIwnZwg1CE72V38FclywmZypjluIMusOL8pHFMpJaXqR
         3lQcW0djA/y9x+i09J0pmBpDRQN3Z1jRH9ZItgID5cYsC7be1v3G4A2V4Y90hu39zZtO
         oAGamFkmxYcDsaUhcOT0007e0zylAmp6u+AHvNLRyIIJ+l+vItCXcRfCzAM6Yq7pZ2lJ
         VE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vc5xi5ftWnxZlU1gt0+b48wT38LyZFngC4JD9PKuX7I=;
        b=XfgdYu5dsGBSlyf+iLbINH066f7+tW9+zumemJZoXEjwCJudTjolgRqaTyWkXz5JqM
         NzcKb1WCZyfpJZ0iquYfwgI9dGpd8S3A2xI3hELDh32MhUd3/hIvGuF5+7eb/2SbKIZj
         ZRye3fBl7SUXjYgOHTf+WwJr7YI7G08trbkQ+mq+FBj2MC2ejlZ2EyvI0W+ig7QhHfhd
         LWToB4qMDdbR5FEl4uyKChmcsLtKO/q2FNcg1M29oQ2TmATSyBEQhA74cKyiZ+M+gUPR
         DRk3eKrnFfMGLDxT9uyUwioIq0vHcAE0Rs03kWG09++Jxz3atX0k5duM+gOz4ub7uqfI
         vAnw==
X-Gm-Message-State: AOAM531lQPa7PJKy5hMJDkiaecVOgL9Q58wzsTMbYOk51npPupdvGtFh
        Xu9X3Kvm3ulL/8DmIOwohd8=
X-Google-Smtp-Source: ABdhPJx0FRVHE0P9JY9PweVc7BKHZ6+iKxtn2+/VNCZJWOoD8ujSXIe+Xd4vpsLeQuU2hYVCbwcauw==
X-Received: by 2002:a17:90a:f684:: with SMTP id cl4mr594900pjb.197.1625158473088;
        Thu, 01 Jul 2021 09:54:33 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id s20sm398738pgv.1.2021.07.01.09.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 09:54:32 -0700 (PDT)
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        emil.l.velikov@gmail.com, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v7 1/5] drm: avoid circular locks in drm_mode_getconnector
Date:   Fri,  2 Jul 2021 00:53:54 +0800
Message-Id: <20210701165358.19053-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701165358.19053-1-desmondcheongzx@gmail.com>
References: <20210701165358.19053-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In preparation for a future patch to take a lock on
drm_device.master_mutex inside drm_is_current_master(), we first move
the call to drm_is_current_master() in drm_mode_getconnector out from the
section locked by &dev->mode_config.mutex. This avoids creating a
circular lock dependency.

Failing to avoid this lock dependency produces the following lockdep
splat:

======================================================
WARNING: possible circular locking dependency detected
5.13.0-rc7-CI-CI_DRM_10254+ #1 Not tainted
------------------------------------------------------
kms_frontbuffer/1087 is trying to acquire lock:
ffff88810dcd01a8 (&dev->master_mutex){+.+.}-{3:3}, at: drm_is_current_master+0x1b/0x40
but task is already holding lock:
ffff88810dcd0488 (&dev->mode_config.mutex){+.+.}-{3:3}, at: drm_mode_getconnector+0x1c6/0x4a0
which lock already depends on the new lock.
the existing dependency chain (in reverse order) is:
-> #2 (&dev->mode_config.mutex){+.+.}-{3:3}:
       __mutex_lock+0xab/0x970
       drm_client_modeset_probe+0x22e/0xca0
       __drm_fb_helper_initial_config_and_unlock+0x42/0x540
       intel_fbdev_initial_config+0xf/0x20 [i915]
       async_run_entry_fn+0x28/0x130
       process_one_work+0x26d/0x5c0
       worker_thread+0x37/0x380
       kthread+0x144/0x170
       ret_from_fork+0x1f/0x30
-> #1 (&client->modeset_mutex){+.+.}-{3:3}:
       __mutex_lock+0xab/0x970
       drm_client_modeset_commit_locked+0x1c/0x180
       drm_client_modeset_commit+0x1c/0x40
       __drm_fb_helper_restore_fbdev_mode_unlocked+0x88/0xb0
       drm_fb_helper_set_par+0x34/0x40
       intel_fbdev_set_par+0x11/0x40 [i915]
       fbcon_init+0x270/0x4f0
       visual_init+0xc6/0x130
       do_bind_con_driver+0x1e5/0x2d0
       do_take_over_console+0x10e/0x180
       do_fbcon_takeover+0x53/0xb0
       register_framebuffer+0x22d/0x310
       __drm_fb_helper_initial_config_and_unlock+0x36c/0x540
       intel_fbdev_initial_config+0xf/0x20 [i915]
       async_run_entry_fn+0x28/0x130
       process_one_work+0x26d/0x5c0
       worker_thread+0x37/0x380
       kthread+0x144/0x170
       ret_from_fork+0x1f/0x30
-> #0 (&dev->master_mutex){+.+.}-{3:3}:
       __lock_acquire+0x151e/0x2590
       lock_acquire+0xd1/0x3d0
       __mutex_lock+0xab/0x970
       drm_is_current_master+0x1b/0x40
       drm_mode_getconnector+0x37e/0x4a0
       drm_ioctl_kernel+0xa8/0xf0
       drm_ioctl+0x1e8/0x390
       __x64_sys_ioctl+0x6a/0xa0
       do_syscall_64+0x39/0xb0
       entry_SYSCALL_64_after_hwframe+0x44/0xae
other info that might help us debug this:
Chain exists of: &dev->master_mutex --> &client->modeset_mutex --> &dev->mode_config.mutex
 Possible unsafe locking scenario:
       CPU0                    CPU1
       ----                    ----
  lock(&dev->mode_config.mutex);
                               lock(&client->modeset_mutex);
                               lock(&dev->mode_config.mutex);
  lock(&dev->master_mutex);
*** DEADLOCK ***
1 lock held by kms_frontbuffer/1087:
 #0: ffff88810dcd0488 (&dev->mode_config.mutex){+.+.}-{3:3}, at: drm_mode_getconnector+0x1c6/0x4a0
stack backtrace:
CPU: 7 PID: 1087 Comm: kms_frontbuffer Not tainted 5.13.0-rc7-CI-CI_DRM_10254+ #1
Hardware name: Intel Corporation Ice Lake Client Platform/IceLake U DDR4 SODIMM PD RVP TLC, BIOS ICLSFWR1.R00.3234.A01.1906141750 06/14/2019
Call Trace:
 dump_stack+0x7f/0xad
 check_noncircular+0x12e/0x150
 __lock_acquire+0x151e/0x2590
 lock_acquire+0xd1/0x3d0
 __mutex_lock+0xab/0x970
 drm_is_current_master+0x1b/0x40
 drm_mode_getconnector+0x37e/0x4a0
 drm_ioctl_kernel+0xa8/0xf0
 drm_ioctl+0x1e8/0x390
 __x64_sys_ioctl+0x6a/0xa0
 do_syscall_64+0x39/0xb0
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/gpu/drm/drm_connector.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index da39e7ff6965..2ba257b1ae20 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2414,6 +2414,7 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
 	struct drm_mode_modeinfo u_mode;
 	struct drm_mode_modeinfo __user *mode_ptr;
 	uint32_t __user *encoder_ptr;
+	bool is_current_master;
 
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
@@ -2444,9 +2445,11 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
 	out_resp->connector_type = connector->connector_type;
 	out_resp->connector_type_id = connector->connector_type_id;
 
+	is_current_master = drm_is_current_master(file_priv);
+
 	mutex_lock(&dev->mode_config.mutex);
 	if (out_resp->count_modes == 0) {
-		if (drm_is_current_master(file_priv))
+		if (is_current_master)
 			connector->funcs->fill_modes(connector,
 						     dev->mode_config.max_width,
 						     dev->mode_config.max_height);
-- 
2.25.1

