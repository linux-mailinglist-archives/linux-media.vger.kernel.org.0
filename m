Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1645C41387B
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 19:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231331AbhIURip (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 13:38:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231171AbhIURim (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 13:38:42 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CA8AC061574
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:13 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id t18so41546384wrb.0
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xs3urb+CfK37NrDBLos1427ZQKhaGuo6xOveDYDdwk4=;
        b=H0Rsek8xSUZLyWEKZe4XKreStzYy2VNPFqSEyNoTUFaSPUyX4R3P9PRQPy1X7gQ4c3
         wbd/A+N25CV6YM2siHkR09nzeQhC40hggZbs44OYcmKETMyMhpzBrrl6za/doIjpcPDO
         cuOSrZAnHbR91RLNN1awE6zFZNAD+Q+goSD+1+FKkDcjcnD/BDvM1kRyKHIL4DtjGN79
         fC7ks1bHMeQt+TmQJAP4UQoJIpPFUfki8G/LIlmm6M9okevMEoBW7ceyZpH0vms8/SHm
         cBbo/kk2cuw+Nb0c+JfYCdSv0lpY3MWxHrCTd7O3c2qc9vWlyXKq1p0yaFDZHHeQscAD
         x+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xs3urb+CfK37NrDBLos1427ZQKhaGuo6xOveDYDdwk4=;
        b=rv53YA2ax/cGri2WE3TfmsED/+iQCYks8E5U2PpQb5vPQRtInSxnOflXB3wAHelRH4
         45L9UCZHqn9e6kQj/9y4YNUDFgBcxCvOIBchYx4NNvC7DuBpbeS3pxD2e/GDnaiGUJPW
         rwLEet5C3zkFS1M1joD6RVbkzR9iF7d2lHeVvimwSOURez2bDc2kvWZ1kxfkKP5STE5K
         DSXsHNk26gF2cspO8Y5TrR8THX1fHsJ+zNcM0NZJS5sOBZVUf97qMQKVyYmjJuSrgo8f
         0xh1FsBmdqrW1JlOesqetkbM3iDRiV2p1gUUxirfQ7SGurSPSaNe3Yp5eYjH3UpAgaHM
         EF/g==
X-Gm-Message-State: AOAM532+uhv2hQ8it44/MVSQnbqS1bJfoqk5AyE8t490uRkXTvFqdAxU
        B1Xy3vYMxO/3Y7Hl7k8jXXE=
X-Google-Smtp-Source: ABdhPJwich8Zl0t7zBwPVpsRu7yBppehopcoUXMfKa4OOLk2jjioFZ1v3ZxiRnjyippNt8C/aGgXzw==
X-Received: by 2002:a5d:4a4e:: with SMTP id v14mr36153785wrs.271.1632245831727;
        Tue, 21 Sep 2021 10:37:11 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id z13sm23310477wrs.90.2021.09.21.10.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 10:37:10 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 10/26] drm/msm: use new iterator in msm_gem_describe
Date:   Tue, 21 Sep 2021 19:36:43 +0200
Message-Id: <20210921173659.246165-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921173659.246165-1-christian.koenig@amd.com>
References: <20210921173659.246165-1-christian.koenig@amd.com>
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
index 22308a1b66fc..14907622769f 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -880,7 +880,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct dma_resv *robj = obj->resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 	struct msm_gem_vma *vma;
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
@@ -955,22 +955,13 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 		seq_puts(m, "\n");
 	}
 
-	rcu_read_lock();
-	fobj = dma_resv_shared_list(robj);
-	if (fobj) {
-		unsigned int i, shared_count = fobj->shared_count;
-
-		for (i = 0; i < shared_count; i++) {
-			fence = rcu_dereference(fobj->shared[i]);
+	dma_resv_for_each_fence(&cursor, robj, true, fence) {
+		if (dma_resv_iter_is_exclusive(&cursor))
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

