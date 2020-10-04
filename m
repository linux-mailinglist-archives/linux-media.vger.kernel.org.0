Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBCB0282CF2
	for <lists+linux-media@lfdr.de>; Sun,  4 Oct 2020 21:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbgJDTVH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Oct 2020 15:21:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbgJDTVH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 4 Oct 2020 15:21:07 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02A56C0613CE;
        Sun,  4 Oct 2020 12:21:06 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id t7so4189146pjd.3;
        Sun, 04 Oct 2020 12:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NaCk20iXyuPTfKj7M2JUxIMfw5amxERCJiUzQ3nZIzw=;
        b=qLZ7yrwgSd/akc7eV6/QqOdy2cpN4vxD1+cGMw+6nQlnrAM2UZycdrJBDVwy2ZkQRb
         xC4WpSFYCCyY0OUWODWft0c/35uhpBNx8dH4AFJ/IyfTmm7Vn7Pl2zSZFVn+RSln8rpa
         CFPtjh+xNXqodhAnEfHy97iDZ3EiCslpM/nfHjXqsetR2TG+y9yTQqkZYgOg7Y4Rs4Ae
         VRLsNKzNkpUbNebvSNydUkerVDETuPn0O6nx6PcpMn2nDpzQ0FRiuwzW7BFimvVdFzFq
         3iKLJqkXQOoctnge+U5GN8rfPo1F92zdzWxDRlIk+1Mkias13Y3zxntZVoW6y7bcV82M
         EUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NaCk20iXyuPTfKj7M2JUxIMfw5amxERCJiUzQ3nZIzw=;
        b=cwB9sOH+2XoS1IFaxHjitaUDCzvyJkWmWJlH+c/X9Q7lYlXsXEKpOQUo6SN1h5GpWh
         185Y8Yf4q+GR1kOWJVn4aFM+me0TSzhzPH6ekCOzsXWN+gk0RzJNHzSEm+nH8WRdRTWg
         t/Da9CUdlQvPkr5tolL/4SE5aj6MSJVkNj6hVrottrhvster21JQmM95/vx8w0Ddcgek
         miHdKy1Pv1rTujsaYK/yjopwgZxaBjQHsqONttQd0kglSfm24/Q7ixftZEKhMVtdWeBu
         8rn4VpqEh5CBNo+/HMxtumXekZbhQzbDWavKVWH6HbWAZdnQsLjFwSyLFYM/8e+RyauS
         ngPg==
X-Gm-Message-State: AOAM532n+0sjR45LRnWmz8liCHTq4jdtxFTWci6iea2L1qyznCJvEgLF
        bPtk+zU/RqGepvCYHC1hMSk=
X-Google-Smtp-Source: ABdhPJw6EeahDTBukuHlSW+cuZeQsk0WyBpaFt45uII85OHJoQALlKnmpO8sL4EXjaYoZMnUsCbVdg==
X-Received: by 2002:a17:90a:71c7:: with SMTP id m7mr13818070pjs.190.1601839266264;
        Sun, 04 Oct 2020 12:21:06 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id m188sm9772226pfd.56.2020.10.04.12.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 12:21:04 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Emil Velikov <emil.velikov@collabora.com>,
        Eric Anholt <eric@anholt.net>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK),
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
        Sam Ravnborg <sam@ravnborg.org>,
        Sharat Masetty <smasetty@codeaurora.org>
Subject: [PATCH 00/14] drm/msm: de-struct_mutex-ification
Date:   Sun,  4 Oct 2020 12:21:32 -0700
Message-Id: <20201004192152.3298573-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This doesn't remove *all* the struct_mutex, but it covers the worst
of it, ie. shrinker/madvise/free/retire.  The submit path still uses
struct_mutex, but it still needs *something* serialize a portion of
the submit path, and lock_stat mostly just shows the lock contention
there being with other submits.  And there are a few other bits of
struct_mutex usage in less critical paths (debugfs, etc).  But this
seems like a reasonable step in the right direction.

Rob Clark (14):
  drm/msm: Use correct drm_gem_object_put() in fail case
  drm/msm: Drop chatty trace
  drm/msm: Move update_fences()
  drm/msm: Add priv->mm_lock to protect active/inactive lists
  drm/msm: Document and rename preempt_lock
  drm/msm: Protect ring->submits with it's own lock
  drm/msm: Refcount submits
  drm/msm: Remove obj->gpu
  drm/msm: Drop struct_mutex from the retire path
  drm/msm: Drop struct_mutex in free_object() path
  drm/msm: remove msm_gem_free_work
  drm/msm: drop struct_mutex in madvise path
  drm/msm: Drop struct_mutex in shrinker path
  drm/msm: Don't implicit-sync if only a single ring

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  4 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 12 +--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  4 +-
 drivers/gpu/drm/msm/msm_debugfs.c         |  7 ++
 drivers/gpu/drm/msm/msm_drv.c             | 15 +---
 drivers/gpu/drm/msm/msm_drv.h             | 19 +++--
 drivers/gpu/drm/msm/msm_gem.c             | 76 ++++++------------
 drivers/gpu/drm/msm/msm_gem.h             | 53 +++++++++----
 drivers/gpu/drm/msm/msm_gem_shrinker.c    | 58 ++------------
 drivers/gpu/drm/msm/msm_gem_submit.c      | 17 ++--
 drivers/gpu/drm/msm/msm_gpu.c             | 96 ++++++++++++++---------
 drivers/gpu/drm/msm/msm_gpu.h             |  5 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c      |  3 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h      | 13 ++-
 14 files changed, 188 insertions(+), 194 deletions(-)

-- 
2.26.2

