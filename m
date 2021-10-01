Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8361941EA6D
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 12:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353480AbhJAKIX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 06:08:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353461AbhJAKIS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 06:08:18 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCBE7C061775
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 03:06:34 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id a131-20020a1c7f89000000b0030d4c90fa87so1136269wmd.2
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 03:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=by8trJVpX1Yx/8GVC1WzD9CSlRZcllVkqP6ongV+oMI=;
        b=KXbwWoEASyQRsPuv46mUDMotK0Bcif+uiHZAp4YIIqwwTbHos+IZJPI4rZHU1TbmZJ
         1nJO6fk2NViAzlCQRF5SYfwt2q9eB7Fsb+Pe8b5ffcEcrJO1CcVK8Um2p733gPBiyz9c
         0gxWwQfNwHPheQEQsPoaxwI9d16TG35+ISWIdcvyFXtMFR9YpH5DECmihkGTLnLxmw7O
         +ogdMbOiQ5cX+QDXaJ0THmIjriLY2XxCJ6TXfdMhQLhkDyUwZMC9n5Q8XjjD0wHihjB8
         qY5xF+BJcdc4OcMXKvZOc2upqpirE/igGCZCNQcN9SEo5N4RFflm5Q7+B1NZiuzTYc9c
         xMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=by8trJVpX1Yx/8GVC1WzD9CSlRZcllVkqP6ongV+oMI=;
        b=3/GKcekZDtSO1PmCgcrY1l/Q377jf0DTumkWNyZqjoP/bRoANOadtIO+b2rLtKq4wa
         m8DMhSpnzsPHzcpBzN0/2g9y2KZjIVgEPQt2Oyexv4Hd01iilhx652rwovYma9eW+7pa
         ZEWwdqIDv1C1VwQA9CLIqNW2k8InLs2AHtslHB/4OSbwN8v/DNJU4p9/7lKjL08pEgp/
         AKgPdt45E4PkhgxXHDHQtOr3P56ARoOu6PSEWLmA6eJnmJGgrPmE0P4WnSeh5LtFpgTE
         kMYYkw2BZEJhAURzIEPOGtuzheqnpJBKc0jN3M4yn3c+Klv4N3LNKH8+yeXNPy6Cr9cm
         bH8w==
X-Gm-Message-State: AOAM533vQGc3w18WauxcfjqsTM1t2r6cdwMuaUeZlBo9bjjWWZltfemX
        gLbS8cd3bxBBvCiiY3DgX90w7bpP5Uo=
X-Google-Smtp-Source: ABdhPJzm+JKATE43IbiivZ6as6JSo9Ps7DVTMr7G6kRy9LrsCmdMBrHvTDiQ4kirIRVSCjM/zx/b2w==
X-Received: by 2002:a1c:94:: with SMTP id 142mr3640878wma.87.1633082793441;
        Fri, 01 Oct 2021 03:06:33 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id v17sm5746069wro.34.2021.10.01.03.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 03:06:33 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 23/28] drm: use new iterator in drm_gem_fence_array_add_implicit v3
Date:   Fri,  1 Oct 2021 12:06:05 +0200
Message-Id: <20211001100610.2899-24-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit.

v2: add missing rcu_read_lock()/unlock()
v3: switch to locked version

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 09c820045859..4dcdec6487bb 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1340,31 +1340,15 @@ int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
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
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
+	int ret = 0;
 
-	ret = dma_resv_get_fences(obj->resv, NULL,
-						&fence_count, &fences);
-	if (ret || !fence_count)
-		return ret;
-
-	for (i = 0; i < fence_count; i++) {
-		ret = drm_gem_fence_array_add(fence_array, fences[i]);
+	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
+		ret = drm_gem_fence_array_add(fence_array, fence);
 		if (ret)
 			break;
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

