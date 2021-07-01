Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABCC03B94E6
	for <lists+linux-media@lfdr.de>; Thu,  1 Jul 2021 18:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbhGAQ44 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jul 2021 12:56:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbhGAQ4z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jul 2021 12:56:55 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EED0BC061762;
        Thu,  1 Jul 2021 09:54:22 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id q91so4622047pjk.3;
        Thu, 01 Jul 2021 09:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KSrQtrkS57Wd8RUtiIlSXmn1PXYteCewAUlvuTiLz9k=;
        b=CeJdWLaXxP5TiRpTjobL5+89BvtG4a0XGRdyggpWjHRV1RqlTP3SvbmU+Uz39rS2vO
         +P9x3/NK4yus1l9oFzWeWDo9UptZnVNR5VASEkowxSTJpJPuQvyFDb2sD+52sPPMrO0d
         9ZB1fq0anCWrgtg0rjdSFT+fy3AdoogP20fbZK+VjRIdmaOhVpvhdaLuk6Jwzf8q7X6b
         S93/NauMkuTXZHHKmSrxD9559sM5GzLHYKcXiMD0pi5LP0XRoLk6H52iQLGEvS4utWQq
         uQ1dQnJPzligC9/d2sNaB4/pF1fY+gwEprhiizwozhOrGefBj3cKYo2UW3ukSglbszUG
         WgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KSrQtrkS57Wd8RUtiIlSXmn1PXYteCewAUlvuTiLz9k=;
        b=r+uqAioMJ3wMQyk85GhBJ2GUnAYtW7sJlrHKo0hnuPGRtJ90xxTKJtUuWOWtA5HBHQ
         YNRFwlMs1SkkFVl9NdR+fxFhGpQTEMbcsRiCBc1IJkrIr4YKob/KPgGUa8QdW+tDYnKR
         StahK1iKHfbyGJz8dBxd6NSiWQ00TwsBra34aNDaXKrLsDa0hun0TSSX/oeG05BNNK4A
         LxMBFWq5fOgphNkT7OONMLcFFOQtfz7LKKgTT+BS13AUisklxQNWz5E4caQmtUiBZ1A7
         MyL6dmSouOrqTXwSoN1zLTFIourVlsd/QuLxFe/Or1eyP+o/Foya4ZlucG3cvYlN4/zc
         ACPw==
X-Gm-Message-State: AOAM532xXxT6geS46Rj1M/0+m956BiJ03NblN3bmKmJC/aMfWopUcY+T
        YWFKRO3YRSmwgouXFHcpNyU=
X-Google-Smtp-Source: ABdhPJz45rBGKDpouGSS1yrk5efAnEw697BBt+81Exjeub/g9QFgrl7iQu4qWRNxbgHX9POqP3DxJA==
X-Received: by 2002:a17:902:fe0a:b029:11d:81c9:3adf with SMTP id g10-20020a170902fe0ab029011d81c93adfmr741720plj.0.1625158462323;
        Thu, 01 Jul 2021 09:54:22 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id s20sm398738pgv.1.2021.07.01.09.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 09:54:21 -0700 (PDT)
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
Subject: [PATCH v7 0/5] drm: address potential UAF bugs with drm_master ptrs
Date:   Fri,  2 Jul 2021 00:53:53 +0800
Message-Id: <20210701165358.19053-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series addresses potential use-after-free errors when dereferencing pointers to struct drm_master. These were identified after one such bug was caught by Syzbot in drm_getunique():
https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803

The series is broken up into five patches:

1. Move a call to drm_is_current_master() out from a section locked by &dev->mode_config.mutex in drm_mode_getconnector(). This patch does not apply to stable.

2. Move a call to _drm_lease_held() out from the section locked by &dev->mode_config.idr_mutex in __drm_mode_object_find().

3. Implement a locked version of drm_is_current_master() function that's used within drm_auth.c.

4. Serialize drm_file.master by introducing a new lock that's held whenever the value of drm_file.master changes.

5. Identify areas in drm_lease.c where pointers to struct drm_master are dereferenced, and ensure that the master pointers are not freed during use.

Changes in v6 -> v7:
- Patch 2:
Modify code alignment as suggested by the intel-gfx CI.

Update commit message based on the changes to patch 5.

- Patch 4:
Add patch 4 to the series. This patch adds a new lock to serialize drm_file.master, in response to the lockdep splat by the intel-gfx CI.

- Patch 5:
Move kerneldoc comment about protecting drm_file.master with drm_device.master_mutex into patch 4.

Update drm_file_get_master to use the new drm_file.master_lock instead of drm_device.master_mutex, in response to the lockdep splat by the intel-gfx CI.

Changes in v5 -> v6:
- Patch 2:
Add patch 2 to the series. This patch moves the call to _drm_lease_held out from the section locked by &dev->mode_config.idr_mutex in __drm_mode_object_find.

- Patch 5:
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

- Patch 5:
Modify kerneldoc formatting.

Additionally, add a file_priv->master NULL check inside drm_file_get_master, and handle the NULL result accordingly in drm_lease.c. As suggested by Daniel Vetter.

Changes in v2 -> v3:
- Patch 3:
Move the definition of drm_is_current_master and the _locked version higher up in drm_auth.c to avoid needing a forward declaration of drm_is_current_master_locked. As suggested by Daniel Vetter.

- Patch 5:
Instead of leaking drm_device.master_mutex into drm_lease.c to protect drm_master pointers, add a new drm_file_get_master() function that returns drm_file->master while increasing its reference count, to prevent drm_file->master from being freed. As suggested by Daniel Vetter.

Changes in v1 -> v2:
- Patch 5:
Move the lock and assignment before the DRM_DEBUG_LEASE in drm_mode_get_lease_ioctl, as suggested by Emil Velikov.

Desmond Cheong Zhi Xi (5):
  drm: avoid circular locks in drm_mode_getconnector
  drm: separate locks in __drm_mode_object_find
  drm: add a locked version of drm_is_current_master
  drm: serialize drm_file.master with a master lock
  drm: protect drm_master pointers in drm_lease.c

 drivers/gpu/drm/drm_auth.c        | 86 +++++++++++++++++++++++--------
 drivers/gpu/drm/drm_connector.c   |  5 +-
 drivers/gpu/drm/drm_file.c        |  1 +
 drivers/gpu/drm/drm_lease.c       | 81 ++++++++++++++++++++++-------
 drivers/gpu/drm/drm_mode_object.c | 10 ++--
 include/drm/drm_auth.h            |  1 +
 include/drm/drm_file.h            | 18 +++++--
 7 files changed, 153 insertions(+), 49 deletions(-)

-- 
2.25.1

