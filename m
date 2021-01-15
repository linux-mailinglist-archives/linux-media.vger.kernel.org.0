Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A42B2F83D6
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 19:17:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388354AbhAOSQs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 13:16:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727711AbhAOSQr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 13:16:47 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EDE9C0613D3
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 10:16:07 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id v15so6548338wrx.4
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 10:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nN4YS0/OMIRscREPk7XlxtO6CWNaJY9AfPbSKKbsChI=;
        b=Yov0HN/yLFQWnmoRImhvbXzZ4UdmnMn+ivBL0UhYPU/9UjFg7lCj2+AfhCw9OTMtN+
         mLP4CArEMJBh6Gcvkkr7CoFY05ZcD9CHvr0ickqZYKlL/XDRoc7HijHovbddsvEUEevn
         RTw1Cslx0twXqQ6a6zqdBnsb6xXzglGDgVyGhBhtkPxXJEB967eCuntgmg3PsTAYZbp9
         VNwdt2tjhc0aOrEFFJ4l0uv/nzZKH05+Haio0IYTUGi0QPMN53p01Mh3NOIDRwxP7F2h
         MCMJnRGtYvrX6NpFG46saMNFhe49/XcQQBTeauA5640tITtVF6N8ZzHGhs7hZO6rRsNx
         +88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nN4YS0/OMIRscREPk7XlxtO6CWNaJY9AfPbSKKbsChI=;
        b=hnrSMtM8pMIr0Fn66VPWnb7B23MSLh6cf7C3hhsZE2rifUJKzvrXLh500bqcjaurs+
         vBN/SX88OQt3QnjpJhwDZqMPt8vqbu06PPDQyJuWHgyQHSvHXzxxuRDXbcpTUyq0tyy8
         i7hwmjIpmuPU7d7ohsnNrZLB2cGcz00gjJUyIOBiVRtRzcK/NxtztleyLLzFzRsvuDqn
         ta1EUfnk7YAgT1iGGkTG9MHjF+54bvlLUhtVMAh5k6u1kXXIhpHldQIghEKPSxZuZySN
         gU8atFdgODYeXdA2lm07XbkBb4+C3Gjh9nRHxw42WEm6y7cRrtSjU/P1P6tkS4l7v5aZ
         RB2w==
X-Gm-Message-State: AOAM531aHvp0CarvKac7auQpi1xUTSgqQ/2bXb4hkAjkBE5oRrG1uXvE
        se66dwXNSVb2J4QlVF8UNIymig==
X-Google-Smtp-Source: ABdhPJxDFeYXsvZoB4yYhaLza6IPXBYukAVHXACFFID0st7lfxFY4Rj0isZ2N0Hb6G4aN+d70zHWnA==
X-Received: by 2002:a05:6000:1088:: with SMTP id y8mr10264491wrw.380.1610734565744;
        Fri, 15 Jan 2021 10:16:05 -0800 (PST)
Received: from dell.default ([91.110.221.158])
        by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 10:16:04 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Airlie <airlied@redhat.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, Eddie Dong <eddie.dong@intel.com>,
        Eric Anholt <eric@anholt.net>, Faith <faith@valinux.com>,
        Gareth Hughes <gareth@valinux.com>,
        intel-gfx@lists.freedesktop.org,
        intel-gvt-dev@lists.freedesktop.org,
        Jackie Li <yaodong.li@intel.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jan Safrata <jan.nikitenko@gmail.com>,
        Jesse Barnes <jesse.barnes@intel.com>,
        jim liu <jim.liu@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Keith Packard <keithp@keithp.com>,
        Kevin Tian <kevin.tian@intel.com>,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, Min He <min.he@intel.com>,
        Niu Bing <bing.niu@intel.com>, nouveau@lists.freedesktop.org,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Pei Zhang <pei.zhang@intel.com>,
        Ping Gao <ping.a.gao@intel.com>,
        Rob Clark <rob.clark@linaro.org>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Roland Scheidegger <sroland@vmware.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tina Zhang <tina.zhang@intel.com>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Zack Rusin <zackr@vmware.com>,
        Zhenyu Wang <zhenyuw@linux.intel.com>,
        Zhi Wang <zhi.a.wang@intel.com>,
        Zhiyuan Lv <zhiyuan.lv@intel.com>
Subject: [PATCH 00/29] [Set 15] Finally rid W=1 warnings from GPU!
Date:   Fri, 15 Jan 2021 18:15:32 +0000
Message-Id: <20210115181601.3432599-1-lee.jones@linaro.org>
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

Last set!  All clean after this for; Arm, Arm64, PPC, MIPS and x86.

Lee Jones (29):
  drm/vmwgfx/vmwgfx_cmdbuf: Fix misnaming of 'headers' should be plural
  drm/vmwgfx/vmwgfx_cotable: Fix a couple of simple documentation
    problems
  drm/vmwgfx/vmwgfx_so: Add description for 'vmw_view's 'rcu' member
  drm/vmwgfx/vmwgfx_binding: Provide some missing param descriptions and
    remove others
  drm/vmwgfx/vmwgfx_msg: Fix misspelling of 'msg'
  drm/gma500/mmu: Actually return an error if one occurs
  drm/vmwgfx/vmwgfx_blit: Add description for 'vmw_bo_cpu_blit's 'diff'
    param
  drm/vmwgfx/vmwgfx_validation: Add some missing struct member/function
    param descriptions
  drm/vmwgfx/ttm_object: Demote half-assed headers and fix-up another
  drm/vmwgfx/vmwgfx_thp: Add description for 'vmw_thp_manager's member
    'manager'
  drm/gma500/psb_intel_sdvo: Demote kernel-doc abuses
  drm/gma500/psb_irq: Demote kernel-doc abuse
  drm/drm_dp_helper: Fix spelling issue and add missing description for
    'enable_frl_ready_hpd'
  drm/gma500/cdv_intel_crt: Demote kernel-doc abuse in
    'cdv_intel_crt_detect_hotplug()'s header
  drm/gma500/cdv_intel_display: Demote kernel-doc abuse in
    'cdv_intel_panel_fitter_pipe()'s header
  drm/gma500/cdv_intel_lvds: Demote unworthy headers to standard blocks
    and fix another
  drm/gma500/cdv_intel_dp: Demote one unworthy header fix another
  drm/gma500/oaktrail_lvds_i2c: Remove unused variables 'tmp'
  drm/gma500/oaktrail_lvds: Demote one documentation header fix another
  drm/gma500/oaktrail_crtc: Demote unworthy kernel-doc headers
  drm/gma500/mdfld_dsi_output: Demote a couple of kernel-doc formatting
    abuses
  drm/gma500/mdfld_intel_display: Demote three kernel-doc formatting
    abuses
  drm/drm_agpsupport: Strip out obviously wrong descriptions and demote
    to standard headers
  drm/i915/gvt/handlers: Remove kernel-doc formatting from
    non-kernel-doc header
  drm/nouveau/nouveau_ioc32: File headers are not good candidates for
    kernel-doc
  drm/nouveau/nouveau_svm: Remove unused variable 'ret' from void
    function
  drm/nouveau/nouveau_bios: Remove unused variable 'pdev' from
    'nouveau_bios_init()'
  drm/nouveau/nouveau_ioc32: Demote kernel-doc abuse to standard comment
    block
  drm/vmwgfx/ttm_object: Reorder header to immediately precede its
    struct

 drivers/gpu/drm/drm_agpsupport.c             | 46 +++++---------------
 drivers/gpu/drm/drm_dp_helper.c              |  3 +-
 drivers/gpu/drm/gma500/cdv_intel_crt.c       |  2 +-
 drivers/gpu/drm/gma500/cdv_intel_display.c   |  2 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c        |  4 +-
 drivers/gpu/drm/gma500/cdv_intel_lvds.c      |  7 +--
 drivers/gpu/drm/gma500/mdfld_dsi_output.c    |  4 +-
 drivers/gpu/drm/gma500/mdfld_intel_display.c |  6 +--
 drivers/gpu/drm/gma500/mmu.c                 |  2 +-
 drivers/gpu/drm/gma500/oaktrail_crtc.c       |  6 +--
 drivers/gpu/drm/gma500/oaktrail_lvds.c       |  3 +-
 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c   |  8 ++--
 drivers/gpu/drm/gma500/psb_intel_sdvo.c      |  6 +--
 drivers/gpu/drm/gma500/psb_irq.c             |  3 +-
 drivers/gpu/drm/i915/gvt/handlers.c          |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bios.c       |  2 -
 drivers/gpu/drm/nouveau/nouveau_ioc32.c      |  4 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c        |  5 +--
 drivers/gpu/drm/vmwgfx/ttm_object.c          | 25 ++++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_binding.c      |  9 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c         |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c       |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c      |  3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c          |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_so.c           |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c          |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c   |  5 ++-
 27 files changed, 74 insertions(+), 90 deletions(-)

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Cc: Eddie Dong <eddie.dong@intel.com>
Cc: Eric Anholt <eric@anholt.net>
Cc: Faith <faith@valinux.com>
Cc: Gareth Hughes <gareth@valinux.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-gvt-dev@lists.freedesktop.org
Cc: Jackie Li <yaodong.li@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jan Safrata <jan.nikitenko@gmail.com>
Cc: Jesse Barnes <jesse.barnes@intel.com>
Cc: jim liu <jim.liu@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Keith Packard <keithp@keithp.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-media@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Min He <min.he@intel.com>
Cc: Niu Bing <bing.niu@intel.com>
Cc: nouveau@lists.freedesktop.org
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Pei Zhang <pei.zhang@intel.com>
Cc: Ping Gao <ping.a.gao@intel.com>
Cc: Rob Clark <rob.clark@linaro.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tina Zhang <tina.zhang@intel.com>
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Zack Rusin <zackr@vmware.com>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Zhi Wang <zhi.a.wang@intel.com>
Cc: Zhiyuan Lv <zhiyuan.lv@intel.com>
-- 
2.25.1

