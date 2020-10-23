Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76CEA296E62
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 14:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463613AbgJWMWf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 08:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S463591AbgJWMWe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 08:22:34 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8633AC0613D4
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2020 05:22:32 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id h5so1573323wrv.7
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2020 05:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9/R15F1LsgpmrfF3NNCzaFiRsuDDTsIACKqWmG0SISo=;
        b=QL0X80IRynXXMUZCjYkwF4TVxPMv6OvJXEja8o1OkGXOMBO4FW8qKjIlQHiTaMX6lC
         Vted5qkM0/57rDsZq+bhda1RMP0UNp2QiZQKvEGxG3qdHN+b54wJSOKQ91pPGKKIz2Ar
         +nKGcH1SKaXqQODHi7K9iRIwpw1YNdCyzAKLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9/R15F1LsgpmrfF3NNCzaFiRsuDDTsIACKqWmG0SISo=;
        b=Svjd876lgJHe+gX7vHVf8pKLwxBCwMGFo1xT74u+GUOWrnl/pivEYQXPcPyzyDpEgn
         YjsKHgZ431YgXxZA1OilIdM9rV5e0Wi0WZN+FeRkjiZuOFPflGBcYT516pn8U3IiCYmE
         b67a2pqDg3tH39M6prc4Qw0NzloVPP1+jrX4amGLhNySOoI8I59prEaQOD79Xdy4zOJ7
         hhO74wwEtH5qkA/A/qyWXgTgt3jLKTVK7vkuXEEARQRZiEN1dwZ+ZbN2YZRNGvl+g8Uw
         Y4t32gAlx8j/6vRMyU7rwn2wnSy2VBAHW0u7ENN5r9sL/qn3anT0XgQw8iFls/rKsSvr
         pRFw==
X-Gm-Message-State: AOAM531xACR0br6R2RD4TEw8n4OY5Zj0+/niwEUBpqOM58eJ+2BbdWBY
        aEs9m0e9fArT6TeMOk+46vnCkQ==
X-Google-Smtp-Source: ABdhPJzjwHFFX0eYKKTO5kCI7ZhG3p97yKYVzt0PU/hjOwBpbNrm4zEFSBi8+JEVc4oqTj3X2egovA==
X-Received: by 2002:adf:a1cb:: with SMTP id v11mr2261703wrv.86.1603455751311;
        Fri, 23 Oct 2020 05:22:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 05:22:30 -0700 (PDT)
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
Subject: [PATCH 08/65] drm/amdgpu: add dma-fence annotations to atomic commit path
Date:   Fri, 23 Oct 2020 14:21:19 +0200
Message-Id: <20201023122216.2373294-8-daniel.vetter@ffwll.ch>
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

I need a canary in a ttm-based atomic driver to make sure the
dma_fence_begin/end_signalling annotations actually work.

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
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index bb1bc7f5d149..b05fecf06f25 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -57,6 +57,7 @@
 
 #include "ivsrcid/ivsrcid_vislands30.h"
 
+#include <linux/module.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/version.h>
@@ -7492,6 +7493,9 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 	struct dm_crtc_state *dm_old_crtc_state, *dm_new_crtc_state;
 	int crtc_disable_count = 0;
 	bool mode_set_reset_required = false;
+	bool fence_cookie;
+
+	fence_cookie = dma_fence_begin_signalling();
 
 	drm_atomic_helper_update_legacy_modeset_state(dev, state);
 	drm_atomic_helper_calc_timestamping_constants(state);
@@ -7816,6 +7820,8 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 	/* Signal HW programming completion */
 	drm_atomic_helper_commit_hw_done(state);
 
+	dma_fence_end_signalling(fence_cookie);
+
 	if (wait_for_vblank)
 		drm_atomic_helper_wait_for_flip_done(dev, state);
 
-- 
2.28.0

