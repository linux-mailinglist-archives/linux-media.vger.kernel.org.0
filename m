Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B48A52B1CAD
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 14:57:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727338AbgKMNx3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 08:53:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgKMNts (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 08:49:48 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A9C1C0617A6
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 05:49:44 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id u12so2762488wrt.0
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 05:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WyNuXCVQx1RiXbGVlsoSFjQskftsnSEq5QsbaFWLc8c=;
        b=pUV4xAYSW0aqWu4AgWE4Gu2ONVq/tvb+WU7dXYssWQBu4ISundyt8NUCtc3f8rsBFW
         Xzm7UqTQy9pLCI/Jxq8tXwTjvV9mAN0N/fYkswK2OI2Gd3vVh4RZq0Q7nx39lnCo67Cp
         pEYP24JGpSOFpO59d+XKbaCuVBYmcsuh6Ya7jp7hTFthga1+7G1qtIzymeh3egKNH5FQ
         RCyoD1ye0kCX5gf0nYlh2yzcpQYVHocfXme6+rV2peCwPODI6UKj/W9usL5uEjZfG+i7
         72xj5tJLfB+E0cwDCs2xg0uE3/2741OYcjK9rE93doNXXcVCb1DVU1qo7MiVcBCdgwGc
         wpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WyNuXCVQx1RiXbGVlsoSFjQskftsnSEq5QsbaFWLc8c=;
        b=eB+nCogJiFndXieqZmmeImhsW0vNnsfr3gV2A0WASjLviwA25/EpT5ggdwIgHLzKas
         0ewRmK+cAo5MUceOQyi5qIcrd92M5ul5I+e7uilmoKGA0yepxWhvcWoTSreNQqT7jZbN
         JooxFKR0TReEQ2cer11mQ3SsBm2OVHROy4FVFvR13PPytPdyhr6v1hYBl4iLBiDjSKmk
         BOtNbUdygR1xbrQhTAJ3D8d4dy684bnVmd0u0R0nBnHD8GTx954kKfb9EhGqBjaUCAwC
         KMvITyv61j7uOD3BdFGEGQ06XdOw+DnErdosmvpOovelouMSNLuIp/Yh/SdBfwcFlH2j
         CFKA==
X-Gm-Message-State: AOAM531SgGR4zrln/AjrbaIRjlVf8am27mvVjUXF1186l7cpSp8WxdTV
        3RS6c7WVq9IkcWN+KE7H1Th14w==
X-Google-Smtp-Source: ABdhPJzuhrz0RkDiGvF0LEw8t6raG5YB/yTSg1tZvfa/F31g8zu8pmDVbzFZxyxSqiLSK4ZsfQOcgg==
X-Received: by 2002:adf:f808:: with SMTP id s8mr3615050wrp.257.1605275382853;
        Fri, 13 Nov 2020 05:49:42 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 05:49:42 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org,
        Andres Rodriguez <andresx7@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        freedreno@lists.freedesktop.org,
        Harry Wentland <harry.wentland@amd.com>,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Jie Qiu <jie.qiu@mediatek.com>,
        John Clements <john.clements@amd.com>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Leo Li <sunpeng.li@amd.com>, lima@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-media@vger.kernel.org, Luben Tuikov <luben.tuikov@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Ripard <mripard@kernel.org>, Monk.liu@amd.com,
        Neil Armstrong <narmstrong@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        YT SHEN <yt.shen@mediatek.com>
Subject: [PATCH 00/40] [Set 7] Rid W=1 warnings from GPU
Date:   Fri, 13 Nov 2020 13:48:58 +0000
Message-Id: <20201113134938.4004947-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

This brings the running total from 5000 (in v5.9) down to 1400!

Hopefully not too much more to go now.

Lee Jones (40):
  drm/amd/include/vega10_ip_offset: Mark _BASE structs as __maybe_unused
  drm/amd/display/dc/core/dc_link_dp: Move
    DP_VGA_LVDS_CONVERTER_ID_{2,3} to where they're used
  drm/amd/display/dc/core/dc_link_ddc: Move DP_DVI_CONVERTER_ID_{4,5} to
    where they're used
  drm/amd/amdgpu/amdgpu_drv: Move 'amdgpu_info_ioctl()'s prototype to
    shared header
  drm/amd/amdgpu/amdgpu_ring: Fix misnaming of param 'max_dw'
  drm/msm/adreno/a6xx_gpu: Staticise local function 'a6xx_idle'
  drm/mediatek/mtk_disp_rdma: Fix formatting and supply missing struct
    member description
  drm/amd/amdgpu/amdgpu_ib: Fix some incorrect/incomplete function
    documentation
  drm/mediatek/mtk_drm_crtc: Demote seriously out-of-date struct header
  drm/mediatek/mtk_drm_drv: Staticise local function invoked by
    reference
  drm/amd/amdgpu/amdgpu_pll: Fix kernel-doc formatting, missing and
    extra params
  drm/pl111/pl111_display: Make local function static
  drm/panel/panel-tpo-tpg110: Correct misnaming and supply missing param
    description
  drm/meson/meson_venc: Make local function
    'meson_venc_hdmi_get_dmt_vmode' static
  drm/lima/lima_drv: Demote kernel-doc formatting abuse
  drm/amd/amdgpu/amdgpu_sync: Fix misnamed, missing and extra param
    descriptions
  drm/meson/meson_vclk: Make two local functions static
  drm/mediatek/mtk_dpi: Remove unused struct definition
    'mtk_dpi_encoder_funcs'
  drm/amd/amdgpu/amdgpu_vram_mgr: Add missing descriptions for 'dev' and
    'dir'
  drm/pl111/pl111_debugfs: Make local function 'pl111_debugfs_regs()'
    static
  drm/amd/amdgpu/amdgpu_virt: Make local function
    'amdgpu_virt_update_vf2pf_work_item()' static
  drm/amd/amdgpu/amdgpu_sched: Consume our own header containing
    prototypes
  drm/lima/lima_sched: Remove unused and unnecessary variable 'ret'
  drm/amd/amdgpu/amdgpu_ids: Supply missing docs for 'id' and 'vmhub'
  drm/amd/amdgpu/amdgpu_debugfs: Demote obvious abuse of kernel-doc
    formatting
  drm/amd/amdgpu/amdgpu_gmc: Demote one and fix another function header
  drm/amd/amdgpu/amdgpu_ras: Remove unused function
    'amdgpu_ras_error_cure'
  drm/amd/amdgpu/amdgpu_ras: Make local function
    'amdgpu_ras_error_status_query' static
  drm/amd/amdgpu/amdgpu_csa: Remove set but unused variable 'r'
  drm/amd/amdgpu/amdgpu_vm_cpu: Fix 'amdgpu_vm_cpu_prepare()'s doc-rot
  drm/amd/amdgpu/amdgpu_vm_sdma: Fix 'amdgpu_vm_sdma_prepare()'s doc-rot
  drm/msm/disp/mdp5/mdp5_crtc: Make local function
    'mdp5_crtc_setup_pipeline()' static
  drm/drm_dp_mst_topology: Remove set but never used variable 'len'
  drm/msm/disp/mdp5/mdp5_ctl: Demote non-conformant kernel-doc headers
  drm/msm/disp/mdp5/mdp5_kms: Make local functions 'mdp5_{en,dis}able()'
    static
  drm/amd/amdgpu/amdgpu_fw_attestation: Consume our own header
    containing prototypes
  drm/amd/amdgpu/smu_v11_0_i2c: Provide descriptions for 'control' and
    'data' params
  drm/msm/disp/dpu1/dpu_core_perf: Remove set but unused variable
    'dpu_cstate'
  drm/msm/disp/dpu1/dpu_encoder: Remove a bunch of unused variables
  drm/amd/amdgpu/gfx_v7_0: Remove unused struct definition

 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c       |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  4 +-
 .../drm/amd/amdgpu/amdgpu_fw_attestation.c    |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c       |  5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c        |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c       |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.h       | 31 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c       | 10 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       | 11 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c      |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c    |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |  2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c         |  9 ---
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.h         |  1 -
 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c    |  3 +
 .../gpu/drm/amd/display/dc/core/dc_link_ddc.c |  4 +
 .../gpu/drm/amd/display/dc/core/dc_link_dp.c  |  5 ++
 .../amd/display/include/ddc_service_types.h   |  8 --
 .../gpu/drm/amd/include/vega10_ip_offset.h    | 76 +++++++++----------
 drivers/gpu/drm/drm_dp_mst_topology.c         |  4 +-
 drivers/gpu/drm/lima/lima_drv.c               |  2 +-
 drivers/gpu/drm/lima/lima_sched.c             |  3 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |  5 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  9 ---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  4 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  4 +-
 drivers/gpu/drm/meson/meson_vclk.c            |  8 +-
 drivers/gpu/drm/meson/meson_venc.c            |  4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  3 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 12 +--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |  6 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c      |  6 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |  4 +-
 drivers/gpu/drm/panel/panel-tpo-tpg110.c      |  3 +-
 drivers/gpu/drm/pl111/pl111_debugfs.c         |  2 +-
 drivers/gpu/drm/pl111/pl111_display.c         |  2 +-
 43 files changed, 147 insertions(+), 142 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.h

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Andres Rodriguez <andresx7@gmail.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Cc: Eric Anholt <eric@anholt.net>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: freedreno@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jie Qiu <jie.qiu@mediatek.com>
Cc: John Clements <john.clements@amd.com>
Cc: Kalyan Thota <kalyan_t@codeaurora.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: lima@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-media@vger.kernel.org
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Monk.liu@amd.com
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Qiang Yu <yuq825@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: YT SHEN <yt.shen@mediatek.com>
-- 
2.25.1

