Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 771B6408E2B
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 15:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241205AbhIMNbs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 09:31:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240091AbhIMNTy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 09:19:54 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80E5AC061794
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:39 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id i23so14676550wrb.2
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cqrPgfWJBnrlrJStbHT4p1XHhorqFS0NFap8w3SO71w=;
        b=dVp9YQTGSPQdK6XKvV0Dou4jqoLAYTi0I3Dt7ZW6manhGGTT0tHQyzVs19XZA6acv/
         W6T1Jkz2TC1YngzprtNG+UWiiozq8pALeSGRfsqvgk1rWOf4cQXdaJmu5omeDBtS2WOH
         vjBSbKel/plaBmCnJn+MGaC+9wHGEw39H2EEFlZYbk/QYJtB2iMzbP+xgDsACUyYMm+S
         klRFfyLN9G4QIN8AJnNpuB4rTJJ6I8lWXS1G8giLTUPc3N1axuOZDlHLB2WuHl7P3ov5
         VjLCxI5MGwU+AeC+tnYFKpGVxCtkgyOvfDTPWBP60ZsueKCoAlKjQUlxz3LCk62d675a
         Uwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cqrPgfWJBnrlrJStbHT4p1XHhorqFS0NFap8w3SO71w=;
        b=L8YbhMsX2y5B/Hh0z6FDzhEOLY83QtO7kSDVEeD+xSKW5XXPYEI15Wnmk78eM+H8kf
         sYWeI5fJojc1+zFg0bv+fruxdiNEjGvVi8B+zILjavwmkL2nhXc2rXzUD8R6JGT2JNxk
         HE30USWl9OdApi8w7nMIWAXQtCqezPz7vY05/rTssr7tnECVVz7MFAUtNuxOQzKEU7qe
         mO2MOYchMdxv/sOCCiKL6efg1LIk6Eess5iyZys4SNy2geNue0YpvK0HwFRffzv1zInu
         cBKrS951IKH5PcPq9KIj0SPNEJCjldWNHKp+I+jwNVKW79fqH9iOTchv//5SazdAIx0K
         ZWuQ==
X-Gm-Message-State: AOAM530b02TpvfhcYm5zizf3CRxo1w7v0fR6C141AH/S0NZhH7zRS0wl
        YXwDeoJo6vrPlnqvDUz9RM7eyuZZPh9l3PXk
X-Google-Smtp-Source: ABdhPJzR6Mgxb45Lu2WU1DaeNVT4R7szGLx4B2hlz5wyz1oQoklArO9DPkMc6QvaZrE8NwiXbnSE/Q==
X-Received: by 2002:adf:9e0b:: with SMTP id u11mr12590484wre.85.1631539058200;
        Mon, 13 Sep 2021 06:17:38 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id h18sm7602834wrb.33.2021.09.13.06.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:17:37 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
Subject: [PATCH 20/26] drm: use new iterator in drm_gem_fence_array_add_implicit
Date:   Mon, 13 Sep 2021 15:17:01 +0200
Message-Id: <20210913131707.45639-21-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem.c | 30 ++++++++----------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 09c820045859..6e3b8491be68 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1340,31 +1340,17 @@ int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
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
+	struct dma_resv_cursor cursor;
+	struct dma_fence *fence;
+	int ret = 0;
 
-	for (i = 0; i < fence_count; i++) {
-		ret = drm_gem_fence_array_add(fence_array, fences[i]);
-		if (ret)
+	dma_resv_for_each_fence_unlocked(obj->resv, &cursor, write, fence) {
+		ret = drm_gem_fence_array_add(fence_array, fence);
+		if (ret) {
+			dma_fence_put(fence);
 			break;
+		}
 	}
-
-	for (; i < fence_count; i++)
-		dma_fence_put(fences[i]);
-	kfree(fences);
 	return ret;
 }
 EXPORT_SYMBOL(drm_gem_fence_array_add_implicit);
-- 
2.25.1

