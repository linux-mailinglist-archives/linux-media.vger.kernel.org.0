Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0DC840050D
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 20:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349762AbhICSpB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 14:45:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349459AbhICSpA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Sep 2021 14:45:00 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB1F5C061575;
        Fri,  3 Sep 2021 11:43:59 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id z24-20020a17090acb1800b0018e87a24300so202405pjt.0;
        Fri, 03 Sep 2021 11:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eL8IPpLjz+u+tW0DpBHxfXxNC5xBjc+5MpXdFfRQCQg=;
        b=YHyxlRJ9KHFtVLZv4e7UMFACH3/qLmF3MpF0+yavqfvhZZzDGyVeTR/t+WlFdbFLVC
         3QW7jEOI/CDuyeA3esWyXvJP6wbd9ZCujymOIbf/XF6gMnCuurkKmftPGnQoo/QdkdBw
         7+jKNY0tho3FGFB1N1pvtoSkAJnpCv4TdiNI+uqGHfR1RlNG4kdAfKwYC8B0dViOyCl2
         Ar/dPOHZSWhYrhZuCBShrTNNBOchp926sNID6dKZnFdeLBMYyuwqmrSKkIhgnGTGphJg
         yg2RpyiUoBKInxJyG92yOLpfpuGT8W7LsV13uy83CL2eRKttBllW6DN3dbbLA3gw5XV0
         D7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eL8IPpLjz+u+tW0DpBHxfXxNC5xBjc+5MpXdFfRQCQg=;
        b=i3rZrGZY3i6eKzdPOjNyEIlTzDdiVaE35Dmfsn2rPqvaK9+YgrWunalzLEbhZ6vxCZ
         fm/gy87PmxFnFyDVN9a5GSR5T50Nf53bvEIao6u/rFuVx6cDLGued2hUcMzxtTQ4V0Pq
         7IbRwf+6GOZXj6Z6yyA9jlg6Wy0RdsX0X5dD+mFBrg6BogIKcyJTzkBfArnuGlhSiQJA
         KtKLdgNNm2UoRmiTU/5QqgaEYTQ6G65s4MMY7UPL25E/L+R91wd3AXZh/ex9fQ09v/IB
         9ZfksupiPwTxBFjSkSrFhZhgiaZqZR7r0bk+XPpOcDPyhAp/eZZqR/GkUwHlHOhyhuKQ
         5XMA==
X-Gm-Message-State: AOAM531HNCjzflh4pafJDu1KEiABVvdiU1NhKi53YoANZiG6StRHisej
        6iAzQbrpixP6OrdL6/YP5JE=
X-Google-Smtp-Source: ABdhPJz303qR3WoSm2Y3+5yldCV+CDvbO1CpVugiOEPTnv5ubkj0mTAp3wQrZViz13f/ianeVmFTfg==
X-Received: by 2002:a17:90a:49cb:: with SMTP id l11mr359711pjm.142.1630694639358;
        Fri, 03 Sep 2021 11:43:59 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id y64sm107777pgy.32.2021.09.03.11.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 11:43:58 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), Gustavo Padovan <gustavo@padovan.org>,
        Jack Zhang <Jack.Zhang1@amd.com>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
        Luben Tuikov <luben.tuikov@amd.com>,
        Melissa Wen <mwen@igalia.com>,
        Steven Price <steven.price@arm.com>,
        Tian Tao <tiantao6@hisilicon.com>
Subject: [PATCH v3 0/9] dma-fence: Deadline awareness
Date:   Fri,  3 Sep 2021 11:47:51 -0700
Message-Id: <20210903184806.1680887-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This series adds deadline awareness to fences, so realtime deadlines
such as vblank can be communicated to the fence signaller for power/
frequency management decisions.

This is partially inspired by a trick i915 does, but implemented
via dma-fence for a couple of reasons:

1) To continue to be able to use the atomic helpers
2) To support cases where display and gpu are different drivers

This iteration adds a dma-fence ioctl to set a deadline (both to
support igt-tests, and compositors which delay decisions about which
client buffer to display), and a sw_sync ioctl to read back the
deadline.  IGT tests utilizing these can be found at:

  https://gitlab.freedesktop.org/robclark/igt-gpu-tools/-/commits/fence-deadline


v1: https://patchwork.freedesktop.org/series/93035/
v2: Move filtering out of later deadlines to fence implementation
    to avoid increasing the size of dma_fence
v3: Add support in fence-array and fence-chain; Add some uabi to
    support igt tests and userspace compositors.

Rob Clark (9):
  dma-fence: Add deadline awareness
  drm/vblank: Add helper to get next vblank time
  drm/atomic-helper: Set fence deadline for vblank
  drm/scheduler: Add fence deadline support
  drm/msm: Add deadline based boost support
  dma-buf/fence-array: Add fence deadline support
  dma-buf/fence-chain: Add fence deadline support
  dma-buf/sync_file: Add SET_DEADLINE ioctl
  dma-buf/sw_sync: Add fence deadline support

 drivers/dma-buf/dma-fence-array.c       | 11 ++++
 drivers/dma-buf/dma-fence-chain.c       | 13 +++++
 drivers/dma-buf/dma-fence.c             | 20 +++++++
 drivers/dma-buf/sw_sync.c               | 58 +++++++++++++++++++
 drivers/dma-buf/sync_debug.h            |  2 +
 drivers/dma-buf/sync_file.c             | 19 +++++++
 drivers/gpu/drm/drm_atomic_helper.c     | 36 ++++++++++++
 drivers/gpu/drm/drm_vblank.c            | 32 +++++++++++
 drivers/gpu/drm/msm/msm_fence.c         | 76 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_fence.h         | 20 +++++++
 drivers/gpu/drm/msm/msm_gpu.h           |  1 +
 drivers/gpu/drm/msm/msm_gpu_devfreq.c   | 20 +++++++
 drivers/gpu/drm/scheduler/sched_fence.c | 34 +++++++++++
 drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
 include/drm/drm_vblank.h                |  1 +
 include/drm/gpu_scheduler.h             |  8 +++
 include/linux/dma-fence.h               | 16 ++++++
 include/uapi/linux/sync_file.h          | 20 +++++++
 18 files changed, 388 insertions(+), 1 deletion(-)

-- 
2.31.1

