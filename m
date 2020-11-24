Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0A32C3102
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 20:45:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbgKXToD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 14:44:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbgKXToB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 14:44:01 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF46FC0613D6
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:00 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id 64so10127785wra.11
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+qzn/zwustkhPmm6CPPvaOjBdBZotgdBHz7Gg1/2/58=;
        b=B9SSFTWYkJpiwdzRTlbdHtktygIWmK53ASYuVZxUzuQ/n1vdExE4t/Iq2OQHpgTdWM
         YlKwnbJKP5QefHzbj/myTyinENyhQsB7HoOOfzDWAp9aUzPFBBw0yI80nn/3vqXq5DVJ
         ZobyMQYvz80ZlKbkAjM6KAwcpej9zSG6WeFQ0mKpsNjL0MZ7A+ScztanbQvNq36BAcFw
         xIyC43sKRK8Vu7yEZdARdFcS7JjbTz8FDyCyw7Y1z02y7eDNahEd7L3cyWfRusNmXTI6
         OQY8lpGqKcIfvMyPrWMx0AMt3UOBnf7ZmQBWnETACGzEEucHC04NgO66a6oIEu6A5zIY
         ql4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+qzn/zwustkhPmm6CPPvaOjBdBZotgdBHz7Gg1/2/58=;
        b=CnwUrFG9fbGW8322PV4lWwWezVPFJqrR5RFLG2JfQvmlc4x71z8ZMeoFt4HUZMIa4w
         mEsqkkGD0p9haGXvDXYUdK4qzcZUfov5QBF/zOUiX8g8URHhw2Q+a6bWX1QU3mGkl8bV
         iPLEYc69zkgB147QGq2Q2ZcepCKrjQEu5aBz/UVPaIs3D2R+9ZucX76nl4Y0GVKvclpp
         LQXp6XswSJKTzUA0DSLGyKovr+gteK8+tVq0PDvXMVKCH72BNBKERQizovAvS8srWZsJ
         UY8WVyo8ZNveIyO5ar5jM/UPJUT0rri00OHJlUMEI9UgJm0LjSr1YtXcMXh/YrJCbzVu
         1OiQ==
X-Gm-Message-State: AOAM531z6RVxtrdADXR7auS8/2vKzSaaiQ/MYl9Vi9m6GKQjFHo9wvqf
        5mDSjVDLNP0NCkMgx5JP9P7hmw==
X-Google-Smtp-Source: ABdhPJxB3v/xbdSNDArOvs4rF9XodhyOQmc1MFnk/hbl5FOT2va6rX0FYDMtWYy+dDvrd7wwREzh8w==
X-Received: by 2002:a5d:51c2:: with SMTP id n2mr92041wrv.326.1606247039596;
        Tue, 24 Nov 2020 11:43:59 -0800 (PST)
Received: from dell.default ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 11:43:58 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        Alex Sierra <alex.sierra@amd.com>,
        amd-gfx@lists.freedesktop.org,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, Evan Quan <evan.quan@amd.com>,
        freedreno@lists.freedesktop.org,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        linaro-mm-sig@lists.linaro.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, Luben Tuikov <luben.tuikov@amd.com>,
        Nirmoy Das <nirmoy.das@amd.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Veerabadhran G <vegopala@amd.com>,
        Xiaojian Du <Xiaojian.Du@amd.com>,
        Zhigang Luo <zhigang.luo@amd.com>
Subject: [PATCH 00/40] [Set 9] Rid W=1 warnings from GPU
Date:   Tue, 24 Nov 2020 19:37:44 +0000
Message-Id: <20201124193824.1118741-1-lee.jones@linaro.org>
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

730 out of 5000 left.

Lee Jones (40):
  drm/msm/msm_gem_shrinker: Fix descriptions for 'drm_device'
  drm/amd/amdgpu/gmc_v10_0: Suppy some missing function doc descriptions
  drm/msm/adreno/a6xx_gpu_state: Make some local functions static
  drm/amd/amdgpu/iceland_ih: Add missing function param descriptions for
    'ih' and 'entry'
  drm/amd/amdgpu/tonga_ih: Provide some missing descriptions for 'ih'
    and 'entry'
  drm/amd/amdgpu/cz_ih: Add missing function param descriptions for 'ih'
    and 'entry'
  drm/amd/amdgpu/amdgpu_psp: Make local function
    'parse_ta_bin_descriptor' static
  drm/msm/dp/dp_ctrl: Move 'tu' from the stack to the heap
  drm/amd/amdgpu/vega10_ih: Add descriptions for 'ih' and 'entry'
  drm/amd/amdgpu/navi10_ih: Add descriptions for 'ih' and 'entry'
  drm/amd/amdgpu/psp_v11_0: Make local function
    'psp_v11_0_wait_for_bootloader()' static
  drm/amd/amdgpu/dce_v10_0: Supply description for function param
    'async'
  drm/amd/amdgpu/dce_v11_0: Supply description for function param
    'async'
  drm/amd/amdgpu/gfx_v9_0: Make called-by-reference only function static
  drm/amd/amdgpu/gfx_v8_0: Functions must follow directly after their
    headers
  drm/amd/amdgpu/gfx_v10_0: Remove a bunch of set but unused variables
  drm/amd/amdgpu/sdma_v2_4: Fix a bunch of kernel-doc function
    documentation issues
  drm/amd/amdgpu/sdma_v3_0: Fix a bunch of kernel-doc function
    documentation issues
  drm/amd/amdgpu/sdma_v3_0: Fix incorrect param doc-rot issue
  drm/amd/amdgpu/uvd_v5_0: Fix a bunch of kernel-doc function
    documentation issues
  drm/amd/amdgpu/sdma_v4_0: Repair a bunch of kernel-doc problems
  drm/amd/amdgpu/amdgpu_uvd: Fix some function documentation headers
  drm/amd/amdgpu/sdma_v5_0: Provide some missing and repair other
    function params
  drm/amd/amdgpu/sdma_v5_2: Provide some missing and repair other
    function params
  drm/amd/amdgpu/amdgpu_vce: Provide some missing and repair other
    function params
  drm/amd/amdgpu/uvd_v6_0: Fix a bunch of kernel-doc function
    documentation issues
  drm/amd/amdgpu/uvd_v7_0: Fix a bunch of kernel-doc function
    documentation issues
  drm/amd/amdgpu/gfx_v10_0: Make local function 'gfx_v10_0_rlc_stop()'
    static
  drm/amd/amdgpu/vcn_v1_0: Fix a few kernel-doc misdemeanours
  drm/amd/amdgpu/jpeg_v1_0: Add some missing function param descriptions
  drm/amd/amdgpu/jpeg_v2_0: Add some missing kernel-doc descriptions
  drm/amd/amdgpu/vcn_v2_0: Fix a few kernel-doc misdemeanours
  drm/amd/amdgpu/vcn_v3_0: Remove unused variable 'direct_poll' from
    'vcn_v3_0_start_sriov()'
  drm/amd/amdgpu/amdgpu_acp: Fix doc-rot issues pertaining to a couple
    of 'handle' params
  drm/amd/pm/swsmu/smu11/vangogh_ppt: Make local function
    'vangogh_set_default_dpm_tables()' static
  drm/amd/pm/inc/smu_v11_0: Mark 'smu11_thermal_policy' as
    __maybe_unused
  drm/amd/pm/swsmu/smu12/renoir_ppt: Demote kernel-doc formatting abuse
  drm/amd/pm/swsmu/smu11/navi10_ppt: Remove unused 'struct i2c_algorithm
    navi10_i2c_algo'
  drm/amd/pm/powerplay/smumgr/fiji_smumgr: Remove unused variable
    'result'
  drm/amd/amdgpu/amdgpu_uvd: Add description for
    amdgpu_uvd_cs_msg_decode()'s 'buf_sizes' param

 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c       |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c       |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c       |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c       |  19 +-
 drivers/gpu/drm/amd/amdgpu/cz_ih.c            |   4 +
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |   1 +
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |   1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c        |  11 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c         |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c         |   2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c        |   4 +
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c       |   4 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c        |   7 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c        |   6 +-
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c        |   5 +
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c        |   2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c        |  16 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c        |  16 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  22 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c        |  19 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        |  19 +-
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c         |   4 +
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c         |  10 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c         |  21 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c         |  21 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c         |  14 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c         |  15 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c         |   4 -
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c        |   5 +
 drivers/gpu/drm/amd/pm/inc/smu_v11_0.h        |   3 +-
 .../drm/amd/pm/powerplay/smumgr/fiji_smumgr.c |  13 +-
 .../gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c   | 204 -----------
 .../gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c  |   9 +-
 .../gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c   |   4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   |   6 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c              | 338 +++++++++---------
 drivers/gpu/drm/msm/msm_gem_shrinker.c        |   4 +-
 37 files changed, 378 insertions(+), 474 deletions(-)

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Alex Sierra <alex.sierra@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Chandan Uddaraju <chandanu@codeaurora.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Cc: Evan Quan <evan.quan@amd.com>
Cc: freedreno@lists.freedesktop.org
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Nirmoy Das <nirmoy.das@amd.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Veerabadhran G <vegopala@amd.com>
Cc: Xiaojian Du <Xiaojian.Du@amd.com>
Cc: Zhigang Luo <zhigang.luo@amd.com>
-- 
2.25.1

