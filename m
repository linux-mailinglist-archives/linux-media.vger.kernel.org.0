Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC4FB2B4D5B
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 18:38:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733083AbgKPRhG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 12:37:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732846AbgKPRhF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 12:37:05 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55E5CC0613D1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:37:05 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id 23so19603945wrc.8
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rnCmLL25pCLDNOYAVS5vRDXtM8wklwyGg+VrKx5Ma2A=;
        b=tllhDcFg6v1aQCkXpAymrypD3GV4OHum5p2/WrHJOhw21jBh1tzJJ5YQH3+f8rLq90
         8fToMihvovq8zyX5/I8FXSc5WZkHtOfg5oa2zOsz6xOUoH8dFamywrLBkG1OT13Xw1oP
         il6O++szmQO7CqwAPSxzz6EWh12ZQrDN4J7e/mbQ0NURGC7pTuhl5MwwChSE5D1Il1lk
         HpwEfmWYN3pcLtOPHZ92fsiQtU0aldoiGcEJkWSyVvHh8bIcdsaplMyuupmxeuax+ogU
         FRrxHweR5keMnn03xWcpPltyvudJv0QJkfwjngh09FALkU07xOZv4vXBx7iTdqHZiRWJ
         xwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rnCmLL25pCLDNOYAVS5vRDXtM8wklwyGg+VrKx5Ma2A=;
        b=L2wj/tLss5YT7UEQu2SLZ7vpYyeAEUbSbPJD9A+hustJqi01KNttOnurPDmfj+0zC+
         YIVFulxYkmx/zuUWXIht9Ssb8wPjQF5dz7S2AV0hebgRUh918O8QYR3En2XlEHDw67HE
         53RnW41GEYRDW2fUWq2GrIjR0ZGUaTImiYMakFQyaEpIdgtDew3KmBNu1whBTXQtHwrB
         227sExhYSVy1BI/maWFEdDgIK6c4jG+LhFNdDJX7kkkjV+ivL03m5DM+bHFa7z26VHWT
         U2f9+xQjPR1Ss7CHusynaGHxhFko4Uy7ZKDVIatREyFKb/v2Y1/ONpcnztO2G72qwg93
         SJIw==
X-Gm-Message-State: AOAM531TfwDTouyOYwkNNpxO1FBTKbomf+rgLkgm+0frlcdUDLaIp+Jn
        trXIVj1fG+4K4TxCdUS44MVfOMBaw/LizuHt
X-Google-Smtp-Source: ABdhPJzrvRFR93QE2mlsw9W/o6xTJR2iMN7IxdLb1TO4poszSjTKNNTUHXJ0m0aAMJICbuU0sVIMwQ==
X-Received: by 2002:adf:cf0b:: with SMTP id o11mr20096726wrj.162.1605548223950;
        Mon, 16 Nov 2020 09:37:03 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:37:03 -0800 (PST)
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
        Slava Grigorev <slava.grigorev@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [RESEND v2 00/43] Rid W=1 warnings from GPU
Date:   Mon, 16 Nov 2020 17:36:17 +0000
Message-Id: <20201116173700.1830487-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[sending again, as `git send-email` crashed!]

This set contains fixes for some "wouldn't it be nice if" issues,
however most of the patches seen here have been on the MLs, but
were left unreviewed.

Lee Jones (43):
  drm/radeon/atombios_encoders: Move 'radeon_atom_get_tv_timings()'s
    prototype into shared location
  drm/radeon/radeon: Move prototype into shared header
  drm/radeon/radeon_kms: Move 'radeon_*_kms' prototypes to shared header
  drm/radeon/radeon_kms: Fix misnaming of 'radeon_info_ioctl's dev param
  drm/radeon: Move radeon_ttm{init,fini} to shared location
  drm/radeon/radeon_legacy_encoders: Move 'radeon_add_legacy_encoder'
    prototype to shared header
  drm/radeon/radeon_legacy_encoders: Move 'radeon_add_legacy_encoder's
    prototype to shared location
  drm/radeon/radeon_irq_kms: Demote non-conformant kernel-doc fix
    another
  drm/radeon/rv770: Move 'rv770_set_clk_bypass_mode' prototype to shared
    location
  drm/radeon/radeon_pm: Move 'radeon_pm_acpi_event_handler' prototype
    into shared header
  drm/radeon/radeon_audio: Move 'dce3_2_*' prototypes to shared location
  drm/radeon/evergreen: Move 'evergreen_*' and 'sumo_*' prototypes out
    to shared location
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
  drm/radeon/ni_dpm: Move 'ni_get_{pi,ps}()'s into shared header
  drm/radeon/evergreen: Move 'cayman_*()'s prototypes to shared header
  drm/radeon/r600_dma: Move 'r600_gpu_check_soft_reset()'s prototype to
    shared location
  drm/radeon/cik: Move 'r600_ih_ring_{alloc,fini}()'s prototypes to
    shared header
  drm/radeon/evergreen_dma: Move 'evergreen_gpu_check_soft_reset()'s
    prototype to shared header
  drm/radeon/r600: Move 'evergreen_rlc_resume()'s prototype to shared
    header
  drm/radeon/ni_dma: Move 'cayman_gpu_check_soft_reset()'s prototype to
    shared header
  drm/radeon/radeon_atombios: Move 'radeon_add_atom_encoder()'s
    prototype to shared header
  drm/radeon/radeon_encoders: Move 'radeon_atom_backlight_init's
    prototype to shared header
  drm/radeon/ci_dpm: Move 'ci_*()'s prototypes to shared header
  drm/radeon/si_dpm: Move 'si_mc_load_microcode()'s prototype to shared
    header
  drm/radeon/si_dma: Move 'si_gpu_check_soft_reset()'s prototype to
    shared header
  drm/radeon/cik: Move 'si_*()'s prototypes to shared header
  drm/radeon/btc_dpm: Move 'evergreen_get_pi's prototype to shared
    header
  drm/radeon/radeon_audio: Move 'dce6_*()'s prototypes to shared header
  drm/radeon/evergreen: Move 'si_get_csb_*()'s prototypes to shared
    header
  drm/radeon/cik_sdma: Move 'amdgpu_cik_gpu_check_soft_reset()'s
    prototype to shared header
  drm/radeon/evergreen: Move 'cik_*()'s prototypes to shared header
  drm/radeon/ci_dpm: Move 'si_*()'s prototypes to shared header
  drm/radeon/cik: Move 'Move 'cik_sdma_*()'s prototypes to shared header
  drm/radeon/si_dpm: Move 'vce_v1_0_enable_mgcg()'s prototype to shared
    header
  drm/radeon/cik: Move 'vce_v2_0_enable_mgcg()'s prototype to shared
    header
  drm/radeon/evergreen_cs: Move 'r600_dma_cs_next_reloc()'s prototype to
    shared header
  drm/radeon/radeon_audio: Move 'r600_*' prototypes into shared header
  drm/radeon/radeon_drv: Move 'radeon_gem_prime_import_sg_table()'s
    prototype to shared header

 drivers/gpu/drm/radeon/atom.h                 |  7 ++
 drivers/gpu/drm/radeon/atombios_encoders.c    |  5 +-
 drivers/gpu/drm/radeon/btc_dpm.c              |  6 +-
 drivers/gpu/drm/radeon/ci_dpm.c               | 13 +---
 drivers/gpu/drm/radeon/cik.c                  | 19 ++---
 drivers/gpu/drm/radeon/cik.h                  | 40 +++++++++++
 drivers/gpu/drm/radeon/cik_sdma.c             |  3 +-
 drivers/gpu/drm/radeon/cypress_dpm.c          |  6 +-
 drivers/gpu/drm/radeon/dce6_afmt.c            |  1 +
 drivers/gpu/drm/radeon/dce6_afmt.h            | 52 ++++++++++++++
 drivers/gpu/drm/radeon/evergreen.c            | 16 ++---
 drivers/gpu/drm/radeon/evergreen.h            | 55 +++++++++++++++
 drivers/gpu/drm/radeon/evergreen_cs.c         |  3 +-
 drivers/gpu/drm/radeon/evergreen_dma.c        |  3 +-
 drivers/gpu/drm/radeon/evergreen_hdmi.c       |  1 +
 drivers/gpu/drm/radeon/evergreen_hdmi.h       | 69 +++++++++++++++++++
 drivers/gpu/drm/radeon/ni.c                   | 17 +----
 drivers/gpu/drm/radeon/ni.h                   | 39 +++++++++++
 drivers/gpu/drm/radeon/ni_dma.c               |  3 +-
 drivers/gpu/drm/radeon/ni_dpm.c               |  5 +-
 drivers/gpu/drm/radeon/ni_dpm.h               |  3 +
 drivers/gpu/drm/radeon/r600.c                 |  5 +-
 drivers/gpu/drm/radeon/r600.h                 | 58 ++++++++++++++++
 drivers/gpu/drm/radeon/r600_cs.c              |  1 +
 drivers/gpu/drm/radeon/r600_dma.c             |  3 +-
 drivers/gpu/drm/radeon/r600_hdmi.c            |  1 +
 drivers/gpu/drm/radeon/radeon_acpi.c          |  3 +-
 drivers/gpu/drm/radeon/radeon_atombios.c      | 11 +--
 drivers/gpu/drm/radeon/radeon_atombios.h      | 45 ++++++++++++
 drivers/gpu/drm/radeon/radeon_audio.c         | 68 +-----------------
 drivers/gpu/drm/radeon/radeon_audio.h         | 12 ++++
 drivers/gpu/drm/radeon/radeon_combios.c       |  6 +-
 drivers/gpu/drm/radeon/radeon_device.c        |  1 +
 drivers/gpu/drm/radeon/radeon_device.h        | 32 +++++++++
 drivers/gpu/drm/radeon/radeon_display.c       |  1 +
 drivers/gpu/drm/radeon/radeon_drv.c           | 14 ++--
 drivers/gpu/drm/radeon/radeon_encoders.c      | 10 +--
 drivers/gpu/drm/radeon/radeon_gem.c           |  1 +
 drivers/gpu/drm/radeon/radeon_i2c.c           |  4 --
 drivers/gpu/drm/radeon/radeon_irq_kms.c       |  9 ++-
 drivers/gpu/drm/radeon/radeon_kms.c           |  3 +-
 drivers/gpu/drm/radeon/radeon_kms.h           | 40 +++++++++++
 .../gpu/drm/radeon/radeon_legacy_encoders.c   |  1 +
 .../gpu/drm/radeon/radeon_legacy_encoders.h   | 36 ++++++++++
 drivers/gpu/drm/radeon/radeon_object.c        |  3 +-
 drivers/gpu/drm/radeon/radeon_pm.c            |  1 +
 drivers/gpu/drm/radeon/radeon_pm.h            | 33 +++++++++
 drivers/gpu/drm/radeon/radeon_prime.c         |  1 +
 drivers/gpu/drm/radeon/radeon_prime.h         | 42 +++++++++++
 drivers/gpu/drm/radeon/radeon_ttm.c           |  1 +
 drivers/gpu/drm/radeon/radeon_ttm.h           | 37 ++++++++++
 drivers/gpu/drm/radeon/rv730_dpm.c            |  4 +-
 drivers/gpu/drm/radeon/rv740_dpm.c            |  3 +-
 drivers/gpu/drm/radeon/rv770.c                |  1 +
 drivers/gpu/drm/radeon/rv770.h                | 39 +++++++++++
 drivers/gpu/drm/radeon/rv770_dpm.c            |  2 +
 drivers/gpu/drm/radeon/si.c                   | 11 +--
 drivers/gpu/drm/radeon/si.h                   | 38 ++++++++++
 drivers/gpu/drm/radeon/si_dma.c               |  3 +-
 drivers/gpu/drm/radeon/si_dpm.c               | 13 ++--
 drivers/gpu/drm/radeon/si_dpm.h               |  5 ++
 drivers/gpu/drm/radeon/trinity_dpm.c          |  2 +-
 drivers/gpu/drm/radeon/vce.h                  | 35 ++++++++++
 drivers/gpu/drm/radeon/vce_v1_0.c             |  1 +
 drivers/gpu/drm/radeon/vce_v2_0.c             |  1 +
 65 files changed, 794 insertions(+), 213 deletions(-)
 create mode 100644 drivers/gpu/drm/radeon/cik.h
 create mode 100644 drivers/gpu/drm/radeon/dce6_afmt.h
 create mode 100644 drivers/gpu/drm/radeon/evergreen.h
 create mode 100644 drivers/gpu/drm/radeon/evergreen_hdmi.h
 create mode 100644 drivers/gpu/drm/radeon/ni.h
 create mode 100644 drivers/gpu/drm/radeon/r600.h
 create mode 100644 drivers/gpu/drm/radeon/radeon_atombios.h
 create mode 100644 drivers/gpu/drm/radeon/radeon_device.h
 create mode 100644 drivers/gpu/drm/radeon/radeon_kms.h
 create mode 100644 drivers/gpu/drm/radeon/radeon_legacy_encoders.h
 create mode 100644 drivers/gpu/drm/radeon/radeon_pm.h
 create mode 100644 drivers/gpu/drm/radeon/radeon_prime.h
 create mode 100644 drivers/gpu/drm/radeon/radeon_ttm.h
 create mode 100644 drivers/gpu/drm/radeon/rv770.h
 create mode 100644 drivers/gpu/drm/radeon/si.h
 create mode 100644 drivers/gpu/drm/radeon/vce.h

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
Cc: Slava Grigorev <slava.grigorev@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
-- 
2.25.1

