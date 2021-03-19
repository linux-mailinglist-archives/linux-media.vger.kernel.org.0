Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 021B1341762
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 09:25:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234361AbhCSIZA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 04:25:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234076AbhCSIYd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 04:24:33 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5B8C061760
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 01:24:33 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id w3so8265912ejc.4
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 01:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TYV9tdkZp1J1ptXQ7wy9Bkml0mtc5KsRXNGrscVW51o=;
        b=YO3T1K4fRrjI5zyKPPMhF0ZWIxUKyEN/v8X23V4Uu+3vH3IBJ2xSrRG51/I4+b3IOC
         M4HyW9W6GnYd1DFAUk9nF11YTW90u6BZiMJvVbarWtiuB2NL2P4gcbpxLqpfS2Ax4U/+
         3E2TEJ5ahykRuBF53GARnAmr1kkuiUjPhaAsQNht/0SpU3WqnpkPxGOBGQE5VsMq2NHe
         TiN2SHUpSpRaJJVJAsSut/9R4g+uBBjR72u37lxqDMP9v1Nxc75B2z1T3laAIWJfCnRz
         MpZ41NouSa716oGR6beChpj4CO2s8K8Byyi/RuEAH5V79IHxrI+4y+lhNebbaSZU04R+
         SSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TYV9tdkZp1J1ptXQ7wy9Bkml0mtc5KsRXNGrscVW51o=;
        b=MwNjGzYPxWmvMvS2VS1WWl/TE9BfvglfgsXcwkO3rtk+KpBBfVXxoc21qO6MPMWsRH
         vDh3ErQpAO4lJLcqyBkVdKhOvJXgAyKZWUI5BXTY0YACvPMJoCb30ls6qScFN+/Tofn/
         sWTwygnI/glMVGkPgKZ1BnR+qZPyd7nLEsXlzohPdSz0ausKIKhR7EPza0W4pWVDih5P
         LPcLtY2XdSih4JX7OUl2sNpIPw6RrN1co1HSqkud/GeU12Qfv46SeTcsGYvWMKj5jqoG
         SHQJsGO+NUUqPvlnQWgBu+3qzCX2WgGyoqL9lsM16UICbfxKXkmYhYTJQfDxhx/8Cult
         dRuA==
X-Gm-Message-State: AOAM532aEgagHWCdaVVPYGR2pEpaJJYq91IJj9AHtgOKO9ECneGhinVc
        sy9A7j3sinBOKFTxxTtM3VShzg==
X-Google-Smtp-Source: ABdhPJxL5an5eBZ72SbM5yDAwYkHBc6fdqf/KsOB8xAPf+lniUY6pKqQ4xw/bVWoZSkHHhXMyt7nGQ==
X-Received: by 2002:a17:906:ad85:: with SMTP id la5mr2964707ejb.37.1616142271941;
        Fri, 19 Mar 2021 01:24:31 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id b18sm3273727ejb.77.2021.03.19.01.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 01:24:31 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org, Anthony Koo <Anthony.Koo@amd.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Colin Ian King <colin.king@canonical.com>,
        Daniel Vetter <daniel@ffwll.ch>,
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
        nouveau@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [RESEND 00/19] Rid GPU from W=1 warnings
Date:   Fri, 19 Mar 2021 08:24:09 +0000
Message-Id: <20210319082428.3294591-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a resend of the remaining patches.

All of these patches have been sent before.

Lee Jones (19):
  drm/nouveau/nvkm/subdev/bios/init: Demote obvious abuse of kernel-doc
  drm/nouveau/dispnv50/disp: Remove unused variable 'ret'
  drm/msm/dp/dp_display: Remove unused variable 'hpd'
  include: drm: drm_atomic: Make use of 'new_plane_state'
  drm/nouveau/nvkm/subdev/volt/gk20a: Demote non-conformant kernel-doc
    headers
  drm/amd/display/dc/calcs/dce_calcs: Move some large variables from the
    stack to the heap
  drm/amd/display/dc/calcs/dce_calcs: Remove some large variables from
    the stack
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

 .../gpu/drm/amd/display/dc/calcs/dce_calcs.c  | 1154 +++++++++--------
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
 include/drm/drm_atomic.h                      |    3 +-
 15 files changed, 692 insertions(+), 734 deletions(-)

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Anthony Koo <Anthony.Koo@amd.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Colin Ian King <colin.king@canonical.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Jeremy Kolb <jkolb@brandeis.edu>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: Lyude Paul <lyude@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: nouveau@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
-- 
2.27.0

