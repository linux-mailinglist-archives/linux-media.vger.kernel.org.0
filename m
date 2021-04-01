Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC48D350BDF
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 03:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233024AbhDABYD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 21:24:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232763AbhDABXy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 21:23:54 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E99DEC061574;
        Wed, 31 Mar 2021 18:23:53 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id s11so293695pfm.1;
        Wed, 31 Mar 2021 18:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+2jBkeo878G+FkmC1vjkk79rQNW00YDmS4BnvfJ2kYU=;
        b=nn1RaRztiuPrmeG4Y6A4+Z9aCNsh96twt7rXm6MoLkf4wFBDpEoglnIrhQ1RL3dISV
         DUtMy2J/5YiIZShK+V7U5YpTFXKMwBE1rwIITEM+0FDdpyi2d2UZacn1kDQDbW6BhtCY
         S+FZz0v5qW3QOcW2RCEuuGTbqHTfnErxOIdPaAtWw+So2UF/oHHIwFd8cewV6TxpbtZ3
         ZzZ0JxQ/8v2DUKx1Wa2oytsG42W/V2rZvQr/bzlHUcqrSstmX20gdZDBSN09kxvmHauw
         uBm1StndG68O9XG6dj6Wv4O9SLiTfO1FM6QRsRCsFsSTt06PNKMeDjEgKtq2GScf76xg
         mafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+2jBkeo878G+FkmC1vjkk79rQNW00YDmS4BnvfJ2kYU=;
        b=fiYQsPPsfN4ur/aC2csqwpl+aRzjG1rjRSSq4/SefSJmQLSVl6RZ8Bppx3PGRCx5fS
         F68eKSfaxYejnAqeS4r/V5REK2D4L2N/PZ865ysqVFYDtwSIKQrKqV19c329e3tfYO4X
         uFePI8fY5Hb3cw/QykfEmN0EoIuL7iH9r1bicWKynExOUTsXtbFrT4p3jh/syGeIGbPl
         bISrf4hF8g88kMoeTXE3GzjkSXNjmrNqbYDmEIZ6qG1qmgINCyTzXrUZfgiCxQLSgvSi
         3s8IIQcp0c3ncCLM/4Q5DyAtxhnOXfCLOZH+78MCeLxbWJjxjqKbp1EJ0ou9MGx+5TpW
         AnxA==
X-Gm-Message-State: AOAM533Zsjm+cT5/o7Atxj/BCeJQcz3ggTrSaX0dNJoN+I2sof0AtSCb
        YzBDwfJgJM+F5jNOUTemKhg=
X-Google-Smtp-Source: ABdhPJxpmKhVqceIQWiXrGGdLvcaLXzXdCmFiC3E3r6puxs07HbTGNDN+PC6hnUY+qLrnezZ75rs9g==
X-Received: by 2002:a63:6d8a:: with SMTP id i132mr5567869pgc.82.1617240233466;
        Wed, 31 Mar 2021 18:23:53 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id ha8sm3270796pjb.6.2021.03.31.18.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 18:23:52 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), Jordan Crouse <jordan@cosmicpenguin.net>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK),
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK)
Subject: [PATCH v2 0/4] drm/msm: Shrinker (and related) fixes
Date:   Wed, 31 Mar 2021 18:27:17 -0700
Message-Id: <20210401012722.527712-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331221630.488498-1-robdclark@gmail.com>
References: <20210331221630.488498-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

I've been spending some time looking into how things behave under high
memory pressure.  The first patch is a random cleanup I noticed along
the way.  The second improves the situation significantly when we are
getting shrinker called from many threads in parallel.  And the last
two are $debugfs/gem fixes I needed so I could monitor the state of GEM
objects (ie. how many are active/purgable/purged) while triggering high
memory pressure.

We could probably go a bit further with dropping the mm_lock in the
shrinker->scan() loop, but this is already a pretty big improvement.
The next step is probably actually to add support to unpin/evict
inactive objects.  (We are part way there since we have already de-
coupled the iova lifetime from the pages lifetime, but there are a
few sharp corners to work through.)

Rob Clark (4):
  drm/msm: Remove unused freed llist node
  drm/msm: Avoid mutex in shrinker_count()
  drm/msm: Fix debugfs deadlock
  drm/msm: Improved debugfs gem stats

 drivers/gpu/drm/msm/msm_debugfs.c      | 14 ++---
 drivers/gpu/drm/msm/msm_drv.c          |  4 ++
 drivers/gpu/drm/msm/msm_drv.h          | 15 ++++--
 drivers/gpu/drm/msm/msm_fb.c           |  3 +-
 drivers/gpu/drm/msm/msm_gem.c          | 65 ++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_gem.h          | 72 +++++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 28 ++++------
 7 files changed, 150 insertions(+), 51 deletions(-)

-- 
2.30.2

