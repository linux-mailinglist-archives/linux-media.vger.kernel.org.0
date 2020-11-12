Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 305F92B0D42
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 20:06:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbgKLTAq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 14:00:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbgKLTAq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 14:00:46 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B52E8C0613D6
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2020 11:00:45 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id 33so7147945wrl.7
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2020 11:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2EhywyPLrzVauOxW6hoSN8BeHIP9/SoKOh3x4hIA4nE=;
        b=mDMN9CSv2W4PIXw03bPQQ8E6n/F1hxOhd7U5xYg0CKNVoFSNx4vt6N6nJEUd+d0NVf
         2f6ET1hpvzbE9dTYE3+AEzEL+oXMm+dQYcFG7X5DeJlH39RK3B36bhjv0Kmfgd6IjRu7
         DK6YHE4NxqI4RcOgx4vmMjk9l0jBxi6xWPEUOmu/6CIwnL3vxLJFaFpRKcG8r7qv3xgD
         dyjxn3R0n7C+dorPtETtr3Ojp3vP39NWvjuLVdBQignca7AielkWQC3zPNd4ftwjEApD
         tELbFwItnMMYVNZnKGN9qFLn5xqZXBJqd3P05jK3vJI0wJT80G2YuD83Borh2wfI9qov
         uFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2EhywyPLrzVauOxW6hoSN8BeHIP9/SoKOh3x4hIA4nE=;
        b=IJwQzPvqEGFNHCEmly9RNWRg/HYrSzR/J0sxmxrzw+bZbjmr8kLEW25tcSzNzwk+tj
         t1152ODyyefoZLQ1/I7f/jMquTbyNp4ml/IurioZ3buxBjXkqBSib3w3GbcheHPKaENf
         AJ1kbLLB3J5pA0+K3sFO09uerSegNVd5JShLQ3HoflC1yitg2swgfnuAkgvpKY8djWc4
         nTpWoIR7AZ8vneAT8TkALhwGeNTE/E0o/kmgRidR3t4faN/ec7NizVJDTpb/mrzF+3aj
         e+J1/g/e8ttyrI13+NDaQH0mbE4MfYUmQtKQfPKV1fdGMkPpNUXY6gBQgjMSsEpj6xXk
         HAfA==
X-Gm-Message-State: AOAM530q24AlXLagpjIgnkIPrblxVq/hKzFBdCmlhDdgkM+0HAnfzgPB
        b/woqiFwk4A8Cydb0P5o1nIScA==
X-Google-Smtp-Source: ABdhPJyKUIdqT6yOWd6udawSWHTScPhDrEAlvpxAeKCcoYi8gRAZSrSI6RVWTEAP7uNql9pNr7za4A==
X-Received: by 2002:adf:fc01:: with SMTP id i1mr1129122wrr.250.1605207644013;
        Thu, 12 Nov 2020 11:00:44 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 11:00:43 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Ajay Kumar <ajaykumar.rs@samsung.com>,
        Akshu Agarwal <akshua@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Ben Skeggs <bskeggs@redhat.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Chris Zhong <zyw@rock-chips.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
        Eunchul Kim <chulspro.kim@samsung.com>,
        =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
        Inki Dae <inki.dae@samsung.com>,
        Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
        Jerome Glisse <glisse@freedesktop.org>,
        Jinyoung Jeon <jy0.jeon@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        linaro-mm-sig@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Luben Tuikov <luben.tuikov@amd.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Mark Yao <mark.yao@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Nickey Yang <nickey.yang@rock-chips.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        nouveau@lists.freedesktop.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        report to <xorg-driver-ati@lists.x.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sandy Huang <hjc@rock-chips.com>,
        Sangmin Lee <lsmin.lee@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Vincent Abriou <vincent.abriou@st.com>
Subject: [PATCH 00/30] [Set 6] Rid W=1 warnings from GPU
Date:   Thu, 12 Nov 2020 19:00:09 +0000
Message-Id: <20201112190039.2785914-1-lee.jones@linaro.org>
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

NB: Hopefully the other sets turn up in -next soon, so they can
be rebased and any stragglers re-submitted.

Lee Jones (30):
  drm/savage/savage_bci: Remove set but never used 'aper_rsrc' and
    'fb_rsrc'
  include: drm: drm_atomic: Artificially use 'crtc' to avoid 'not used'
    warning
  drm/v3d/v3d_gem: Provide descriptions for 'v3d_lookup_bos's params
  drm/via/via_dma: Remove set but unused variable 'agp_base'
  drm/v3d/v3d_sched: Demote non-conformant kernel-doc header
  drm/amd/amdgpu/amdgpu_kms: Fix misnaming of parameter 'dev'
  drm/amd/amdgpu/amdgpu_fence: Fix some issues pertaining to function
    documentation
  drm/exynos/exynos7_drm_decon: Supply missing description for  param
    'ctx'
  drm/exynos/exynos_drm_fimd: Add missing description for param 'ctx'
  drm/vc4/vc4_hdmi_regs: Mark some data sets as __maybe_unused
  drm/vc4/vc4_hdmi: Remove set but unused variable 'ret'
  drm/amd/amdgpu/amdgpu_ttm: Demote non-conformant kernel-doc headers,
    fix slightly lacking ones
  drm/atmel-hlcdc/atmel_hlcdc_crtc: Apply correct formatting to struct
    docs
  drm/amd/amdgpu/amdgpu_ring: Fix a bunch of function misdocumentation
  drm/amd/amdgpu/amdgpu_display: Remove pointless header
  drm/atmel-hlcdc/atmel_hlcdc_plane: Staticise local function
    'atmel_hlcdc_plane_setup_scaler()'
  drm/atmel-hlcdc/atmel_hlcdc_plane: Fix documentation formatting and
    add missing description
  drm/vc4/vc4_v3d: Demote non-conformant kernel-doc headers
  drm/amd/amdgpu/amdgpu_cs: Add a couple of missing function param
    descriptions
  drm/armada/armada_overlay: Staticify local function
    'armada_overlay_duplicate_state'
  drm/vc4/vc4_debugfs: Demote non-conformant kernel-doc headers
  drm/rockchip/dw-mipi-dsi-rockchip: Demote non-conformant kernel-doc
    headers
  drm/rockchip/rockchip_rgb: Consume our own header
  drm/nouveau/nvkm/core/firmware: Fix formatting, provide missing param
    description
  drm/rockchip/rockchip_lvds: Fix struct document formatting
  drm/exynos/exynos_drm_gsc: Supply missing description for 'num_limits'
  drm/sti/sti_hdmi: Move 'colorspace_mode_names' array to where its used
  drm/mediatek/mtk_disp_color: Fix formatting and provide missing member
    description
  drm/amd/amdgpu/atombios_encoders: Remove set but unused variable
    'backlight_level'
  drm/mediatek/mtk_disp_ovl: Fix formatting and provide missing member
    description

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  4 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     | 11 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c      | 12 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 60 ++++++++++---------
 .../gpu/drm/amd/amdgpu/atombios_encoders.c    |  3 +-
 drivers/gpu/drm/armada/armada_overlay.c       |  2 +-
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    |  6 +-
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   |  7 ++-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  1 +
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  1 +
 drivers/gpu/drm/exynos/exynos_drm_gsc.c       |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_color.c     |  5 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  5 +-
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c  |  9 +--
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   |  4 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c      |  2 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.c       |  1 +
 drivers/gpu/drm/savage/savage_bci.c           | 11 ----
 drivers/gpu/drm/sti/sti_hdmi.c                |  6 ++
 drivers/gpu/drm/sti/sti_hdmi.h                |  6 --
 drivers/gpu/drm/v3d/v3d_gem.c                 |  2 +
 drivers/gpu/drm/v3d/v3d_sched.c               |  2 +-
 drivers/gpu/drm/vc4/vc4_debugfs.c             |  4 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                |  3 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h           |  6 +-
 drivers/gpu/drm/vc4/vc4_v3d.c                 |  4 +-
 drivers/gpu/drm/via/via_dma.c                 |  2 -
 include/drm/drm_atomic.h                      |  1 +
 30 files changed, 91 insertions(+), 94 deletions(-)

Cc: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: Akshu Agarwal <akshua@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Chris Zhong <zyw@rock-chips.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Cc: Eric Anholt <eric@anholt.net>
Cc: Eunchul Kim <chulspro.kim@samsung.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Cc: Jerome Glisse <glisse@freedesktop.org>
Cc: Jinyoung Jeon <jy0.jeon@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Mark Yao <mark.yao@rock-chips.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Nickey Yang <nickey.yang@rock-chips.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: nouveau@lists.freedesktop.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: report to <xorg-driver-ati@lists.x.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: Sangmin Lee <lsmin.lee@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Vincent Abriou <vincent.abriou@st.com>
-- 
2.25.1

