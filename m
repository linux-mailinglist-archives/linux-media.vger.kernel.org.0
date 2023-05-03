Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 184126F61E8
	for <lists+linux-media@lfdr.de>; Thu,  4 May 2023 01:15:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjECXPg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 May 2023 19:15:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjECXPf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 May 2023 19:15:35 -0400
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C08297D9E
        for <linux-media@vger.kernel.org>; Wed,  3 May 2023 16:15:15 -0700 (PDT)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6436e004954so612958b3a.0
        for <linux-media@vger.kernel.org>; Wed, 03 May 2023 16:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683155715; x=1685747715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eff3ZaiYOUbIPy6KT7ZXvjLKnlTgyEyzsJx1SVSksmo=;
        b=KP+l0vYBTKVnWK2n4c3BFX45QYxYM+KuiZYT0ULYrLmx9D68/S4G7SQ16wcj/6VmzQ
         IRjgslbzbQJBKKmqeIr1OIizGYPxgBk3qszBDjFbobK8KrDSZPm3MMfxyZkaHdbvP17k
         iptVzA806+cqfeUg42Vx6ZKHIlOpZRJh01x6QYT3hVEtq+K/0QY8oPUX5EW93xAX6I4q
         gJR0fot/JZPI75DouwtjPmwVMOryw6xWzVKuN3WlgcGBJ+1LpPwkNhdGhR2DV9FBrgh6
         gXnGNihPfpMr9arj7+U2RuWu1/XvYIc269d/PTzoShvemAaJM+NpiCkLTAdVmqUFIAcQ
         xokQ==
X-Gm-Message-State: AC+VfDze491AtdSfawxW6kAWbVN2NM5gWP7OQo7go5V1I9meybuSARac
        NQCoQ7VyGt1GA2fE0nub0ew=
X-Google-Smtp-Source: ACHHUZ58hTtUY+QQn8NPCJbbQAlRhY+rpBOQNZydZYWYHqcJ68pLXlzqj57cIjvp0rpz7qeKe2oKbQ==
X-Received: by 2002:a05:6a21:2d09:b0:cc:5f27:d003 with SMTP id tw9-20020a056a212d0900b000cc5f27d003mr149179pzb.56.1683155714954;
        Wed, 03 May 2023 16:15:14 -0700 (PDT)
Received: from dev-linux.lan (cpe-70-95-21-110.san.res.rr.com. [70.95.21.110])
        by smtp.gmail.com with ESMTPSA id m21-20020a62a215000000b0063f33e216dasm20555097pff.96.2023.05.03.16.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 16:15:14 -0700 (PDT)
From:   Sukrut Bellary <sukrut.bellary@linux.com>
To:     alexander.deucher@amd.com, christian.koenig@amd.com,
        airlied@gmail.com, daniel@ffwll.ch, Xinhui.Pan@amd.com
Cc:     Sukrut Bellary <sukrut.bellary@linux.com>, sumit.semwal@linaro.org,
        Hawking.Zhang@amd.com, Jiadong.Zhu@amd.com, ray.huang@amd.com,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH] drm:amd:amdgpu: Fix missing buffer object unlock in failure path
Date:   Wed,  3 May 2023 16:15:07 -0700
Message-Id: <20230503231507.279172-1-sukrut.bellary@linux.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

smatch warning -
1) drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:3615 gfx_v9_0_kiq_resume()
warn: inconsistent returns 'ring->mqd_obj->tbo.base.resv'.

2) drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:6901 gfx_v10_0_kiq_resume()
warn: inconsistent returns 'ring->mqd_obj->tbo.base.resv'.

Signed-off-by: Sukrut Bellary <sukrut.bellary@linux.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 4 +++-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c  | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 8bd07ff59671..66d5c5d68454 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -6891,8 +6891,10 @@ static int gfx_v10_0_kiq_resume(struct amdgpu_device *adev)
 		return r;
 
 	r = amdgpu_bo_kmap(ring->mqd_obj, (void **)&ring->mqd_ptr);
-	if (unlikely(r != 0))
+	if (unlikely(r != 0)) {
+		amdgpu_bo_unreserve(ring->mqd_obj);
 		return r;
+	}
 
 	gfx_v10_0_kiq_init_queue(ring);
 	amdgpu_bo_kunmap(ring->mqd_obj);
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index bce6919d666a..d5715d8a4128 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -3617,8 +3617,10 @@ static int gfx_v9_0_kiq_resume(struct amdgpu_device *adev)
 		return r;
 
 	r = amdgpu_bo_kmap(ring->mqd_obj, (void **)&ring->mqd_ptr);
-	if (unlikely(r != 0))
+	if (unlikely(r != 0)) {
+		amdgpu_bo_unreserve(ring->mqd_obj);
 		return r;
+	}
 
 	gfx_v9_0_kiq_init_queue(ring);
 	amdgpu_bo_kunmap(ring->mqd_obj);
-- 
2.34.1

