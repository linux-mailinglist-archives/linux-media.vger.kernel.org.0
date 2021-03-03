Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 098E732C709
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:09:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349972AbhCDAaz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:30:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349093AbhCCNoK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 08:44:10 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D400C061793
        for <linux-media@vger.kernel.org>; Wed,  3 Mar 2021 05:43:30 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id m1so6398088wml.2
        for <linux-media@vger.kernel.org>; Wed, 03 Mar 2021 05:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QBm1TtnSOgkIdE+poP2XHRBabvEfYrHEJwcqomHGK4I=;
        b=CobjywY2f31xvahThtnf+1J/tPkCZZLUOzDN9k925p+K3ljoBNUuwGN6Z04oqnMIPI
         WS1MUrwyT0+HPr+bF9JgzQWmvgClLWJo5rzB40dMh9V5sv/Yq8nYX3E/F1e9qb0ufBpc
         5R8UsMIhy7JVlgVo1/18XfYf+wP4uLAb+RWHY37577RbXX6pd5jXuE34eefan1RAvX/m
         GvImGq+2Q4Rmx4plYwdwDh6zhOaXjXOA9Dhsa/U9Qym0hc8ELB2Y8W5EzXNViMZFdKHL
         jm+T25PBHcD0TK81K8m8O8oDvH2G4UqZTtjl3pd1izvptFsGjlScPG2R+aJxykccdEAg
         zjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QBm1TtnSOgkIdE+poP2XHRBabvEfYrHEJwcqomHGK4I=;
        b=NdAIbijNcCML+LDLWHwIDqk4qqlG47CHEQP0rsvn5PL6tDffuF36kQk1QHrJttp+g3
         9gUn2RIujka7NDmy/f6TxZk+y1vBkCW/OQcP7nprnAO78gwispJE0q1XBaXb7Axm+Dy6
         6ccd5A7uwGU9CvktHJTWy0qLwRTyVlSz0dSRWc/pU3cQx+pedI8OAct7U+SlYQR0chdw
         KjUxJsbfpMJ6nY5z6UCQfKWyP80/zKYQ8dnbBI1A1PPbY0VeGUJT3VePXmbNP8JyvEd4
         vJxDhlzmPpsAEHZci9tVJcttEQZKNUHo0Zx9fy7bRdO2hix3y00eqg6iV6PE+RMyU0eW
         3KXA==
X-Gm-Message-State: AOAM530+ukK2jQg36hr83qpp338/7bmwNDbLewZRQCg43Rv72A7eJytf
        CA3R1zB2I7eT3kdGdAaL7oe4tA==
X-Google-Smtp-Source: ABdhPJxDWAS0QekMYikPudJ4qNiYAhq/iWdMPZuZl8uyYTy6BkFNsfoxpNYhdQ/7ZfCkCJrNbg2EpA==
X-Received: by 2002:a1c:a98a:: with SMTP id s132mr9567391wme.12.1614779009161;
        Wed, 03 Mar 2021 05:43:29 -0800 (PST)
Received: from dell.default ([91.110.221.155])
        by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 05:43:28 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org, Anthony Koo <Anthony.Koo@amd.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Colin Ian King <colin.king@canonical.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Airlie <airlied@redhat.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Harry Wentland <harry.wentland@amd.com>,
        Jeremy Kolb <jkolb@brandeis.edu>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Leo Li <sunpeng.li@amd.com>, linaro-mm-sig@lists.linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        nouveau@lists.freedesktop.org,
        Qinglang Miao <miaoqinglang@huawei.com>,
        Rob Clark <rob.clark@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Roland Scheidegger <sroland@vmware.com>,
        Sean Paul <sean@poorly.run>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Zack Rusin <zackr@vmware.com>
Subject: [RESEND 00/53] Rid GPU from W=1 warnings
Date:   Wed,  3 Mar 2021 13:42:26 +0000
Message-Id: <20210303134319.3160762-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a resend.  All of these patches have been sent before.

The vmwgfx ones were even applied, but were dropped for some reason.

Lee Jones (53):
  drm/nouveau/nvkm/subdev/bios/init: Demote obvious abuse of kernel-doc
  drm/nouveau/dispnv50/disp: Remove unused variable 'ret'
  drm/msm/dp/dp_display: Remove unused variable 'hpd'
  drm/amd/display/dc/bios/command_table: Remove unused variable
  include: drm: drm_atomic: Make use of 'new_plane_state'
  drm/nouveau/nvkm/subdev/volt/gk20a: Demote non-conformant kernel-doc
    headers
  drm/amd/display/dc/bios/command_table: Remove unused variable and
    associated comment
  drm/amd/display/dc/calcs/dce_calcs: Move some large variables from the
    stack to the heap
  drm/amd/display/dc/calcs/dce_calcs: Remove some large variables from
    the stack
  drm/amd/display/dc/dce/dce_aux: Remove duplicate line causing 'field
    overwritten' issue
  drm/amd/display/dc/dce80/dce80_resource: Make local functions static
  drm/nouveau/nvkm/engine/gr/gf100: Demote non-conformant kernel-doc
    header
  drm/nouveau/nouveau_bo: Remove unused variables 'dev'
  drm/nouveau/nouveau_display: Remove set but unused variable 'width'
  drm/nouveau/dispnv04/crtc: Demote non-conforming kernel-doc headers
  drm/nouveau/dispnv50/disp: Remove unused variable 'ret' from function
    returning void
  drm/nouveau/dispnv50/headc57d: Make local function 'headc57d_olut'
    static
  drm/nouveau/nv50_display: Remove superfluous prototype for local
    static functions
  drm/nouveau/dispnv50/disp: Include header containing our prototypes
  drm/nouveau/nouveau_ioc32: File headers are not good candidates for
    kernel-doc
  drm/nouveau/nouveau_svm: Remove unused variable 'ret' from void
    function
  drm/nouveau/nouveau_ioc32: Demote kernel-doc abuse to standard comment
    block
  drm/vmwgfx/vmwgfx_execbuf: Fix some kernel-doc related issues
  drm/vmwgfx/vmwgfx_kms: Remove unused variable 'ret' from
    'vmw_du_primary_plane_atomic_check()'
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
  drm/vmwgfx/vmwgfx_kms: Update worthy function headers and demote
    others
  drm/vmwgfx/vmwgfx_overlay: Demote kernel-doc abuses to standard
    comment blocks
  drm/vmwgfx/vmwgfx_fence: Add, remove and demote various documentation
    params/headers
  drm/vmwgfx/vmwgfx_bo: Remove superfluous param description and supply
    another
  drm/vmwgfx/vmwgfx_context: Demote kernel-doc abuses
  drm/vmwgfx/vmwgfx_scrn: Demote unworthy kernel-doc headers and update
    others
  drm/vmwgfx/vmwgfx_surface: Fix some kernel-doc related issues
  drm/vmwgfx/vmwgfx_cmdbuf_res: Rename param description and remove
    another
  drm/vmwgfx/vmwgfx_shader: Demote kernel-doc abuses and fix-up worthy
    headers
  drm/vmwgfx/vmwgfx_cmdbuf: Fix a bunch of missing or incorrectly
    formatted/named params
  drm/vmwgfx/vmwgfx_cmdbuf_res: Remove unused variable 'ret'
  drm/vmwgfx/vmwgfx_stdu: Add some missing param/member descriptions
  drm/vmwgfx/vmwgfx_cmdbuf: Fix misnaming of 'headers' should be plural
  drm/vmwgfx/vmwgfx_cotable: Fix a couple of simple documentation
    problems
  drm/vmwgfx/vmwgfx_so: Add description for 'vmw_view's 'rcu' member
  drm/vmwgfx/vmwgfx_binding: Provide some missing param descriptions and
    remove others
  drm/vmwgfx/vmwgfx_msg: Fix misspelling of 'msg'
  drm/vmwgfx/vmwgfx_blit: Add description for 'vmw_bo_cpu_blit's 'diff'
    param
  drm/vmwgfx/vmwgfx_validation: Add some missing struct member/function
    param descriptions
  drm/vmwgfx/ttm_object: Demote half-assed headers and fix-up another
  drm/vmwgfx/vmwgfx_thp: Add description for 'vmw_thp_manager's member
    'manager'
  drm/vmwgfx/ttm_object: Reorder header to immediately precede its
    struct

 .../drm/amd/display/dc/bios/command_table.c   |   16 +-
 .../gpu/drm/amd/display/dc/calcs/dce_calcs.c  | 1151 +++++++++--------
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.h  |    1 -
 .../drm/amd/display/dc/dce80/dce80_resource.c |   16 +-
 drivers/gpu/drm/msm/dp/dp_display.c           |    3 -
 drivers/gpu/drm/nouveau/dispnv04/crtc.c       |    4 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |   10 +-
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c   |    2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c          |    4 -
 drivers/gpu/drm/nouveau/nouveau_display.c     |    8 +-
 drivers/gpu/drm/nouveau/nouveau_ioc32.c       |    4 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c         |    5 +-
 drivers/gpu/drm/nouveau/nv50_display.h        |    3 -
 .../gpu/drm/nouveau/nvkm/engine/gr/gf100.c    |    2 +-
 .../gpu/drm/nouveau/nvkm/subdev/bios/init.c   |  204 +--
 .../gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c  |    4 +-
 drivers/gpu/drm/vmwgfx/ttm_object.c           |   25 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_binding.c       |    9 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c          |    1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c           |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c        |   14 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c    |    8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_context.c       |    6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c       |    3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |    8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c       |   20 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c         |   18 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c         |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           |   16 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h           |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c           |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c           |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c       |   16 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c      |   10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c          |   10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c        |   10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_so.c            |    1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c          |    9 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c       |   17 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c           |    1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c    |    2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c    |    5 +-
 include/drm/drm_atomic.h                      |    3 +-
 44 files changed, 818 insertions(+), 847 deletions(-)

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Anthony Koo <Anthony.Koo@amd.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Colin Ian King <colin.king@canonical.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Jeremy Kolb <jkolb@brandeis.edu>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: Lyude Paul <lyude@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: nouveau@lists.freedesktop.org
Cc: Qinglang Miao <miaoqinglang@huawei.com>
Cc: Rob Clark <rob.clark@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Zack Rusin <zackr@vmware.com>
-- 
2.27.0

