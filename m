Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F380A3912B3
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 10:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233093AbhEZItF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 04:49:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232568AbhEZItD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 04:49:03 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2812C061574
        for <linux-media@vger.kernel.org>; Wed, 26 May 2021 01:47:31 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id v12so203620wrq.6
        for <linux-media@vger.kernel.org>; Wed, 26 May 2021 01:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WgO8pJnbycGAPr/jI7WVY+xNAObrZKGPkpv1D9egn8s=;
        b=P07J35BETyrv+OPvGbVbCm5g4FQF/A/FA18Y0aGwAdU2nwjaPb0M/olKJPqJtiOrhX
         8Z8R6LILF+Ut0yOpDub0YmflLxejoVIa3+BDrBaHyaLq4j773XxmCSsJs2jA9VyGfyf1
         mp2PalUrXqEUbLW+AzzNGRy8VGNmQ+uM8dd/yO2STKe+yZBlmba4Xr/Pgr2vq9/TvfMR
         hmpRWbM61jEczGjETUM7EdN2Qf+jibbSBzLcte+AI0H2OrklYvs+pJ7wklAjOHdCBZXL
         miV4N+UuwnWDOZEC6vEbIbC4E0ztLPOBpZravpjuyP+TO3fP8gLn452oCtyQHAK+ZrJq
         XF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WgO8pJnbycGAPr/jI7WVY+xNAObrZKGPkpv1D9egn8s=;
        b=ptMhc++M4G6lTUrfMorzcwJp29W6yjYgTNAE6BmO/HERJYO/ngNHgz2WC/xAA4j5i5
         fjHoqbwAF6Ww5V4+jVlpejKC6+RQxUbkVAlbkq29iRttk9dEQ4CjAnqUl1fQUN/5rzWo
         dQIfZCYgPJHfiNCqWAw7o4m7dj2bNCoBMZFyNt31nqNCpuYDarwbK1HFc2RwwBTKA58G
         zn8D0XFCxZT53RgHkFtQT1Kq3TYF5Q2uV/2nUOnwwSoiLJuUGsJvshy6yx6vGDeVOAkh
         +1lQ4zgnoJZnN9Q0SG+h7Uz+eCm5cZ6ITbN/ih+BTPpL3rxdhonW8RRQhwdgU1QF4J7s
         k47Q==
X-Gm-Message-State: AOAM533bGuUsjPjiLJ53PsQn+PnQuCA1asH6A15dMo1MhFAdMB2jB/H8
        3gjJ61GPgPyIjPJapJlqjKVfZA==
X-Google-Smtp-Source: ABdhPJz7Yt7N0U9dO4++M/DXckMsobASl2c3GuDArRZKHB1os8WtSXIpk/vFAHDOzBqexSS+KqxpSQ==
X-Received: by 2002:adf:f9d0:: with SMTP id w16mr32449829wrr.336.1622018850280;
        Wed, 26 May 2021 01:47:30 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 01:47:29 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Adam Jackson <ajax@redhat.com>,
        Ajay Kumar <ajaykumar.rs@samsung.com>,
        Akshu Agarwal <akshua@gmail.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Alistair Popple <apopple@nvidia.com>,
        amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
        Ben Widawsky <ben@bwidawsk.net>,
        Christian Koenig <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
        Evan Quan <evan.quan@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Huang Rui <ray.huang@amd.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Inki Dae <inki.dae@samsung.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Jun Lei <Jun.Lei@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Leo Li <sunpeng.li@amd.com>, linaro-mm-sig@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Rossi <issor.oruam@gmail.com>,
        Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
        Michal Simek <michal.simek@xilinx.com>,
        nouveau@lists.freedesktop.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 00/34] Rid W=1 warnings from GPU
Date:   Wed, 26 May 2021 09:46:52 +0100
Message-Id: <20210526084726.552052-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

Lee Jones (34):
  drm/amd/pm/inc/smu_v13_0: Move table into the only source file that
    uses it
  drm/amd/pm/swsmu/smu13/aldebaran_ppt: Remove unused variable 'ret'
  drm/amd/pm/powerplay/hwmgr/smu7_thermal: Provide function name for
    'smu7_fan_ctrl_set_default_mode()'
  drm/amd/pm/powerplay/hwmgr/vega12_thermal: Provide function name
  drm/amd/pm/powerplay/hwmgr/vega12_hwmgr: Provide
    'vega12_init_smc_table()' function name
  drm/amd/pm/powerplay/hwmgr/vega10_hwmgr: Kernel-doc headers must
    contain function names
  drm/amd/pm/powerplay/hwmgr/vega20_hwmgr: Provide function name
    'vega20_init_smc_table()'
  drm/amd/display/dc/bios/command_table_helper: Fix function name for
    'dal_cmd_table_helper_transmitter_bp_to_atom()'
  drm/amd/display/dc/bios/command_table_helper2: Fix function name
    'dal_cmd_table_helper_transmitter_bp_to_atom2()'
  drm/amd/display/dc/bios/bios_parser: Fix formatting and misnaming
    issues
  drm/nouveau/nvkm/subdev/mc/tu102: Make functions called by reference
    static
  drm/amd/display/amdgpu_dm/amdgpu_dm: Functions must directly follow
    their headers
  drm/amd/display/dc/dce/dmub_outbox: Convert over to kernel-doc
  drm/amd/display/dc/gpio/gpio_service: Pass around correct
    dce_{version,environment} types
  drm/amd/display/dc/dce110/dce110_hw_sequencer: Include our own header
  drm/amd/display/dc/dce/dce_transform: Remove superfluous
    re-initialisation of DCFE_MEM_LIGHT_SLEEP_CNTL,
  drm/amd/display/dc/dce/dce_mem_input: Remove duplicate initialisation
    of GRPH_CONTROL__GRPH_NUM_BANKS_{SHIFT,MASK}
  drm/amd/display/dc/dce/dce_mem_input: Remove duplicate initialisation
    of GRPH_CONTROL__GRPH_NUM_BANKS_{SHIFT,MASK
  drm/amd/amdgpu/amdgpu_device: Make local function static
  drm/amd/display/amdgpu_dm/amdgpu_dm: Fix kernel-doc formatting issue
  drm/amd/display/dc/dce110/dce110_hw_sequencer: Include header
    containing our prototypes
  drm/amd/display/dc/core/dc: Convert function headers to kernel-doc
  drm/amd/display/dmub/src/dmub_srv_stat: Convert function header to
    kernel-doc
  drm/amd/display/modules/hdcp/hdcp_psp: Remove unused function
    'mod_hdcp_hdcp1_get_link_encryption_status()'
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

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 +-
 .../gpu/drm/amd/display/dc/bios/bios_parser.c |  6 +--
 .../display/dc/bios/command_table_helper.c    |  2 +-
 .../display/dc/bios/command_table_helper2.c   |  2 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c      | 46 +++++--------------
 .../drm/amd/display/dc/dce/dce_mem_input.h    |  2 -
 .../drm/amd/display/dc/dce/dce_transform.h    |  3 +-
 .../gpu/drm/amd/display/dc/dce/dmub_outbox.c  | 17 ++-----
 .../display/dc/dce110/dce110_hw_sequencer.c   |  3 ++
 .../drm/amd/display/dc/gpio/gpio_service.c    | 12 ++---
 .../drm/amd/display/dmub/src/dmub_srv_stat.c  | 19 +++-----
 .../display/include/gpio_service_interface.h  |  4 +-
 .../drm/amd/display/modules/hdcp/hdcp_psp.c   | 13 ------
 drivers/gpu/drm/amd/pm/inc/smu_v13_0.h        |  6 ---
 .../drm/amd/pm/powerplay/hwmgr/smu7_thermal.c |  8 ++--
 .../drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c | 26 ++++++-----
 .../drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c |  2 +-
 .../amd/pm/powerplay/hwmgr/vega12_thermal.c   |  3 +-
 .../drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c |  2 +-
 .../drm/amd/pm/swsmu/smu13/aldebaran_ppt.c    |  9 +++-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_ipp.c       |  4 +-
 .../gpu/drm/nouveau/nvkm/subdev/mc/tu102.c    |  6 +--
 .../drm/panel/panel-raspberrypi-touchscreen.c |  2 +-
 drivers/gpu/drm/panel/panel-sitronix-st7701.c |  2 +-
 drivers/gpu/drm/ttm/ttm_tt.c                  |  2 +-
 drivers/gpu/drm/vboxvideo/hgsmi_base.c        | 19 +++++---
 drivers/gpu/drm/vboxvideo/modesetting.c       | 20 ++++----
 drivers/gpu/drm/vgem/vgem_drv.c               |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_disp.c            |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c              |  2 +-
 32 files changed, 107 insertions(+), 147 deletions(-)

Cc: Adam Jackson <ajax@redhat.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: Akshu Agarwal <akshua@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Ben Widawsky <ben@bwidawsk.net>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Cc: Eric Anholt <eric@anholt.net>
Cc: Evan Quan <evan.quan@amd.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Jun Lei <Jun.Lei@amd.com>
Cc: Kevin Wang <kevin1.wang@amd.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-media@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Mauro Rossi <issor.oruam@gmail.com>
Cc: Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: nouveau@lists.freedesktop.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
-- 
2.31.1

