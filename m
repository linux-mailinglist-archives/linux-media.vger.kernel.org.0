Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19BE7422536
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 13:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234495AbhJELj7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 07:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234470AbhJELj6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 07:39:58 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D39E4C061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 04:38:07 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id k7so36616302wrd.13
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 04:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HMzUm0lSAp/TufSF81gwSiHnNGVLq2ZvLYEQaLMOzyo=;
        b=hhHpVvwfMnnHwI+vQ3XITa1aQYsSBFoaZX0m247XUTVUdPyi95aZsOWAs7pWOTaUf3
         HyrNaZMY3shrmKT6IZaoAgBOlgpaLvyxlEKzD5Aa4co3S38LnrObkBVf26lJlSiiZ78E
         wPBaDXTyaPiWKt8NUSKjz8+S21sWA8WRXW4vHLXV1PNsmqbNmFIrAHO7AnmWQeWaQgI+
         /tNXHVnNmRPmFecmPczhHyy2ofUQjy2Cy6a2or4Hts3yJe0Jk7UBZ/XbJMB7RbHSFSJk
         lJ4l4nFr2v9xdRbe/N9A38ee3e85egb0XrEAsR97AAIyBe4Lqg67phZau19YDCuextaW
         nl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HMzUm0lSAp/TufSF81gwSiHnNGVLq2ZvLYEQaLMOzyo=;
        b=ZkClrrv3qTjWu6Fen+SrkEiEp1E/6uJMhVMRIKN2AJhlROuUmzfpadQfuTkXvEWxc9
         LDNrgm+HtJ3u8qD0DWt2YqX3Wter+wUw/j0BbnYfy8ov1vjr7hMoiZ00GOex0MWVSbXx
         3afWI4hIF75e9/coF91i2kWWPcAB76tfiiKGEg/H6GwXnijg0i/SDoIGPEL6joGbifuu
         H0nqjr9nkR4mbjw18FM6y3xvrYyM1ZfHv+m0RgeYbpWF0NS6qveH5z2Sjcrz6BVQdLE2
         eT59xexHIvpA8qHjuJZ7WQ7uyPvu+uG6aCo3i4hLicyi1TbdIv+nTAHHNtg3d9URoxrP
         +biA==
X-Gm-Message-State: AOAM531XrE2WKWNQVG9Pi7iDEgHkLoCtqVzvjMivlVIiwFGSpuxLVEF2
        45tHbaDdTe7Ysy2tYO0+QcR1IcyKKLI=
X-Google-Smtp-Source: ABdhPJyUGvcV1ZwGKRs9V2vqonO4HKIO8QTHt0jxiHgx2NA7aB6xjsD2Mr9jkJgmiZDsWbX6ey+rEA==
X-Received: by 2002:a5d:500f:: with SMTP id e15mr6173258wrt.90.1633433886565;
        Tue, 05 Oct 2021 04:38:06 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c5sm1739912wml.9.2021.10.05.04.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 04:38:06 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 24/28] drm: use new iterator in drm_gem_plane_helper_prepare_fb v2
Date:   Tue,  5 Oct 2021 13:37:38 +0200
Message-Id: <20211005113742.1101-25-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Makes the handling a bit more complex, but avoids the use of
dma_resv_get_excl_unlocked().

v2: improve coding and documentation

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index e570398abd78..8534f78d4d6d 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -143,6 +143,7 @@
  */
 int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 {
+	struct dma_resv_iter cursor;
 	struct drm_gem_object *obj;
 	struct dma_fence *fence;
 
@@ -150,9 +151,17 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_st
 		return 0;
 
 	obj = drm_gem_fb_get_obj(state->fb, 0);
-	fence = dma_resv_get_excl_unlocked(obj->resv);
-	drm_atomic_set_fence_for_plane(state, fence);
+	dma_resv_iter_begin(&cursor, obj->resv, false);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		/* TODO: We only use the first write fence here and need to fix
+		 * the drm_atomic_set_fence_for_plane() API to accept more than
+		 * one. */
+		dma_fence_get(fence);
+		break;
+	}
+	dma_resv_iter_end(&cursor);
 
+	drm_atomic_set_fence_for_plane(state, fence);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
-- 
2.25.1

