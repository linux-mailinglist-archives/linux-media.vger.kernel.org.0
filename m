Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 331182B4CE6
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 18:32:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732914AbgKPRaN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 12:30:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732904AbgKPRaK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 12:30:10 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0F87C0613D1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:30:10 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id p19so359102wmg.0
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Va1cLVfZBuyh4JlQmULv5m72tMTELkHXMhBCanEGiFk=;
        b=kg89kpisOiiPWxBFPajM/LFhfdS+b0tsKznbVRE04wvACLChQ59pOp1AjNbVLxhE+p
         6MIE9UZlVKaFKE/qg1wR8fP2VQRkjxcFawUGpOYwA/J7O73TVuSzm8VYlA/K/jYPPcv7
         Gngzh3CfRJEMyALQ8GiuxgrVYN+aEMNN2xLMw4Qea6kGwmI8LNgE/n1qfwQ6PgiRiTjL
         R7FCgnTRKAgWqLsFDvcwsGwEFY0SPMp9e3hWK69NOFQsrELylOnnjtKLfV8VRJaOZqYD
         6SCPoxeIiLsbcwLPrzuHmpO0f3LmqvFdyS1zQZv9ZpcVIavTnqwdxHwnXmhjaMHkKH7+
         6yfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Va1cLVfZBuyh4JlQmULv5m72tMTELkHXMhBCanEGiFk=;
        b=c1B5N9MeO2hUheDhjmf//vPSAVA2lf1RRAg/MjcxpbqedgCTGxpYbVstL0aiTdpHhu
         qleX3Dx93BYeqkI/ERZfPX8/UUi5lMrmovrMMcra3zq1MMb+dOgp2oq7iL1BvRV60YN9
         gboEEJNvhNfWmHDG2BDDrUpzG20AP4XWS/dCCV9KvHxlExLWpVeNuas67r2QUrbMCG2e
         lTPyFppMdBxkK4+DFHvprFnk6Ovi5NfwbXsFmk2/A4RcBJk93HbjMhpI9cUjH+XtuHRO
         P64+UoxsNWyWh+gBVk654LWC3dkrY+Zy8+vwTO8sgAp5L8v08sjGh0IZSOCHseV/jI/Y
         CfPA==
X-Gm-Message-State: AOAM532buu0dJZaPHkxFu/4haRv1I8y4TUuambVA3QPgmvceHh4Hy66q
        KU2vo1J/8FfRZFZqeBoIFE/qMJ85yuQ+z/Lo
X-Google-Smtp-Source: ABdhPJzptdguR/7fiycWek3WAWaq9nJPjqjO31kcsOiAaXL5iD2olUi13t74DUfyOCXZJLVlt52Mzw==
X-Received: by 2002:a1c:c203:: with SMTP id s3mr16920694wmf.77.1605547809291;
        Mon, 16 Nov 2020 09:30:09 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id f23sm20054854wmb.43.2020.11.16.09.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:30:08 -0800 (PST)
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
Subject: [RESEND 00/43] Rid W=1 warnings from GPU 
Date:   Mon, 16 Nov 2020 17:29:22 +0000
Message-Id: <20201116173005.1825880-1-lee.jones@linaro.org>
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

