Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B28343F29C5
	for <lists+linux-media@lfdr.de>; Fri, 20 Aug 2021 12:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232659AbhHTKEI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Aug 2021 06:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232244AbhHTKEG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Aug 2021 06:04:06 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 551DDC061575;
        Fri, 20 Aug 2021 03:03:29 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id oa17so6999198pjb.1;
        Fri, 20 Aug 2021 03:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bUKxomWQZ5QxIYFDsb+klHkUJT56TTMlo6NJBPgwDTw=;
        b=XQIzz6ucLOTQp2DzVHYZkL6sgdA78JVrYg5osuKw9srS4VYeK+4UG5Ocu2rjdGl72K
         hozy0pXafCIL3DzoAGv1/Ynts0t1R95UT4eRGw8efB1QbFsTMQZcZzNzVsRTrIG8Jjsx
         T8XGwXtDc6W1lq8IAGR67sSlxVxx5EVaKUDjyTWi9PWFB78PE35CBfisPfwjL5ZGOqIz
         I3jWnfUS86KLf9vU9Kc1KZ2TAw1LjhjPGp1branPwgmPnlTWP17YOW4FMxOb6Une8Jga
         qPm9GimVgYFG94rKXQtAimPIneqpt2CG69j+fuCneS+OnoCnAwijNwLS1/8pxSTsjEtr
         pP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bUKxomWQZ5QxIYFDsb+klHkUJT56TTMlo6NJBPgwDTw=;
        b=bcVEfSkROB2EmLH8G9gMHQzoJ9ZIy0EaD25WYwO5BbTRCIxeYv+giaYhtsuMOSkESF
         emwMW2M+P7SczSKVxE+CwRYmXGP7Cj4G0/fYpf3aLe32vvS74Uug25UwoK0sePWFxZt4
         aFDLR5pf/+KVAnQNVT7+15atWWlsmOG57wunP49pyOmj+2Zl/RlFz+oLQjYXEE1ux73B
         WLrt04Kzps/qgEzPT/ZqB05hUnuX5Jnqchd70klE/THhpU5ubn7FvFuu16jAtKPyIgdU
         gfRb0q1AsuoeaH5E+bJ63BNeKq5yHPdOWSl9JXtWtkRiPZ5idsgDY/f6YSAV1eLVd5Uq
         CCag==
X-Gm-Message-State: AOAM531JD/oZQQztF/l4DK54FcKz/Vv+V+P30nr+B/JQjmNt1BuQu3ZF
        ntyabirA9QfA1uDHPhBDkks=
X-Google-Smtp-Source: ABdhPJyVUBpUuyiz1RaVzTh1c7byc8ylmZizw2oW+a4dWyMXQewAPos+qDRZ0N0on3UDesmH/00SKQ==
X-Received: by 2002:a17:90a:d791:: with SMTP id z17mr3743696pju.203.1629453808880;
        Fri, 20 Aug 2021 03:03:28 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id i8sm6503876pfo.117.2021.08.20.03.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 03:03:28 -0700 (PDT)
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
Subject: [PATCH v4 0/5] drm: update locking for modesetting
Date:   Fri, 20 Aug 2021 18:02:46 +0800
Message-Id: <20210820100251.448346-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Thanks for all the helpful feedback on the previous version.

Taking all the suggestions together, this series now converts
drm_device.master_mutex into master_rwsem, and also attempts to remove
drm_file.master_lookup_lock. There might still be lock inversions
lurking, so the output from Intel-gfx CI should be interesting to see.

Overall, this series makes the following changes:

- Patch 1: Fix a potential null ptr dereference in drm_master_release

- Patch 2: Convert master_mutex into rwsem (avoids creating a new lock)

- Patch 3: Update global mutex locking in the ioctl handler (avoids
deadlock when grabbing read lock on master_rwsem in drm_ioctl_kernel)

- Patch 4: Plug races with drm modesetting rights

- Patch 5: Replace master_lookup_lock with master_rwsem by untangling
remaining lock hierarchy inversions

v3 -> v4 (suggested by Daniel Vetter):
- Drop a patch that added an unnecessary master_lookup_lock in
drm_master_release (previously patch 2)
- Drop a patch that addressed a non-existent race in
drm_is_current_master_locked (previously patch 3)
- Remove fixes for non-existent null ptr dereferences (previous patch 4)
- Protect drm_master.magic_map,unique{_len} with master_rwsem instead of
master_lookup_lock (dropped previous patch 5)
- Drop the patch that moved master_lookup_lock into struct drm_device
(previously patch 1)
- Drop a patch to export task_work_add (previously patch 8)
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

Desmond Cheong Zhi Xi (5):
  drm: fix null ptr dereference in drm_master_release
  drm: convert drm_device.master_mutex into a rwsem
  drm: lock drm_global_mutex earlier in the ioctl handler
  drm: avoid races with modesetting rights
  drm: remove drm_file.master_lookup_lock

 drivers/gpu/drm/drm_auth.c        | 54 ++++++++++++------------
 drivers/gpu/drm/drm_debugfs.c     |  4 +-
 drivers/gpu/drm/drm_drv.c         |  3 +-
 drivers/gpu/drm/drm_file.c        |  7 ++--
 drivers/gpu/drm/drm_internal.h    |  1 +
 drivers/gpu/drm/drm_ioctl.c       | 48 ++++++++++++---------
 drivers/gpu/drm/drm_lease.c       | 69 ++++++++++++++-----------------
 drivers/gpu/drm/drm_mode_object.c | 14 +++++--
 include/drm/drm_auth.h            |  6 +--
 include/drm/drm_device.h          | 15 +++++--
 include/drm/drm_file.h            | 17 +++-----
 include/drm/drm_lease.h           |  2 +-
 12 files changed, 125 insertions(+), 115 deletions(-)

-- 
2.25.1

