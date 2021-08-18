Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74F533EFDDF
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 09:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239112AbhHRHkB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 03:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239108AbhHRHkB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 03:40:01 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E8F7C061764;
        Wed, 18 Aug 2021 00:39:27 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id oa17so2093619pjb.1;
        Wed, 18 Aug 2021 00:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e6vxkGEC/5cBQ7RDSXvwNkc+jNWhSIL2gt3cyXjlMy0=;
        b=i4L99wf64dEZ9LMIjZCdq5HBsL7YO+w6mPeYaGb3CXwuW15cjMopamJ7i+UtFSaN25
         z4rZKcLO5w15cg7+P4rlboKjkGbHm2INjwHBCSyIBdvOIIHKMs8iq36Uc2t2HpR4U6DS
         PeVX7wc1SgqOfwrOtaOMAAAbWfhKZOxgQEPpTAD2DwGmKJuxv9SRbs1jI4DjEfvYP16W
         GdHdUTB0UPtvFtAUhhcXY6s7AuE8PdIXUBbgVw/jQ8o6Dek7vaaLJH/PPPw6v2VcG07L
         knSCx6Bi7AAG29YttwsWCAtn2JIenaQ0ncOp7C6cEebcrLUcHzclF2lQeLIn61qhRq9F
         j7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e6vxkGEC/5cBQ7RDSXvwNkc+jNWhSIL2gt3cyXjlMy0=;
        b=XEFbpYZqKLsKctf0GGMdpYyY38N4vMy8cI3xP+oytzfYSylx03Id8OW+Gxr7AozvMs
         fcuhd8gSSMGq1bEzuSSTDIAw49BiVmOn48Al8NCMFDpkxBXSCIl+5u+3cyVxijvoskbd
         8rvqSRjMf1cw49/qXUDAjALKFKVyHSo215mUmtgJNnuCsNL0Dt2XikKpSmdnBhjB8I+V
         NtsWjv90yVBT41ss3A7S3D9Pg6jWfIMYRN3b/4biWhmGV8zHAsTuZzzukCFSCMLD0Tez
         EUzGcez5u9POl+jlIqlfGsDvzY2VJY2oTtBPkTBX1Xo8EoVBCQHMVSJnXk0bDFNp8JmG
         96BQ==
X-Gm-Message-State: AOAM532zqBUQCvoqkZnfcXVvGRyBwCeaCfC5TnSGjz3FBU/5fr6FqtP1
        xKIFkDqGOHERn54qR/P7y8g=
X-Google-Smtp-Source: ABdhPJwsjLetmmkwthytXHRAjBgzfi7amhs4Th7JIiNaKTNGuKsh8scjwN6S/Fd61RcIgh641geZBg==
X-Received: by 2002:a17:90a:8b12:: with SMTP id y18mr8016646pjn.72.1629272366618;
        Wed, 18 Aug 2021 00:39:26 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id u3sm3886729pjr.2.2021.08.18.00.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 00:39:26 -0700 (PDT)
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
Subject: [PATCH v3 0/9] drm, kernel: update locking for DRM
Date:   Wed, 18 Aug 2021 15:38:15 +0800
Message-Id: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

The patches in this series are largely fixes and prepwork leading up to
the final patch which plugs races with modesetting rights. Most of the
fixes don't have bug reports, so comments would be very appreciated.

The biggest change from the previous version is that we convert
drm_device.master_mutex into master_rwsem, instead of introducing
master_rwsem as a third lock.

Overall, this series makes the following changes:

- Patch 1: Move master_lookup_lock into struct drm_device (enables us to
use it to protect attributes accessed by different drm_files)

- Patch 2: Add a missing master_lookup_lock in drm_master_release

- Patch 3: Fix a potential race in drm_is_current_master_locked

- Patch 4: Fix potential null ptr dereferences in drm_{auth, ioctl}

- Patch 5: Move magic_map,unique{_len} out from master_mutex's
protection into master_lookup_lock's protection (allows us to avoid
read_lock -> write_lock deadlocks)

- Patch 6: Convert master_mutex into rwsem (avoids creating a new lock)

- Patch 7: Update global mutex locking in the ioctl handler (avoids
deadlock when grabbing read lock on master_rwsem in drm_ioctl_kernel)

- Patch 8: Export task_work_add (enables us to write drm_master_flush)

- Patch 9: Plug races with drm modesetting rights

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

Desmond Cheong Zhi Xi (9):
  drm: move master_lookup_lock into drm_device
  drm: hold master_lookup_lock when releasing a drm_file's master
  drm: check for null master in drm_is_current_master_locked
  drm: fix potential null ptr dereferences in drm_{auth,ioctl}
  drm: protect magic_map,unique{_len} with master_lookup_lock
  drm: convert drm_device.master_mutex into a rwsem
  drm: update global mutex lock in the ioctl handler
  kernel: export task_work_add
  drm: avoid races with modesetting rights

 drivers/gpu/drm/drm_auth.c     | 108 ++++++++++++++++++++++++---------
 drivers/gpu/drm/drm_debugfs.c  |   4 +-
 drivers/gpu/drm/drm_drv.c      |   4 +-
 drivers/gpu/drm/drm_file.c     |   1 -
 drivers/gpu/drm/drm_internal.h |   1 +
 drivers/gpu/drm/drm_ioctl.c    |  39 +++++++-----
 drivers/gpu/drm/drm_lease.c    |   1 +
 include/drm/drm_auth.h         |   6 +-
 include/drm/drm_device.h       |  27 +++++++--
 include/drm/drm_file.h         |  20 +++---
 kernel/task_work.c             |   1 +
 11 files changed, 145 insertions(+), 67 deletions(-)

-- 
2.25.1

