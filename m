Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2FF3F7705
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 16:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240797AbhHYOXh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 10:23:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240148AbhHYOXg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 10:23:36 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 007C0C061757;
        Wed, 25 Aug 2021 07:22:50 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id oa17so16662726pjb.1;
        Wed, 25 Aug 2021 07:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PyEUKLbqZIq1NMqrQWfaTXN/Z5gCejfRXXNJ7X/27zI=;
        b=Otb4pO56XogV3OPnTsbSnwXqDcs6r0tKYcZR1iNssiuYkYcMQ8PckQQk5CD/miFvvB
         YZnG4332bu9ZsuemG388tzhNs61duJY0Y/KMjR5S08oDCI/f54z5swJSvVfKtWrPVs6T
         OuNoyKyH75/wKOeVDs9BPzGZoaW4WgmwokdZAk10r16AriZK8yWzshiJ7QPD1tIiR4j4
         QzPkHke0ApkC7BmIel9NpOhZX6skVucQ5cDWBE1sEkxud+kBXt03CWPE54DZpYbaPcNZ
         CGpeksEdBwtBmUERj/lWgptGdsYMR8NniWurGI+HmBGYyKp86SYp3LYEv8Bwuy5BttNW
         kemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PyEUKLbqZIq1NMqrQWfaTXN/Z5gCejfRXXNJ7X/27zI=;
        b=rnk2BeJdCOQajkxcX5TeN6A5djhZH/SO2YT5hIzTg1VtVCdAsYtjzudE0AfvBa8ZlJ
         spvT35lR7dxPCmuuyn3pn2ZydkFUU2u8CrqNtyrJodTDEYRqysYm3adXdjKOau4y63+o
         mLgbzk/esbL+BaU708GCHJ0hbFXBskXh1eE1iGAJ9aQN19Km4PbtgQRUaoM+4K5FLckW
         CSR+20BIxxVvR4BvB9rMBz1Uwgkt9LyHdMBzbyWA4soH32WY8S+H0qFr7ERe4GRAX5ob
         zikG9ZcWfL5cc7qow0NV+VKOtS9iFExfH/3yngXkbJzCWdnR+o1hQ0rPWXNgJIfQRfZr
         zIDw==
X-Gm-Message-State: AOAM532YIOvk856dLmgtt6kBwBNAd2a4+GZkZyQaEjke9Tp8NvNNysHd
        +Z2CePTZvXA/lL2X6hURxzU=
X-Google-Smtp-Source: ABdhPJxehXmLzPU7JznTC/D2Rq9/EqmHv+0cvyHdGLCWoO8H0/6/JPBhLtcGKA9lw/2OCfOujrZx3w==
X-Received: by 2002:a17:90a:ae18:: with SMTP id t24mr9049661pjq.92.1629901370243;
        Wed, 25 Aug 2021 07:22:50 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id n3sm54431pfo.101.2021.08.25.07.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 07:22:49 -0700 (PDT)
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
Subject: [PATCH v7 0/7] drm: update locking for modesetting
Date:   Wed, 25 Aug 2021 22:21:58 +0800
Message-Id: <20210825142205.1376789-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sorry for the noise. Sending out a new version because the Intel-gfx CI
caught that __drm_mode_object_find has to be exported for loadable
modules like the Intel and VMware DRM drivers.

Hi,

Updated the series again to avoid recursive locking caught by the
Intel-gfx CI. Patch 5 touches a number of files, including the Intel and
VMware drivers, but most changes are simply switching a function call to
the appropriate locked/unlocked version.

Overall, this series fixes races with modesetting rights, converts
drm_device.master_mutex into master_rwsem, and removes
drm_file.master_lookup_lock.

- Patch 1: Fix a potential null ptr dereference in drm_master_release

- Patch 2: Convert master_mutex into rwsem (avoids creating a new lock)

- Patch 3: Update global mutex locking in the ioctl handler (avoids
deadlock when grabbing read lock on master_rwsem in drm_ioctl_kernel)

- Patch 4: Plug races with drm modesetting rights

- Patch 5: Modify drm_mode_object_find to fix potential recursive
locking of master_rwsem and lock inversions between modeset_mutex and
master_rwsem

- Patch 6: Remove remaining potential lock inversions between
modeset_mutex and master_rwsem

- Patch 7: Replace master_lookup_lock with master_rwsem

v6 -> v7:
- Export __drm_mode_object_find for loadable modules, caught by the
Intel-gfx CI (patch 5)

v5 -> v6:
- Fix recursive locking on master_rwsem, caught by the Intel-gfx CI
(patch 5 & 6)

v4 -> v5:
- Avoid calling drm_file_get_master while holding on to the modeset
mutex, caught by the Intel-gfx CI (patch 5 & 6)

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

Desmond Cheong Zhi Xi (7):
  drm: fix null ptr dereference in drm_master_release
  drm: convert drm_device.master_mutex into a rwsem
  drm: lock drm_global_mutex earlier in the ioctl handler
  drm: avoid races with modesetting rights
  drm: avoid circular locks in drm_mode_object_find
  drm: avoid circular locks with modeset_mutex and master_rwsem
  drm: remove drm_file.master_lookup_lock

 drivers/gpu/drm/drm_atomic_uapi.c            |  7 +-
 drivers/gpu/drm/drm_auth.c                   | 57 ++++++------
 drivers/gpu/drm/drm_color_mgmt.c             |  2 +-
 drivers/gpu/drm/drm_crtc.c                   |  5 +-
 drivers/gpu/drm/drm_debugfs.c                |  4 +-
 drivers/gpu/drm/drm_drv.c                    |  3 +-
 drivers/gpu/drm/drm_encoder.c                |  7 +-
 drivers/gpu/drm/drm_file.c                   |  7 +-
 drivers/gpu/drm/drm_framebuffer.c            |  2 +-
 drivers/gpu/drm/drm_internal.h               |  1 +
 drivers/gpu/drm/drm_ioctl.c                  | 48 ++++++----
 drivers/gpu/drm/drm_lease.c                  | 94 ++++++++++----------
 drivers/gpu/drm/drm_mode_object.c            | 28 +++++-
 drivers/gpu/drm/drm_plane.c                  | 22 +++--
 drivers/gpu/drm/drm_property.c               |  6 +-
 drivers/gpu/drm/i915/display/intel_overlay.c |  2 +-
 drivers/gpu/drm/i915/display/intel_sprite.c  |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c          |  2 +-
 include/drm/drm_auth.h                       |  6 +-
 include/drm/drm_connector.h                  | 23 +++++
 include/drm/drm_crtc.h                       | 22 +++++
 include/drm/drm_device.h                     | 15 +++-
 include/drm/drm_file.h                       | 17 ++--
 include/drm/drm_lease.h                      |  2 +
 include/drm/drm_mode_object.h                |  3 +
 include/drm/drm_plane.h                      | 20 +++++
 26 files changed, 264 insertions(+), 143 deletions(-)

-- 
2.25.1

