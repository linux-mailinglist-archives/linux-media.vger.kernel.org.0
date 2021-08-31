Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D179A3FC3A9
	for <lists+linux-media@lfdr.de>; Tue, 31 Aug 2021 10:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239942AbhHaH0Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Aug 2021 03:26:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239937AbhHaH0V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Aug 2021 03:26:21 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56FFDC06175F;
        Tue, 31 Aug 2021 00:25:26 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so1304337pjc.3;
        Tue, 31 Aug 2021 00:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JNsb6x1cQWvzMyudhFnNtCYBKN16JRWCSincvM+uOoY=;
        b=jxGI0ujHdl0N9GyGT2D3gCCB89vXr6ZHaDLYSvDAb0ZPJwcEXuX0JTOEampQTrFjnT
         R26DUsjxGUV2bNbq11XYxHiYUTV/uhTyuRaSRpftAlhLNY+PZYIOzUIExnRbFTF5Rnrq
         n7liC6CH5fsoUMhY6V6BKI3bZpqEPdZersNF3QuTd3yaxx6NO1Hx39aiwKeZuszeHUHv
         EX1SNZbPUwkQUarOBZmOPveUMleCesg2Zdur/+YXj4VfUkMN0TcSZ1kJJ4f1zDAZrLk+
         MGLPPd80FAOi/Irzp/mnPQkGHNpv58wKjPpEb29iiC4LBAZch9D8LBW54yjgya0qO7Pd
         Djuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JNsb6x1cQWvzMyudhFnNtCYBKN16JRWCSincvM+uOoY=;
        b=Nq1J7aCPJYkytedD7dmLcqXF7VPhOhwOtOQgx/HN6t8ceUDs/u1Db7pBxShYjA5bPW
         zAxtX1uyHuVfnxfguwELO6s5lP3KnEB4F8n/NrM3NTy/U+AbOVVLH35/kNJA50ckJGVD
         zb1d8IOWvBpk3SwifTDkXGBGg0aHkYIJkdsMqOPMBTeL6+h0H63jOkQoW0jMNXfs3fIb
         A0P0rGzohYLp2m0DZm0I3uwrEaxbzmVjuETCKlC0bkEz7OtE+UMTpkVCxks6dddXqiDk
         NQ6oAme+tlgU2kIrsLJVzVDJmiMXcz53wxC73XATbstn3d3Gl4yaztp+PQMseL8OK0oN
         H1HQ==
X-Gm-Message-State: AOAM533B+kqgDieG/NDystbRUQQqhmDhcVHMD2QeT6+UJ6kguKE3ydXL
        HvIAdKzR2s7DEBs5Pl1uM4M=
X-Google-Smtp-Source: ABdhPJyXMfL4c3g1dgTRJF/g+KwCIJImavM64F0XKUZcJVbQKi+4eCx2e6aSpaHBso5IjMGSKotQkA==
X-Received: by 2002:a17:902:c101:b0:138:f219:b0a0 with SMTP id 1-20020a170902c10100b00138f219b0a0mr393100pli.1.1630394725844;
        Tue, 31 Aug 2021 00:25:25 -0700 (PDT)
Received: from sanitydock.wifi-cloud.jp ([210.160.217.69])
        by smtp.gmail.com with ESMTPSA id m11sm1720724pjn.2.2021.08.31.00.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 00:25:25 -0700 (PDT)
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH v10 0/4] drm: update locking for modesetting
Date:   Tue, 31 Aug 2021 15:24:57 +0800
Message-Id: <20210831072501.184211-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sorry for the noise, rebasing on top of drm-misc-next. Please ignore the
v9 series.

Hi,

I updated the patch set with some suggestions by Daniel Vetter, and
dropped the patches after patch 4 so that we can stick the landing for
avoiding races with modesetting rights before dealing with the tricky
spinlock.

Overall, this series fixes races with modesetting rights, and converts
drm_device.master_mutex into master_rwsem.

- Patch 1: Fix a potential null ptr dereference in drm_master_release

- Patch 2: Convert master_mutex into rwsem (avoids creating a new lock)

- Patch 3: Update global mutex locking in the ioctl handler (avoids
deadlock when grabbing read lock on master_rwsem in drm_ioctl_kernel)

- Patch 4: Plug races with drm modesetting rights

v9 -> v10:
- Rebase on top of drm-misc-next, caught by Intel-gfx CI

v8 -> v9 (suggested by Daniel Vetter):
- Drop patches 5-7 to handle it in another series
- Add the appropriate Fixes: tag for the null ptr dereference fix
(patch 1)
- Create a locked_ioctl bool to clarify locking/unlocking patterns in
the ioctl handler (patch 3)
- Clarify the kernel doc for master_rwsem (patch 4)

v7 -> v8:
- Avoid calling drm_lease_held in drm_mode_setcrtc and
drm_wait_vblank_ioctl, caught by Intel-gfx CI

v6 -> v7:
- Export __drm_mode_object_find for loadable modules, caught by the
Intel-gfx CI

v5 -> v6:
- Fix recursive locking on master_rwsem, caught by the Intel-gfx CI

v4 -> v5:
- Avoid calling drm_file_get_master while holding on to the modeset
mutex, caught by the Intel-gfx CI

v3 -> v4 (suggested by Daniel Vetter):
- Drop a patch that added an unnecessary master_lookup_lock in
drm_master_release
- Drop a patch that addressed a non-existent race in
drm_is_current_master_locked
- Remove fixes for non-existent null ptr dereferences
- Protect drm_master.magic_map,unique{_len} with master_rwsem instead of
master_lookup_lock
- Drop the patch that moved master_lookup_lock into struct drm_device
- Drop a patch to export task_work_add
- Revert the check for the global mutex in the ioctl handler to use
drm_core_check_feature instead of drm_dev_needs_global_mutex
- Push down master_rwsem locking for selected ioctls to avoid lock
hierarchy inversions, and to allow us to hold write locks on
master_rwsem instead of flushing readers
- Remove master_lookup_lock by replacing it with master_rwsem

v2 -> v3:
- Unexport drm_master_flush, as suggested by Daniel Vetter.
- Merge master_mutex and master_rwsem, as suggested by Daniel Vetter.
- Export task_work_add, reported by kernel test robot.
- Make master_flush static, reported by kernel test robot.
- Move master_lookup_lock into struct drm_device.
- Add a missing lock on master_lookup_lock in drm_master_release.
- Fix a potential race in drm_is_current_master_locked.
- Fix potential null ptr dereferences in drm_{auth, ioctl}.
- Protect magic_map,unique{_len} with  master_lookup_lock.
- Convert master_mutex into a rwsem.
- Update global mutex locking in the ioctl handler.

v1 -> v2 (suggested by Daniel Vetter):
- Address an additional race when drm_open runs.
- Switch from SRCU to rwsem to synchronise readers and writers.
- Implement drm_master_flush with task_work so that flushes can be
queued to run before returning to userspace without creating a new
DRM_MASTER_FLUSH ioctl flag.

Best wishes,
Desmond

Desmond Cheong Zhi Xi (4):
  drm: fix null ptr dereference in drm_master_release
  drm: convert drm_device.master_mutex into a rwsem
  drm: lock drm_global_mutex earlier in the ioctl handler
  drm: avoid races with modesetting rights

 drivers/gpu/drm/drm_auth.c    | 39 ++++++++++++++++------------
 drivers/gpu/drm/drm_debugfs.c |  4 +--
 drivers/gpu/drm/drm_drv.c     |  3 +--
 drivers/gpu/drm/drm_file.c    |  6 ++---
 drivers/gpu/drm/drm_ioctl.c   | 49 ++++++++++++++++++++++-------------
 drivers/gpu/drm/drm_lease.c   | 35 +++++++++++++++++--------
 include/drm/drm_auth.h        |  6 ++---
 include/drm/drm_device.h      | 16 +++++++++---
 include/drm/drm_file.h        | 12 ++++-----
 9 files changed, 104 insertions(+), 66 deletions(-)

-- 
2.25.1

