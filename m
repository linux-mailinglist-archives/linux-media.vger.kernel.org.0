Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC3D52B4D1D
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 18:36:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733032AbgKPReF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 12:34:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732986AbgKPReE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 12:34:04 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 075A2C0613D2
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:34:03 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id o15so19620873wru.6
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2rD08UjkD5sCRxYS0F4REDAlR1ogAYBAyad+KWz2GEw=;
        b=K3MiO7nmCnXKxJcjVRzgh23znPiMhQF02r4EEB7ilazh6Q3typAKfns3W275i/uPwe
         6ki3g+RVNhc0vrXZq3g/NjcHDWs+0dIiR9hbHYjXkWaHA19vmEOkeiL3NWGUAzyrgJkN
         tHQKXYzaVPK1Y726mGhFToAlmQJnLR0vrjWl/G6HFa2g8W8po3DfiLJSh4w3r3xm1/1J
         4iKvoDgtchsphx/S761VXUii48yJOE65It3vRJ8WDhCFz/WQHdhzXpPzR3iG+qQI4OXV
         Kn62IC/EEYXRvvO5sxXlSmdibfJONlvMFe2LSYETrMbq3r5KirnOZfjBqtRLpviug9+T
         jXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2rD08UjkD5sCRxYS0F4REDAlR1ogAYBAyad+KWz2GEw=;
        b=cgogsSbO3M+oq3QQKqVeIvnwE6iUAEuULurDrt0y9b2KTbZ/egMH/mBN7ZailaMe/C
         g79+NgpMhvr56SukgjOLllhnJgi38wPcIiHWkrr4DViEejr0EctKoLy0k0vu7yd3Adtu
         3uRLZdq5vcVBq8v0Az27xgb1qjIYUs7DP/z6HS6NaicHwkT9Oeif3WVXkS/sP3o5AI5e
         QunwehS0ENAhG2As8hyMDeZbvwS9rOfk6Q+zf/FOni8gW+ZdJYTxepK5KF7lRutv233S
         nVZapO435leYREe4ziobmvMZdoj4Q0ijW744+DDPQ5NE+/vvKJ88W1aBxH18GRz751Ps
         U8sQ==
X-Gm-Message-State: AOAM532/YzZzssrrWpeupHbYL64wUNbjm95ijixovGmXwjUOT6ZK9ex0
        VdTlpeL7vzAm1XPoV4XxMT7Nng==
X-Google-Smtp-Source: ABdhPJynz1SYzcQjLU7vxkWKnYKhsXRdyUFjnGlTNdA6hFZ/AU7rgprYiT7u0t+B4P+Sd63V1F7+RA==
X-Received: by 2002:adf:de12:: with SMTP id b18mr21161496wrm.187.1605548042617;
        Mon, 16 Nov 2020 09:34:02 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id k22sm20178562wmi.34.2020.11.16.09.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:34:01 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Ajay Kumar <ajaykumar.rs@samsung.com>,
        Akshu Agarwal <akshua@gmail.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
        Christian Koenig <christian.koenig@amd.com>,
        Chris Zhong <zyw@rock-chips.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        David Francis <David.Francis@amd.com>,
        dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
        Eunchul Kim <chulspro.kim@samsung.com>,
        Fabio Estevam <festevam@gmail.com>,
        freedreno@lists.freedesktop.org,
        =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
        Huang Rui <ray.huang@amd.com>, Inki Dae <inki.dae@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Jie Qiu <jie.qiu@mediatek.com>,
        Jinyoung Jeon <jy0.jeon@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        linaro-mm-sig@lists.linaro.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Luben Tuikov <luben.tuikov@amd.com>,
        Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Mark Yao <mark.yao@rock-chips.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Nickey Yang <nickey.yang@rock-chips.com>,
        Nirmoy Das <nirmoy.aiemd@gmail.com>,
        nouveau@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Sandy Huang <hjc@rock-chips.com>,
        Sangmin Lee <lsmin.lee@samsung.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sean Paul <sean@poorly.run>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        YT SHEN <yt.shen@mediatek.com>
Subject: [RESEND 00/42] Rid W=1 warnings from GPU (non-Radeon)
Date:   Mon, 16 Nov 2020 17:33:14 +0000
Message-Id: <20201116173356.1828478-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This set contains fixes for some "wouldn't it be nice if" issues,
however most of the patches seen here have been on the MLs, but
were left unreviewed.

Lee Jones (42):
  drm/amd/amdgpu/atombios_encoders: Remove set but unused variable
    'backlight_level'
  drm/armada/armada_overlay: Staticify local function
    'armada_overlay_duplicate_state'
  drm/drm_dp_mst_topology: Remove set but never used variable 'len'
  drm/exynos/exynos7_drm_decon: Supply missing description for  param
    'ctx'
  drm/exynos/exynos_drm_fimd: Add missing description for param 'ctx'
  drm/exynos/exynos_drm_gsc: Supply missing description for 'num_limits'
  drm/mediatek/mtk_dpi: Remove unused struct definition
    'mtk_dpi_encoder_funcs'
  drm/mediatek/mtk_disp_color: Fix formatting and provide missing member
    description
  drm/mediatek/mtk_disp_ovl: Fix formatting and provide missing member
    description
  drm/mediatek/mtk_disp_rdma: Fix formatting and supply missing struct
    member description
  drm/mediatek/mtk_drm_crtc: Demote seriously out-of-date struct header
  drm/mediatek/mtk_drm_drv: Staticise local function invoked by
    reference
  drm/meson/meson_venc: Make local function
    'meson_venc_hdmi_get_dmt_vmode' static
  drm/meson/meson_vclk: Make two local functions static
  drm/msm/adreno/a6xx_gpu: Staticise local function 'a6xx_idle'
  drm/msm/disp/mdp5/mdp5_crtc: Make local function
    'mdp5_crtc_setup_pipeline()' static
  drm/msm/disp/mdp5/mdp5_ctl: Demote non-conformant kernel-doc headers
  drm/msm/disp/mdp5/mdp5_kms: Make local functions 'mdp5_{en,dis}able()'
    static
  drm/msm/disp/dpu1/dpu_core_perf: Remove set but unused variable
    'dpu_cstate'
  drm/msm/disp/dpu1/dpu_encoder: Remove a bunch of unused variables
  drm/nouveau/nvkm/core/firmware: Fix formatting, provide missing param
    description
  drm/pl111/pl111_display: Make local function static
  drm/pl111/pl111_debugfs: Make local function 'pl111_debugfs_regs()'
    static
  drm/rockchip/dw-mipi-dsi-rockchip: Demote non-conformant kernel-doc
    headers
  drm/rockchip/rockchip_rgb: Consume our own header
  drm/rockchip/rockchip_lvds: Fix struct document formatting
  drm/selftests/test-drm_mm: Mark 'hole_end' as always_unused
  drm/selftests/test-drm_framebuffer: Remove set but unused variable
    'fb'
  drm/selftests/test-drm_dp_mst_helper: Place 'struct
    drm_dp_sideband_msg_req_body' onto the heap
  drm/selftests/test-drm_dp_mst_helper: Move
    'sideband_msg_req_encode_decode' onto the heap
  drm/ttm/ttm_bo: Fix one function header - demote lots of kernel-doc
    abuses
  drm/ttm/ttm_tt: Demote kernel-doc header format abuses
  drm/ttm/ttm_range_manager: Demote non-conformant kernel-doc header
  drm/v3d/v3d_drv: Remove unused static variable 'v3d_v3d_pm_ops'
  drm/v3d/v3d_gem: Provide descriptions for 'v3d_lookup_bos's params
  drm/v3d/v3d_sched: Demote non-conformant kernel-doc header
  drm/vc4/vc4_hdmi_regs: Mark some data sets as __maybe_unused
  drm/vc4/vc4_hdmi: Remove set but unused variable 'ret'
  drm/vc4/vc4_v3d: Demote non-conformant kernel-doc headers
  drm/vc4/vc4_debugfs: Demote non-conformant kernel-doc headers
  gpu/ipu-v3/ipu-di: Strip out 2 unused 'di_sync_config' entries
  include/drm/drm_atomic: Make use of 'new_crtc_state'

 .../gpu/drm/amd/amdgpu/atombios_encoders.c    |  3 --
 drivers/gpu/drm/armada/armada_overlay.c       |  2 +-
 drivers/gpu/drm/drm_dp_mst_topology.c         |  4 +-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  1 +
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  1 +
 drivers/gpu/drm/exynos/exynos_drm_gsc.c       |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_color.c     |  5 ++-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  5 ++-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |  5 ++-
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  9 -----
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  4 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  4 +-
 drivers/gpu/drm/meson/meson_vclk.c            |  8 ++--
 drivers/gpu/drm/meson/meson_venc.c            |  4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  3 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 12 +-----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |  6 +--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c      |  6 +--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |  4 +-
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c  |  9 +++--
 drivers/gpu/drm/pl111/pl111_debugfs.c         |  2 +-
 drivers/gpu/drm/pl111/pl111_display.c         |  2 +-
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   |  4 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c      |  2 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.c       |  1 +
 .../drm/selftests/test-drm_dp_mst_helper.c    | 40 +++++++++++++------
 .../gpu/drm/selftests/test-drm_framebuffer.c  |  3 +-
 drivers/gpu/drm/selftests/test-drm_mm.c       |  2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  | 23 ++++++-----
 drivers/gpu/drm/ttm/ttm_range_manager.c       |  2 +-
 drivers/gpu/drm/ttm/ttm_tt.c                  |  4 +-
 drivers/gpu/drm/v3d/v3d_drv.c                 | 36 -----------------
 drivers/gpu/drm/v3d/v3d_gem.c                 |  2 +
 drivers/gpu/drm/v3d/v3d_sched.c               |  2 +-
 drivers/gpu/drm/vc4/vc4_debugfs.c             |  4 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                |  3 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h           |  6 +--
 drivers/gpu/drm/vc4/vc4_v3d.c                 |  4 +-
 drivers/gpu/ipu-v3/ipu-di.c                   |  4 --
 include/drm/drm_atomic.h                      |  3 +-
 41 files changed, 105 insertions(+), 142 deletions(-)

Cc: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: Akshu Agarwal <akshua@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Chris Zhong <zyw@rock-chips.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: David Francis <David.Francis@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: Eric Anholt <eric@anholt.net>
Cc: Eunchul Kim <chulspro.kim@samsung.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: freedreno@lists.freedesktop.org
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Huang Rui <ray.huang@amd.com>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jie Qiu <jie.qiu@mediatek.com>
Cc: Jinyoung Jeon <jy0.jeon@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Kalyan Thota <kalyan_t@codeaurora.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Mark Yao <mark.yao@rock-chips.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Nickey Yang <nickey.yang@rock-chips.com>
Cc: Nirmoy Das <nirmoy.aiemd@gmail.com>
Cc: nouveau@lists.freedesktop.org
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: Sangmin Lee <lsmin.lee@samsung.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sean Paul <sean@poorly.run>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: YT SHEN <yt.shen@mediatek.com>
-- 
2.25.1

