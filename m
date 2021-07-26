Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A461E3D6A3A
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 01:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233707AbhGZWyT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 18:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233380AbhGZWyS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 18:54:18 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FC5CC061757;
        Mon, 26 Jul 2021 16:34:45 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id k4-20020a17090a5144b02901731c776526so1347152pjm.4;
        Mon, 26 Jul 2021 16:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oJHcf2A+v4Xg1Z8UjOIkujJQfUCL6EomQD60/Cu1nbQ=;
        b=gyFbRvsBvc3GB64q5FVHckiBc7Bagj0Tn576aP7P1xv3GzUUQkBWJlEisCbs9U1dPd
         Tk9UniFqVFVZWkkYVe1Q1ZOH/y1b0ES64cKz3YE9cpvrUvfXin7PGX5SgM/fSQmgbPjk
         IHkil3GlN09mZixx++iR0YhCsRfzIPUMLFQCMFak/xuSx+i9Wlv4yBlf/FsDIzTJQRFr
         IWRf/VAat9oNJUSf+dFtyQmcsNSIvOeN51hisgAPe/GHMdkIr6qjXRXcB4eg+5segHnv
         PsndZ2Np2QQf2USln8vIOGRHB9j7rj5TsrwX+/cjAu2Pbo8lWTKf/n3p4hHL0MYG7FFd
         vzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oJHcf2A+v4Xg1Z8UjOIkujJQfUCL6EomQD60/Cu1nbQ=;
        b=cNvhE2cqsg80k5UuLdK/laf2MK47yFoytkjtA0E82u9JibELi8J+wf4WI9w1tGcMnw
         rtLLBh3H1v891hxlN+P9J+hc/iTPsjPtoyIoiMxoIwQ090N7xcACT/EHkpqkXxSBDRz5
         35ZXV9AzxsnhDtkpKFc2q6JB/1IURlbge4PiEY6PCp267tXIkZV2aGezWLvn6hTQz3Sy
         YzqLaP8xKguGQYmmdSXgiC9mVycRd6Bm9puJi6Ag22A17J15byXqWGjOShxETin6pXrW
         ET4L0boUOblGMca4Xe46j4K3BXwasZ9XTMvp3iau7j9Ru4BB4zrzHaQ1fp4+8CAd+C5N
         vFOw==
X-Gm-Message-State: AOAM533HhpSYsEAWbZB7ja5ugUMl/lce0flrHoRoMAx+SGQldi/HI7Ne
        zn8p9VXNou73jMYInhVeaL4=
X-Google-Smtp-Source: ABdhPJwO0Aa1CWuY70s13U0aOFFS10F4rpeB45ZWiWi99YiT1whKcfqq/2IVyEdw1gBu5ZuBadW9yQ==
X-Received: by 2002:a63:b953:: with SMTP id v19mr20385890pgo.40.1627342484886;
        Mon, 26 Jul 2021 16:34:44 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id k11sm1000201pgg.25.2021.07.26.16.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 16:34:43 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Matthew Brost <matthew.brost@intel.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Gustavo Padovan <gustavo@padovan.org>,
        Jack Zhang <Jack.Zhang1@amd.com>,
        Lee Jones <lee.jones@linaro.org>,
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK), linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
        Luben Tuikov <luben.tuikov@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Roy Sun <Roy.Sun@amd.com>, Tian Tao <tiantao6@hisilicon.com>
Subject: [RFC 0/4] dma-fence: Deadline awareness
Date:   Mon, 26 Jul 2021 16:38:47 -0700
Message-Id: <20210726233854.2453899-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Based on discussion from a previous series[1] to add a "boost" mechanism
when, for example, vblank deadlines are missed.  Instead of a boost
callback, this approach adds a way to set a deadline on the fence, by
which the waiter would like to see the fence signalled.

I've not yet had a chance to re-work the drm/msm part of this, but
wanted to send this out as an RFC in case I don't have a chance to
finish the drm/msm part this week.

Original description:

In some cases, like double-buffered rendering, missing vblanks can
trick the GPU into running at a lower frequence, when really we
want to be running at a higher frequency to not miss the vblanks
in the first place.

This is partially inspired by a trick i915 does, but implemented
via dma-fence for a couple of reasons:

1) To continue to be able to use the atomic helpers
2) To support cases where display and gpu are different drivers

[1] https://patchwork.freedesktop.org/series/90331/

Rob Clark (4):
  dma-fence: Add deadline awareness
  drm/vblank: Add helper to get next vblank time
  drm/atomic-helper: Set fence deadline for vblank
  drm/scheduler: Add fence deadline support

 drivers/dma-buf/dma-fence.c             | 39 +++++++++++++++++++++++++
 drivers/gpu/drm/drm_atomic_helper.c     | 36 +++++++++++++++++++++++
 drivers/gpu/drm/drm_vblank.c            | 31 ++++++++++++++++++++
 drivers/gpu/drm/scheduler/sched_fence.c | 10 +++++++
 drivers/gpu/drm/scheduler/sched_main.c  |  3 ++
 include/drm/drm_vblank.h                |  1 +
 include/linux/dma-fence.h               | 17 +++++++++++
 7 files changed, 137 insertions(+)

-- 
2.31.1

