Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9AA440F7B1
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 14:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244214AbhIQMgt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 08:36:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244209AbhIQMgt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 08:36:49 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0822AC061574
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:27 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id g19-20020a1c9d13000000b003075062d4daso6800106wme.0
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IkVWp2cRgm41mlWFdiuPcdEqOEMHJpLCxm3yFN2dD0Q=;
        b=MnWtggex5Ail8JVsmN18gU4UHQ3jSuSrLinUisjzQ2SEGe7ScDEXLvZt37dLvaCXEj
         du2do7tClOucHFUpb9UKhlIdhfOspxZgKMOQUbhf6nCD1OcyOLYsvrnV5wsJoEj+sox9
         VgCRw4SbsOyj4zo3LUhEu60i6BndNeR40dViKCQjblRx6HHbZGt9k3TQs0AlvdTw4Nd7
         ZBcif4iXQsEHzhbiNT9r+Z6InOC8GT1NcXUAGfKCBjbniX6l7/A+w3+Ugy1d85rFE1Ol
         vwG03IAHCY9BaSz5+bpmvRHoPWQ3WfM0RfrofDrI/JrW81ulln7xZ+xxXtBpe50sdixs
         ql3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IkVWp2cRgm41mlWFdiuPcdEqOEMHJpLCxm3yFN2dD0Q=;
        b=JTp/voZa4oZWdcxLRLx5MRBXV3b4hlzkf5wug2lCgP357Iq3ho35Faxz+Tbjk+vMOs
         rqw8MvquLVX5rA54rQd84NBYFtOlnSL31LeiH6u9PrE3R7H6cxXYsyP5cZKzaffOMszS
         BhqukW6FjPoZz9h7AhUgxBnBHfas1EWE1HiaXzq1U+J8BZBQfN1fTm6EwA2q/zd44abs
         SWpBtMevur/CxBdILi8KYZjgU1hhtdfACkqbdN92Xd8o+rHlsHLKHmURPBTfySeLSO6p
         7SssRMRqQuiOsVqlbwrnPNPUcbLiGhdeHp/1lgMY63/ZcZYKhQ1itd80C4sgtqkmc9lx
         siFA==
X-Gm-Message-State: AOAM531lwg8WUB2M/k8KiY8Z8uMT4CipwX4gMKiZ1RTKy0+a7dQvJqxV
        C3BDaIZN1zlH3vcpN18pKfpzir76ENA=
X-Google-Smtp-Source: ABdhPJzdFJRubHKlc6TxRV8emqLHCMF/tBXOi790xDh1XujN5nwcSLxOLOSNyq5qMuPOn9xUhM5OtQ==
X-Received: by 2002:a05:600c:40c4:: with SMTP id m4mr14792529wmh.100.1631882125635;
        Fri, 17 Sep 2021 05:35:25 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l21sm6122049wmh.31.2021.09.17.05.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:35:25 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 11/26] drm/radeon: use new iterator in radeon_sync_resv
Date:   Fri, 17 Sep 2021 14:34:58 +0200
Message-Id: <20210917123513.1106-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/radeon/radeon_sync.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_sync.c b/drivers/gpu/drm/radeon/radeon_sync.c
index 9257b60144c4..b991ba1bcd51 100644
--- a/drivers/gpu/drm/radeon/radeon_sync.c
+++ b/drivers/gpu/drm/radeon/radeon_sync.c
@@ -91,33 +91,17 @@ int radeon_sync_resv(struct radeon_device *rdev,
 		     struct dma_resv *resv,
 		     bool shared)
 {
-	struct dma_resv_list *flist;
-	struct dma_fence *f;
+	struct dma_resv_iter cursor;
 	struct radeon_fence *fence;
-	unsigned i;
+	struct dma_fence *f;
 	int r = 0;
 
-	/* always sync to the exclusive fence */
-	f = dma_resv_excl_fence(resv);
-	fence = f ? to_radeon_fence(f) : NULL;
-	if (fence && fence->rdev == rdev)
-		radeon_sync_fence(sync, fence);
-	else if (f)
-		r = dma_fence_wait(f, true);
-
-	flist = dma_resv_shared_list(resv);
-	if (shared || !flist || r)
-		return r;
-
-	for (i = 0; i < flist->shared_count; ++i) {
-		f = rcu_dereference_protected(flist->shared[i],
-					      dma_resv_held(resv));
+	dma_resv_for_each_fence(&cursor, resv, shared, f) {
 		fence = to_radeon_fence(f);
 		if (fence && fence->rdev == rdev)
 			radeon_sync_fence(sync, fence);
 		else
 			r = dma_fence_wait(f, true);
-
 		if (r)
 			break;
 	}
-- 
2.25.1

