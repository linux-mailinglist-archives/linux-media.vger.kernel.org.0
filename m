Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCBB02974E8
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 18:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751546AbgJWQuF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 12:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750451AbgJWQuE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 12:50:04 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E45FC0613CE;
        Fri, 23 Oct 2020 09:50:04 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id r3so1167521plo.1;
        Fri, 23 Oct 2020 09:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nBPnkSzxv9sPok1QPqQrqR3RAN+aeKw0AQbLebVLUkg=;
        b=XWd4i3YxdLK6VWhNOtDxDiaINl8/TMi05tnnJR9puUiJz/lyGwupODZ2BioSlxNWAs
         WvUKyvqWwQHs+h636Ih+DDVJYM8Dmdr4psbtqQMdRBJve8Yf1B2KrTOc5WbQVzVGIV5Q
         YBom1yXreJCyTzkwWwJYLdBwzHSbnxdCC2Vh0ES3F5gyr9fgwQk1Gy+CV/M9WHOgNe//
         SmHRT4Yrd+MReu0/5yrfi/wuUGJUqgqiN11WzCBkP3hxzO2YS+OFexsatzjKCdHGsebc
         QyOTPupwrn6DlUxEf1+QnfH5zypSUxXK6W8vJ9VYTCoO9ncFSfYuOuthfXTeFJOaQvFT
         gdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nBPnkSzxv9sPok1QPqQrqR3RAN+aeKw0AQbLebVLUkg=;
        b=BezStE185EB/DF2TKtW7TU/1IFiPrcHNqt+kDv9TCfCYK4Q8UqoMmqpSEle5kCIqWS
         ZTTslpkzWDI21xnHGL1NTNlp20k/N4ArKrEZ6EPP2g4BqSvXJrwz3hE09r0JXeVKB0m9
         ku6R6L6/St6zWPiV11YgPVvh2Bojvxdb1fleydQNv3BLc42Ga981bQTr2ZgbIr1Qphje
         DbV+matKM4zhWpvO1CXaWQnGcGogIGmIw24KD72iUJzjhR+KQoPyDtYoSjWVQVFCnb0P
         8r8dM05T6Teb2om45+9kEL+qccdKYEJHt4iK8m8pHy284EE827/+Vl4zuwevdOemBGvD
         kTvA==
X-Gm-Message-State: AOAM530bw3CU61ON8t7L/0Hr46Um4rAsgYNpeFNWx6V4i87EWERVwt7m
        e5VGr/wa4mjCILNzYmD8PgI=
X-Google-Smtp-Source: ABdhPJyHkDmRF2Pq6NHPnw+ueoQTE8icbQuxnnOlfwxFMwu6/Tb1NJ3F9e0raXPtHEKsO3ge9RuTEA==
X-Received: by 2002:a17:902:9a84:b029:d2:9390:5e6 with SMTP id w4-20020a1709029a84b02900d2939005e6mr3262382plp.37.1603471803833;
        Fri, 23 Oct 2020 09:50:03 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id e4sm2363441pgg.37.2020.10.23.09.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 09:50:02 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Brian Masney <masneyb@onstation.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Emil Velikov <emil.velikov@collabora.com>,
        Eric Anholt <eric@anholt.net>,
        Harigovindan P <harigovi@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK), linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
        Matthias Kaehlcke <mka@chromium.org>,
        Maxime Ripard <mripard@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 00/23] drm/msm: de-struct_mutex-ification
Date:   Fri, 23 Oct 2020 09:51:01 -0700
Message-Id: <20201023165136.561680-1-robdclark@gmail.com>
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
v4: couple minor review comments (krh), fix deadlock with imported
    dma-buf's (ie. from v4l2, etc)

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
 drivers/gpu/drm/msm/msm_gem.c             | 271 +++++++++++-----------
 drivers/gpu/drm/msm/msm_gem.h             | 133 +++++++++--
 drivers/gpu/drm/msm/msm_gem_shrinker.c    |  81 ++-----
 drivers/gpu/drm/msm/msm_gem_submit.c      | 164 ++++++++-----
 drivers/gpu/drm/msm/msm_gpu.c             | 110 +++++----
 drivers/gpu/drm/msm/msm_gpu.h             |   5 +-
 drivers/gpu/drm/msm/msm_rd.c              |   2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c      |   3 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h      |  13 +-
 19 files changed, 506 insertions(+), 405 deletions(-)

-- 
2.26.2

