Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12E583622BA
	for <lists+linux-media@lfdr.de>; Fri, 16 Apr 2021 16:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243051AbhDPOiC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 10:38:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235733AbhDPOh5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 10:37:57 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75969C061761
        for <linux-media@vger.kernel.org>; Fri, 16 Apr 2021 07:37:31 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id r12so42509217ejr.5
        for <linux-media@vger.kernel.org>; Fri, 16 Apr 2021 07:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8GxxDkNQ8xWrJkT9ns8670579onh7Bw+Uvw6ps3Hfzw=;
        b=sYu24cfTNp3Sk4VoVSTiZqobXGS3o/nl0S6CM7UMymRzJySbfpZpwBn4yOUMeZDO5R
         TTPZysgH5JwH4gWicDVlSJXvfnJhRa6vSH8N7qnf2cLql+HX6P9eGY8yH05SiJkTTapB
         cUsa5jSFYsua/vA/qRY+5BCk+jpyp7Bx/plX0fwM/Yavv33fVDc+ZKkJOUdehjEothHN
         fYbTCXiVvAYkcPlpsALfnFYCAiNnI8LYEyvQX9anXk0VAaVTV2QN40epzPGkkFu/3j8C
         E7/HouOKLSTw9DWGjH+xF6aSIabcOm+GI/p5GAe1cQxOpvsMQ853+b+kmUjjRUkihTWz
         a5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8GxxDkNQ8xWrJkT9ns8670579onh7Bw+Uvw6ps3Hfzw=;
        b=T5lDmZpzBEXQYoz4xtki5hSTGL09Ulx+QWLkjg3D92/uHotfREWtgXUJ+W1xDyHROO
         FZhrDcyQLglcbHSvufKNbQgtr1dYGjVl+zzlSZfZjCdFOWx4RTCuR02ceptVDy58OT/A
         WkRWYzCNqIi/dc7lrqLPFyi8IX4LVejlj2qLJjkfmtFDWbXNYo0bRJ9/Fntkdb88mrU6
         PJnMyse5ArXOHW/y2yRqtXJ7ByK47T4AKYwu2qZ6MrXaSHWfh/SMaf/VMOWukp5TbmrZ
         p0OPJlVoHbHyiN5kv1JftcbtF5JpJ2s1+0IjglCss3/8DKiKbL0KDwKoA/YWADdmvqkk
         erpA==
X-Gm-Message-State: AOAM5322qooDwrttjuJgWy28v2Q911nHWeuzHUt9iQcf5C5z2700bzTJ
        KwAgmebbqCSBzFoUpLNEzI3UOQ==
X-Google-Smtp-Source: ABdhPJz9kIi33dwSJ44VTeiCQHZMhDXP4sc0J7Kiq4t3coxWZ1m1x67Zk7mnLNXlBKhO87ldnTNptw==
X-Received: by 2002:a17:906:1dd3:: with SMTP id v19mr8633955ejh.4.1618583849970;
        Fri, 16 Apr 2021 07:37:29 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 07:37:29 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Adam Jackson <ajax@redhat.com>,
        Ajay Kumar <ajaykumar.rs@samsung.com>,
        Akshu Agarwal <akshua@gmail.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Ben Skeggs <bskeggs@redhat.com>,
        Ben Widawsky <ben@bwidawsk.net>,
        Christian Koenig <christian.koenig@amd.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
        freedreno@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Inki Dae <inki.dae@samsung.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jeremy Kolb <jkolb@brandeis.edu>,
        Jerome Glisse <glisse@freedesktop.org>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linaro-mm-sig@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Nirmoy Das <nirmoy.das@amd.com>, nouveau@lists.freedesktop.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <rob.clark@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tomi Valkeinen <tomba@kernel.org>,
        Vincent Abriou <vincent.abriou@st.com>
Subject: [PATCH 00/40] [Set 16] Rid W=1 warnings from GPU!
Date:   Fri, 16 Apr 2021 15:36:45 +0100
Message-Id: <20210416143725.2769053-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

Lee Jones (40):
  drm/nouveau/nvkm/subdev/bios/init: Demote obvious abuse of kernel-doc
  drm/nouveau/dispnv50/disp: Remove unused variable 'ret'
  drm/msm/dp/dp_display: Remove unused variable 'hpd'
  include: drm: drm_atomic: Make use of 'new_plane_state'
  drm/nouveau/nvkm/subdev/volt/gk20a: Demote non-conformant kernel-doc
    headers
  drm/nouveau/nvkm/engine/gr/gf100: Demote non-conformant kernel-doc
    header
  drm/nouveau/nouveau_bo: Remove unused variables 'dev'
  drm/nouveau/nouveau_display: Remove set but unused variable 'width'
  drm/nouveau/dispnv04/crtc: Demote non-conforming kernel-doc headers
  drm/nouveau/dispnv50/disp: Remove unused variable 'ret' from function
    returning void
  drm/nouveau/dispnv50/headc57d: Make local function 'headc57d_olut'
    static
  drm/nouveau/nv50_display: Remove superfluous prototype for local
    static functions
  drm/nouveau/dispnv50/disp: Include header containing our prototypes
  drm/nouveau/nouveau_ioc32: File headers are not good candidates for
    kernel-doc
  drm/nouveau/nouveau_svm: Remove unused variable 'ret' from void
    function
  drm/nouveau/nouveau_ioc32: Demote kernel-doc abuse to standard comment
    block
  gpu: host1x: bus: Remove superfluous param description 'key'
  drm/omapdrm/omap_irq: Fix a couple of incorrectly documented functions
  drm/omapdrm/omap_gem: Properly document omap_gem_dumb_map_offset()
  drm/xlnx/zynqmp_disp: Fix incorrectly documented enum 'zynqmp_disp_id'
  drm/xlnx/zynqmp_dp: Fix a little potential doc-rot
  drm/ttm/ttm_tt: Demote non-conformant kernel-doc header
  drm/ttm/ttm_bo: Fix incorrectly documented function
    'ttm_bo_cleanup_refs'
  drm/scheduler/sched_entity: Fix some function name disparity
  drm/radeon/radeon_device: Provide function name in kernel-doc header
  drm/amd/amdgpu/amdgpu_device: Remove unused variable 'r'
  drm/ttm/ttm_device: Demote kernel-doc abuses
  drm/panel/panel-raspberrypi-touchscreen: Demote kernel-doc abuse
  drm/amd/amdgpu/amdgpu_fence: Provide description for 'sched_score'
  drm/vgem/vgem_drv: Demote kernel-doc abuse
  drm/amd/amdgpu/amdgpu_gart: Correct a couple of function names in the
    docs
  drm/amd/amdgpu/amdgpu_ttm: Fix incorrectly documented function
    'amdgpu_ttm_copy_mem_to_mem()'
  drm/amd/amdgpu/amdgpu_ring: Provide description for 'sched_score'
  drm/exynos/exynos_drm_fimd: Realign function name with its header
  drm/amd/amdgpu/amdgpu_cs: Repair some function naming disparity
  drm/exynos/exynos7_drm_decon: Realign function name with its header
  drm/panel/panel-sitronix-st7701: Demote kernel-doc format abuse
  drm/exynos/exynos_drm_ipp: Fix some function name disparity issues
  drm/sti/sti_hdmi: Provide kernel-doc headers with function names
  drm/mediatek/mtk_disp_ccorr: Demote less than half-populated struct
    header

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c      |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c      |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   2 +-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_ipp.c       |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c     |   2 +-
 drivers/gpu/drm/msm/dp/dp_display.c           |   3 -
 drivers/gpu/drm/nouveau/dispnv04/crtc.c       |   4 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  10 +-
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c   |   2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c          |   4 -
 drivers/gpu/drm/nouveau/nouveau_display.c     |   8 +-
 drivers/gpu/drm/nouveau/nouveau_ioc32.c       |   4 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c         |   5 +-
 drivers/gpu/drm/nouveau/nv50_display.h        |   3 -
 .../gpu/drm/nouveau/nvkm/engine/gr/gf100.c    |   2 +-
 .../gpu/drm/nouveau/nvkm/subdev/bios/init.c   | 204 ++++++------------
 .../gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c  |   4 +-
 drivers/gpu/drm/omapdrm/omap_gem.c            |   2 +-
 drivers/gpu/drm/omapdrm/omap_irq.c            |   4 +-
 .../drm/panel/panel-raspberrypi-touchscreen.c |   2 +-
 drivers/gpu/drm/panel/panel-sitronix-st7701.c |   2 +-
 drivers/gpu/drm/radeon/radeon_device.c        |   3 +-
 drivers/gpu/drm/scheduler/sched_entity.c      |   6 +-
 drivers/gpu/drm/sti/sti_hdmi.c                |  18 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  |   2 +-
 drivers/gpu/drm/ttm/ttm_device.c              |   4 +-
 drivers/gpu/drm/ttm/ttm_tt.c                  |   2 +-
 drivers/gpu/drm/vgem/vgem_drv.c               |   2 +-
 drivers/gpu/drm/xlnx/zynqmp_disp.c            |   2 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c              |   2 +-
 drivers/gpu/host1x/bus.c                      |   1 -
 include/drm/drm_atomic.h                      |   3 +-
 37 files changed, 130 insertions(+), 207 deletions(-)

Cc: Adam Jackson <ajax@redhat.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: Akshu Agarwal <akshua@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Ben Widawsky <ben@bwidawsk.net>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Cc: Eric Anholt <eric@anholt.net>
Cc: freedreno@lists.freedesktop.org
Cc: Huang Rui <ray.huang@amd.com>
Cc: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jeremy Kolb <jkolb@brandeis.edu>
Cc: Jerome Glisse <glisse@freedesktop.org>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-media@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: Lyude Paul <lyude@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Nirmoy Das <nirmoy.das@amd.com>
Cc: nouveau@lists.freedesktop.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Clark <rob.clark@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomba@kernel.org>
Cc: Vincent Abriou <vincent.abriou@st.com>
-- 
2.27.0

