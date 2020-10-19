Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA86292FA7
	for <lists+linux-media@lfdr.de>; Mon, 19 Oct 2020 22:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727154AbgJSUpY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 16:45:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727103AbgJSUpX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 16:45:23 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF112C0613CE;
        Mon, 19 Oct 2020 13:45:23 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id b26so689169pff.3;
        Mon, 19 Oct 2020 13:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VYlmVNr0dY3l4uhDIFjX37H6wetw4+WykhKJz4MPamw=;
        b=BqRbwvF6wiCTRseSCUHa+Vi3jOPkteT3dZ8Nxhx+bebtph7DXrcWvdDA1SeKMI7EqL
         MkM+ls4W5sETyKntRt5zv1jXwuKlyZ1PX7bYO3g2l2NppjkPO1XWPpqKoRYMBd9/b6Tj
         dhbiR5fEpHplIPYRv76JWflDYqw2NYo0Z8sHrHtF8msfG5ftWNB8Jz32Go3Ebon3OTDU
         VG4NDGDsG/eQVQ90JE32BhmMsGIpU1fNsIyGsJgNDGGduE5XkoLb5JSITwXfUxE4nRli
         VGtj5q4t2feQxNm0f2UN2Up9t3u2vap9cEzCcnLi3PzG8ni+z+r/5rin+urNigILaBsc
         Ol8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VYlmVNr0dY3l4uhDIFjX37H6wetw4+WykhKJz4MPamw=;
        b=FEgpDWNyjqJ301GG/ATmlrOSelyQrezFbM2vo8+npVQv5XLZTh6Fv4opV5rIKICxKS
         pWBCmmvOS5pAhoSZv1sc+zGHJtHFDByKiYiA6dtDG+P7VdIRQ0gGKKqD2Zuu+XFAf3J5
         R960Ih8yJ35HQ9LEeWBQAWRS+K/Hod+WsUedXu2c8Y1937o4Vh1fmcTggjPK/ukm2XLK
         DM6Sy5KaKi3s0Yb++Zf/gp6JiwGS+Ig8eb0qenKhuXeSuGeV0wHiQXKttBwlDfOou0v0
         CioO8cMWeKt9vx8isiRNcWS6opSoValt3TDs7XKq4+lCVJ3lslcmfbCA6BIvCAOT6kkC
         ODFw==
X-Gm-Message-State: AOAM532oyK/Oe1CVDFO1NphraFNmE5SYUTEZdSsvEf7NvcuahsCC5nn3
        zrZBnI5N4YVh1vy15gmX5ZQ=
X-Google-Smtp-Source: ABdhPJymNRUHlbOevPw6zBiQT2pmXXAjTcTJ54Q1CuigBS6O5RZ8CtU1GZZz2Y9Z3I8WiLFEGOOOUg==
X-Received: by 2002:a63:778f:: with SMTP id s137mr1293614pgc.7.1603140323111;
        Mon, 19 Oct 2020 13:45:23 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id x18sm431812pga.49.2020.10.19.13.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:45:21 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Emil Velikov <emil.velikov@collabora.com>,
        Eric Anholt <eric@anholt.net>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK),
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
        Liviu Dudau <liviu.dudau@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Thierry Reding <treding@nvidia.com>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 00/23] drm/msm: de-struct_mutex-ification
Date:   Mon, 19 Oct 2020 13:46:01 -0700
Message-Id: <20201019204636.139997-1-robdclark@gmail.com>
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

v2: teach lockdep about shrinker locking patters (danvet) and
    convert to obj->resv locking (danvet)
v3: fix get_vaddr locking for legacy userspace (relocs), devcoredump,
    and rd/hangrd

Rob Clark (23):
  drm/msm: Fix a couple incorrect usages of get_vaddr_active()
  drm/msm/gem: Add obj->lock wrappers
  drm/msm/gem: Rename internal get_iova_locked helper
  drm/msm/gem: Move prototypes to msm_gem.h
  drm/msm/gem: Add some _locked() helpers
  drm/msm/gem: Move locking in shrinker path
  drm/msm/submit: Move copy_from_user ahead of locking bos
  drm/msm: Do rpm get sooner in the submit path
  drm/msm/gem: Switch over to obj->resv for locking
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
  drm/msm: Remove msm_gem_free_work
  drm/msm: Drop struct_mutex in madvise path
  drm/msm: Drop struct_mutex in shrinker path
  drm/msm: Don't implicit-sync if only a single ring

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |   6 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c |  12 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |   6 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c |   1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c |   1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c        |   1 +
 drivers/gpu/drm/msm/msm_debugfs.c         |   7 +
 drivers/gpu/drm/msm/msm_drv.c             |  21 +-
 drivers/gpu/drm/msm/msm_drv.h             |  73 +-----
 drivers/gpu/drm/msm/msm_fbdev.c           |   1 +
 drivers/gpu/drm/msm/msm_gem.c             | 266 +++++++++++-----------
 drivers/gpu/drm/msm/msm_gem.h             | 133 +++++++++--
 drivers/gpu/drm/msm/msm_gem_shrinker.c    |  81 ++-----
 drivers/gpu/drm/msm/msm_gem_submit.c      | 158 ++++++++-----
 drivers/gpu/drm/msm/msm_gpu.c             | 110 +++++----
 drivers/gpu/drm/msm/msm_gpu.h             |   5 +-
 drivers/gpu/drm/msm/msm_rd.c              |   2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c      |   3 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h      |  13 +-
 19 files changed, 495 insertions(+), 405 deletions(-)

-- 
2.26.2

