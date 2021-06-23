Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC8C3B1916
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 13:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbhFWLmQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 07:42:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbhFWLmQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 07:42:16 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AFAAC061574;
        Wed, 23 Jun 2021 04:39:59 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id bv7-20020a17090af187b029016fb18e04cfso3533545pjb.0;
        Wed, 23 Jun 2021 04:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D6m9WVA3yMq8SaqW5tFc5l5QsGXzTbM/gH6eKVIL3Gg=;
        b=Ig1//yPm6b7geiSIFyIb+upUA/WpuANcQ6A7c0YLI0nu6hIyIiv+Gc14QE0KFY7XO/
         cxX31A1VUhfKyFxFLavQmmlGANdt6TyrCZ3C/IzRy2BQakWDEVeHhJUpXZQCpJRR3d+a
         DSjYYbLhU8Q5B+UxY8Ig94ZoSbITiXA1vkSf565wlkpAdzQailVqydm8BGJl/GChIZf/
         G2s+qS99Hrwq0xPTO7u/1QvOOfccBZKvkj5gyZvkL7XItE767CiPYt1rlgOA3OAn0RJZ
         hUx9Ytf710y5jPfUUKJoSni8R0LlUkDr5++zxpeUBAVOKVtisCMSSafBYDzTYXSqd3TO
         6g7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D6m9WVA3yMq8SaqW5tFc5l5QsGXzTbM/gH6eKVIL3Gg=;
        b=mHz5O2WXZteGnFWHTVD8kR/dI+yE8mVL1+02Q5S1JNWjxbZjyv5i5dVzjHZXZHuXOn
         eCch7klljzp/2Exy/ewLPrihcmccfamQ65r7vGyFjQ44HCLVtCEndvyEetqD0snBxemh
         sidK4/D1GWU7D7lO8+RDdIm7D3PXrWzD6Gk2dfV3T9Mwb5nQa0hUxJyT5hvr28EkuhMR
         limqWmJDkyK2mqOgRShbtv7Txj7okmcqUDac5Mg3iBGcfKXQ71MLUxWOGbnU9ckXseKL
         K0L7zzMvAqRr/+00WlKoO4DLWfOV2mCVb5qwlkCGQPjqges6R6oj9xATQKfn0IBPGVCZ
         DbVA==
X-Gm-Message-State: AOAM531YiExsN1bX7G97zXSif91tRBb2JUNBI7Y+OAyjwzDqxFv2Mird
        hMzqBNS6O2tIGL05njpy0teZ+u2aJOdbj+C6lbI=
X-Google-Smtp-Source: ABdhPJyxhO9sXbxIcpkcMe69JQIh2asY1zWw8/qysdg/uGuhhi6aSLfTrPFyr2HArrOcU+cld1nssg==
X-Received: by 2002:a17:90a:8a95:: with SMTP id x21mr9125603pjn.154.1624448398722;
        Wed, 23 Jun 2021 04:39:58 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id u12sm5368922pjc.0.2021.06.23.04.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 04:39:58 -0700 (PDT)
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
Subject: [PATCH v4 0/2] drm: address potential UAF bugs with drm_master ptrs
Date:   Wed, 23 Jun 2021 19:37:38 +0800
Message-Id: <20210623113740.6260-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series addresses potential use-after-free errors when dereferencing pointers to struct drm_master. These were identified after one such bug was caught by Syzbot in drm_getunique():
https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803

The series is broken up into two patches:

1. Implement a locked version of drm_is_current_master() function that's used within drm_auth.c.

2. Identify areas in drm_lease.c where pointers to struct drm_master are dereferenced, and ensure that the master pointers are not freed during use.

Changes in v3 -> v4:
- Patch 1:
Move the call to drm_is_current_master in drm_mode_getconnector out from the section locked by &dev->mode_config.mutex. As suggested by Daniel Vetter. This avoids a circular lock lock dependency as reported here https://patchwork.freedesktop.org/patch/440406/

Additionally, inside drm_is_current_master, instead of grabbing &fpriv->master->dev->master_mutex, we grab &fpriv->minor->dev->master_mutex to avoid dereferencing a null ptr if fpriv->master is not set.

- Patch 2:
Modify kerneldoc formatting.

Additionally, add a file_priv->master NULL check inside drm_file_get_master, and handle the NULL result accordingly in drm_lease.c. As suggested by Daniel Vetter.

Changes in v2 -> v3:
- Patch 1:
Move the definition of drm_is_current_master and the _locked version higher up in drm_auth.c to avoid needing a forward declaration of drm_is_current_master_locked. As suggested by Daniel Vetter.

- Patch 2:
Instead of leaking drm_device.master_mutex into drm_lease.c to protect drm_master pointers, add a new drm_file_get_master() function that returns drm_file->master while increasing its reference count, to prevent drm_file->master from being freed. As suggested by Daniel Vetter.

Changes in v1 -> v2:
- Patch 2:
Move the lock and assignment before the DRM_DEBUG_LEASE in drm_mode_get_lease_ioctl, as suggested by Emil Velikov.

Desmond Cheong Zhi Xi (2):
  drm: add a locked version of drm_is_current_master
  drm: protect drm_master pointers in drm_lease.c

 drivers/gpu/drm/drm_auth.c      | 76 ++++++++++++++++++++++++--------
 drivers/gpu/drm/drm_connector.c |  5 ++-
 drivers/gpu/drm/drm_lease.c     | 77 ++++++++++++++++++++++++---------
 include/drm/drm_auth.h          |  1 +
 include/drm/drm_file.h          | 15 +++++--
 5 files changed, 131 insertions(+), 43 deletions(-)

-- 
2.25.1

