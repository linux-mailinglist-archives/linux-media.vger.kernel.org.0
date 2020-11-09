Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 865A42AC6CB
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 22:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729454AbgKIVTF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 16:19:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgKIVTE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 16:19:04 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5644C0613D3
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 13:19:03 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 23so714017wmg.1
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2020 13:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2BhrCBQbfmRZLpUpWXEUFmjezg6+PE2LAePTP+SbH+M=;
        b=I22RgE4HXQJeXrkMywCF0c58g4ymKrdb1XIqYmVJ1l9107iR/zllJYlW3Y4+0HjqrF
         1I7kG3IH0cp0ttyXHv+taVnH4EPBaUNMw9TtUzzpG1WgzAYwfitziY8a5dX1gkdf/LMf
         mGF0vNXCsvS5V8SwO72SFSKOF/cqAKQbKmX9wG1rfk0fhT4ODNDYf/5xjX5CxgczZUEV
         RZ19ryEavZUYOV0g/+JuaeTszemLVfeMLtBO4nnLEvMLP4Idr7jpF+lCOAwW9rDXq7UI
         Ad/i0MkTkUAjIesyKCTDPOxNkRdjmCLfl/mnLKfGr5GQbuZjKGNq+uIgAgONjAGwglkn
         vOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2BhrCBQbfmRZLpUpWXEUFmjezg6+PE2LAePTP+SbH+M=;
        b=CzAirpcz12rj4rOeuGUOHnt6NJv+ij7bqw2Nf8YloDpTsA8kTV2roHdQhHpUXr4s5A
         MD6dDTlYBDKX3vl5P+qGZwS5rSmq57XrdEOMFKUiM/4u6lKPzQk2CK1zW3HfvVbsbnkn
         8u0h6fNLJ89oMySLFCOovULfl9wLpC6V7rxHFpgOFOWL4eqJJF7MxKKXWPniku/n2XLJ
         EuXTGvJFGCWgQfOEFtg7YTXrxUnzL7U5mUMumH6a0A1+a4fPPJih1GYMZ920WDwBedoE
         aoInRDRS4lST+70buOLZAnposLyMm3W/jNQRGjfIFrF70tOF9pQNbY19/z8Qts2rUrR6
         TW0g==
X-Gm-Message-State: AOAM530qTi60pI4TbqfyrICnk+4Wt2PvvYGQt3Ow0G/1WbtSpfvjaM+b
        BPl2lRZORk66oSkAcqzllZ/fQA==
X-Google-Smtp-Source: ABdhPJzdcwB8rqaq7cQDbwgS0YbQzyJ5wsfTzVscX3fNhQZDc+xbcBkBa39JWEwmNBKdxoSM6DhCFQ==
X-Received: by 2002:a1c:f604:: with SMTP id w4mr1126625wmc.87.1604956740794;
        Mon, 09 Nov 2020 13:19:00 -0800 (PST)
Received: from dell.default ([91.110.221.139])
        by smtp.gmail.com with ESMTPSA id 71sm15170630wrm.20.2020.11.09.13.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 13:18:59 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Jerome Glisse <glisse@freedesktop.org>,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        report to <xorg-driver-ati@lists.x.org>,
        Slava Grigorev <slava.grigorev@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH 00/20] [Set 3] Rid W=1 warnings from GPU
Date:   Mon,  9 Nov 2020 21:18:35 +0000
Message-Id: <20201109211855.3340030-1-lee.jones@linaro.org>
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

This set takes the running (decreasing) total from 5000 before
[Set 1] down to 2300.

Lee Jones (20):
  drm/radeon/radeon_ttm: Place declaration of 'rdev' in same clause as
    its use
  drm/radeon: Move radeon_ttm{init,fini} to shared location
  drm/radeon/radeon_fence: Demote some non-conformant kernel-doc headers
    and fix another
  drm/radeon: Move 'radeon_add_legacy_encoder' prototype to shared
    header
  drm/radeon: Move 'radeon_add_legacy_encoder's prototype to shared
    location
  drm/radeon/radeon_connectors: Strip out set but unused variable 'ret'
  drm/radeon/radeon_display: Remove unused variable 'mod'
  drm/radeon/radeon_i2c: Remove pointless function header
  drm/radeon/radeon_irq_kms: Demote non-conformant kernel-doc fix
    another
  drm/radeon/radeon_ring: Add missing function parameters 'rdev' and
    'data'
  drm/radeon/r600: Strip out set but unused 'tmp' variables
  drm/radeon/radeon_cs: Fix a bunch of doc-rot issues
  drm/radeon/evergreen: Move 'rv770_set_clk_bypass_mode' prototype to
    shared location
  drm/radeon: Move 'radeon_pm_acpi_event_handler' prototype into shared
    header
  drm/radeon/r600d: Move 'rc600_*' prototypes into shared header
  drm/radeon/radeon_audio: Move 'dce3_2_*' prototypes to shared location
  drm/radeon/evergreend: Move 'evergreen_*' and 'sumo_*' prototypes out
    to shared location
  drm/radeon/radeon_display: Fix function doc formatting and missing
    param issues
  drm/radeon/r600: Fix a misnamed parameter description and a formatting
    issue
  drm/radeon/cik: Fix a bunch of function parameter descriptions

 drivers/gpu/drm/radeon/cik.c               | 10 +++----
 drivers/gpu/drm/radeon/evergreen.c         |  1 -
 drivers/gpu/drm/radeon/ni.c                | 16 ----------
 drivers/gpu/drm/radeon/r600.c              | 11 +++----
 drivers/gpu/drm/radeon/r600d.h             | 14 +++++++++
 drivers/gpu/drm/radeon/radeon.h            | 34 ++++++++++++++++++++++
 drivers/gpu/drm/radeon/radeon_acpi.c       |  2 --
 drivers/gpu/drm/radeon/radeon_atombios.c   |  5 ----
 drivers/gpu/drm/radeon/radeon_audio.c      | 23 +--------------
 drivers/gpu/drm/radeon/radeon_audio.h      | 12 ++++++++
 drivers/gpu/drm/radeon/radeon_combios.c    |  5 ----
 drivers/gpu/drm/radeon/radeon_connectors.c |  4 +--
 drivers/gpu/drm/radeon/radeon_cs.c         | 12 ++++----
 drivers/gpu/drm/radeon/radeon_display.c    | 17 +++++------
 drivers/gpu/drm/radeon/radeon_encoders.c   |  3 --
 drivers/gpu/drm/radeon/radeon_fence.c      |  6 ++--
 drivers/gpu/drm/radeon/radeon_i2c.c        |  4 ---
 drivers/gpu/drm/radeon/radeon_irq_kms.c    |  6 ++--
 drivers/gpu/drm/radeon/radeon_object.c     |  2 --
 drivers/gpu/drm/radeon/radeon_ring.c       |  3 ++
 drivers/gpu/drm/radeon/radeon_ttm.c        |  8 ++---
 drivers/gpu/drm/radeon/si.c                |  6 ----
 22 files changed, 96 insertions(+), 108 deletions(-)

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Cc: Jerome Glisse <glisse@freedesktop.org>
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-media@vger.kernel.org
Cc: report to <xorg-driver-ati@lists.x.org>
Cc: Slava Grigorev <slava.grigorev@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
-- 
2.25.1

