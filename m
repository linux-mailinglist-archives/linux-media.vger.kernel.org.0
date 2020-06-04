Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94E431EDF57
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 10:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727966AbgFDINL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 04:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727882AbgFDIMz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 04:12:55 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B2D0C0A88B4
        for <linux-media@vger.kernel.org>; Thu,  4 Jun 2020 01:12:55 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id x6so4997175wrm.13
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2020 01:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xBHH8HV/ynkGTblaQCBVPIasEigLpWOOzD+/aDDngeE=;
        b=hFJHKrGcuuTLGVLvJHPMkbscDyUX8o+8t48i8gjHX/wrNO8TtoqmHu26IkBnYNObr4
         KrI3LjBc0l2LHjqOn1T5MjPDcrAq4+mlQUnp02d+7XQ707QBLNKeZkrBDQuMdNYSE4rB
         ZVSbprOpIkob9k4ZgEk5Bvg5TCd7X96OYidgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xBHH8HV/ynkGTblaQCBVPIasEigLpWOOzD+/aDDngeE=;
        b=drh8ybJmSTXbaQOfJRRjqYX39hON8M+K5sqlx/W8BSuyEKAIknOta6aezIs3/x5bPv
         TPxBuiTe2otSSfB8Pv6WsH4I/aFGKwfrSa118pmWfPet0hamCiGU9LAFRnqSvxdl1sUF
         X8IYK7AVzo3FCOmSs+AijzFO3bEqaLHxJgCpdOpjqJAIod8GuAJf1lpQNZ47MEgnQcak
         BEV5gpWliLejhmH6hYsUyWOx6PSMKh13XI9+YUHK0JiuWaecf/30eLSDrnRUodN3VXjj
         0KQ8j0zA4RFw/UWLOQCiPHdhay5l0Sa+SVDw84m7vFnMeYnEA67F1WHAlgQ3Yq2g5MtA
         LUcQ==
X-Gm-Message-State: AOAM530NuWmaACge+k7ZWUgkSgH3ox3sGwyH1rZr4ckz576QmZqVuitL
        Go2HaNKxPCUIzbhIyGtaaCqxsA==
X-Google-Smtp-Source: ABdhPJyObyzep5ImU/AAS5w8hAKuTWNCEAJ1espIeo8JSFze8n8cPO+9cK+VeTUgMxSDryXkAOC4zw==
X-Received: by 2002:adf:a4dd:: with SMTP id h29mr3422543wrb.372.1591258373746;
        Thu, 04 Jun 2020 01:12:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id f11sm6873305wrj.2.2020.06.04.01.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 01:12:53 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-rdma@vger.kernel.org,
        amd-gfx@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH 17/18] drm/amdgpu: gpu recovery does full modesets
Date:   Thu,  4 Jun 2020 10:12:23 +0200
Message-Id: <20200604081224.863494-18-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

...

I think it's time to stop this little exercise.

The lockdep splat, for the record:

[  132.583381] ======================================================
[  132.584091] WARNING: possible circular locking dependency detected
[  132.584775] 5.7.0-rc3+ #346 Tainted: G        W
[  132.585461] ------------------------------------------------------
[  132.586184] kworker/2:3/865 is trying to acquire lock:
[  132.586857] ffffc90000677c70 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_atomic_helper_suspend+0x38/0x120 [drm_kms_helper]
[  132.587569]
               but task is already holding lock:
[  132.589044] ffffffff82318c80 (dma_fence_map){++++}-{0:0}, at: drm_sched_job_timedout+0x25/0xf0 [gpu_sched]
[  132.589803]
               which lock already depends on the new lock.

[  132.592009]
               the existing dependency chain (in reverse order) is:
[  132.593507]
               -> #2 (dma_fence_map){++++}-{0:0}:
[  132.595019]        dma_fence_begin_signalling+0x50/0x60
[  132.595767]        drm_atomic_helper_commit+0xa1/0x180 [drm_kms_helper]
[  132.596567]        drm_client_modeset_commit_atomic+0x1ea/0x250 [drm]
[  132.597420]        drm_client_modeset_commit_locked+0x55/0x190 [drm]
[  132.598178]        drm_client_modeset_commit+0x24/0x40 [drm]
[  132.598948]        drm_fb_helper_restore_fbdev_mode_unlocked+0x4b/0xa0 [drm_kms_helper]
[  132.599738]        drm_fb_helper_set_par+0x30/0x40 [drm_kms_helper]
[  132.600539]        fbcon_init+0x2e8/0x660
[  132.601344]        visual_init+0xce/0x130
[  132.602156]        do_bind_con_driver+0x1bc/0x2b0
[  132.602970]        do_take_over_console+0x115/0x180
[  132.603763]        do_fbcon_takeover+0x58/0xb0
[  132.604564]        register_framebuffer+0x1ee/0x300
[  132.605369]        __drm_fb_helper_initial_config_and_unlock+0x36e/0x520 [drm_kms_helper]
[  132.606187]        amdgpu_fbdev_init+0xb3/0xf0 [amdgpu]
[  132.607032]        amdgpu_device_init.cold+0xe90/0x1677 [amdgpu]
[  132.607862]        amdgpu_driver_load_kms+0x5a/0x200 [amdgpu]
[  132.608697]        amdgpu_pci_probe+0xf7/0x180 [amdgpu]
[  132.609511]        local_pci_probe+0x42/0x80
[  132.610324]        pci_device_probe+0x104/0x1a0
[  132.611130]        really_probe+0x147/0x3c0
[  132.611939]        driver_probe_device+0xb6/0x100
[  132.612766]        device_driver_attach+0x53/0x60
[  132.613593]        __driver_attach+0x8c/0x150
[  132.614419]        bus_for_each_dev+0x7b/0xc0
[  132.615249]        bus_add_driver+0x14c/0x1f0
[  132.616071]        driver_register+0x6c/0xc0
[  132.616902]        do_one_initcall+0x5d/0x2f0
[  132.617731]        do_init_module+0x5c/0x230
[  132.618560]        load_module+0x2981/0x2bc0
[  132.619391]        __do_sys_finit_module+0xaa/0x110
[  132.620228]        do_syscall_64+0x5a/0x250
[  132.621064]        entry_SYSCALL_64_after_hwframe+0x49/0xb3
[  132.621903]
               -> #1 (crtc_ww_class_mutex){+.+.}-{3:3}:
[  132.623587]        __ww_mutex_lock.constprop.0+0xcc/0x10c0
[  132.624448]        ww_mutex_lock+0x43/0xb0
[  132.625315]        drm_modeset_lock+0x44/0x120 [drm]
[  132.626184]        drmm_mode_config_init+0x2db/0x8b0 [drm]
[  132.627098]        amdgpu_device_init.cold+0xbd1/0x1677 [amdgpu]
[  132.628007]        amdgpu_driver_load_kms+0x5a/0x200 [amdgpu]
[  132.628920]        amdgpu_pci_probe+0xf7/0x180 [amdgpu]
[  132.629804]        local_pci_probe+0x42/0x80
[  132.630690]        pci_device_probe+0x104/0x1a0
[  132.631583]        really_probe+0x147/0x3c0
[  132.632479]        driver_probe_device+0xb6/0x100
[  132.633379]        device_driver_attach+0x53/0x60
[  132.634275]        __driver_attach+0x8c/0x150
[  132.635170]        bus_for_each_dev+0x7b/0xc0
[  132.636069]        bus_add_driver+0x14c/0x1f0
[  132.636974]        driver_register+0x6c/0xc0
[  132.637870]        do_one_initcall+0x5d/0x2f0
[  132.638765]        do_init_module+0x5c/0x230
[  132.639654]        load_module+0x2981/0x2bc0
[  132.640522]        __do_sys_finit_module+0xaa/0x110
[  132.641372]        do_syscall_64+0x5a/0x250
[  132.642203]        entry_SYSCALL_64_after_hwframe+0x49/0xb3
[  132.643022]
               -> #0 (crtc_ww_class_acquire){+.+.}-{0:0}:
[  132.644643]        __lock_acquire+0x1241/0x23f0
[  132.645469]        lock_acquire+0xad/0x370
[  132.646274]        drm_modeset_acquire_init+0xd2/0x100 [drm]
[  132.647071]        drm_atomic_helper_suspend+0x38/0x120 [drm_kms_helper]
[  132.647902]        dm_suspend+0x1c/0x60 [amdgpu]
[  132.648698]        amdgpu_device_ip_suspend_phase1+0x83/0xe0 [amdgpu]
[  132.649498]        amdgpu_device_ip_suspend+0x1c/0x60 [amdgpu]
[  132.650300]        amdgpu_device_gpu_recover.cold+0x4e6/0xe64 [amdgpu]
[  132.651084]        amdgpu_job_timedout+0xfb/0x150 [amdgpu]
[  132.651825]        drm_sched_job_timedout+0x8a/0xf0 [gpu_sched]
[  132.652594]        process_one_work+0x23c/0x580
[  132.653402]        worker_thread+0x50/0x3b0
[  132.654139]        kthread+0x12e/0x150
[  132.654868]        ret_from_fork+0x27/0x50
[  132.655598]
               other info that might help us debug this:

[  132.657739] Chain exists of:
                 crtc_ww_class_acquire --> crtc_ww_class_mutex --> dma_fence_map

[  132.659877]  Possible unsafe locking scenario:

[  132.661416]        CPU0                    CPU1
[  132.662126]        ----                    ----
[  132.662847]   lock(dma_fence_map);
[  132.663574]                                lock(crtc_ww_class_mutex);
[  132.664319]                                lock(dma_fence_map);
[  132.665063]   lock(crtc_ww_class_acquire);
[  132.665799]
                *** DEADLOCK ***

[  132.667965] 4 locks held by kworker/2:3/865:
[  132.668701]  #0: ffff8887fb81c938 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x1bc/0x580
[  132.669462]  #1: ffffc90000677e58 ((work_completion)(&(&sched->work_tdr)->work)){+.+.}-{0:0}, at: process_one_work+0x1bc/0x580
[  132.670242]  #2: ffffffff82318c80 (dma_fence_map){++++}-{0:0}, at: drm_sched_job_timedout+0x25/0xf0 [gpu_sched]
[  132.671039]  #3: ffff8887b84a1748 (&adev->lock_reset){+.+.}-{3:3}, at: amdgpu_device_gpu_recover.cold+0x59e/0xe64 [amdgpu]
[  132.671902]
               stack backtrace:
[  132.673515] CPU: 2 PID: 865 Comm: kworker/2:3 Tainted: G        W         5.7.0-rc3+ #346
[  132.674347] Hardware name: System manufacturer System Product Name/PRIME X370-PRO, BIOS 4011 04/19/2018
[  132.675194] Workqueue: events drm_sched_job_timedout [gpu_sched]
[  132.676046] Call Trace:
[  132.676897]  dump_stack+0x8f/0xd0
[  132.677748]  check_noncircular+0x162/0x180
[  132.678604]  ? stack_trace_save+0x4b/0x70
[  132.679459]  __lock_acquire+0x1241/0x23f0
[  132.680311]  lock_acquire+0xad/0x370
[  132.681163]  ? drm_atomic_helper_suspend+0x38/0x120 [drm_kms_helper]
[  132.682021]  ? cpumask_next+0x16/0x20
[  132.682880]  ? module_assert_mutex_or_preempt+0x14/0x40
[  132.683737]  ? __module_address+0x28/0xf0
[  132.684601]  drm_modeset_acquire_init+0xd2/0x100 [drm]
[  132.685466]  ? drm_atomic_helper_suspend+0x38/0x120 [drm_kms_helper]
[  132.686335]  drm_atomic_helper_suspend+0x38/0x120 [drm_kms_helper]
[  132.687255]  dm_suspend+0x1c/0x60 [amdgpu]
[  132.688152]  amdgpu_device_ip_suspend_phase1+0x83/0xe0 [amdgpu]
[  132.689057]  ? amdgpu_fence_process+0x4c/0x150 [amdgpu]
[  132.689963]  amdgpu_device_ip_suspend+0x1c/0x60 [amdgpu]
[  132.690893]  amdgpu_device_gpu_recover.cold+0x4e6/0xe64 [amdgpu]
[  132.691818]  amdgpu_job_timedout+0xfb/0x150 [amdgpu]
[  132.692707]  drm_sched_job_timedout+0x8a/0xf0 [gpu_sched]
[  132.693597]  process_one_work+0x23c/0x580
[  132.694487]  worker_thread+0x50/0x3b0
[  132.695373]  ? process_one_work+0x580/0x580
[  132.696264]  kthread+0x12e/0x150
[  132.697154]  ? kthread_create_worker_on_cpu+0x70/0x70
[  132.698057]  ret_from_fork+0x27/0x50

Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-rdma@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 4c4492de670c..3ea4b9258fb0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2441,6 +2441,14 @@ static int amdgpu_device_ip_suspend_phase1(struct amdgpu_device *adev)
 		/* displays are handled separately */
 		if (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_DCE) {
 			/* XXX handle errors */
+
+			/*
+			 * This is dm_suspend, which calls modeset locks, and
+			 * that a pretty good inversion against dma_fence_signal
+			 * which gpu recovery is supposed to guarantee.
+			 *
+			 * Dont ask me how to fix this.
+			 */
 			r = adev->ip_blocks[i].version->funcs->suspend(adev);
 			/* XXX handle errors */
 			if (r) {
-- 
2.26.2

