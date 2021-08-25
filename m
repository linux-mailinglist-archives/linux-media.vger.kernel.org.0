Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D43B13F72FA
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 12:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239901AbhHYK0n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 06:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239889AbhHYK0m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 06:26:42 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7DE5C061757;
        Wed, 25 Aug 2021 03:25:56 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id oc2-20020a17090b1c0200b00179e56772d6so3823765pjb.4;
        Wed, 25 Aug 2021 03:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ba/aDvD1tkluhQ4EKS9mJop10MbwBdBq8p8q4FF7hME=;
        b=ERW9eAq0Yrphg27JkPRPoE9hi5ScahnBoNwNuz7HulCP62HFkrhXWI0nyJcIddIFn7
         x9v/kxVidsNMcf+nTHom40evTH/p8ND8jqD3OS/vQtRzDdVvNsMuKCG9sUqIQL4To3EM
         hyNb7khUoqPlL/5qNG61XXHvm2smKgPyXj9NR5qFeSi1SnMGy9MQRa1ZpfuctgFw9rIP
         1Jsx2sSz2YPUYO45juwlfJo3Q15Etj0c7enDb+styb1YpHQBOE2wQWJRUVQDwp4vNLDq
         6yfvMoboiwSdcOp4nBSoEYBiUtH5IxObynxBbd5Nc6qiWjduuECQxYvcb2PLgL7buvOL
         BZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ba/aDvD1tkluhQ4EKS9mJop10MbwBdBq8p8q4FF7hME=;
        b=bfCsCOqnnldpTItdWKcz4lASbGZqLZE8cv6MgCUU4Wv3c50gCML3RT9n5uSkJWXreK
         ctQOeLRyn1Ce+2JuBXVqI79B5aWeokp9Jt2Pt/O+wM9RnunLDuC6WoUtoLxDkglwzs+G
         OmxsS4xM21wny0zP8VepsqS8bNMk1cKH05p/kG3RTcht4Nu8f0lCmqvIRGEBUfSlHB4N
         /Fa1/3Qv5vizURDC2VfyKsGJo6D0Q/eAI/0cRLxC68O2pR9egN262Q2goichQpLdt567
         DucPRT6iVp4TzLJeDvgiooIb0DWQ0byiZnyNjVnX88M+SSBli5tlb2hJVQREBbtAS5cj
         pJzw==
X-Gm-Message-State: AOAM533oip1Gzqm3wyW0XCYvPzcFXv32431jDiAWDUqigtQDphZcSMeE
        9a5pFADBcnnIprxtuaeuEz8=
X-Google-Smtp-Source: ABdhPJxh+Vt9oDZRXNiLgQBph5qkOp3i9zD+1yOu+rnkCFbGG36RMeKJz2sTzFwpPEwsICDPT2HhbQ==
X-Received: by 2002:a17:90a:f696:: with SMTP id cl22mr4536225pjb.216.1629887156307;
        Wed, 25 Aug 2021 03:25:56 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id t42sm10228377pfg.30.2021.08.25.03.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 03:25:55 -0700 (PDT)
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
Subject: [PATCH v6 0/7] drm: update locking for modesetting
Date:   Wed, 25 Aug 2021 18:24:04 +0800
Message-Id: <20210825102411.1084220-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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

v5 -> v6:
- Fix recursive locking on master_rwsem, caught by the Intel-gfx CI
(only current patch 5 & 6 changed)

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
 drivers/gpu/drm/drm_mode_object.c            | 13 ++-
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
 26 files changed, 249 insertions(+), 143 deletions(-)

-- 
2.25.1

