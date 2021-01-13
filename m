Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2BF2F45E0
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 09:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725865AbhAMIIh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 03:08:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbhAMIIh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 03:08:37 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED139C061575
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 00:07:56 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id c124so681196wma.5
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 00:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ASaF2Lz+3U8HXzJJ1UEEZRzsmlvRFeoI0GvMyEKNjiw=;
        b=SE9oIA4EYZVyH214vJW9lUNt8xt0mg4yfvs0k7+q6cUe2zaF1RzK8+/cJKD9SegsjA
         MfIeGsE5eWtpV+Ft1yOBx1ncLvytspASwKDa054+4ESezgHtKKlY33fjszxOtDV164E9
         DD7vFBFer4UihawaIdx7gzqrKq0EJrYqVwNOvF9Ja1PKFOs0LTx4u4ndPxctBddVcTfq
         G/2+50UdNJtxgNWRt006OncsxJDBLr/u6Gw6vMeFTSB0lpJdhKDuaaOqT8L7kjMB7lQv
         q31KNYLF3rK6pvTpdvSAJDBEaZR4AjvWkNN668qA9uzuEDOwtjzEpkFES7qKt0jP1l7X
         Fh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ASaF2Lz+3U8HXzJJ1UEEZRzsmlvRFeoI0GvMyEKNjiw=;
        b=fCidHA2Ca2pTw/gLHJY1no9RVRmbjUM8tGw823eJ23gPKghB457wmj9KSkulzS3kSw
         f0nd6CYwfAZLhscIBElCZUzpqPjX+FqS8D1pGXMLIzDK9pdywN2xWIWxk6lMczGdkmNk
         8hU2x2ugwTLNrecEjthRcgcwlDSIaIAG+htcBntA3EXoPZuS6G0axvtmYMQQbakuZK9M
         5jJY9QAr/LmYxaqE2cGSFFF2yP6Yr6AYMF127S128jyqIL3N8JG7lKinFVWWNoZKMRdf
         ZXwKTlKwXGVTTwt3HMOyeA+Nh9qdchIzBiUdIS3nvQfBa7G4jWhh2QDHuJasB52preuM
         23Sw==
X-Gm-Message-State: AOAM531DyBzauwc7bGOVKqSCOwZxtMsipbws1T9iLb4S/k3Gm7RQP44u
        P/sW9P/5K1r0+yAX6tWnkQTjdQ==
X-Google-Smtp-Source: ABdhPJzpqWtD7JRoUTlxKG1Kexi900ZqPelwmJzR4MtEuvPIuECn9kkk6/wDHIjeVMBl+hAkknSDFQ==
X-Received: by 2002:a1c:1bcd:: with SMTP id b196mr957693wmb.70.1610525275740;
        Wed, 13 Jan 2021 00:07:55 -0800 (PST)
Received: from dell.default ([91.110.221.229])
        by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 00:07:54 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org, Anthony Koo <Anthony.Koo@amd.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Harry Wentland <harry.wentland@amd.com>,
        Jeremy Kolb <jkolb@brandeis.edu>, Leo Li <sunpeng.li@amd.com>,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        Lyude Paul <lyude@redhat.com>,
        Mauro Rossi <issor.oruam@gmail.com>,
        Noah Abradjian <noah.abradjian@amd.com>,
        nouveau@lists.freedesktop.org,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH 00/30] [Set 13] Finally rid W=1 warnings from GPU
Date:   Wed, 13 Jan 2021 08:07:22 +0000
Message-Id: <20210113080752.1003793-1-lee.jones@linaro.org>
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

0 out of 5000 left!

LAST SET!  You're all clean.  Can you believe it!?

Lee Jones (30):
  drm/amd/display/dc/dc_helper: Include our own header, containing
    prototypes
  drm/amd/include/renoir_ip_offset: Mark top-level IP_BASE as
    __maybe_unused
  drm/amd/display/dmub/src/dmub_dcn30: Include our own header containing
    prototypes
  drm/amd/display/modules/power/power_helpers: Staticify local functions
  drm/amd/display/modules/info_packet/info_packet: Correct kernel-doc
    formatting
  drm/amd/display/dc/core/dc_resource: Staticify local functions
  drm/amd/display/dc/core/dc_link: Remove unused variable 'status'
  drm/amd/display/dc/core/dc_link_dp: Staticify local function
    'linkRateInKHzToLinkRateMultiplier'
  drm/amd/display/dc/dce112/dce112_resource: Include our own header file
    containing prototypes
  drm/amd/display/dc/core/dc: Staticise local function
    'apply_ctx_interdependent_lock'
  drm/amd/display/dc/dce100/Makefile: Ignore -Woverride-init warning
  drm/amd/display/dc/dce100/dce100_resource: Include our own header
    containing prototypes
  drm/amd/display/dc/dce60/Makefile: Ignore -Woverride-init warning
  drm/amd/display/dc/dce80/Makefile: Ignore -Woverride-init warning
  drm/amd/display/dc/dce80/dce80_resource: Include our own header
    containing prototypes
  fixup! drm/amd/display/dc/dce60/Makefile: Ignore -Woverride-init
    warning
  drm/amd/display/dc/dce60/dce60_resource: Include our own header
    containing prototypes
  drm/amd/display/dc/core/dc_link: Move some local data from the stack
    to the heap
  drm/amd/display/dc/core/dc_link_dp: Mark 'result_write_min_hblank' as
    __maybe_unused
  drm/amd/display/dc/core/dc: Fix a bunch of documentation misdemeanours
  drm/amd/display/dc/core/dc_resource: Demote some kernel-doc abuses
  drm/amd/display/dc/core/dc_link: Fix a couple of function
    documentation issues
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

 drivers/gpu/drm/amd/display/dc/core/dc.c      | 36 +++++++++----------
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 31 ++++++++--------
 .../gpu/drm/amd/display/dc/core/dc_link_dp.c  |  4 +--
 .../gpu/drm/amd/display/dc/core/dc_resource.c | 14 ++++----
 drivers/gpu/drm/amd/display/dc/dc_helper.c    |  1 +
 .../gpu/drm/amd/display/dc/dce100/Makefile    |  2 ++
 .../amd/display/dc/dce100/dce100_resource.c   |  2 ++
 .../amd/display/dc/dce112/dce112_resource.c   |  4 ++-
 drivers/gpu/drm/amd/display/dc/dce60/Makefile |  2 ++
 .../drm/amd/display/dc/dce60/dce60_resource.c |  2 ++
 drivers/gpu/drm/amd/display/dc/dce80/Makefile |  2 ++
 .../drm/amd/display/dc/dce80/dce80_resource.c |  2 ++
 .../gpu/drm/amd/display/dmub/src/dmub_dcn30.c |  1 +
 .../display/modules/info_packet/info_packet.c | 13 +++----
 .../amd/display/modules/power/power_helpers.c |  6 ++--
 .../gpu/drm/amd/include/renoir_ip_offset.h    |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/crtc.c       |  4 +--
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  7 ++--
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c   |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c          |  4 ---
 drivers/gpu/drm/nouveau/nouveau_display.c     |  8 ++---
 drivers/gpu/drm/nouveau/nv50_display.h        |  3 --
 .../gpu/drm/nouveau/nvkm/engine/gr/gf100.c    |  2 +-
 23 files changed, 80 insertions(+), 74 deletions(-)

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Anthony Koo <Anthony.Koo@amd.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Jeremy Kolb <jkolb@brandeis.edu>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-media@vger.kernel.org
Cc: Lyude Paul <lyude@redhat.com>
Cc: Mauro Rossi <issor.oruam@gmail.com>
Cc: Noah Abradjian <noah.abradjian@amd.com>
Cc: nouveau@lists.freedesktop.org
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
-- 
2.25.1

