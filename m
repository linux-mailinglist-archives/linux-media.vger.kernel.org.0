Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 832BE3B0AC7
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 18:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231648AbhFVQ5n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 12:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231680AbhFVQ5l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 12:57:41 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88946C06175F
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 09:55:25 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id c84so13233569wme.5
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 09:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h9eNpjSe5MhemdskcpozFFwFBpnPhNMmF6owEmgO3DE=;
        b=Srb9Hp0msD4/YUuX5uDCQ8UzvwxBDF7IeTFsP8q+JYF/WlHIejhwVYKRzm+E3tog0s
         NRiHl4rF87jCR5b/Rv2trZS+LyrltJVttIRR9EvrqGR3GzZpJBRnTXwVonzgYFpbsYOg
         50kavhu00kIMO3Z21/EEcEsF7LqaVnOELjBlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h9eNpjSe5MhemdskcpozFFwFBpnPhNMmF6owEmgO3DE=;
        b=tyeboVretC/VQwOgXWSDvGvI6C6kytYRlmm+J8b7SAtgxeL7umzJm3dfl+esSW75WJ
         b6ZbouqXk3sR5J7n8BGlAwQ3ylg9nWVtSn9TrCYlRu5AL2tLsJac99AlNxIJRIrc0vIT
         j87KpNMjoU6wM/OMLkJPYkfPX5BQYEtkot+GqKYkM4nruLGt3TWUvwzXR0omMVRfPnkG
         mLojqn6Rz7Y2PR4DMXWL+d5iaeGkJdehJXGyq+cqod1mqFRYEF6m1AEVhfmM+JZY3hKn
         HyFkqMpWq8FR0JwoWUydNrxD4DNtuST9+7E8328WD4Adol64StvwzrZEBq08xM9NkLKb
         hrZQ==
X-Gm-Message-State: AOAM531T1brZJJJdJz+sNgW+Kn/k1rfYor+yIU/M6A7z+MkgA+NTjnG0
        EVLqwBA9GNnFGFELCiwUOGuuTw==
X-Google-Smtp-Source: ABdhPJwztqOVGeujWJdmOaCicMCajbL6crQePDnRgX5sryx49h1vuS8a7vSsRTr5VXfdshclJwcABA==
X-Received: by 2002:a7b:ce82:: with SMTP id q2mr5542089wmj.60.1624380924163;
        Tue, 22 Jun 2021 09:55:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id l23sm3632342wmc.5.2021.06.22.09.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 09:55:23 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Rob Herring <robh@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Steven Price <steven.price@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 06/15] drm/panfrost: Fix implicit sync
Date:   Tue, 22 Jun 2021 18:55:02 +0200
Message-Id: <20210622165511.3169559-7-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently this has no practial relevance I think because there's not
many who can pull off a setup with panfrost and another gpu in the
same system. But the rules are that if you're setting an exclusive
fence, indicating a gpu write access in the implicit fencing system,
then you need to wait for all fences, not just the previous exclusive
fence.

panfrost against itself has no problem, because it always sets the
exclusive fence (but that's probably something that will need to be
fixed for vulkan and/or multi-engine gpus, or you'll suffer badly).
Also no problem with that against display.

With the prep work done to switch over to the dependency helpers this
is now a oneliner.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 71cd43fa1b36..ef004d587dc4 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -203,9 +203,8 @@ static int panfrost_acquire_object_fences(struct drm_gem_object **bos,
 	int i, ret;
 
 	for (i = 0; i < bo_count; i++) {
-		struct dma_fence *fence = dma_resv_get_excl_unlocked(bos[i]->resv);
-
-		ret = drm_gem_fence_array_add(deps, fence);
+		/* panfrost always uses write mode in its current uapi */
+		ret = drm_gem_fence_array_add_implicit(deps, bos[i], true);
 		if (ret)
 			return ret;
 	}
-- 
2.32.0.rc2

