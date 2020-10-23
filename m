Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5056C296E74
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 14:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463644AbgJWMWv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 08:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S463626AbgJWMWu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 08:22:50 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 965B4C0613CE
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2020 05:22:48 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id h5so1574313wrv.7
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2020 05:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l2f4yPYYME2DTpuyrkHxIxIPVviQpkcCzpFQoof8xZU=;
        b=htfnkTc+EmPeG0/GmNNRktzQuZnBkEZ5WxtnLvx4A26hvPpxcZL/WZ1E2iMapXJ7F8
         sYwnwW67xrGBCZcu7ZKtH7RGR3Klzf1FwMh5C3D2yfC4Y2HrxIoa+ZdrgP6bIuxcRc+m
         OC/kSMX339P4eTo2UpTUZGUqBf2+D/Hgktq3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l2f4yPYYME2DTpuyrkHxIxIPVviQpkcCzpFQoof8xZU=;
        b=UYK3L+5ymXrPrpKIuCWUtL20rgBlwX4wIzrGZC4wMxwdF0lnc4lOXYu6HZWcYbPaSm
         8wnMIWn/S6unsHRE7a/qBLXi4nsM4jlsXegOJETm8Ecg0JDoMf67iDaAh5Ym8ffcfB5i
         pGMYOe4QebPGlAVaj0Q6KxnIoli2tkdjfsMwFCVuSL477uT8MiemFbpzDv1ueMkmMH4q
         fAYtr6Qp7QwdtkVwPQOzW5Ofb/HjbEb0MJTz/eOAMu6VuQugGiZ9PnSh9YgbmAmoIwwf
         1p6lbHQieixWEgjwmbIsoFcZmUF8oL0zmZFnS6EE5vSNRy9PT93PYlQC2HJS6jAubX8U
         ATiw==
X-Gm-Message-State: AOAM532awZoX9wmL6opZct4VdBknuX04habmdOVgosfe+bPVKzEW9AYA
        YfzbIY3x06G7wjdoIvrefAlRAw==
X-Google-Smtp-Source: ABdhPJyfjTgfuVVogkOvOEvv2+h5MYBRWOpR68BwVx3mHmk6n/hf7lS67d2ElS6ONGSJ5K0KZ+vD1w==
X-Received: by 2002:adf:f643:: with SMTP id x3mr2525910wrp.180.1603455767291;
        Fri, 23 Oct 2020 05:22:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 05:22:46 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH 22/65] Revert "drm/amdgpu: add fbdev suspend/resume on gpu reset"
Date:   Fri, 23 Oct 2020 14:21:33 +0200
Message-Id: <20201023122216.2373294-22-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is one from the department of "maybe play lottery if you hit
this, karma compensation might work". Or at least lockdep ftw!

This reverts commit 565d1941557756a584ac357d945bc374d5fcd1d0.

It's not quite as low-risk as the commit message claims, because this
grabs console_lock, which might be held when we allocate memory, which
might never happen because the dma_fence_wait() is stuck waiting on
our gpu reset:

[  136.763714] ======================================================
[  136.763714] WARNING: possible circular locking dependency detected
[  136.763715] 5.7.0-rc3+ #346 Tainted: G        W
[  136.763716] ------------------------------------------------------
[  136.763716] kworker/2:3/682 is trying to acquire lock:
[  136.763716] ffffffff8226f140 (console_lock){+.+.}-{0:0}, at: drm_fb_helper_set_suspend_unlocked+0x7b/0xa0 [drm_kms_helper]
[  136.763723]
               but task is already holding lock:
[  136.763724] ffffffff82318c80 (dma_fence_map){++++}-{0:0}, at: drm_sched_job_timedout+0x25/0xf0 [gpu_sched]
[  136.763726]
               which lock already depends on the new lock.

[  136.763726]
               the existing dependency chain (in reverse order) is:
[  136.763727]
               -> #2 (dma_fence_map){++++}-{0:0}:
[  136.763730]        __dma_fence_might_wait+0x41/0xb0
[  136.763732]        dma_resv_lockdep+0x171/0x202
[  136.763734]        do_one_initcall+0x5d/0x2f0
[  136.763736]        kernel_init_freeable+0x20d/0x26d
[  136.763738]        kernel_init+0xa/0xfb
[  136.763740]        ret_from_fork+0x27/0x50
[  136.763740]
               -> #1 (fs_reclaim){+.+.}-{0:0}:
[  136.763743]        fs_reclaim_acquire.part.0+0x25/0x30
[  136.763745]        kmem_cache_alloc_trace+0x2e/0x6e0
[  136.763747]        device_create_groups_vargs+0x52/0xf0
[  136.763747]        device_create+0x49/0x60
[  136.763749]        fb_console_init+0x25/0x145
[  136.763750]        fbmem_init+0xcc/0xe2
[  136.763750]        do_one_initcall+0x5d/0x2f0
[  136.763751]        kernel_init_freeable+0x20d/0x26d
[  136.763752]        kernel_init+0xa/0xfb
[  136.763753]        ret_from_fork+0x27/0x50
[  136.763753]
               -> #0 (console_lock){+.+.}-{0:0}:
[  136.763755]        __lock_acquire+0x1241/0x23f0
[  136.763756]        lock_acquire+0xad/0x370
[  136.763757]        console_lock+0x47/0x70
[  136.763761]        drm_fb_helper_set_suspend_unlocked+0x7b/0xa0 [drm_kms_helper]
[  136.763809]        amdgpu_device_gpu_recover.cold+0x21e/0xe7b [amdgpu]
[  136.763850]        amdgpu_job_timedout+0xfb/0x150 [amdgpu]
[  136.763851]        drm_sched_job_timedout+0x8a/0xf0 [gpu_sched]
[  136.763852]        process_one_work+0x23c/0x580
[  136.763853]        worker_thread+0x50/0x3b0
[  136.763854]        kthread+0x12e/0x150
[  136.763855]        ret_from_fork+0x27/0x50
[  136.763855]
               other info that might help us debug this:

[  136.763856] Chain exists of:
                 console_lock --> fs_reclaim --> dma_fence_map

[  136.763857]  Possible unsafe locking scenario:

[  136.763857]        CPU0                    CPU1
[  136.763857]        ----                    ----
[  136.763857]   lock(dma_fence_map);
[  136.763858]                                lock(fs_reclaim);
[  136.763858]                                lock(dma_fence_map);
[  136.763858]   lock(console_lock);
[  136.763859]
                *** DEADLOCK ***

[  136.763860] 4 locks held by kworker/2:3/682:
[  136.763860]  #0: ffff8887fb81c938 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x1bc/0x580
[  136.763862]  #1: ffffc90000cafe58 ((work_completion)(&(&sched->work_tdr)->work)){+.+.}-{0:0}, at: process_one_work+0x1bc/0x580
[  136.763863]  #2: ffffffff82318c80 (dma_fence_map){++++}-{0:0}, at: drm_sched_job_timedout+0x25/0xf0 [gpu_sched]
[  136.763865]  #3: ffff8887ab621748 (&adev->lock_reset){+.+.}-{3:3}, at: amdgpu_device_gpu_recover.cold+0x5ab/0xe7b [amdgpu]
[  136.763914]
               stack backtrace:
[  136.763915] CPU: 2 PID: 682 Comm: kworker/2:3 Tainted: G        W         5.7.0-rc3+ #346
[  136.763916] Hardware name: System manufacturer System Product Name/PRIME X370-PRO, BIOS 4011 04/19/2018
[  136.763918] Workqueue: events drm_sched_job_timedout [gpu_sched]
[  136.763919] Call Trace:
[  136.763922]  dump_stack+0x8f/0xd0
[  136.763924]  check_noncircular+0x162/0x180
[  136.763926]  __lock_acquire+0x1241/0x23f0
[  136.763927]  lock_acquire+0xad/0x370
[  136.763932]  ? drm_fb_helper_set_suspend_unlocked+0x7b/0xa0 [drm_kms_helper]
[  136.763933]  ? mark_held_locks+0x2d/0x80
[  136.763934]  ? _raw_spin_unlock_irqrestore+0x46/0x60
[  136.763936]  console_lock+0x47/0x70
[  136.763940]  ? drm_fb_helper_set_suspend_unlocked+0x7b/0xa0 [drm_kms_helper]
[  136.763944]  drm_fb_helper_set_suspend_unlocked+0x7b/0xa0 [drm_kms_helper]
[  136.763993]  amdgpu_device_gpu_recover.cold+0x21e/0xe7b [amdgpu]
[  136.764036]  amdgpu_job_timedout+0xfb/0x150 [amdgpu]
[  136.764038]  drm_sched_job_timedout+0x8a/0xf0 [gpu_sched]
[  136.764040]  process_one_work+0x23c/0x580
[  136.764041]  worker_thread+0x50/0x3b0
[  136.764042]  ? process_one_work+0x580/0x580
[  136.764044]  kthread+0x12e/0x150
[  136.764045]  ? kthread_create_worker_on_cpu+0x70/0x70
[  136.764046]  ret_from_fork+0x27/0x50

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
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 029a026ecfa9..935116614884 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4330,8 +4330,6 @@ static int amdgpu_do_asic_reset(struct amdgpu_hive_info *hive,
 				if (r)
 					goto out;
 
-				amdgpu_fbdev_set_suspend(tmp_adev, 0);
-
 				/*
 				 * The GPU enters bad state once faulty pages
 				 * by ECC has reached the threshold, and ras
@@ -4590,8 +4588,6 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		 */
 		amdgpu_unregister_gpu_instance(tmp_adev);
 
-		amdgpu_fbdev_set_suspend(tmp_adev, 1);
-
 		/* disable ras on ALL IPs */
 		if (!need_emergency_restart &&
 		      amdgpu_device_ip_need_full_reset(tmp_adev))
-- 
2.28.0

