Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B5D53F802A
	for <lists+linux-media@lfdr.de>; Thu, 26 Aug 2021 04:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236845AbhHZCC4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 22:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235677AbhHZCCv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 22:02:51 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F61FC061757;
        Wed, 25 Aug 2021 19:02:05 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 28-20020a17090a031cb0290178dcd8a4d1so5042457pje.0;
        Wed, 25 Aug 2021 19:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s5TqIlANFa3uV0VJDHOKkR4xpYeVf++ry3FD6Swo8JM=;
        b=quTcae3XtnhsVfHIVFHg3uvgfbbqlLLkD+JXWD1Afb3ziOEAmfMU24IZ1x4I6NatTx
         Riw2TpPn63AXa2NDy0CgEn5bO/W94bCyEp3bqG/SoMtLZu3XrSX+/wnuQPJro7MIF4rW
         iwt2muRdG+/tFCEN2U9tRC/LvNnbiARstzbmZyOhUC+MsLOn0HmY1/3QUdEmxGDX/ld6
         ptqFPeCJET1tobzpZak5a+AZ4DUhCXBCHHLENAU0ukvHHTg37u2CglZ8vu3RWpP4u+yN
         ROvWuTvDt6IjSIMBzjsFk/sLWwl/ZCURihvh39eVObhq5BDnXAyE3sJPIGxxdrdtseqA
         tQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s5TqIlANFa3uV0VJDHOKkR4xpYeVf++ry3FD6Swo8JM=;
        b=dlZK3J0YEKBP28m4k1bXceVJgHqAzyxXtJ06s1h1oFIa23O+HBpDLRISZ+JG4N2j5L
         a70Tb3mkS9Go2W+oSaRNBF8bsPK/N7qpR7MLywNmBm84Rqxjqhy8J9hAF+xS9+hsE6sP
         drda6pTkCmUPeTkzncytlF/0v0e72tTT2goZzunxrI/ITkyCdfjoW2tt1dX9sXwRuKb6
         XN1NNvUUnyTZMoekeoBcKGN//CAmKpWSAcdnzurIV46u16Z4/KETHTMyKIveblLn3r2z
         5UIk+TSYU8/IeuulPjPAuK3H9TR14MuOBVqRsCdpfigQH/tt9aA3+hlHoE5usBEdj9KZ
         BfVg==
X-Gm-Message-State: AOAM533wxYN0meUWlveDcl8tfuN2VhII8taJPwb1rWTa+wHEjWJ5UN7K
        7JR8KLFNno3v32Ax7pfYqR0=
X-Google-Smtp-Source: ABdhPJzuk2arjEVv1wm3C1m/iVmZhI47zbgk9ZcOdm9fNpblqQ/6PqGPe1Vlg8vJofMgIHO4LR5DrA==
X-Received: by 2002:a17:90a:14c4:: with SMTP id k62mr13812913pja.126.1629943324527;
        Wed, 25 Aug 2021 19:02:04 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id i11sm721973pjj.19.2021.08.25.19.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 19:02:04 -0700 (PDT)
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
Subject: [PATCH v8 0/7] drm: update locking for modesetting
Date:   Thu, 26 Aug 2021 10:01:15 +0800
Message-Id: <20210826020122.1488002-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Seems that Intel-gfx CI still doesn't like what's going on, so I updated
the series to remove more recursive locking again.

Note: patch 5 touches a number of files, including the Intel and VMware
drivers, but most changes are simply switching a function call to the
appropriate locked/unlocked version.

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

- Patch 6: Remove remaining potential recursive locking of master_rwsem
and lock inversions between modeset_mutex and master_rwsem from calling
drm_lease_held

- Patch 7: Replace master_lookup_lock with master_rwsem

v7 -> v8:
- Avoid calling drm_lease_held in drm_mode_setcrtc and
drm_wait_vblank_ioctl, caught by Intel-gfx CI (patch 6)

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
  drm: avoid circular locks in drm_lease_held
  drm: remove drm_file.master_lookup_lock

 drivers/gpu/drm/drm_atomic_uapi.c            |  7 +-
 drivers/gpu/drm/drm_auth.c                   | 57 ++++++------
 drivers/gpu/drm/drm_color_mgmt.c             |  2 +-
 drivers/gpu/drm/drm_crtc.c                   |  9 +-
 drivers/gpu/drm/drm_debugfs.c                |  4 +-
 drivers/gpu/drm/drm_drv.c                    |  3 +-
 drivers/gpu/drm/drm_encoder.c                |  7 +-
 drivers/gpu/drm/drm_file.c                   |  7 +-
 drivers/gpu/drm/drm_framebuffer.c            |  2 +-
 drivers/gpu/drm/drm_internal.h               |  1 +
 drivers/gpu/drm/drm_ioctl.c                  | 48 ++++++----
 drivers/gpu/drm/drm_lease.c                  | 94 ++++++++++----------
 drivers/gpu/drm/drm_mode_object.c            | 28 +++++-
 drivers/gpu/drm/drm_plane.c                  | 26 ++++--
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
 26 files changed, 270 insertions(+), 145 deletions(-)

-- 
2.25.1

