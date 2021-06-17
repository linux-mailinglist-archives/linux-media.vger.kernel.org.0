Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DDF23AB237
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 13:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232476AbhFQLSW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 07:18:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232475AbhFQLSU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 07:18:20 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D3A2C06175F
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:12 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id n20so3452696edv.8
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5RG0PthxUb2OXPV5l0/m18up/y1qESMs7WFmfpY8Xt0=;
        b=g+D3W4qMWgyEia6rgQELJge+SQQ2NVfYP2PuA5e0o92VM1hYGbeR4uefcSN1UEmoa0
         TyxVqAWIkKZT5a4Z+JnAXK8BzshUnD//UGDEXFwfnATj6IyJGF9aQYSXsSOwwnBgMovU
         HLMKsAPe1hGChok41/dl/BnkoiN6AOT4/qQMvyPCQXQ+ia0AFlKPeQ3saDEtSSAku3pP
         NS7Yyiieq+IfcO3utB0CcogeAzl1skgQaiP8PuspAUdUcEu+z0IjDFaODExWGb9hqPam
         8eYKw5TVI1MFS5m/0c6z2I07hNbMq1lc0DUOPSMnxA+TATcaeecC+UWTiWQCaT81NlaH
         oiYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5RG0PthxUb2OXPV5l0/m18up/y1qESMs7WFmfpY8Xt0=;
        b=j55+2+/JAaeD8H6aBo6cxrLYGFxhSXfP6Xzt2xOqgqRJKkJGXD6hLKSKrfKn8Rf83L
         JNjCCigCJ6U93GMy1SNqzO/K6ISScNU+jSM/0SWi2O7mJE6Q1ehH8a5aCLIm/hWb3/Ip
         8+0TkA+hnKXM9ilPIRxIBm7J/GEmERhCoPvlr+HhSUOY6HIiMTb+XOXB3gBA5YIAcj5Y
         20CvvKLXRGbfAdSCG3kqyePJxBvPXeTkWNktoUcNhq8AJc7jnE4f061dx07CwGDWUxY9
         3jM3r15RikhJiiFgEFfQWr8c8uc53KaNl+em93TrnhSimr9a/vP9pbbH5vgM8oRs187F
         +i7w==
X-Gm-Message-State: AOAM531ZAFbyXKBYwIheGqZYpA8a8bHKwKbWMOTy8M8WUO7MDcE4qSCc
        zQCxNKXEZY/nXX2PCLt0Muw=
X-Google-Smtp-Source: ABdhPJxubHT7YLEEdz8ShaZB+VV9F9nfP2H/mn5NXRPMIM+yC4zBGh3VpVEM8t/+ZflUd4FZZM1Tww==
X-Received: by 2002:a50:8dc6:: with SMTP id s6mr5789974edh.50.1623928570919;
        Thu, 17 Jun 2021 04:16:10 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8534:5e76:1ee5:f3ad])
        by smtp.gmail.com with ESMTPSA id y10sm3531353ejm.76.2021.06.17.04.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 04:16:10 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, sumit.semwal@linaro.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Subject: [PATCH 14/16] drm/msm: use new iterator in msm_gem_describe
Date:   Thu, 17 Jun 2021 13:15:56 +0200
Message-Id: <20210617111558.28486-15-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617111558.28486-1-christian.koenig@amd.com>
References: <20210617111558.28486-1-christian.koenig@amd.com>
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
index 24f8c0603385..8b10d82b5d7b 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -932,7 +932,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct dma_resv *robj = obj->resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_cursor cursor;
 	struct dma_fence *fence;
 	struct msm_gem_vma *vma;
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
@@ -1007,22 +1007,13 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
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

