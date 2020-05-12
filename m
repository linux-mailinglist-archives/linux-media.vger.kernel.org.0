Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA21E1CF08F
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 11:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729407AbgELJBH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 05:01:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729374AbgELJAF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 05:00:05 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CBD4C05BD09
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 02:00:05 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id h17so5459047wrc.8
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 02:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9rtZPjL4qCIHg+K9tvyoRbu8glhfJrL+U886kKa9MgQ=;
        b=bjQj5zUoHFxr/SGM4dy27f04NAwPFLqit1mjhUpVM48tJB0DvrtAI/QUt4Uq4fHY11
         5zIrzzFoaYD8bqvQgrOwaiqaU/6WtYEiZX2CakVoxiDZFsrz5WjYusAXBDM7dzkZzpGs
         nwDoH4Vjs2gY1QwHAO2mv8pc5dm8xpRypRhzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9rtZPjL4qCIHg+K9tvyoRbu8glhfJrL+U886kKa9MgQ=;
        b=QOnT3gmr2nieJ/uDeIiik00mbWoYmh0QiWB+0LZJSb55SDzWLVdoxHUlMM5OO6Kvgn
         T+RwBT9bkLPrEAZT2vDSUxhVDfmVveoChP56+X+MmhvPesjW5tQDtpJd6+IVilI4ud9m
         Oupa5tvAmGZOWx7RVu9JUw+MbjPYuNB07lg2Uy3nOVyMb3hU8hMXSaptM4D4dlxlP9UB
         1R4AkTw8EYVRyULJcwXfPBoXJszONmmFNMMr7fQ9hHVxL/VsMbehfv//oG/ce6uIWsIe
         6p3hguVPIEHt2DYdQaaRnnwyxEG/OJ28R1pZ+bPBZPi15tmDEIeieR7ttP5qZltdYJkC
         ztBA==
X-Gm-Message-State: AGi0PuYcnrIiQVNv4pae242vLMCUGv4Tq/eUF/5x9lvgOYnn4vyitLPg
        5dzyg73F4d+VgqidknUI1Kaong==
X-Google-Smtp-Source: APiQypJ4sp6ae2VxawQXYuyWMb/LII0NAOyrZR4XJi9uK+LfraVsh0bXQKwL7UmDORgQR8hkYHBnZA==
X-Received: by 2002:adf:ec88:: with SMTP id z8mr22394542wrn.44.1589274004220;
        Tue, 12 May 2020 02:00:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y10sm18845457wrd.95.2020.05.12.02.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 02:00:03 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [RFC 07/17] drm/amdgpu: add dma-fence annotations to atomic commit path
Date:   Tue, 12 May 2020 10:59:34 +0200
Message-Id: <20200512085944.222637-8-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
References: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
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
index ea0e039a667a..4469a8c96b08 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -57,6 +57,7 @@
 
 #include "ivsrcid/ivsrcid_vislands30.h"
 
+#include <linux/module.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/version.h>
@@ -7109,6 +7110,9 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 	struct drm_connector_state *old_con_state, *new_con_state;
 	struct dm_crtc_state *dm_old_crtc_state, *dm_new_crtc_state;
 	int crtc_disable_count = 0;
+	bool fence_cookie;
+
+	fence_cookie = dma_fence_begin_signalling();
 
 	drm_atomic_helper_update_legacy_modeset_state(dev, state);
 
@@ -7389,6 +7393,8 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 	/* Signal HW programming completion */
 	drm_atomic_helper_commit_hw_done(state);
 
+	dma_fence_end_signalling(fence_cookie);
+
 	if (wait_for_vblank)
 		drm_atomic_helper_wait_for_flip_done(dev, state);
 
-- 
2.26.2

