Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92EDA3D7B9A
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 19:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbhG0RHb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 13:07:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbhG0RHb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 13:07:31 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15179C061757;
        Tue, 27 Jul 2021 10:07:30 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id o44-20020a17090a0a2fb0290176ca3e5a2fso5766295pjo.1;
        Tue, 27 Jul 2021 10:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ye2Guv3cXyOW7ZfoRGmuIBwYadeC5LeAizWaptWnxQU=;
        b=Z1bSFDe3kgYH5p2nFBUDVWm77dAOEJGPWxkCUql96WLMiFEoYeBTKvFTbx/umcJQU5
         UbINaTymOqgZdwPpsTOurZuohAYKULs2ULtg9XWzObURUMHo1I0xrnuLDy3acuK9r0sg
         qD3rcO2in+sgej6DPxdZ8dSJerd4ChdqW/U2abBjqcFkhDPwiUWu9QUs9YXxoDea2BVK
         kNB21wWs7MkY2YMHQYPe/+hQO5+l3TNYqhzbaQWFoXcyOXKu4WmYQYJ+ksix/Rj6riTE
         ELskoNf+c3o/W4UZSDxE0kpixzXSE7nxse8OR5lyWg4p+JKqG5vHnDW01/Av7JappEZV
         xPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ye2Guv3cXyOW7ZfoRGmuIBwYadeC5LeAizWaptWnxQU=;
        b=JBLX/rgBApbQhZmfasASUtLqPuf2flYpzraWU6ZGFR+/oLoJo8wRdidn/3lDUXdVQs
         B5amdvux0VcA0OCdBuLikx1v9b763G3xVF5nxB6zElal1FxKAfCwuwjxMh5nV4tQxXh9
         5WAAAGmBvwSt1B1TQzi60WiVwucJeg+gYWe6Bi3MQ4l0n8LFImz8NPk6zbOLi0w+N2Jc
         2F40qhS4pXOsdoSAkZmb8vYBhEdGIJqQBCXaS6S8K6f0/qRzdxAc4HW35tMwv9lQYoJL
         QJHFFLZnjT/EGku/gkJFD8vxKyy6S0CxV+1BOCelokvixysqNWbOJnK+Aq5yanVaCK7F
         BzcQ==
X-Gm-Message-State: AOAM531cXkLrbF8+YpdRDw9WwoaEMKKVezvFOkUM1xGtETtoaFEJvFkd
        /Y1olboqPhso/TMDiiNlTsc=
X-Google-Smtp-Source: ABdhPJxAcX4DxFLgF/ksbBt+WjNMVAoKTXfaxSyzS6VCyHl7EdFbMun2/NlE3Fjd2qIVHa8LYP+jsA==
X-Received: by 2002:a17:90b:1109:: with SMTP id gi9mr5141879pjb.61.1627405649496;
        Tue, 27 Jul 2021 10:07:29 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id z6sm4677930pgs.4.2021.07.27.10.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 10:07:28 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bernard Zhao <bernard@vivo.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Douglas Anderson <dianders@chromium.org>,
        Eric Anholt <eric@anholt.net>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        Lee Jones <lee.jones@linaro.org>,
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK),
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Zhenzhong Duan <zhenzhong.duan@gmail.com>
Subject: [PATCH v3 00/13] drm/msm: drm scheduler conversion and cleanups
Date:   Tue, 27 Jul 2021 10:11:16 -0700
Message-Id: <20210727171143.2549475-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Conversion to gpu_scheduler, and bonus removal of
drm_gem_object_put_locked()

v2: Fix priority mixup (msm UAPI has lower numeric priority value as
    higher priority, inverse of drm/scheduler) and add some comments
    in the UAPI header to clarify.

    Now that we move active refcnt get into msm_gem_submit, add a
    patch to mark all bos busy before pinning, to avoid evicting bos
    used in same batch.

    Fix bo locking for cmdstream dumping ($debugfs/n/{rd,hangrd})

v3: Add a patch to drop submit bo_list and instead use -EALREADY
    to detect errors with same obj appearing multiple times in the
    submit ioctl bos table.  Otherwise, with struct_mutex locking
    dropped, we'd need to move insertion into and removal from
    bo_list under the obj lock.

Rob Clark (13):
  drm/msm: Docs and misc cleanup
  drm/msm: Small submitqueue creation cleanup
  drm/msm: drop drm_gem_object_put_locked()
  drm: Drop drm_gem_object_put_locked()
  drm/msm/submit: Simplify out-fence-fd handling
  drm/msm: Consolidate submit bo state
  drm/msm: Track "seqno" fences by idr
  drm/msm: Return ERR_PTR() from submit_create()
  drm/msm: Conversion to drm scheduler
  drm/msm: Drop submit bo_list
  drm/msm: Drop struct_mutex in submit path
  drm/msm: Utilize gpu scheduler priorities
  drm/msm/gem: Mark active before pinning

 drivers/gpu/drm/drm_gem.c                   |  22 --
 drivers/gpu/drm/msm/Kconfig                 |   1 +
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c   |   4 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |   6 +-
 drivers/gpu/drm/msm/adreno/a5xx_power.c     |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |   7 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  12 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |   4 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   6 +-
 drivers/gpu/drm/msm/msm_drv.c               |  30 +-
 drivers/gpu/drm/msm/msm_fence.c             |  39 ---
 drivers/gpu/drm/msm/msm_fence.h             |   2 -
 drivers/gpu/drm/msm/msm_gem.c               |  94 +-----
 drivers/gpu/drm/msm/msm_gem.h               |  47 +--
 drivers/gpu/drm/msm/msm_gem_submit.c        | 344 ++++++++++++--------
 drivers/gpu/drm/msm/msm_gpu.c               |  46 +--
 drivers/gpu/drm/msm/msm_gpu.h               |  78 ++++-
 drivers/gpu/drm/msm/msm_rd.c                |   6 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c        |  70 +++-
 drivers/gpu/drm/msm/msm_ringbuffer.h        |  12 +
 drivers/gpu/drm/msm/msm_submitqueue.c       |  53 ++-
 include/drm/drm_gem.h                       |   2 -
 include/uapi/drm/msm_drm.h                  |  14 +-
 24 files changed, 516 insertions(+), 387 deletions(-)

-- 
2.31.1

