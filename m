Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE8F23D84F3
	for <lists+linux-media@lfdr.de>; Wed, 28 Jul 2021 03:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233098AbhG1BCZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 21:02:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233008AbhG1BCY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 21:02:24 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 565ADC061757;
        Tue, 27 Jul 2021 18:02:23 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id e2-20020a17090a4a02b029016f3020d867so1816324pjh.3;
        Tue, 27 Jul 2021 18:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JnNg+LtmUtuMVbhwKpc+TsfLTbQ0CCjgGn2ha7kyTe4=;
        b=jAEhX2vgfmLiBn/ABCM8HM+m6KEW9HsmuvIFt5Nb8Ze0p6OBtUT9v9SWOobzrxOPAJ
         OPVve9cPQNN4lNlgltzg3wrLueqe9WyMCOkCtZ3LTyrMRPrT4mPxqrTFpjB4BrZGFTZz
         W0WTXH2ZtlfGjZnEGUXMjgX3j3c/hvnwS/Cc/uwgWLoSkwM5R0iU1OT9ZxcYgTQJ3ZVw
         gX1jdASZZs5Aza9+J13g7ZbHaqoL7/TARhxbAxwvFzB5mmt9d54oToIZukcX+rTg1k1O
         25WAQ8Gg+3/bggl9+wYGch3j98a1XDMWOs2lvt+wszlrhRXtPoomRki1StVlkV6I6oqG
         nGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JnNg+LtmUtuMVbhwKpc+TsfLTbQ0CCjgGn2ha7kyTe4=;
        b=EXl5Bq3k5BmmlHTHjCYw4Gy5c1sbUJXnTjBK51h2ptxeILSavgrcFkxn95twBehO2A
         5PUmlnOz2MXWE1bhyFYVKgh5eGDHVqWzMMLJHytm4mQ4AlWcfLs4wt/pYN0kBhZ59sEl
         pDJbbPJ4derEsi977bKAdJVx9+VEyCbIAKICGySqjtcXNU4Tm5SoHQEWqYFXeROU5GFc
         /diSlOhRg79Gwhi1qe84dKMaGKmjzs1QTZw6AQlL12tqQ2kxEx9Ui90M2XTbTRcQiwif
         fsCHWqD69AkjETGJhQkek03tWXY3rZ9KONSfUBpTJEkGh4F7BVxveFs6DGKCbZ9l6iZ5
         IBCg==
X-Gm-Message-State: AOAM533vTC65eXG/WkAiltCA3C1QrOOVqJezIx3lFHDgtRKnpa+DrG3C
        owDh+npYlxHhCuf4LiIyWTs=
X-Google-Smtp-Source: ABdhPJwE8048m0W7kGr6PrR8geRv+/5g1CPr5++AujkltYbWKD/aIwJ8tcj6XPlLbxcvsdGz2drG9A==
X-Received: by 2002:a65:5bc6:: with SMTP id o6mr7933192pgr.2.1627434142666;
        Tue, 27 Jul 2021 18:02:22 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id n17sm5405596pgj.93.2021.07.27.18.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 18:02:21 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bernard Zhao <bernard@vivo.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Dave Airlie <airlied@redhat.com>,
        Douglas Anderson <dianders@chromium.org>,
        Emma Anholt <emma@anholt.net>,
        Jonathan Marek <jonathan@marek.ca>,
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
Subject: [PATCH v4 00/13] drm/msm: drm scheduler conversion and cleanups
Date:   Tue, 27 Jul 2021 18:06:05 -0700
Message-Id: <20210728010632.2633470-1-robdclark@gmail.com>
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

v4: One last small tweak, drop unused wait_queue_head_t in
    msm_fence_context

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
 drivers/gpu/drm/msm/msm_fence.c             |  42 ---
 drivers/gpu/drm/msm/msm_fence.h             |   3 -
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
 24 files changed, 516 insertions(+), 391 deletions(-)

-- 
2.31.1

