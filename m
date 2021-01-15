Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8466B2F8388
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 19:14:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728474AbhAOSN6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 13:13:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbhAOSN6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 13:13:58 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30AECC0613D3
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 10:13:18 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id w5so10179427wrm.11
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 10:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=310sSHEao7tJsu2UmDOFWrsrWQfu1990Uj0j4Ybye0s=;
        b=N7iHRt5SkUdVMxq65xZRkaCdEEtZwkmVojjDcfia9WNo0dnreS7PNmI+Ko/66J/gIi
         ADII32ML+RE+7uPDFVtFvvXjJqtZA46PfoaZTbmRYK83ibmQMjgZFyGXl+flumpU8vmx
         dmoPyA5B22YyetLHZfrg9E/rze/vsnOFXh93eNGItG2dBNsTWcwnKjZPdm5RNo33eAks
         VaIZYPc7EVNbWwJ/tX0hrvBzeYMT2H7/TpHGScnUNh8Fd3VraTwFo1K86gn7GTsHsD+v
         8puqWa5qrqQFxkybONpTUkA9ODG3qytMka8gB26ZeBUztFg5qwOYMbV7RsaRFVqZPmCD
         8wLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=310sSHEao7tJsu2UmDOFWrsrWQfu1990Uj0j4Ybye0s=;
        b=LETIxoGbYCOeWAATmzr197k582xqB70Rn9Ujc9yVVquwvN9QNxJ/FCVfpBVnk9ohTZ
         V/OawJJ74bsmwM1Ks2HupUB2nSmvZBukgqsCDqNT1UlHxszWpFc0Ilq4dV3MLbyTQLe+
         QHGvJfDm5ecyL4mHCnm+/YTHUAv9mDIS3YGlQ+29+fB9LP/4QFtMAIB+EOcGP2ir/9PC
         qgWQ8XxPta/GHvviIIqNHRsiA7Rp3JLsUB8bYoeAM0vLAIkldu8a2H9A6jMn5SBQMAEa
         /zhUv7Lsfgq5kmgAW9H31e9dAQlMZniBwGil1l6V3Qsbi9ifQdjTRXLeDsQ2E+6JEf7L
         WgJQ==
X-Gm-Message-State: AOAM531mjuU2IhbjIqqBQhOmJWHAk7bd34zuYZ11dA3ZYlNuOeJqFq4o
        HsJpSu3RK9+Ekttcc/QPsIkWeg==
X-Google-Smtp-Source: ABdhPJwZkJUzDyYGJSn4L879Wg9Va9OC82105X+364sfv1aadU8xGto5VQFWiwta2p/MiqbuYUXy9A==
X-Received: by 2002:adf:e941:: with SMTP id m1mr9194603wrn.240.1610734396902;
        Fri, 15 Jan 2021 10:13:16 -0800 (PST)
Received: from dell.default ([91.110.221.158])
        by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 10:13:16 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Alan Cox <alan@linux.intel.com>,
        Benjamin Defnet <benjamin.r.defnet@intel.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
        Jesse Barnes <jesse.barnes@intel.com>,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Rajesh Poornachandran <rajesh.poornachandran@intel.com>,
        Roland Scheidegger <sroland@vmware.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Zack Rusin <zackr@vmware.com>
Subject: [PATCH 00/40] [Set 14] Rid W=1 warnings from GPU
Date:   Fri, 15 Jan 2021 18:12:33 +0000
Message-Id: <20210115181313.3431493-1-lee.jones@linaro.org>
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

Penultimate set, promise. :)

Lee Jones (40):
  drm/r128/r128_ioc32: Document headers do not make good kernel-doc
    candidates
  drm/mga/mga_ioc32: Document headers do not make good kernel-doc
    candidates
  drm/vmwgfx/vmwgfx_execbuf: Fix some kernel-doc related issues
  drm/vmwgfx/vmwgfx_kms: Remove unused variable 'ret' from
    'vmw_du_primary_plane_atomic_check()'
  drm/r128/r128_ioc32: Fix formatting issues in 'r128_compat_ioctl()'s
    header
  drm/mga/mga_ioc32: Fix some formatting issues in 'mga_compat_ioctl's
    header
  drm/vmwgfx/vmwgfx_kms: Mark vmw_{cursor,primary}_plane_formats as
    __maybe_unused
  drm/vmwgfx/vmwgfx_drv: Fix some kernel-doc misdemeanours
  drm/vmwgfx/vmwgfx_ioctl: Provide missing '@' sign required by
    kernel-doc
  drm/vmwgfx/vmwgfx_resource: Fix worthy function headers demote some
    others
  drm/vmwgfx/vmwgfx_ttm_buffer: Supply some missing parameter
    descriptions
  drm/vmwgfx/vmwgfx_fifo: Demote non-conformant kernel-doc header
  drm/vmwgfx/vmwgfx_ldu: Supply descriptions for 'state' function
    parameter
  drm/gma500/framebuffer: Fix some possible doc-rot issues
  drm/gma500/gem: Add and rename some function parameter descriptions
  drm/gma500/intel_bios: Demote non-conformant kernel-doc header
  drm/gma500/intel_i2c: Remove superflouous parameter description and
    rename another
  drm/gma500/mmu: Make local function 'psb_mmu_pt_alloc_map_lock()'
    static
  drm/gma500/power: Fix a bunch of *dev documentation issues
  drm/vmwgfx/vmwgfx_kms: Update worthy function headers and demote
    others
  drm/gma500/gma_display: Demote kernel-doc abuses to standard comment
    blocks
  drm/gma500/gma_device: Include our own header containing prototypes
  drm/vmwgfx/vmwgfx_overlay: Demote kernel-doc abuses to standard
    comment blocks
  drm/gma500/psb_intel_display: Demote kernel-doc formatting abuse
  drm/gma500/psb_intel_lvds: Supply description for 'mode_dev'
  drm/vmwgfx/vmwgfx_fence: Add, remove and demote various documentation
    params/headers
  drm/vmwgfx/vmwgfx_bo: Remove superfluous param description and supply
    another
  drm/vmwgfx/vmwgfx_context: Demote kernel-doc abuses
  drm/vmwgfx/vmwgfx_scrn: Demote unworthy kernel-doc headers and update
    others
  drm/gma500/psb_intel_modes: Provide missing descriptions for function
    param 'adapter'
  drm/gma500/gem: Do not rely on consumers to include drm/drm_device.h
    before gem.h
  drm/gma500/gem: Include our own header containing prototypes
  drm/vmwgfx/vmwgfx_surface: Fix some kernel-doc related issues
  drm/gma500/mmu: Remove unused function 'psb_get_default_pd_addr'
  drm/vmwgfx/vmwgfx_cmdbuf_res: Rename param description and remove
    another
  drm/vmwgfx/vmwgfx_shader: Demote kernel-doc abuses and fix-up worthy
    headers
  drm/vmwgfx/vmwgfx_cmdbuf: Fix a bunch of missing or incorrectly
    formatted/named params
  drm/gma500/power: Remove excess param description 'state'
  drm/vmwgfx/vmwgfx_cmdbuf_res: Remove unused variable 'ret'
  drm/vmwgfx/vmwgfx_stdu: Add some missing param/member descriptions

 drivers/gpu/drm/gma500/framebuffer.c       |  6 +++---
 drivers/gpu/drm/gma500/gem.c               |  6 ++++--
 drivers/gpu/drm/gma500/gem.h               |  2 ++
 drivers/gpu/drm/gma500/gma_device.c        |  1 +
 drivers/gpu/drm/gma500/gma_display.c       |  8 ++++----
 drivers/gpu/drm/gma500/intel_bios.c        |  2 +-
 drivers/gpu/drm/gma500/intel_i2c.c         |  3 +--
 drivers/gpu/drm/gma500/mmu.c               | 13 ++-----------
 drivers/gpu/drm/gma500/power.c             |  8 ++++----
 drivers/gpu/drm/gma500/psb_intel_display.c |  2 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c    |  1 +
 drivers/gpu/drm/gma500/psb_intel_modes.c   |  3 ++-
 drivers/gpu/drm/mga/mga_ioc32.c            | 14 +++++++-------
 drivers/gpu/drm/r128/r128_ioc32.c          | 14 +++++++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c        |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c     | 12 ++++++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c |  8 ++------
 drivers/gpu/drm/vmwgfx/vmwgfx_context.c    |  6 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c        |  8 ++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c    | 20 ++++++++++++--------
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c      | 18 ++++++++++--------
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c      |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c        | 16 ++++++++--------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h        |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c        |  4 +++-
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c    | 16 ++++++++--------
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c   | 10 ++++------
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c       | 10 ++++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c     | 10 +++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c       |  9 +++++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c    | 17 ++++++++++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  2 ++
 33 files changed, 137 insertions(+), 122 deletions(-)

Cc: Alan Cox <alan@linux.intel.com>
Cc: Benjamin Defnet <benjamin.r.defnet@intel.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Cc: Eric Anholt <eric@anholt.net>
Cc: Jesse Barnes <jesse.barnes@intel.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-media@vger.kernel.org
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Rajesh Poornachandran <rajesh.poornachandran@intel.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Zack Rusin <zackr@vmware.com>
-- 
2.25.1

