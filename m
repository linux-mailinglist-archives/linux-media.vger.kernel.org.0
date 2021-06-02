Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82274398D10
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 16:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbhFBOgM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 10:36:12 -0400
Received: from mail-wm1-f52.google.com ([209.85.128.52]:37747 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231693AbhFBOgH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Jun 2021 10:36:07 -0400
Received: by mail-wm1-f52.google.com with SMTP id t16-20020a05600c1990b02901a0d45ff03aso372258wmq.2
        for <linux-media@vger.kernel.org>; Wed, 02 Jun 2021 07:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hexu7cKSeKzuwDGfSYjJ5Naq4syeodeMqWoX460WR6c=;
        b=YnUg9R7FAfDth6b0+i7LnprXoGOHmxfpsGVrwM1uR4qc3ylGDcN2fMm7g5Cw2B/cIW
         j30w+lYL/AREtK2OKb6Mpkh+UhMcDOqEW8PseOYarGU/zP/skxG0FKrFJ0rR1Zs6txh8
         5+8n+muAZdpofmyn1MIYZF5LmLJvIhct3uXEcUaKJfZq0a6R+yt4uSJuh8vvcT+wLdbZ
         GmfEoZH5U46rZrJkBqJWpH87XABFe/4GcwKakQj6Sjpv/7rIFKu+YxANUoRR6Jxmo3RT
         kUj/s0mLMiLiZ+uLUu1nFREt38x9aoB2pic1i2duhXYWl2LDDriXoDDCyZGQ/7coEEoi
         NO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hexu7cKSeKzuwDGfSYjJ5Naq4syeodeMqWoX460WR6c=;
        b=qzKwSyy6XvVLMyj8VUvZMulmL3Vg0vPlbx4Dl69dlE8HR7N1AlaRrJcaUrcMd6bYCG
         qzf4gVXNh1u0A0hY9HiAKt7GOe14auYcPjxQ592n4d3hYL5W97sSso20p0sAfM04ptKa
         yFSGtFL1HfeBs/UCzvgnDds9Mi2e3CGh0YEgunzx4ODw2fgXMt6FTyPIKu70zyorSk0F
         ACkqX5gSojCUGBRt4hC7ktIVRBNWd+C44+GQ6glEVXsBi0BzR3D2uMp7NwLbQBkLtF5f
         C+CtOhs1yrkZzRAkBLLFdXqwIpo6di9nsRoyRirVgV1g8d6B2Xy0GEU2FM/dxGJAxkNZ
         jDnA==
X-Gm-Message-State: AOAM531xfNxLL3UgH5Ghdy3CvD8Z5Upvl2bPxiVtSwZwKXlsd+gPEfba
        pRcwoBUIMwaAJPGdKOWTxvmAqg==
X-Google-Smtp-Source: ABdhPJwH8/eJTRs27ADnedTTW55aDfi99/T9FH9EumVjgB06SEnGQcD9JLwfnOw2xFcXpsN5fAwH9w==
X-Received: by 2002:a05:600c:2cd2:: with SMTP id l18mr31968202wmc.142.1622644389928;
        Wed, 02 Jun 2021 07:33:09 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
        by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 07:33:09 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Adam Jackson <ajax@redhat.com>,
        Ajay Kumar <ajaykumar.rs@samsung.com>,
        Akshu Agarwal <akshua@gmail.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Alistair Popple <apopple@nvidia.com>,
        amd-gfx@lists.freedesktop.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Ben Skeggs <bskeggs@redhat.com>,
        Ben Widawsky <ben@bwidawsk.net>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Christian Koenig <christian.koenig@amd.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
        Fabien Dessenne <fabien.dessenne@st.com>,
        freedreno@lists.freedesktop.org,
        Hans de Goede <hdegoede@redhat.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Huang Rui <ray.huang@amd.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Inki Dae <inki.dae@samsung.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Leo Li <sunpeng.li@amd.com>, linaro-mm-sig@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Rossi <issor.oruam@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        nouveau@lists.freedesktop.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <robdclark@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Vincent Abriou <vincent.abriou@st.com>
Subject: [RESEND 00/26] Rid W=1 warnings from GPU
Date:   Wed,  2 Jun 2021 15:32:34 +0100
Message-Id: <20210602143300.2330146-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some off these patches have been knocking around for a while.

Who will hoover them up please?

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

Lee Jones (26):
  drm/mediatek/mtk_disp_color: Strip incorrect doc and demote header
  drm/mediatek/mtk_disp_gamma: Strip and demote non-conformant
    kernel-doc header
  drm/mediatek/mtk_disp_ovl: Strip and demote non-conformant header
  drm/mediatek/mtk_disp_rdma: Strip and demote non-conformant kernel-doc
    header
  drm/sti/sti_hdmi_tx3g4c28phy: Provide function names for kernel-doc
    headers
  drm/sti/sti_hda: Provide missing function names
  drm/sti/sti_tvout: Provide a bunch of missing function names
  drm/sti/sti_hqvdp: Fix incorrectly named function 'sti_hqvdp_vtg_cb()'
  drm/msm/disp/dpu1/dpu_encoder_phys_cmd: Remove unused variable
    'cmd_enc'
  drm/msm/disp/dpu1/dpu_hw_interrupts: Demote a bunch of kernel-doc
    abuses
  drm/msm/disp/dpu1/dpu_plane: Fix a couple of naming issues
  drm/msm/msm_gem: Demote kernel-doc abuses
  drm/msm/dp/dp_catalog: Correctly document param 'dp_catalog'
  drm/msm/dp/dp_link: Fix some potential doc-rot
  drm/nouveau/nvkm/subdev/mc/tu102: Make functions called by reference
    static
  drm/amd/display/dc/dce/dce_transform: Remove superfluous
    re-initialisation of DCFE_MEM_LIGHT_SLEEP_CNTL,
  drm/xlnx/zynqmp_disp: Fix incorrectly named enum
    'zynqmp_disp_layer_id'
  drm/xlnx/zynqmp_dp: Fix incorrectly name function 'zynqmp_dp_train()'
  drm/ttm/ttm_tt: Demote non-conformant kernel-doc header
  drm/panel/panel-raspberrypi-touchscreen: Demote kernel-doc abuse
  drm/panel/panel-sitronix-st7701: Demote kernel-doc abuse
  drm/vgem/vgem_drv: Standard comment blocks should not use kernel-doc
    format
  drm/exynos/exynos7_drm_decon: Fix incorrect naming of
    'decon_shadow_protect_win()'
  drm/exynos/exynos_drm_ipp: Fix documentation for
    'exynos_drm_ipp_get_{caps,res}_ioctl()'
  drm/vboxvideo/hgsmi_base: Place function names into headers
  drm/vboxvideo/modesetting: Provide function names for prototype
    headers

 .../drm/amd/display/dc/dce/dce_transform.h    |  3 +-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_ipp.c       |  4 +--
 drivers/gpu/drm/mediatek/mtk_disp_color.c     |  3 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c     |  4 +--
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  3 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |  4 +--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  4 ---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 32 +++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  4 +--
 drivers/gpu/drm/msm/dp/dp_catalog.c           |  2 +-
 drivers/gpu/drm/msm/dp/dp_link.c              |  6 ++--
 drivers/gpu/drm/msm/msm_gem.c                 |  4 +--
 .../gpu/drm/nouveau/nvkm/subdev/mc/tu102.c    |  6 ++--
 .../drm/panel/panel-raspberrypi-touchscreen.c |  2 +-
 drivers/gpu/drm/panel/panel-sitronix-st7701.c |  2 +-
 drivers/gpu/drm/sti/sti_hda.c                 |  6 ++--
 drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c    |  4 +--
 drivers/gpu/drm/sti/sti_hqvdp.c               |  2 +-
 drivers/gpu/drm/sti/sti_tvout.c               | 18 +++++------
 drivers/gpu/drm/ttm/ttm_tt.c                  |  2 +-
 drivers/gpu/drm/vboxvideo/hgsmi_base.c        | 19 +++++++----
 drivers/gpu/drm/vboxvideo/modesetting.c       | 20 +++++++-----
 drivers/gpu/drm/vgem/vgem_drv.c               |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_disp.c            |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c              |  2 +-
 26 files changed, 80 insertions(+), 82 deletions(-)

Cc: Adam Jackson <ajax@redhat.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: Akshu Agarwal <akshua@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Ben Widawsky <ben@bwidawsk.net>
Cc: Chandan Uddaraju <chandanu@codeaurora.org>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Cc: Eric Anholt <eric@anholt.net>
Cc: Fabien Dessenne <fabien.dessenne@st.com>
Cc: freedreno@lists.freedesktop.org
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Krishna Manikandan <mkrishn@codeaurora.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-media@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mauro Rossi <issor.oruam@gmail.com>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: nouveau@lists.freedesktop.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Vincent Abriou <vincent.abriou@st.com>
-- 
2.31.1

