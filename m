Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37E56296E76
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 14:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463647AbgJWMWw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 08:22:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S463638AbgJWMWv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 08:22:51 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF4ACC0613D2
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2020 05:22:49 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id a72so1225917wme.5
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2020 05:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PXR6++RRL9LARYV7LHJfxiTuXc7gp0ylfY0jpRLccnk=;
        b=GOpMVLRDSJhBIUH0Jl9RpNU7ca62jsa/0uF4vz52hy/l0Nb7bHFlNFX95AMzOO9A7g
         kFor3nekCRKiDob6YYYrBsijgmi8v2hST44iXnT7fzAasthUs8V+fGhsJqV+ZTfOhaUH
         GR9QGDBC7vCZ36wK45YiK3pyokqCw8S0lhdgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PXR6++RRL9LARYV7LHJfxiTuXc7gp0ylfY0jpRLccnk=;
        b=Md8NGcJwSTLZyDbEYfCx5gJyhXtXO63hFbpBVAkB7m2p6qR+Ha8EjRWqa0MxenDM/E
         Wl2C8DK3lVtFYgJ2qsNXyEBu1FDBQLMd3hx3+dg+n3ECk7+MOMsp9jHtq8+EEFZv2LEQ
         aXqi63o309nYRJzz+FLHb3XEzGY9+PX5Ll01XdKheuV6U3oT7LjPqK/5zz71ZG1BIIZ9
         4+crYq0nrubiBcb4beaT+dp5xa6juoIgfZt+oW855FbTKKr4yv5Mx4rhKToyrQJ/hQLb
         tcuHMdDL2c9cWM0Hfs61tEVScfJgwBF3C4AvU9gwRGcAJ3hkRqrHOrDKFBW7eD87iOiK
         +iAw==
X-Gm-Message-State: AOAM532CubzGo9QDbob5I1DczH35mP4xaK4AmSKGOdqi6JGKd8HMiUGY
        b8IV8QmX/f0Nf5gjNu4OYGiMSA==
X-Google-Smtp-Source: ABdhPJxJctwHHwXLpK/i827ZMfpLrwvrm04VWkzSg+J1vZd4u3wLfW88Tc9LRut5cVMvDGZpg74J1g==
X-Received: by 2002:a7b:cd96:: with SMTP id y22mr2135356wmj.126.1603455768671;
        Fri, 23 Oct 2020 05:22:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 05:22:48 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH 23/65] drm/i915: Annotate dma_fence_work
Date:   Fri, 23 Oct 2020 14:21:34 +0200
Message-Id: <20201023122216.2373294-23-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

i915 does tons of allocations from this worker, which lockdep catches.

Also generic infrastructure like this with big potential for how
dma_fence or other cross driver contracts work, really should be
reviewed on dri-devel. Implementing custom wheels for everything
within the driver is a classic case of "platform problem" [1]. Which in
upstream we really shouldn't have.

Since there's no quick way to solve these splats (dma_fence_work is
used a bunch in basic buffer management and command submission) like
for amdgpu, I'm giving up at this point here. Annotating i915
scheduler and gpu reset could would be interesting, but since lockdep
is one-shot we can't see what surprises would lurk there.

1: https://lwn.net/Articles/443531/
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-rdma@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/i915_sw_fence_work.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_sw_fence_work.c b/drivers/gpu/drm/i915/i915_sw_fence_work.c
index a3a81bb8f2c3..5b74acadaef5 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence_work.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence_work.c
@@ -17,12 +17,15 @@ static void fence_work(struct work_struct *work)
 {
 	struct dma_fence_work *f = container_of(work, typeof(*f), work);
 	int err;
+	bool fence_cookie;
 
+	fence_cookie = dma_fence_begin_signalling();
 	err = f->ops->work(f);
 	if (err)
 		dma_fence_set_error(&f->dma, err);
 
 	fence_complete(f);
+	dma_fence_end_signalling(fence_cookie);
 	dma_fence_put(&f->dma);
 }
 
-- 
2.28.0

