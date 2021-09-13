Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAA54408E1E
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 15:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241877AbhIMNbi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 09:31:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240037AbhIMNTx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 09:19:53 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B101BC0613E7
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:26 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id n7-20020a05600c3b8700b002f8ca941d89so6596052wms.2
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SoAGyzr0AFHKUUA0vh6k3hC1t95HnGfzvSeL9OXTB3o=;
        b=Kh0OGoeXjzmmCZ0zjFYjMjhcLCSGakXHyJFBtgqCTcmXpUKYZV5H0OOwlCfY6fe9UW
         jh/OKomca4DKpPuZ/+ovaBWY2PF6EfRl8Y+h5iNUuQV0BoP4mjshAyuW4DuLQEGXQHrx
         hnNwydun9hTXd4TlI4ZGsZQ03xedApkQQCxHXuyBwGyAzmb8uOvNvdAW/crG/MKfLvnz
         vTA0nZdzBuax3McLso8eGXFQuQhsiF7nlUMrHxGBZNYOLwJT4xCvQ2mMnlRRNMDysznP
         Uks1ETS8osqd9cSSXZ1WuKsAOqw0/zBAnTXB9ox4c2fMgnBTAtM20DkT6qQhR/sLYZq/
         KwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SoAGyzr0AFHKUUA0vh6k3hC1t95HnGfzvSeL9OXTB3o=;
        b=sFRYCfGqQI8RrAw2+w98yT3ByHTSWMzfCbKo5c6AhGs6oD/c4zvyRXPO+W61QSWlUK
         juX58JpPyAzDqotU0HXoNMPF3RL48Q18dIkMhVvoy/IjbbGyTelaa9XwRVv8rIcoX1uh
         G638wbgK7nrzQ4dczoANJjekMv4/0/y5nwj0X4VdPOBwY0UuPfxVbpWVgEHU1ob6s28O
         EQ82gGelS9d7gJph8xnI7R8aA/EcJrhOkGKkvjV/1Ty0V2O4jHHQpF273hxXReTIr84e
         YRk0xE1rJPbmjhvrL8d3RjlcnszXObbtx3bXjmH/uLYheQcO7ahBuZ2VOUryY/joulZu
         oZzw==
X-Gm-Message-State: AOAM531AWwL1t894+STy9Q0aX/GSPv19fD6GZ/xq3OEjcahny1+oUNpE
        Su3HP7KNNhVV7WQT6LfpBK0=
X-Google-Smtp-Source: ABdhPJzx3GYjZUiC7y9zv3TKie29kMObPXC3Pqr0OxTxbCQd7waFVUuKw2gckGGdNYEhwXhRnzNeWg==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr11295003wmk.135.1631539045407;
        Mon, 13 Sep 2021 06:17:25 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id h18sm7602834wrb.33.2021.09.13.06.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:17:25 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
Subject: [PATCH 10/26] drm/msm: use new iterator in msm_gem_describe
Date:   Mon, 13 Sep 2021 15:16:51 +0200
Message-Id: <20210913131707.45639-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
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

