Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD4DD45A541
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 15:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237898AbhKWOYr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 09:24:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237929AbhKWOYp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 09:24:45 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB95CC061574
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:37 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id g191-20020a1c9dc8000000b0032fbf912885so2718082wme.4
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IRN4qp5Iqo3k44JzsPUytvzY07JybWV7N7oXbJsRX+E=;
        b=eLwYR4ZKYqhkoKNUcBKIl/SAfy9xF87d9II49MKgVRWKZESAQ+iJI5bsmv/O0K5s1e
         Y2efcqQ5qKcudBl35z+gXv3uY1Y45G/tmeoZ4VhYgTm9X3+G7ohLsmgSFtqM4IguOr9b
         pKcIBxkYs34qGvCySVkuPFfnf3KNeoMX7k8L80PPcgdZU5A1gj+HZtmEds4lh+2+dHGK
         dYaeTBQinuxL21oFo6vRVJSshjdqgm8z0SzkvdARpXJ7+lAj3ZD3AdeIU9TJ6IEhHQNk
         MRVy30mak+KWX/i7iWZjSMvOIRk21rfcF+2HG85EtBDMKeoZnhgYqpOjmtPF9nBMu8l+
         CHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IRN4qp5Iqo3k44JzsPUytvzY07JybWV7N7oXbJsRX+E=;
        b=tg2Rl14dc09otWwR+TUcRVhQjI2uAUX9CVIvoxsbbEnUi2rWtSbZvWO2KFpCkPwCMm
         dXdQ9nXAOjIQevXz784Gf4ASLxKXmRmNg2euFyhDa1C7pICLBz1zU26K/SDuGITt4Svg
         fyNGdxddahBSApR+Zu4oh+GeG3cswOSxpyYc7q8fdQwUpdIKni1C+pxL4kHFRbzSy6Rg
         Np0JEjNWXVvMQHMXRcgaexpcyqip4oT1nxq1O2tu/RIlSzWm57vNO4NRL9YoxwwFex5j
         vCCazj8aUI53y9XAdPIRAdIsyYOQH8os3s1WY++NkH5AZ2VAoC6iCfGUqHMeq5PT/iT0
         Wp/A==
X-Gm-Message-State: AOAM532+IYAoGqwlWJdqfomTzKZw8Za7B1BjG5R0Wq3wklEJjyEjQ7lD
        uVTaKcsu1F2S/X1v0xsjUHo=
X-Google-Smtp-Source: ABdhPJwdudJRBQUyuM6N/s07Qo3lmLid8mFUOvJ3ndWpjmCPTwrY9JZYMgsS6jk9TZToXh3BkzwbPA==
X-Received: by 2002:a1c:f418:: with SMTP id z24mr3642026wma.95.1637677296400;
        Tue, 23 Nov 2021 06:21:36 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 06:21:36 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 12/26] drm/vmwgfx: stop using dma_resv_excl_fence
Date:   Tue, 23 Nov 2021 15:20:57 +0100
Message-Id: <20211123142111.3885-13-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead use the new dma_resv_get_singleton function.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index 8d1e869cc196..23c3fc2cbf10 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -1168,8 +1168,10 @@ int vmw_resources_clean(struct vmw_buffer_object *vbo, pgoff_t start,
 		vmw_bo_fence_single(bo, NULL);
 		if (bo->moving)
 			dma_fence_put(bo->moving);
-		bo->moving = dma_fence_get
-			(dma_resv_excl_fence(bo->base.resv));
+
+		/* TODO: This is actually a memory management dependency */
+		return dma_resv_get_singleton(bo->base.resv, false,
+					      &bo->moving);
 	}
 
 	return 0;
-- 
2.25.1

