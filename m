Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98FB72AF847
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 19:37:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727676AbgKKSfu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Nov 2020 13:35:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbgKKSfu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 13:35:50 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB319C0613D1
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 10:35:49 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id 10so3173839wml.2
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 10:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M8WfWuBVHXpKLzkSsKEOW6BSD/IfhCkoHkgxrNpz2cI=;
        b=KgAnGRoSC1GGHgGKylBif9BORNSvke76zr6Ku+V2dpq5zX/ppUCMXa6BZ50PLao2Su
         wgMZIci54WmiIRlv8BP3RviUmpLeGnDrlWpT6nIPxFotxzTAPnKotPe48UujpPlgD+j1
         y1GFe4cT54dk/av5cvpir2oc4RKEJtEREIwDqO8uIAsrZA6vLqrSIwrugO7Kdxktf/1n
         APlL9KK3h7FFRXMHlz+ivY3DTvNGku3VsEE63RyF5f30IzuZl+NKcYSA4FkgXUhQm8Pl
         CSyACifcZE6IrPwhFTqwNJUSD2NAOtiS+lrdG37fTlJOeWaAa6tQWymx0POpAzKY9VAR
         fXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M8WfWuBVHXpKLzkSsKEOW6BSD/IfhCkoHkgxrNpz2cI=;
        b=OISsEG3zNpKA9iLGu9pif6lq/jRYnvKMtNUZPA2rPFToWD64RT3X/Cupy+850eldlN
         ZsdEXuWVbhSHA7c9f6LhciXi/9SQcv35G4bnLh0Y3mw5vDZndiylAY76PHznpD+Ej87u
         P36T2ECqex9ymjBrxR6LMpox2vwVv6VHHV06z+R2Vn8znrKht1qGPFbnQs6uYGgNdBt7
         UFi0oNrwBhE2WZwffEIWyGHR4manc81ozBVSOACne007Q4+OzxvKiKK3wqG40U6Y3lL3
         reL2tVCCYPeUXwwyQsge45C0v9Fk1XIDci19jzd48NbCZotkigu0NYjx6sjT0m7QviZ/
         iZZQ==
X-Gm-Message-State: AOAM530Go1WgzDnsWvO2WIAriD+x9BsdKd2mW3JVWZdm7YjzE3W2SP6A
        QeNZwCuCXDa2gkpjySu3sDdaLA==
X-Google-Smtp-Source: ABdhPJwzCQY8CRZfDnAapb8rqhTNiyryIG+qh+R7rglcXlJeolDgqhoxLc5LLh/U2O6/sDSnl1BcJQ==
X-Received: by 2002:a7b:cd92:: with SMTP id y18mr5624982wmj.178.1605119748648;
        Wed, 11 Nov 2020 10:35:48 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id k84sm3558311wmf.42.2020.11.11.10.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 10:35:47 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org,
        Slava Grigorev <slava.grigorev@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH 00/19] [Set 5] Rid W=1 warnings from GPU
Date:   Wed, 11 Nov 2020 18:35:26 +0000
Message-Id: <20201111183545.1756994-1-lee.jones@linaro.org>
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

This finishes cleaning up Radeon.  AMD next!

Lee Jones (19):
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

 drivers/gpu/drm/radeon/btc_dpm.c         |  3 +-
 drivers/gpu/drm/radeon/ci_dpm.c          | 13 +-----
 drivers/gpu/drm/radeon/cik.c             | 10 ++---
 drivers/gpu/drm/radeon/cik.h             | 40 ++++++++++++++++++
 drivers/gpu/drm/radeon/cik_sdma.c        |  3 +-
 drivers/gpu/drm/radeon/cypress_dpm.c     |  3 +-
 drivers/gpu/drm/radeon/dce6_afmt.c       |  1 +
 drivers/gpu/drm/radeon/dce6_afmt.h       | 52 ++++++++++++++++++++++++
 drivers/gpu/drm/radeon/evergreen.c       |  8 +---
 drivers/gpu/drm/radeon/evergreen.h       |  4 ++
 drivers/gpu/drm/radeon/evergreen_cs.c    |  3 +-
 drivers/gpu/drm/radeon/evergreen_dma.c   |  3 +-
 drivers/gpu/drm/radeon/ni.h              |  1 +
 drivers/gpu/drm/radeon/ni_dma.c          |  3 +-
 drivers/gpu/drm/radeon/ni_dpm.c          |  3 +-
 drivers/gpu/drm/radeon/r600.c            |  2 +-
 drivers/gpu/drm/radeon/r600.h            |  4 ++
 drivers/gpu/drm/radeon/r600_cs.c         |  1 +
 drivers/gpu/drm/radeon/radeon_atombios.c |  4 --
 drivers/gpu/drm/radeon/radeon_atombios.h |  8 ++++
 drivers/gpu/drm/radeon/radeon_audio.c    | 17 +-------
 drivers/gpu/drm/radeon/radeon_encoders.c |  6 +--
 drivers/gpu/drm/radeon/rv770_dpm.c       |  1 +
 drivers/gpu/drm/radeon/si.c              |  1 +
 drivers/gpu/drm/radeon/si.h              | 38 +++++++++++++++++
 drivers/gpu/drm/radeon/si_dma.c          |  3 +-
 drivers/gpu/drm/radeon/si_dpm.c          |  8 ++--
 drivers/gpu/drm/radeon/si_dpm.h          |  5 +++
 drivers/gpu/drm/radeon/trinity_dpm.c     |  2 +-
 drivers/gpu/drm/radeon/vce.h             | 35 ++++++++++++++++
 drivers/gpu/drm/radeon/vce_v1_0.c        |  1 +
 drivers/gpu/drm/radeon/vce_v2_0.c        |  1 +
 32 files changed, 215 insertions(+), 72 deletions(-)
 create mode 100644 drivers/gpu/drm/radeon/cik.h
 create mode 100644 drivers/gpu/drm/radeon/dce6_afmt.h
 create mode 100644 drivers/gpu/drm/radeon/si.h
 create mode 100644 drivers/gpu/drm/radeon/vce.h

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-media@vger.kernel.org
Cc: Slava Grigorev <slava.grigorev@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
-- 
2.25.1

