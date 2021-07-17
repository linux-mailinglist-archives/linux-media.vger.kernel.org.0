Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 144AD3CC60C
	for <lists+linux-media@lfdr.de>; Sat, 17 Jul 2021 22:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235379AbhGQU2P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Jul 2021 16:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235163AbhGQU2O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Jul 2021 16:28:14 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD367C061762;
        Sat, 17 Jul 2021 13:25:16 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id o3-20020a17090a6783b0290173ce472b8aso11434281pjj.2;
        Sat, 17 Jul 2021 13:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uC3Kt3XtLnkno2+Qm5TSlObC0vd0oMsVm4usUcZZhE0=;
        b=kdjwuhk9YHdADF8pebGkgWK2xYLOLwAmyNlOhdwY2UzzbqpPv320mGwes4Cy3ZTWym
         yo+kAiJdXbh/6oczbYBiWg4gXbnAS7ua7v7SVBE2PCPnVQPL2mUl14p1pGL7yByo39Md
         NTxWAx/9e4uXk9/qRWkH6cFk3QlvHa/xi0Vmuy5ZtucfZJTNWWcyPg9JvdrBeKNeSHIu
         ol8qeZ0DGyf1NMwTTNq1aWLRuLCrWcrz+I2Cpm5GYLtM5vc9TQbVMEGzCsVxEc5xHByG
         jxCmoN3m4UH/R6mMPEZHfWloLt0M8bZPjO7+kY8jg1mRgi6vk9rv5rIM9rK/BQV8yLXx
         eX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uC3Kt3XtLnkno2+Qm5TSlObC0vd0oMsVm4usUcZZhE0=;
        b=FNgESKgzFQAsfSTyzzMD6iI0X5+5b6YMk6amaeXsqT8l0Y3y6rVIQKG+gTyaa4cnm6
         2OAYOqXOyXid7USOgAIcEObmzg6pbhz67Idavbegz7+pHIz7nkaZLMiwzMff2lOUwYFJ
         SjXJje1GtZTA/I5SsY9xN0y3uyyz25PqoZ/tq+7ffZ9x+9ibYb35aq69nE2eZFNmZhFw
         P3Fn2Vim25hWwjgZnY5T5YPbLcPpQqluRGWrNAvOPfJ3We4m0HYxo/gDjYOByePkxOiB
         ESoRA4gMTUBPJGz6CdAAQGpExYJH8CJ2DuyiT4Z+LAuNrX1brHcuni8vH/xb5lUpsRmS
         M3ow==
X-Gm-Message-State: AOAM53381S++wJyiYg5PbQrGX9kAIytJJOuv3pCboXk9sgP/GhS0q2HC
        Eh6h3M6dLh5uDiekeB1HsIY=
X-Google-Smtp-Source: ABdhPJyVmyK0XM4kAPFQungzUnAW5TQP0BSouG+anpFQuhH4Hl65L4sSzUHwZd2jk8FfBb/SIFVN4g==
X-Received: by 2002:a17:90a:a898:: with SMTP id h24mr22117356pjq.208.1626553516038;
        Sat, 17 Jul 2021 13:25:16 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id i1sm15533365pjs.31.2021.07.17.13.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 13:25:14 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bernard Zhao <bernard@vivo.com>,
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
Subject: [PATCH 00/11] drm/msm: drm scheduler conversion and cleanups
Date:   Sat, 17 Jul 2021 13:29:02 -0700
Message-Id: <20210717202924.987514-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Conversion to gpu_scheduler, and bonus removal of
drm_gem_object_put_locked()

Rob Clark (11):
  drm/msm: Docs and misc cleanup
  drm/msm: Small submitqueue creation cleanup
  drm/msm: drop drm_gem_object_put_locked()
  drm: Drop drm_gem_object_put_locked()
  drm/msm/submit: Simplify out-fence-fd handling
  drm/msm: Consolidate submit bo state
  drm/msm: Track "seqno" fences by idr
  drm/msm: Return ERR_PTR() from submit_create()
  drm/msm: Conversion to drm scheduler
  drm/msm: Drop struct_mutex in submit path
  drm/msm: Utilize gpu scheduler priorities

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
 drivers/gpu/drm/msm/msm_gem.c               |  91 +-----
 drivers/gpu/drm/msm/msm_gem.h               |  37 ++-
 drivers/gpu/drm/msm/msm_gem_submit.c        | 300 ++++++++++++--------
 drivers/gpu/drm/msm/msm_gpu.c               |  50 +---
 drivers/gpu/drm/msm/msm_gpu.h               |  41 ++-
 drivers/gpu/drm/msm/msm_ringbuffer.c        |  70 ++++-
 drivers/gpu/drm/msm/msm_ringbuffer.h        |  12 +
 drivers/gpu/drm/msm/msm_submitqueue.c       |  49 +++-
 include/drm/drm_gem.h                       |   2 -
 include/uapi/drm/msm_drm.h                  |  10 +-
 23 files changed, 440 insertions(+), 359 deletions(-)

-- 
2.31.1

