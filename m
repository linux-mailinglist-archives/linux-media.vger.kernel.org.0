Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C866E41EA5E
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 12:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353489AbhJAKIP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 06:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353460AbhJAKIL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 06:08:11 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C01C061775
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 03:06:27 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id j27so6842180wms.0
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 03:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=svmFiiyBNTOLlFWjgaUjcSSYX7QcL0TbCV34MdRHULg=;
        b=SeWOp56Q+stkLUfrHU+2IN8GGPWI9v1emdLlba9y3G4/qG92EwRdVpi2uAIWU+0DN6
         EVoVMrpMAxdjoglRFSNcpEEM/fv+jlA3dibG7wUY8366mWI6CtSw7bF3AVicHInB4SLC
         hi47/Gi3XKBpCOQgoU6ELW1dEEFfAxpmvYaU7cvHPKq9suz0BKa7m7RgcY/ky/vpljRi
         k3wYL9r9sVEZY8wKHtV7Kzz6qu2ZwBYzalr4o/MGG+VB2XrDJa0zYBPdnovfLxA8FzRt
         n2Evxx85irE8Z9DNmafJ/7sKk6PBj1woVZvlrBj+Srb0Ge9s8hSk/F5BvqA3X7vvc+Cv
         tlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=svmFiiyBNTOLlFWjgaUjcSSYX7QcL0TbCV34MdRHULg=;
        b=Y5M7nMkZDb4ehF9yOMS7SPURESPbw1aNwOuI5MN04vLwqOJcdz+CarTHjiMJvo765j
         tW4QmGMC/5XJb6Esz/Gm28rnvw9rZxmwyYVEOA1AMum8wx89VPWaMtTsaIRHoxJMTLeY
         xWBUtxxAvmyRi4LRCN3UR95DCQe7kCplYmERjK1kUG5gZuMordPbuauB2qttU3fgIT5j
         bl0VM8YBaAmFZo/kfifDpaw4P/hpYjXVjTykxZYfzZuoNJeo0qb0qj/VrK9jXDzRO7xh
         V+z4UefG0v7iTV0ZYQXY14b/LZGC4Rn6JvCImsEWd0VV7Jo0nlFohDag2wXWwCGa8xBk
         AOBA==
X-Gm-Message-State: AOAM531UOr+QkhGIvhKbquuMf5YQbrRY6ogyJ/xI9y+QWleDyDhn9xJS
        x8m8W6RJMqOsHt+yGG7S25TMXyijLEI=
X-Google-Smtp-Source: ABdhPJz5GdBwInX0HcHiq4cY5DrVsDDxvKbmevZjVBxvxPTmRIsT0zcitxa6m+x6ZMvly0w9A57eQQ==
X-Received: by 2002:a1c:a387:: with SMTP id m129mr3546114wme.181.1633082785686;
        Fri, 01 Oct 2021 03:06:25 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id v17sm5746069wro.34.2021.10.01.03.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 03:06:25 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 14/28] drm/msm: use new iterator in msm_gem_describe
Date:   Fri,  1 Oct 2021 12:05:56 +0200
Message-Id: <20211001100610.2899-15-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
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
index 40a9863f5951..5bd511f07c07 100644
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

