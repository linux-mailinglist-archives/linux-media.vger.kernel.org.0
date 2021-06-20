Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8973B3ADE03
	for <lists+linux-media@lfdr.de>; Sun, 20 Jun 2021 13:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbhFTLG7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Jun 2021 07:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbhFTLG5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Jun 2021 07:06:57 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AACA2C061574;
        Sun, 20 Jun 2021 04:04:45 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id y21so1124004plb.4;
        Sun, 20 Jun 2021 04:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hm+xu31YRuYg61DzdJ+EG1Au10NDFoDqRdnK9sTUPfw=;
        b=gu5JKG5yi/doY7lZWTE2Go+m3li0+jak/AiaAanXeKdr9PsGmqWvJzTUW6eEuSdAXt
         4e8xbUF6d8v0PAXVd8XZMotbhNJtQ+usKw1KhNpiIKxy+JDHULy5I9lXi2PeQWutaNHq
         4M3giA+mCO4tUwh9UvxdoSaMEPLy/Z5ftv/7G1oOb7hD2Q+JxZDW8YFVFozDs1MXrIVs
         RUpHOm1akIpKZToSJizcvQDV4iZg1iDX3qFyrvwiMgD6LicLJA3pxiBM5v+WD2DRtifW
         KuHSBhCzYCcAm9u0pLHyfFCB0EREsqriqYWezsXySejtSZ7Ziv0zx0HmeUjkASVTKTDW
         ZKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hm+xu31YRuYg61DzdJ+EG1Au10NDFoDqRdnK9sTUPfw=;
        b=LVv27r9I685pitSqYzuOwee8UaESqLwUdo5kXTGpPEccpGcyW95km6SH4vIpM2pRvS
         PuvkADBRZat4OPZJ102Pm+0c7c9ZrWQdCqMpTQ5rKM/+JxP5faRYRDKLDH+Ah3WmWSFx
         Z1eDXv3ZG+d6VvAjPMU+jkntOAVYir7RoDLJBOs4wONmHV0HU1bNbos1wtaHbx/LKRi6
         HHTVC6yY0yqqSQRhE4RA9zt5UWxW72na0rKtunuBQV9I7PD7Fzuq4pPhhNPjDqwNsmTJ
         6/YeA13pyA4gxN2QQ5tVWFT6K7yDLChqr2Eagn5YMYk4ktrjrj2AK7spvOrM1U/8gj0W
         Oyqg==
X-Gm-Message-State: AOAM533CQnda6qlIrKAeGSIDTFFXrhOQC0P7P9co8ceEBxoQleaqY9NU
        37+6JHEn7AQpLU+XkROvcAA=
X-Google-Smtp-Source: ABdhPJyq3fgBPGP6rV2rxyDZ2CNUL6a6yAbLjE1a5ZFjAfpqVganmSwJGWtMN3CWWaPUKN0nG+j2qg==
X-Received: by 2002:a17:902:720c:b029:11e:787d:407e with SMTP id ba12-20020a170902720cb029011e787d407emr13272957plb.31.1624187085036;
        Sun, 20 Jun 2021 04:04:45 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id h22sm2644876pfc.21.2021.06.20.04.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jun 2021 04:04:44 -0700 (PDT)
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        emil.l.velikov@gmail.com
Subject: [PATCH v3 0/2] drm: address potential UAF bugs with drm_master ptrs
Date:   Sun, 20 Jun 2021 19:03:25 +0800
Message-Id: <20210620110327.4964-1-desmondcheongzx@gmail.com>
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

Changes in v2 -> v3:
- Patch 1: Move the definition of drm_is_current_master and the _locked version higher up in drm_auth.c to avoid needing a forward declaration of drm_is_current_master_locked. As suggested by Daniel Vetter.

- Patch 2: Instead of leaking drm_device.master_mutex into drm_lease.c to protect drm_master pointers, add a new drm_file_get_master() function that returns drm_file->master while increasing its reference count, to prevent drm_file->master from being freed. As suggested by Daniel Vetter.

Changes in v1 -> v2:
- Patch 2: Move the lock and assignment before the DRM_DEBUG_LEASE in drm_mode_get_lease_ioctl, as suggested by Emil Velikov.

Desmond Cheong Zhi Xi (2):
  drm: add a locked version of drm_is_current_master
  drm: protect drm_master pointers in drm_lease.c

 drivers/gpu/drm/drm_auth.c  | 73 +++++++++++++++++++++++++++----------
 drivers/gpu/drm/drm_lease.c | 57 ++++++++++++++++++++---------
 include/drm/drm_auth.h      |  1 +
 include/drm/drm_file.h      | 15 ++++++--
 4 files changed, 107 insertions(+), 39 deletions(-)

-- 
2.25.1

