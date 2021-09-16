Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82FBE40D8B9
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 13:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238229AbhIPLc0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 07:32:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238256AbhIPLcZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 07:32:25 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A510C061574
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:31:05 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id i23so8959640wrb.2
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9NhP0KemkDYjvJFJ1qOIIarsOUWVW1ocIDtArvNA068=;
        b=P54eRNRDIILCiWfnHFMaUtJoPi/+1chXerdoAKRheG5qRgJSm27QG+fFzoTdKUnDg7
         0a5ICJiheo1lcAdbXf/YTdLwxtdQC3a4syLbG0OvUvfMcLqxJcKIYPlvT+G6UHKKwg2H
         rodUnd97bSnySzg+j/9R3TNtXnxSHU+/ubzGWRbVPaBWNOC3tTaPYECcDVw+05e3Fo0C
         iUHa3oPuAfeUAHGSW/rg5JyUBIEa0Iqyg9OZDO2gymyCeEXh0WgpAbtQ6G0M961YwVWo
         gUVep6XXi7LNVCi7wKZ6XhBmgrBxjL28R3Q3Gs50HogNNeMjb8j7bequaPsXiHIQAgSk
         C/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9NhP0KemkDYjvJFJ1qOIIarsOUWVW1ocIDtArvNA068=;
        b=OLxCFUayd3pJj8FE6gJK1l3JxxamgCLQV9DBN+sjyL+93h2s8WjYtbhTwumVPf54I7
         0d6RyQl+SsQDyAT79sr0Gie9uxtI0Op/hjVaO6b/DKoOffiRoP2utRauJqOsxUcB9cXE
         lLozh2jE+833S2UByzHIZC+WDuTERudeLQfLiViU2KwPSs40/oJUilIkusqcO9W3w3n6
         SHOaefbU3+njicUmf9Ze423IeotEyHRiVoM7uWYVV4eOYlaHVVVzmAL3xa+mmOTVD2ij
         DvyvkhOsdf58Ds1o+inonANCNsQKaEb178BlrDaqzxMS+HXt6Eay6uvqC3wZeZSWRm7d
         KiMw==
X-Gm-Message-State: AOAM530GGghAbsJBkv8roXyaQDeSLyaxa9bZcjbH4OFfOQ5WM+qJMJlW
        YZ2HM18GjmM84Z+vXUiRmbU=
X-Google-Smtp-Source: ABdhPJwrkyAg3w90rMzWPvNlNb8unGCndntK/rO+r83tG4dJ1qU//0NAk8tLvxnaagiUmcZ3mzAcSg==
X-Received: by 2002:a5d:568a:: with SMTP id f10mr5516399wrv.314.1631791863816;
        Thu, 16 Sep 2021 04:31:03 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c17sm3803674wrn.54.2021.09.16.04.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 04:31:03 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 20/26] drm: use new iterator in drm_gem_fence_array_add_implicit v2
Date:   Thu, 16 Sep 2021 13:30:36 +0200
Message-Id: <20210916113042.3631-21-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit.

v2: add missing rcu_read_lock()/unlock()

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem.c | 36 +++++++++++++-----------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 09c820045859..8c3ff098e49e 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1340,31 +1340,21 @@ int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
 				     struct drm_gem_object *obj,
 				     bool write)
 {
-	int ret;
-	struct dma_fence **fences;
-	unsigned int i, fence_count;
-
-	if (!write) {
-		struct dma_fence *fence =
-			dma_resv_get_excl_unlocked(obj->resv);
-
-		return drm_gem_fence_array_add(fence_array, fence);
-	}
-
-	ret = dma_resv_get_fences(obj->resv, NULL,
-						&fence_count, &fences);
-	if (ret || !fence_count)
-		return ret;
-
-	for (i = 0; i < fence_count; i++) {
-		ret = drm_gem_fence_array_add(fence_array, fences[i]);
-		if (ret)
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
+	int ret = 0;
+
+	rcu_read_lock();
+	dma_resv_for_each_fence_unlocked(obj->resv, &cursor, write, fence) {
+		rcu_read_unlock();
+		ret = drm_gem_fence_array_add(fence_array, fence);
+		rcu_read_lock();
+		if (ret) {
+			dma_fence_put(fence);
 			break;
+		}
 	}
-
-	for (; i < fence_count; i++)
-		dma_fence_put(fences[i]);
-	kfree(fences);
+	rcu_read_unlock();
 	return ret;
 }
 EXPORT_SYMBOL(drm_gem_fence_array_add_implicit);
-- 
2.25.1

