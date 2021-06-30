Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42EE93B8580
	for <lists+linux-media@lfdr.de>; Wed, 30 Jun 2021 16:55:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235405AbhF3O5w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Jun 2021 10:57:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235177AbhF3O5v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Jun 2021 10:57:51 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D78BC061756;
        Wed, 30 Jun 2021 07:55:22 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id a127so2653308pfa.10;
        Wed, 30 Jun 2021 07:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DbLagrqX9GyFiYDlx5GodYpslzbdCAvx8G0gowIUudY=;
        b=rnIF81Edc3BhqlLAhT7hsmv4IGJ2tTSllDOEblCmt2DkJCoHAiTvkhLTKVabX/zEIp
         jVmFNxGLpzqMD79Pwcu+S7EkwFEuzn0yfiy5i1M1TxQD6Io14xq7f1hVfw7ORpo24yXs
         u9Zx3dPG0dOmI5ovMmchBx9LUXfwLVeiJOTMUsPvr5ax+VfBqaff4BH4Aj35xcqN0pYW
         dTjvfELHQYsZiJbc+veYEh1PNrZMzYfNa4PqAkJZuJSjGDD1yHsp6ce8uQKoJZG7hVQf
         Gee2BSaK/VndKuhsqjo+Bh6H+wSDaFmkKZHpePJ+kJdIVhrEIPjzplsJDx3aj6d2DJcR
         4JpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DbLagrqX9GyFiYDlx5GodYpslzbdCAvx8G0gowIUudY=;
        b=thx6HJ156TsfSKKSKPjLJ/K17n5sZNzgp1gQFPJOz6Te1lVEL0gt7s+gevAPA/mwTn
         c7psBIHTQEt5FXUORZKq6ar4QckiI2jDL9AtXhOnJRNOiMa8HjyUzLZIw9DApxwYkJq7
         rCFQ4b5ti9pqhniXZ42dhT7qb/wPL0BzAFWy3m0pRSjyDgdmmj08UPx3pTUMc9kipCAt
         oOWYpyTwB9wyyWwQn9Jx5csQ1Mo0vLMnHhEU6DSENnGLlLnwnQMwg1/MA5YKDbMgnVMM
         9t5bytQsRGPvNv233YE6173ylzBRv8ok3y7ofhNdC7KEAGRBWsJ/x3MOO4bGFvL9Sz39
         axFw==
X-Gm-Message-State: AOAM5318Pp24zBlvrYukrYIGXwWMQDG5wFAZP8EDN8E/Hzvt7OxpWzwI
        i8Ax38OtNlcLtUZDDQxhk1w=
X-Google-Smtp-Source: ABdhPJy20ySZ9X53g3XT2CVgt7VxxhHPKHPP85Vof/2Cvj1fsukFMR41XOIOAlZsTMRR6qDi5I1c+A==
X-Received: by 2002:a65:608a:: with SMTP id t10mr8423416pgu.311.1625064921816;
        Wed, 30 Jun 2021 07:55:21 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id d13sm7157234pjr.49.2021.06.30.07.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 07:55:21 -0700 (PDT)
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
        emil.l.velikov@gmail.com
Subject: [PATCH v6 0/4] drm: address potential UAF bugs with drm_master ptrs
Date:   Wed, 30 Jun 2021 22:54:00 +0800
Message-Id: <20210630145404.5958-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series addresses potential use-after-free errors when dereferencing pointers to struct drm_master. These were identified after one such bug was caught by Syzbot in drm_getunique():
https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803

The series is broken up into four patches:

1. Move a call to drm_is_current_master() out from a section locked by &dev->mode_config.mutex in drm_mode_getconnector(). This patch does not apply to stable.

2. Move a call to _drm_lease_held() out from the section locked by &dev->mode_config.idr_mutex in __drm_mode_object_find().

3. Implement a locked version of drm_is_current_master() function that's used within drm_auth.c.

4. Identify areas in drm_lease.c where pointers to struct drm_master are dereferenced, and ensure that the master pointers are not freed during use.

Changes in v5 -> v6:
- Patch 2:
Add patch 2 to the series. This patch moves the call to _drm_lease_held out from the section locked by &dev->mode_config.idr_mutex in __drm_mode_object_find.

- Patch 4:
Clarify the kerneldoc for dereferencing drm_file.master, as suggested by Daniel Vetter.

Refactor error paths with goto labels so that each function only has a single drm_master_put(), as suggested by Emil Velikov.

Modify comparison to NULL into "!master", as suggested by the intel-gfx CI.

Changes in v4 -> v5:
- Patch 1:
Add patch 1 to the series. The changes in patch 1 do not apply to stable because they apply to new changes in the drm-misc-next branch. This patch moves the call to drm_is_current_master in drm_mode_getconnector out from the section locked by &dev->mode_config.mutex.

Additionally, added a missing semicolon to the patch, caught by the intel-gfx CI.

- Patch 3:
Move changes to drm_connector.c into patch 1.

Changes in v3 -> v4:
- Patch 3:
Move the call to drm_is_current_master in drm_mode_getconnector out from the section locked by &dev->mode_config.mutex. As suggested by Daniel Vetter. This avoids a circular lock lock dependency as reported here https://patchwork.freedesktop.org/patch/440406/

Additionally, inside drm_is_current_master, instead of grabbing &fpriv->master->dev->master_mutex, we grab &fpriv->minor->dev->master_mutex to avoid dereferencing a null ptr if fpriv->master is not set.

- Patch 4:
Modify kerneldoc formatting.

Additionally, add a file_priv->master NULL check inside drm_file_get_master, and handle the NULL result accordingly in drm_lease.c. As suggested by Daniel Vetter.

Changes in v2 -> v3:
- Patch 3:
Move the definition of drm_is_current_master and the _locked version higher up in drm_auth.c to avoid needing a forward declaration of drm_is_current_master_locked. As suggested by Daniel Vetter.

- Patch 4:
Instead of leaking drm_device.master_mutex into drm_lease.c to protect drm_master pointers, add a new drm_file_get_master() function that returns drm_file->master while increasing its reference count, to prevent drm_file->master from being freed. As suggested by Daniel Vetter.

Changes in v1 -> v2:
- Patch 4:
Move the lock and assignment before the DRM_DEBUG_LEASE in drm_mode_get_lease_ioctl, as suggested by Emil Velikov.

Desmond Cheong Zhi Xi (4):
  drm: avoid circular locks in drm_mode_getconnector
  drm: avoid circular locks in __drm_mode_object_find
  drm: add a locked version of drm_is_current_master
  drm: protect drm_master pointers in drm_lease.c

 drivers/gpu/drm/drm_auth.c        | 76 +++++++++++++++++++++--------
 drivers/gpu/drm/drm_connector.c   |  5 +-
 drivers/gpu/drm/drm_lease.c       | 81 +++++++++++++++++++++++--------
 drivers/gpu/drm/drm_mode_object.c | 10 ++--
 include/drm/drm_auth.h            |  1 +
 include/drm/drm_file.h            | 15 ++++--
 6 files changed, 141 insertions(+), 47 deletions(-)

-- 
2.25.1

