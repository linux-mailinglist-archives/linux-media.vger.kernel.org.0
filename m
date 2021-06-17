Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D09843AB234
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 13:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232470AbhFQLSU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 07:18:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232468AbhFQLST (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 07:18:19 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A63C061574
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:11 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id s15so3422605edt.13
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vA0rvCYA+88SSxxA+oXw2xjoeTV7dLie4dtS+00yakw=;
        b=uN5Zx0cBca5DbQUlMYKzChSxSUBt3pn1rgGuo0oxUeskZlsiUgrLTk1HaliRHo0Vt/
         jUyRiJx13d8nIltoW1+jfOTmrJpVeFCXq/T/GcF0juZQtkb11l7QNLmy9OsowxL5qPFY
         BnZfkZ81GDkhMR/fI9SUrwMou7NIVlD+9wtooYY3QmRvCgkOIesuMSZ1l0GHZp102i9g
         t4jbSCh/PkxMqnR1n80TUyGonzXFsP9dr42hODlxnNdrdDo4046NaEixY5Z/nPernKeW
         dhby/aGpuFR8ksEB0/1yv4/tRhKhPkT6BEaxVIKLR5TWRqaQX1KbtqMPOiF/JFr5Cff8
         oGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vA0rvCYA+88SSxxA+oXw2xjoeTV7dLie4dtS+00yakw=;
        b=bk/y0F05xmzdDmwGcbDbKknQUryDVbWoIt4ufaumygZN2SVoZpYzHj9Cg1Lv3VZKLV
         NLp+yPbUmreI6iO/gwBw2lUz0eGGhUwKGTibXpFtDHe3z1TPP/wR2uPXcc/AOKyHdBYt
         RNBbD9A1IqMdP5u5KmUjOVO3q1Hw2IPZUwncx58IeldG24yPyo3yQ6/WWBzAhvcxM9DV
         zfemrjFwZaELu23eNtNkQnU8OVxjyKulDTzm35N4LBCiiHtNd1yMvRn18XGrfCts8bBD
         YptwtZM0BJVR+xoElW5Qkz+nQVxOV1kNX2fF7791wya64QBikUfseIdDJPstCOUSk+ub
         dEaA==
X-Gm-Message-State: AOAM530oQNmWNwFObndPKp7UJMGEutdKyhcfh8bAWnBzdJ24V4aKtyGT
        KGrjJb0eveHh9kjkNl+EbaoCw2MMqXY=
X-Google-Smtp-Source: ABdhPJxdliDVqYsrZ036wK0ckaoMVPasvaJSER1iToDyEGkiVZdtlysHJiBnomX9yz33uPLT55iTRg==
X-Received: by 2002:a05:6402:885:: with SMTP id e5mr5889036edy.248.1623928570233;
        Thu, 17 Jun 2021 04:16:10 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8534:5e76:1ee5:f3ad])
        by smtp.gmail.com with ESMTPSA id y10sm3531353ejm.76.2021.06.17.04.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 04:16:09 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, sumit.semwal@linaro.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Subject: [PATCH 13/16] drm/msm: use new iterator in msm_gem_sync_object
Date:   Thu, 17 Jun 2021 13:15:55 +0200
Message-Id: <20210617111558.28486-14-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617111558.28486-1-christian.koenig@amd.com>
References: <20210617111558.28486-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit.

Untested since I can't get the driver to compile on !ARM.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 72a07e311de3..24f8c0603385 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -813,25 +813,11 @@ void msm_gem_vunmap(struct drm_gem_object *obj)
 int msm_gem_sync_object(struct drm_gem_object *obj,
 		struct msm_fence_context *fctx, bool exclusive)
 {
-	struct dma_resv_list *fobj;
+	struct dma_resv_cursor cursor;
 	struct dma_fence *fence;
-	int i, ret;
-
-	fence = dma_resv_excl_fence(obj->resv);
-	/* don't need to wait on our own fences, since ring is fifo */
-	if (fence && (fence->context != fctx->context)) {
-		ret = dma_fence_wait(fence, true);
-		if (ret)
-			return ret;
-	}
-
-	fobj = dma_resv_shared_list(obj->resv);
-	if (!exclusive || !fobj)
-		return 0;
+	int ret;
 
-	for (i = 0; i < fobj->shared_count; i++) {
-		fence = rcu_dereference_protected(fobj->shared[i],
-						dma_resv_held(obj->resv));
+	dma_resv_for_each_fence(obj->resv, &cursor, exclusive, fence) {
 		if (fence->context != fctx->context) {
 			ret = dma_fence_wait(fence, true);
 			if (ret)
-- 
2.25.1

