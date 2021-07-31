Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3943DC4C8
	for <lists+linux-media@lfdr.de>; Sat, 31 Jul 2021 10:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232705AbhGaIFs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 31 Jul 2021 04:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbhGaIFr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 31 Jul 2021 04:05:47 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95969C06175F;
        Sat, 31 Jul 2021 01:05:40 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id m11so1618372plx.4;
        Sat, 31 Jul 2021 01:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M8s8mhhqZ8Up+UA2vSw3vvwlmTtYXes+e5VhDxbCIyA=;
        b=bLCvfbuEP6qV/fkOAbd7z0uDgSx0ITQwQ67JwV6y4UggR35pF/iBN9Y8uYAn4i/h1Q
         +OmDW2Bp+HnZF8bq9DQrAQLAEtP7Hmw43DF3bGKC9mVG1uM++cb6eue6AYxwUf5FGa/5
         yygFB1IvISIM9pbIojyzAmH8J9NROnYxvvngVaPra8EzHBvCwLcguFYJNOaNzh22y/DI
         xG2VSnH4tKPMDU1rbk/FTaKi279oWIWrgkhDyJsmN7b6bOcccMIb7I2RPvOU1KzK9+Jm
         1fy57BXltuQjLDKNAwRGrPzvaxfc77lC6ehTunPUh7Se1cx+02jNjUKqTV0KXl+Td99o
         rqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M8s8mhhqZ8Up+UA2vSw3vvwlmTtYXes+e5VhDxbCIyA=;
        b=KQ5p0cQUYc7HSesilmkr8P2RCjlWKllvoVJ5EnJIcUfoVBuNiyrJzo/NOw8S/VcPA8
         sY3YHn16X2cCKutsK7BQ2r/lgajv9P+xs3pTYjj1vQTRQryCZR2oIuHBnUPETlmOsAke
         toQCyOc/ByM9KI02VRqQEAkroxeS8F/GdZkssTyodABL9qQ814YEtkjo+vAEViDnvu2K
         R/ANubDqNIojqeeZPqMg1oxxQI2Rxn2uXcFc7G4bSj8HGyQBs/6xja8LJgz0eG2E0nKH
         dS6/5OgsnMekOfdSck5S9mLvH5VIWT1eK5ryHiklNqnFK0viUl1mK+lC21Pd6QYBFx2q
         YVdw==
X-Gm-Message-State: AOAM532Ix96m96UOv43K3BJYZ9IniPScyOe8iRSZMxQ1O8B+dKYQUUHi
        9qlBBar1u3OG1N/HD7xtqYY=
X-Google-Smtp-Source: ABdhPJwlGBDhCkzdHi57AylTjultSYaBz302y2ff7rorMx5fNPjeqUSkEm9NlFx7UyITj/vo3B1mUg==
X-Received: by 2002:a63:b60:: with SMTP id a32mr1585053pgl.29.1627718740214;
        Sat, 31 Jul 2021 01:05:40 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.29])
        by smtp.gmail.com with ESMTPSA id c7sm5288427pgq.22.2021.07.31.01.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jul 2021 01:05:39 -0700 (PDT)
From:   Tuo Li <islituo@gmail.com>
To:     alexander.deucher@amd.com, christian.koenig@amd.com,
        Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, airlied@redhat.com,
        Felix.Kuehling@amd.com, Oak.Zeng@amd.com, nirmoy.das@amd.com,
        tzimmermann@suse.de, Philip.Yang@amd.com
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, baijiaju1990@gmail.com,
        Tuo Li <islituo@gmail.com>, TOTE Robot <oslab@tsinghua.edu.cn>
Subject: [PATCH] drm/amdgpu: fix possible null-pointer dereference in amdgpu_ttm_tt_populate()
Date:   Sat, 31 Jul 2021 01:04:37 -0700
Message-Id: <20210731080437.74539-1-islituo@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The variable ttm is assigned to the variable gtt, and the variable gtt
is checked in:
  if (gtt && gtt->userptr)

This indicates that both ttm and gtt can be NULL.
If so, a null-pointer dereference will occur:
  if (ttm->page_flags & TTM_PAGE_FLAG_SG)

Also, some null-pointer dereferences will occur in the function
ttm_pool_alloc() which is called in:
  return ttm_pool_alloc(&adev->mman.bdev.pool, ttm, ctx);

To fix these possible null-pointer dereferences, the function returns
-EINVAL when ttm is NULL.

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Tuo Li <islituo@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 3a55f08e00e1..80440f799c09 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1120,8 +1120,11 @@ static int amdgpu_ttm_tt_populate(struct ttm_device *bdev,
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
 
+	if (ttm == NULL)
+		return -EINVAL;
+
 	/* user pages are bound by amdgpu_ttm_tt_pin_userptr() */
-	if (gtt && gtt->userptr) {
+	if (gtt->userptr) {
 		ttm->sg = kzalloc(sizeof(struct sg_table), GFP_KERNEL);
 		if (!ttm->sg)
 			return -ENOMEM;
-- 
2.25.1

