Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D118C38AEA7
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 14:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242380AbhETMnm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 08:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242579AbhETMm6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 08:42:58 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D13C056483
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 05:02:53 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id d11so17358050wrw.8
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 05:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ObgmrN92NxTDRRCctMyGxQK2RJSjpicdlYhfFmhnPOY=;
        b=e1Gdj9CLqOqawdIr13q6OgyxO0r08kxS9aPOdeuBFlQLEaNvhURhySVJXWRCR7quIm
         B9EyY2yaZnu5pabaTTGQjl6BsbRpistLCdagKzzvp9lKgtFgjH+P8Zv35Y0JKpzXup6h
         EfUwsQYRd7KL7cbW5b/dCgln8KCfNbFceO5cY6hyVj/2oEPGzxuAzzo/clK7R7z/FaEm
         yFtLm+AgIIGMtPOMuiAyBhp/ytZ+3ygswUC07rYa9TKdEqMiYy63rFy7yNoJJvcWU/WU
         +wEMLio5C3w2nkNvFiRDYtmVF9fxrA6P1eKkRaeEhfaytsmoF7F/0fTo7KXvHtP8Se29
         O2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ObgmrN92NxTDRRCctMyGxQK2RJSjpicdlYhfFmhnPOY=;
        b=QBjPwfW0G06b6/N6tBHPrC4nsWXAjcF1U4uwsHn+FSntxpb9xO20rug4mcOyb1zS3H
         GGYuH9x4osTcqcu0/uNpzxzUTFIZXapMcEX4OCKwloSbSbineGC3m7L26HAe6Cn7FbEu
         FiMa7H93VkI7CqPKKv0DvudmGw3b5jMjJUBCndjkISBWzxiFkVTx/UVNXHIBonm/1t4O
         MKA4ewElTpyIIHdBIWwjVAHM5WFR0sId7eV9HLUbSadRaF8uNxpyfq/NH4LiWhhJLAKu
         5xqah4l5myPwbEm2PMJClTl3HIBakmRRI83da9XR1LQG56D7w5yYsTDSjaNlmqAjDVCN
         tdIg==
X-Gm-Message-State: AOAM533iLfs+axLiB7OE/0QapivZbvl9sNQ4Zi0if0JQs8FTUm9WXoXl
        HlBQYaWScsHj9te0IHCOxsrixw==
X-Google-Smtp-Source: ABdhPJxRWZEylxmqK9DM4vAaGp5PwNdLCjcyoyxoDr48TQ06C36yd7o4cMxzmpLrwhXfOi6gcFYN7w==
X-Received: by 2002:adf:f54b:: with SMTP id j11mr3679400wrp.376.1621512171931;
        Thu, 20 May 2021 05:02:51 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:02:51 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, Evan Quan <evan.quan@amd.com>,
        Fabien Dessenne <fabien.dessenne@st.com>,
        freedreno@lists.freedesktop.org,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        Jerome Glisse <glisse@freedesktop.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        linaro-mm-sig@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-media@vger.kernel.org, Luben Tuikov <luben.tuikov@amd.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Vincent Abriou <vincent.abriou@st.com>
Subject: [PATCH 00/38] Rid W=1 warnings from GPU
Date:   Thu, 20 May 2021 13:02:10 +0100
Message-Id: <20210520120248.3464013-1-lee.jones@linaro.org>
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

Lee Jones (38):
  drm/mediatek/mtk_disp_color: Strip incorrect doc and demote header
  drm/mediatek/mtk_disp_gamma: Strip and demote non-conformant
    kernel-doc header
  drm/radeon/radeon_cs: Fix incorrectly documented function
    'radeon_cs_parser_fini'
  drm/mediatek/mtk_disp_ovl: Strip and demote non-conformant header
  drm/mediatek/mtk_disp_rdma: Strip and demote non-conformant kernel-doc
    header
  drm/sti/sti_hdmi_tx3g4c28phy: Provide function names for kernel-doc
    headers
  drm/sti/sti_hda: Provide missing function names
  drm/sti/sti_tvout: Provide a bunch of missing function names
  drm/sti/sti_hqvdp: Fix incorrectly named function 'sti_hqvdp_vtg_cb()'
  drm/amd/amdgpu/amdgpu_ids: Correct some function name disparity
  drm/amd/amdgpu/amdgpu_debugfs: Fix a couple of misnamed functions
  drm/amd/amdgpu/amdgpu_gmc: Fix a little naming related doc-rot
  drm/amd/amdgpu/cik_sdma: Fix a few incorrectly named functions
  drm/amd/amdgpu/gfx_v7_0: Repair function names in the documentation
  drm/msm/disp/dpu1/dpu_encoder_phys_cmd: Remove unused variable
    'cmd_enc'
  drm/amd/amdgpu/si_dma: Fix some function name disparity
  drm/amd/amdgpu/dce_v6_0: Repair function name of
    'si_get_number_of_dram_channels()'
  drm/msm/disp/dpu1/dpu_hw_interrupts: Demote a bunch of kernel-doc
    abuses
  drm/radeon/cik: Fix incorrectly named function 'cik_irq_suspend()'
  drm/radeon/radeon_vm: Fix function naming disparities
  drm/amd/include/aldebaran_ip_offset: Mark top-level IP_BASE as
    __maybe_unused
  drm/msm/disp/dpu1/dpu_plane: Fix a couple of naming issues
  drm/amd/amdgpu/gmc_v7_0: Fix potential copy/paste issue
  drm/amd/amdgpu/mmhub_v9_4: Fix naming disparity with
    'mmhub_v9_4_set_fault_enable_default()'
  drm/msm/msm_gem: Demote kernel-doc abuses
  drm/amd/amdgpu/gmc_v10_0: Fix potential copy/paste issue
  drm/msm/dp/dp_catalog: Correctly document param 'dp_catalog'
  drm/msm/dp/dp_link: Fix some potential doc-rot
  drm/radeon/r100: Realign doc header with function
    'r100_cs_packet_parse_vline()'
  drm/amd/amdgpu/gfx_v9_4_2: Mark functions called by reference as
    static
  drm/amd/amdgpu/sdma_v2_4: Correct misnamed function
    'sdma_v2_4_ring_emit_hdp_flush()'
  drm/amd/amdgpu/sdma_v4_0: Realign functions with their headers
  drm/amd/amdgpu/sdma_v5_0: Fix typo in function name
  drm/amd/amdgpu/amdgpu_vce: Fix a few incorrectly named functions
  drm/amd/amdgpu/sdma_v5_2: Repair typo in function name
  drm/amd/amdgpu/vcn_v1_0: Fix some function naming disparity
  drm/amd/amdgpu/gfx_v10_0: Demote kernel-doc abuse
  drm/amd/amdgpu/smuio_v13_0: Realign
    'smuio_v13_0_is_host_gpu_xgmi_supported()' header

 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  4 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c       |  4 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c       |  8 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c       | 10 +++---
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c         |  8 ++---
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c         |  6 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c       | 14 ++++----
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  4 +--
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c           |  6 ++--
 drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c         |  4 +--
 .../gpu/drm/amd/include/aldebaran_ip_offset.h |  2 +-
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
 drivers/gpu/drm/radeon/cik.c                  |  2 +-
 drivers/gpu/drm/radeon/r100.c                 |  2 +-
 drivers/gpu/drm/radeon/radeon_cs.c            |  2 +-
 drivers/gpu/drm/radeon/radeon_vm.c            |  4 +--
 drivers/gpu/drm/sti/sti_hda.c                 |  6 ++--
 drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c    |  4 +--
 drivers/gpu/drm/sti/sti_hqvdp.c               |  2 +-
 drivers/gpu/drm/sti/sti_tvout.c               | 18 +++++------
 38 files changed, 92 insertions(+), 102 deletions(-)

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Chandan Uddaraju <chandanu@codeaurora.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Cc: Evan Quan <evan.quan@amd.com>
Cc: Fabien Dessenne <fabien.dessenne@st.com>
Cc: freedreno@lists.freedesktop.org
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: Jerome Glisse <glisse@freedesktop.org>
Cc: Krishna Manikandan <mkrishn@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-media@vger.kernel.org
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Vincent Abriou <vincent.abriou@st.com>
-- 
2.31.1

