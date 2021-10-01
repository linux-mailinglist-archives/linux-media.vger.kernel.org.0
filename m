Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6995F41EA73
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 12:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353482AbhJAKI0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 06:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353493AbhJAKIW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 06:08:22 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37F85C061775
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 03:06:38 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id q17-20020a7bce91000000b0030d4e298215so810676wmj.0
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 03:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jIUir/k9ok0mhA9lZLcDk0nsv9skwzmV2ts7X5dBo9o=;
        b=WN6qInpAsn24+ftDpOyCYIkBgofW7UaWxMslwRXjLU3tyhh3Ca31+rUNhj+m9LztjU
         sWlGZD0XwTpt2tvUoPdlCD0YI/kuc5NjlzJM3AL8v//Od+x+O5S9Bx1fg2QpUDF5QPk1
         v2zv0mPo3/0J6rlyBUFGwQq3jLBGRNgXXFRDhJPUW+rSLH4e0pbxLaEWoRTavpYUXAu+
         w5Y1FWlBaSQL+7OURv5Er1N3tlBspNHHn8g2E23BT+BrottgnGEiJ8e6Km0kCfPFI4Az
         LjBlXpnYh0LjQHfhVPTCWNRFHPAoBtx2ZxOYXYlMEyBzq1Sf4TBz1KqRD1vafSvHIXhQ
         2KdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jIUir/k9ok0mhA9lZLcDk0nsv9skwzmV2ts7X5dBo9o=;
        b=ekAuMx+sb/tLKyPUssWAA3AnoRJ/1mtDGeIg8kkNGACMxTVDZYbo/ldb2E9ULLBU8C
         9rr4MClsfNcgAGGZXNjXcszIlsXfKpOp9V/DRET2J87E0JOEsr87CsOknd2NfNkPi9lf
         WzS3Dj8QkSBrGx+wjpg2hoouC40Bwshx8hR3eXHD7KfOyhSRrWZIu3brEQse/l1pqKEC
         DfoHOIXap19juyql60KcDtpX8vQAyuHmZnKahHOYrCoNE8c3WIBixG7tTm6zjEHHEwkg
         6HccEfBocs3r2xVD+EUparbvEvAZ2q4Fo2ezPtPE4viVoqBZnl3Fi+L7PaWs+SKCR99N
         u8Sg==
X-Gm-Message-State: AOAM533QGDuLlgdY0runQdlK7G4r0O4SbFmKA+YbdRr0DJLlNUEZKjF8
        fJZx4K22XWJ4oCUJL5vX5jo=
X-Google-Smtp-Source: ABdhPJymDfL7NFE48Y02DYUiKpeGEfG6vmQwsVgnGjDCH8Rsk9Komv7T3/TkF1ZwvPureSAXTL/EgQ==
X-Received: by 2002:a1c:44d7:: with SMTP id r206mr3584007wma.150.1633082796860;
        Fri, 01 Oct 2021 03:06:36 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id v17sm5746069wro.34.2021.10.01.03.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 03:06:36 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 27/28] drm/etnaviv: use new iterator in etnaviv_gem_describe
Date:   Fri,  1 Oct 2021 12:06:09 +0200
Message-Id: <20211001100610.2899-28-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of hand rolling the logic.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 31 ++++++++++-----------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 8f1b5af47dd6..0eeb33de2ff4 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -428,19 +428,17 @@ int etnaviv_gem_wait_bo(struct etnaviv_gpu *gpu, struct drm_gem_object *obj,
 static void etnaviv_gem_describe_fence(struct dma_fence *fence,
 	const char *type, struct seq_file *m)
 {
-	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
-		seq_printf(m, "\t%9s: %s %s seq %llu\n",
-			   type,
-			   fence->ops->get_driver_name(fence),
-			   fence->ops->get_timeline_name(fence),
-			   fence->seqno);
+	seq_printf(m, "\t%9s: %s %s seq %llu\n", type,
+		   fence->ops->get_driver_name(fence),
+		   fence->ops->get_timeline_name(fence),
+		   fence->seqno);
 }
 
 static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 {
 	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
 	struct dma_resv *robj = obj->resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 	unsigned long off = drm_vma_node_start(&obj->vma_node);
 
@@ -449,21 +447,14 @@ static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 			obj->name, kref_read(&obj->refcount),
 			off, etnaviv_obj->vaddr, obj->size);
 
-	rcu_read_lock();
-	fobj = dma_resv_shared_list(robj);
-	if (fobj) {
-		unsigned int i, shared_count = fobj->shared_count;
-
-		for (i = 0; i < shared_count; i++) {
-			fence = rcu_dereference(fobj->shared[i]);
+	dma_resv_iter_begin(&cursor, robj, true);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		if (dma_resv_iter_is_exclusive(&cursor))
+			etnaviv_gem_describe_fence(fence, "Exclusive", m);
+		else
 			etnaviv_gem_describe_fence(fence, "Shared", m);
-		}
 	}
-
-	fence = dma_resv_excl_fence(robj);
-	if (fence)
-		etnaviv_gem_describe_fence(fence, "Exclusive", m);
-	rcu_read_unlock();
+	dma_resv_iter_end(&cursor);
 }
 
 void etnaviv_gem_describe_objects(struct etnaviv_drm_private *priv,
-- 
2.25.1

