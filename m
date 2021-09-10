Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0134406860
	for <lists+linux-media@lfdr.de>; Fri, 10 Sep 2021 10:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231799AbhIJI2V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Sep 2021 04:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231794AbhIJI2U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Sep 2021 04:28:20 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D793C061574
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 01:27:09 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id n14-20020a05600c3b8e00b002f8bd2f8ab6so819960wms.5
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 01:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SoAGyzr0AFHKUUA0vh6k3hC1t95HnGfzvSeL9OXTB3o=;
        b=Z3iC+Swm/AAIJ5S/nzJFDgKB/1deDYDWIvJHSIZZkReTUl7PpCdA2jxrlDFfpdmiOu
         t2YqkLV2EsTZ24/oR/1LWA3s34bUo7ah3JCqtEYlKQYP2qZX3AUrz6c3mIfNmhUoW/ur
         +mWRK2K0hsLLLEGoycitOQMzkxR4XHi/SdaDjfz18w+KlI6c9THsDdBR2izyAPt4ZKuz
         Bb7zoYOn32kZb3XSBl51sQklFUjKJiVnnnarZgV73OpFnuPz/ifQHmyUOE2fzD2GCgdQ
         YQDVJOGJLvzv04xFF0NO+xbiwvkuQ22hVCYBc4Vr7jeNeHmM/QzrQz6fZ9LTbHXVs6As
         d9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SoAGyzr0AFHKUUA0vh6k3hC1t95HnGfzvSeL9OXTB3o=;
        b=drIXg9PDkUfAit5iIiFt0SOvSecXFjE6d6BhiFiSGYP4CzZM5Ftq7Tqmv4IBDJi1vB
         unNcH3Ehoo2X7bOVBzYrYTf6rj2w/xPBqfXF5lvV21P0Gx99tgnpFo2mrLvs1FBbLdZb
         Td7YvHL6bS0BR2xslFhxIQPfGTU3g00zmH+Kf5RV3fDB2BU+PMZoD2tLPMO5HIAiKYHt
         8uF/2m09hEaKHjGMRuuCvxWmkWkf0QJVsHOQoyOOtGp2Gbi8cvthLuCNysVN7pKr7YsV
         AagnqQLbmhe4/v7AOO1kmL0ZOy1AZpEESHCWZ1SwAbIja24cnWufj2ovf0PO0731rIue
         IjSw==
X-Gm-Message-State: AOAM5315maRGse7EiEQoD+UA0JndxTTzoeO7egmQ9JLwFnWj3dZg0B+6
        xY0W2NKahMPsDG46GUAimKw=
X-Google-Smtp-Source: ABdhPJyp1TSwidEpj8PAEswJmvQlCFP+0w3GyUfxZc/HjYy4dAcrjUXWhYXK4rt7EyLcq3pk+9dAGw==
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr7169119wmr.89.1631262428260;
        Fri, 10 Sep 2021 01:27:08 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l10sm4429756wrg.50.2021.09.10.01.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 01:27:07 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 12/14] drm/msm: use new iterator in msm_gem_describe
Date:   Fri, 10 Sep 2021 10:26:53 +0200
Message-Id: <20210910082655.82168-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910082655.82168-1-christian.koenig@amd.com>
References: <20210910082655.82168-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit. Also drop the RCU read side lock since the
object is locked anyway.

Untested since I can't get the driver to compile on !ARM.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 5db07fc287ad..8ee4e8881b03 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -906,7 +906,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct dma_resv *robj = obj->resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_cursor cursor;
 	struct dma_fence *fence;
 	struct msm_gem_vma *vma;
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
@@ -981,22 +981,13 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 		seq_puts(m, "\n");
 	}
 
-	rcu_read_lock();
-	fobj = dma_resv_shared_list(robj);
-	if (fobj) {
-		unsigned int i, shared_count = fobj->shared_count;
-
-		for (i = 0; i < shared_count; i++) {
-			fence = rcu_dereference(fobj->shared[i]);
+	dma_resv_for_each_fence(robj, &cursor, true, fence) {
+		if (cursor.is_exclusive)
+			describe_fence(fence, "Exclusive", m);
+		else
 			describe_fence(fence, "Shared", m);
-		}
 	}
 
-	fence = dma_resv_excl_fence(robj);
-	if (fence)
-		describe_fence(fence, "Exclusive", m);
-	rcu_read_unlock();
-
 	msm_gem_unlock(obj);
 }
 
-- 
2.25.1

