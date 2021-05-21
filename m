Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C76B38C2AD
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 11:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235690AbhEUJLd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 05:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233695AbhEUJLc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 05:11:32 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ACFFC061574
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 02:10:09 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id z85-20020a1c7e580000b029017a76f3afbaso4206116wmc.2
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 02:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HABPMdXSrKsW4uEw0rscNeUzj5fp9ApU11szDLOfF2g=;
        b=fXNUkTfQQylHve4e5q7hej2PfB3CsxTiwKvzcCa0DmQnFmgJgOxLi3L3xKRECoS9nf
         8asDsKAzfQXRUIArgbk0BFuIwPtkPX0uk4ZgG0KeL0UFd364oeAvvFjkw9q6URsV7GNa
         i467cpK5nxrW+8LWbSddPOQS5DUODHlMEhX8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HABPMdXSrKsW4uEw0rscNeUzj5fp9ApU11szDLOfF2g=;
        b=L6dK7Q1cn/iJ5tSkIu2EeFuEsA52AewpYoLmeK0keIre1bDWY1cdkN5U+WD3O//nv0
         umRB5v1hEEzlMw63XtZ9IvjzlYI9gRLIPSKkTQr86xZU2286xBlzAPW7x9hBccQdE1tf
         dCAXWLHvIVqgCNpMaPJgZWq7lwJhfd2p53snxjs7I0mnVCSWKCvNuVvmOGq65IUDNl7i
         vJvrc5kOdPkS7jxBTFzTB/4tVV2RdE76BMZ0RIEuByWMb2Oiy4P+YToeUnFcw9aq5ruQ
         cMyYm2CkbdsHhxj9sZa3ObHugG6owDwGT9FxpqAWD47VES4+mx9xTtszNMLigaFoe0Uv
         EWuQ==
X-Gm-Message-State: AOAM533djp0MkRjPyC1joY3S3GYTR/j45rkR3lTRQ/XIcOMAZ6sk1dCI
        lV21A0mfI5VDi/+oWEF2jq8nrw==
X-Google-Smtp-Source: ABdhPJy4AppsKMSYrINJJ5HHtcoyKQ5HCs+pp50JtN605hKrw5dYRryDwHmn4jAzZiOvi2dJ36vjOw==
X-Received: by 2002:a7b:cb45:: with SMTP id v5mr7986141wmj.48.1621588208292;
        Fri, 21 May 2021 02:10:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y2sm13589457wmq.45.2021.05.21.02.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 02:10:07 -0700 (PDT)
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
Subject: [PATCH 04/11] drm/panfrost: Fix implicit sync
Date:   Fri, 21 May 2021 11:09:52 +0200
Message-Id: <20210521090959.1663703-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
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
index 707d912ff64a..619d6104040c 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -203,9 +203,8 @@ static int panfrost_acquire_object_fences(struct drm_gem_object **bos,
 	int i, ret;
 
 	for (i = 0; i < bo_count; i++) {
-		struct dma_fence *fence = dma_resv_get_excl_rcu(bos[i]->resv);
-
-		ret = drm_gem_fence_array_add(deps, fence);
+		/* panfrost always uses write mode in its current uapi */
+		ret = drm_gem_fence_array_add_implicit(deps, bos[i], true);
 		if (ret)
 			return ret;
 	}
-- 
2.31.0

