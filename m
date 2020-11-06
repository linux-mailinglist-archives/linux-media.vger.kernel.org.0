Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 209992A9F58
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 22:49:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728547AbgKFVty (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 16:49:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbgKFVty (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Nov 2020 16:49:54 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EBBCC0613CF
        for <linux-media@vger.kernel.org>; Fri,  6 Nov 2020 13:49:54 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id v5so2842253wmh.1
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2020 13:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=atRaJCXFVxAlihI4r4ojii808StzDT60z5Ec9SQAR/c=;
        b=AjBsI4km7LOdpe3juQ0sb1PHk/smmBYDMBsiL8eKHCnqoSJbL14NUE8SdDRfeZgPkZ
         +DxjrVqLYfdQ0RUisTVflMg4C+aK/13Y91yRQNt2TRkZa19sIVT0k9UG106xPxHr6j7u
         yn20MAvlzzXtrV9HRoflVyWEBTeSdPv5cyZTveSv2dOvhkfAkOWkFbygv3qVFTMMjxy/
         52UcUdPLLPv8JITzUPM4dNiblkAqiuytJJE/0W4mNpW0bhv8k+sQE+MplDFJdyAjcc3S
         woDB1b9+/GwiKQm9qX3IEGWBR8b2Cqs2XAwypLa7SZ34SqSlqqYer1GahSbc0rV+0zfI
         MYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=atRaJCXFVxAlihI4r4ojii808StzDT60z5Ec9SQAR/c=;
        b=MAe78RZKdlEQcoTTjKMEavqrwmGAyz51omviATqlSNYf1K1xNZyzyDatZHAnKWACAN
         Z+tMyjwxZ5jd0dHdY6z3ssyOaT8xjFQRadD/uyFeRS/T+iUAZeIxV6jgLNEv8OBX9S2e
         Kn/IWIon3+eZrVB6bP9Io4LLncoNcgnWw7u+98H+ThAt2ZG6GR45PY9GuO7FdKTxHCZw
         26wU0k3IhATCMn0lzF+XdZwb1UgELIVZ5reXSSv13xdAcFML0UlqeQfvdrt6pBsQ7kwr
         tqun4Nvw86/Swn2aN4v9uQpqvOS2JHoA2KOgFWTRlW6JwIcBaOprFKy/SI8LWrS3Ofm8
         dMDw==
X-Gm-Message-State: AOAM533Kyx+eoH9DZ2usPnu5SJgNb3k44L4Dsdx8RfJSJI0yr5Knd3Sa
        0kG4Q/rjZg5ge5rZjNqrs2+iWQ==
X-Google-Smtp-Source: ABdhPJyxSilLymaZgbLjfvWQZDTgj2OWOjONwp5UO++dwOgGyrFaukmAGiTHKU2EcOOknhLQDmeuVQ==
X-Received: by 2002:a7b:c24b:: with SMTP id b11mr1515570wmj.109.1604699393111;
        Fri, 06 Nov 2020 13:49:53 -0800 (PST)
Received: from dell.default ([91.110.221.236])
        by smtp.gmail.com with ESMTPSA id t199sm3981084wmt.46.2020.11.06.13.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 13:49:52 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org, Andy Gross <andy.gross@ti.com>,
        by <jhartmann@precisioninsight.com>,
        Christian Koenig <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
        Faith <faith@valinux.com>, Gareth Hughes <gareth@valinux.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Huang Rui <ray.huang@amd.com>,
        Jeff Hartmann <jhartmann@valinux.com>,
        Keith Whitwell <keith@tungstengraphics.com>,
        Leo Li <sunpeng.li@amd.com>, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <rob.clark@linaro.org>, Rob Clark <rob@ti.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 00/19] [Set 2] Rid W=1 warnings from GPU
Date:   Fri,  6 Nov 2020 21:49:30 +0000
Message-Id: <20201106214949.2042120-1-lee.jones@linaro.org>
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

There are 5000 warnings to work through.  It will take a couple more
sets.  Although, ("drm/amd/display/dc/basics/fixpt31_32: Move
variables to where they're used") does take care of 2000 of them!

Lee Jones (19):
  drm/ttm/ttm_range_manager: Demote non-conformant kernel-doc header
  drm/r128/ati_pcigart: Source file headers are not good candidates for
    kernel-doc
  drm/selftests/test-drm_dp_mst_helper: Move
    'sideband_msg_req_encode_decode' onto the heap
  drm/mga/mga_dma: Demote kernel-doc abusers to standard comment blocks
  drm/mga/mga_state: Remove unused variable 'buf_priv'
  drm/radeon/atom: Move prototype into shared location
  drm/radeon/radeon_kms: Include header containing our own prototypes
  drm/omapdrm/omap_gem: Fix misnamed and missing parameter descriptions
  drm/omapdrm/omap_dmm_tiler: Demote abusive use of kernel-doc format
  drm/radeon/radeon: Move prototype into shared header
  drm/radeon/radeon_drv: Source file headers are not good candidates for
    kernel-doc
  drm/amd/display/dc/basics/fixpt31_32: Move variables to where they're
    used
  drm/radeon/radeon_drv: Move prototypes to a shared headerfile
  drm/amd/amdgpu/amdgpu_device: Provide documentation for 'reg_addr'
    params
  drm/radeon: Move prototypes to shared header
  drm/amd/amdgpu/amdgpu_kms: Remove 'struct drm_amdgpu_info_device
    dev_info' from the stack
  drm/radeon/radeon_kms: Fix misnaming of 'radeon_info_ioctl's dev param
  drm/radeon/atombios_crtc: Remove description of non-existent function
    param 'encoder'
  drm/v3d/v3d_drv: Remove unused static variable 'v3d_v3d_pm_ops'

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       | 104 +++++++++---------
 .../drm/amd/display/dc/basics/fixpt31_32.c    |   5 +
 .../gpu/drm/amd/display/include/fixed31_32.h  |   6 -
 drivers/gpu/drm/mga/mga_dma.c                 |  10 +-
 drivers/gpu/drm/mga/mga_state.c               |   2 -
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c      |   6 +-
 drivers/gpu/drm/omapdrm/omap_gem.c            |   3 +-
 drivers/gpu/drm/r128/ati_pcigart.c            |   2 +-
 drivers/gpu/drm/radeon/atom.h                 |   6 +
 drivers/gpu/drm/radeon/atombios_crtc.c        |   1 -
 drivers/gpu/drm/radeon/atombios_encoders.c    |   4 -
 drivers/gpu/drm/radeon/radeon.h               |   6 +
 drivers/gpu/drm/radeon/radeon_device.c        |   1 +
 drivers/gpu/drm/radeon/radeon_device.h        |  32 ++++++
 drivers/gpu/drm/radeon/radeon_display.c       |   4 -
 drivers/gpu/drm/radeon/radeon_drv.c           |  11 +-
 drivers/gpu/drm/radeon/radeon_drv.h           |   7 ++
 drivers/gpu/drm/radeon/radeon_kms.c           |   3 +-
 .../drm/selftests/test-drm_dp_mst_helper.c    |  11 +-
 drivers/gpu/drm/ttm/ttm_range_manager.c       |   2 +-
 drivers/gpu/drm/v3d/v3d_drv.c                 |  36 ------
 22 files changed, 138 insertions(+), 126 deletions(-)
 create mode 100644 drivers/gpu/drm/radeon/radeon_device.h

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Andy Gross <andy.gross@ti.com>
Cc: by <jhartmann@precisioninsight.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Cc: Eric Anholt <eric@anholt.net>
Cc: Faith <faith@valinux.com>
Cc: Gareth Hughes <gareth@valinux.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: Jeff Hartmann <jhartmann@valinux.com>
Cc: Keith Whitwell <keith@tungstengraphics.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Clark <rob.clark@linaro.org>
Cc: Rob Clark <rob@ti.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
-- 
2.25.1

