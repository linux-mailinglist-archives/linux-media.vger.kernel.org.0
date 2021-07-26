Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFB3C3D5C42
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 16:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234808AbhGZOP6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 10:15:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234389AbhGZOP6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 10:15:58 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8BA6C061757;
        Mon, 26 Jul 2021 07:56:25 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id ca5so856422pjb.5;
        Mon, 26 Jul 2021 07:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4kiMiLKKdf74B8SbPL3dRDmnPHR8lzRMp7RHSQmrGNw=;
        b=jI1j/NgDo5hs4g+F/KPwBAM+MOzWrSm17BUPFpmgS+r7lkXmGUXQyhqz+hNF7GRKNx
         YYdlgQ9QLIfqyzRXe3rC5M4gstvciuqgcrV255x0Vxqhw7eL5DloVQhMdzEUbUS0j5hy
         qJOEGjd7GJ8RWFVPOyIRnu7H96draFn/HNd/c+M2AqULKQLshZ17TLnXoPmqxn2bN6AV
         u6ORrEl3fyvVFrZx3ZkKJxZhaU29xzgJVNObiE/bAsFPXX84rwqeTQiIUzveLeotHELk
         XJnGUQTodmB3X2vAoLHL/gEW0aLo/m0ovZFT8XxhChsFH59k+DitsaHWPt04F84Tr63U
         eB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4kiMiLKKdf74B8SbPL3dRDmnPHR8lzRMp7RHSQmrGNw=;
        b=XKJmd5tyQyHK84RlyJ63kUJYHXCF8jGmBheIPISIEwpJu/I2O8ct5yECQWdjjyzd7G
         /WdC/EcE4LHIfPsbHsh8JQe6rOFi2Bhrmgmb8rHUKFyNcIy58RCHXRQPqodvIyZbzS33
         Y7ZXIL+2JOlnRsjzyOilCSMtLU8nUPNFoG6BtfOLYmBizRRYDZj95Tb0cj91u0hqIFDt
         ZzpAL+//Won+YGpUPztb2/OGOiQsUXCQjmRmULiWWzovgEDvfhv32hOvoFyQLSltRaM4
         zmYQOVB0jp1Y1Og1tp49NaHhYEMvCw+o5D1Y8E66dfXEq906ffMMsC535z7Ug2Hv+IsZ
         rEbg==
X-Gm-Message-State: AOAM530BSiYubhoIF3MX/8MtsOuV2SKDGCz91BdNofkNwZO57Ke6LOSK
        DXbBVbMvooS9XS1wDYHLWJo=
X-Google-Smtp-Source: ABdhPJxCzSPaN6g5q60cPg019AFRxemj39UE/GdRQyt7U07FdFkZJldm6g5LHorArCTP21RfR8lbHw==
X-Received: by 2002:a17:902:a710:b029:12b:9b9f:c461 with SMTP id w16-20020a170902a710b029012b9b9fc461mr14548619plq.59.1627311385190;
        Mon, 26 Jul 2021 07:56:25 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id x6sm3034152pjk.24.2021.07.26.07.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 07:56:24 -0700 (PDT)
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
        Emma Anholt <emma@anholt.net>,
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
Subject: [PATCH v2 00/12] drm/msm: drm scheduler conversion and cleanups
Date:   Mon, 26 Jul 2021 08:00:14 -0700
Message-Id: <20210726150038.2187631-1-robdclark@gmail.com>
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

Rob Clark (12):
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
 drivers/gpu/drm/msm/msm_gem.c               |  93 +-----
 drivers/gpu/drm/msm/msm_gem.h               |  39 ++-
 drivers/gpu/drm/msm/msm_gem_submit.c        | 316 ++++++++++++--------
 drivers/gpu/drm/msm/msm_gpu.c               |  46 +--
 drivers/gpu/drm/msm/msm_gpu.h               |  78 ++++-
 drivers/gpu/drm/msm/msm_rd.c                |   6 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c        |  70 ++++-
 drivers/gpu/drm/msm/msm_ringbuffer.h        |  12 +
 drivers/gpu/drm/msm/msm_submitqueue.c       |  53 +++-
 include/drm/drm_gem.h                       |   2 -
 include/uapi/drm/msm_drm.h                  |  14 +-
 24 files changed, 503 insertions(+), 363 deletions(-)

-- 
2.31.1

