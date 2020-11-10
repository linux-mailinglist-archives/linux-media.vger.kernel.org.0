Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE3D2ADFBC
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 20:34:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731561AbgKJTbY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 14:31:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730174AbgKJTbT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 14:31:19 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C8EEC0613D1
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2020 11:31:18 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id p22so4335706wmg.3
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2020 11:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KIXfXFuPLwXB8GBq2vAXvcC0I8sjkpobgKWKDNLykA0=;
        b=JUjEt2lFTR0iG+Eax3c3Pz0DLhpVkOTbzfvPcFTnuFbl4T6oTJV0Zc7K8h38ORBupm
         LnUCDldwHm6asihRgXVog41ewvNS+DvA3Z4UVggb1yTKNJ0mxZ2g6LNqva90dcXt6X5J
         fobritNfiLBI98bcZgFSXqyHYfGz7U4rET2OCpyhknHb8S7tInueAF+1HOs6aKyLXmpd
         KMmeK10S1GMHx/K/meqnfS+1y0XTXMEh9SKSLUJT7uC0Y7gk7z/NrJNPEpQ3JVJXIqrb
         httUzSxj0LSNTTxrbGnPVL1yY++5MnASDBwRFeKz222eEdk/7LOFN4fcIUs5kJUoRqoK
         AguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KIXfXFuPLwXB8GBq2vAXvcC0I8sjkpobgKWKDNLykA0=;
        b=Lz2Sxk/uAgU24A88PHlrlPSnQy80h16Hx7pmZNAAe+FyPbtsYBmccwKFZUkWwjWrkj
         iuO7UOjkElRv01ArOve2K+u8GBFn7sAOlOOUWx3ZPeOtUysVhOYlpCVBzbhRi48j/3kA
         adsMVdwdeEUVizMi2isycoy48C1/ct/1o5Vd7esRCjKwdL06yDF+wtC77M9nc1M/QG4B
         +xla/Rr8vW498uddiLhZDrkRMjwgSULJVgyfr8WTdYNrJvpNL1dVk2zp9hRzw359C+GF
         CdtY1Qi4cPqXHyPC+/Tynkwrd9GRcmkj8wU7MhXC5jqkM2YDKzxNynQKQMhxIjCYjtfC
         xlpQ==
X-Gm-Message-State: AOAM531cU3bhaOLT1WUwD/qlDLH4GDah15yehe6XaDFabYiga3kPCWya
        xSCrBUaJTCnx0pIXHZi/qyzTFg==
X-Google-Smtp-Source: ABdhPJz6SD75kp2GNtnOY5W0GnwQsi2T981/R3O4DcB3jOoL9Zl9xgJ43TkfqHYvJiBjI4G7lgl67A==
X-Received: by 2002:a1c:190:: with SMTP id 138mr665338wmb.113.1605036676569;
        Tue, 10 Nov 2020 11:31:16 -0800 (PST)
Received: from dell.default ([91.110.221.139])
        by smtp.gmail.com with ESMTPSA id 30sm17635335wrs.84.2020.11.10.11.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 11:31:15 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, Evan Quan <evan.quan@amd.com>,
        Gareth Hughes <gareth@valinux.com>,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH 00/30] [Set 4] Rid W=1 warnings from GPU
Date:   Tue, 10 Nov 2020 19:30:42 +0000
Message-Id: <20201110193112.988999-1-lee.jones@linaro.org>
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

Exciting times (using Arm as the benchmark):

 Before these sets:
  5031 drivers/gpu/
   3923 drivers/gpu/drm/amd/
    258 drivers/gpu/drm/radeon/
     95 drivers/gpu/drm/nouveau/
     77 drivers/gpu/drm/msm/

 After these sets:
  2236 drivers/gpu/
    1949 drivers/gpu/drm/amd/
      97 drivers/gpu/drm/nouveau/
      83 drivers/gpu/drm/msm/
      40 drivers/gpu/drm/radeon

Couple more to go.

Plan is to finsish off Radeon, then start targeting AMD tomorrow.

Lee Jones (30):
  drm/radeon/evergreen: Add comment for 'evergreen_page_flip()'s 'async'
    param
  drm/radeon/evergreen: Remove set but unused variable 'mc_shared_chmap'
  drm/radeon/ni: Demote vague attempt at function header doc
  drm/radeon/si: Remove set but unused variable 'mc_shared_chmap'
  drm/radeon/cik: Remove set but unused variable 'mc_shared_chmap'
  drm/radeon/trinity_dpm: Remove some defined but never used arrays
  drm/radeon/kv_dpm: Strip out unused functions and their tables
  drm/radeon/ci_dpm: Remove set but unused variable 'dpm_event_src'
  drm/radeon/radeon_vm: Fix some function parameter documentation
  drm/radeon/radeon_sync: Add description for function param 'rdev'
  drm/radeon/radeon_ib: Supply description for 'radeon_ib_get's get
    param
  drm/radeon/radeon_dp_mst: Remove unused variable 'ret' from
    radeon_mst_encoder_dpms()
  drm/radeon/radeon_mn: Supply description for 'cur_seq' even if it is
    unused
  drm/radeon/evergreen_dma: Fix doc-rot of function parameter 'resv'
  drm/radeon/cik_sdma: Demote vague attempt at kernel-doc
  drm/radeon/r100: Fix some kernel-doc formatting, misnaming and missing
    issues
  drm/radeon/r600_cs: Fix some doc-rot and supply missing function param
    docs
  drm/radeon/evergreen_cs: Fix misnaming issues surrounding 'p' param
  drm/radeon/radeon_drv: Move 'radeon_mmap()'s prototype to shared
    header
  drm/radeon/radeon_drv: Move 'radeon_driver_irq_handler_kms's prototype
    into shared header
  drm/radeon/atom: Move 'radeon_atom_hw_i2c_*()'s prototypes into shared
    header
  drm/radeon/radeon_gem: Move 'radeon_gem_prime_*()'s prototypes to
    shared header
  drm/radeon/evergreen_hdmi: Move 'evergreen_*()' and 'dce4_*()' HDMI
    prototypes to shared header
  drm/radeon/rv770: Move 'rv770_get_*()'s prototypes to shared header
  drm/radeon/sumo_dpm: Move 'sumo_get_pi()'s prototype into shared
    header
  drm/radeon/ni_dpm: Move 'ni_get_{pi,ps}()'s into shared header
  drm/radeon/ni: Remove set but unused variable 'mc_shared_chmap'
  drm/radeon/evergreen: Move 'cayman_*()'s prototypes to shared header
  drm/radeon/r600_dma: Move 'r600_gpu_check_soft_reset()'s prototype to
    shared location
  drm/radeon/cik: Move 'r600_ih_ring_{alloc,fini}()'s prototypes to
    shared header

 drivers/gpu/drm/radeon/atom.h           |   6 +
 drivers/gpu/drm/radeon/btc_dpm.c        |   3 +-
 drivers/gpu/drm/radeon/ci_dpm.c         |  12 --
 drivers/gpu/drm/radeon/cik.c            |   7 +-
 drivers/gpu/drm/radeon/cik_sdma.c       |   4 +-
 drivers/gpu/drm/radeon/cypress_dpm.c    |   3 +-
 drivers/gpu/drm/radeon/evergreen.c      |  10 +-
 drivers/gpu/drm/radeon/evergreen_cs.c   |   6 +-
 drivers/gpu/drm/radeon/evergreen_dma.c  |   2 +-
 drivers/gpu/drm/radeon/evergreen_hdmi.c |   1 +
 drivers/gpu/drm/radeon/evergreen_hdmi.h |  69 ++++++++
 drivers/gpu/drm/radeon/kv_dpm.c         | 205 +-----------------------
 drivers/gpu/drm/radeon/ni.c             |   9 +-
 drivers/gpu/drm/radeon/ni.h             |  36 +++++
 drivers/gpu/drm/radeon/ni_dpm.c         |   2 +-
 drivers/gpu/drm/radeon/ni_dpm.h         |   3 +
 drivers/gpu/drm/radeon/r100.c           |   7 +-
 drivers/gpu/drm/radeon/r600.c           |   1 +
 drivers/gpu/drm/radeon/r600.h           |  35 ++++
 drivers/gpu/drm/radeon/r600_cs.c        |   9 +-
 drivers/gpu/drm/radeon/r600_dma.c       |   3 +-
 drivers/gpu/drm/radeon/radeon_audio.c   |  26 +--
 drivers/gpu/drm/radeon/radeon_dp_mst.c  |  16 +-
 drivers/gpu/drm/radeon/radeon_drv.c     |   7 +-
 drivers/gpu/drm/radeon/radeon_gem.c     |   9 +-
 drivers/gpu/drm/radeon/radeon_i2c.c     |   4 -
 drivers/gpu/drm/radeon/radeon_ib.c      |   1 +
 drivers/gpu/drm/radeon/radeon_irq_kms.c |   1 +
 drivers/gpu/drm/radeon/radeon_kms.h     |   5 +
 drivers/gpu/drm/radeon/radeon_mn.c      |   1 +
 drivers/gpu/drm/radeon/radeon_prime.c   |   1 +
 drivers/gpu/drm/radeon/radeon_prime.h   |  39 +++++
 drivers/gpu/drm/radeon/radeon_sync.c    |   1 +
 drivers/gpu/drm/radeon/radeon_ttm.h     |   1 +
 drivers/gpu/drm/radeon/radeon_vm.c      |   8 +-
 drivers/gpu/drm/radeon/rv730_dpm.c      |   4 +-
 drivers/gpu/drm/radeon/rv740_dpm.c      |   3 +-
 drivers/gpu/drm/radeon/rv770.h          |   5 +
 drivers/gpu/drm/radeon/rv770_dpm.c      |   1 +
 drivers/gpu/drm/radeon/si.c             |   7 +-
 drivers/gpu/drm/radeon/si_dpm.c         |   5 +-
 drivers/gpu/drm/radeon/sumo_dpm.h       |   1 +
 drivers/gpu/drm/radeon/sumo_smc.c       |   2 -
 drivers/gpu/drm/radeon/trinity_dpm.c    |  44 -----
 44 files changed, 261 insertions(+), 364 deletions(-)
 create mode 100644 drivers/gpu/drm/radeon/evergreen_hdmi.h
 create mode 100644 drivers/gpu/drm/radeon/ni.h
 create mode 100644 drivers/gpu/drm/radeon/r600.h
 create mode 100644 drivers/gpu/drm/radeon/radeon_prime.h

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Cc: Evan Quan <evan.quan@amd.com>
Cc: Gareth Hughes <gareth@valinux.com>
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-media@vger.kernel.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>
-- 
2.25.1

