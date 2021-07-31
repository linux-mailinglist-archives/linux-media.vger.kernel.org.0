Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEC523DC4E3
	for <lists+linux-media@lfdr.de>; Sat, 31 Jul 2021 10:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232363AbhGaINf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 31 Jul 2021 04:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbhGaINe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 31 Jul 2021 04:13:34 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CB19C06175F;
        Sat, 31 Jul 2021 01:13:28 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id t3so11731463plg.9;
        Sat, 31 Jul 2021 01:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pSqWDBwjSHpo0CpUmYzJgqTp6C8xaprSXoTH68RUk9A=;
        b=uByXvFJLrQigPJrd54cWKzjfeHhmv/59d2ORQVsOva+5sc8NUkvICieZBg18ItO2Bl
         H+jyxMqxtR0naDcAwKzLvkcaHmdzHLlTRV2Qd5tSi0sHOfJJSg7jY/ebFfZeOmmti3qi
         1vVVuxwkQwYobrzkHkFpnjjzAjyaH6FXU2fi77dkQQkKugCrqjK1T9MFCse+PXzQRtIY
         XP0TZajX/Rxe7SI2zQ5gYjE3+38td6o/gj0n5cl9efRbBGYGQYjXqzIiEadVQx9HQlGx
         ta+9+0HadNRRG8JvzJnzj1NnY2ljjQUf+MbJ1vsR007GS4MkFmVY6+qUL3xODTt8ppuZ
         CEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pSqWDBwjSHpo0CpUmYzJgqTp6C8xaprSXoTH68RUk9A=;
        b=STnuAzggIMj5UrjyYlZ1U99BvLdaKf9JGUJjJINNIpX9V9+IrmX+JeDwRajezaNLm2
         F9dF6VrAyDrqRbtisLEgWV90ZaDhmd5tsS4IQWaq9Q3cAmsZMUvPoEamMAH0fzFtQiAy
         yqR4Ec2gmHpUTvArVtnHQr1iP6ngsdHXdcSP+fNX/QHynTocRugN5nPkEFUJG53sVml2
         e1JgcDIvebXjFQh1ac3kgBv8CMI3uPArlqtBQUt3cdbEh4G4BXmQakWnKJ1LdkWqPve5
         xTzHrnHhCqAbMYrV0W2+/MD3cPVC7cYFndFNHbVJaw1hc+jvlnSbMDR9OE6HpKXmZLu3
         GNKQ==
X-Gm-Message-State: AOAM531W/XkuHX44ZXHZx6oQazFRqr4nlVaBK8W3cirYk4CGsRqsxwUn
        /Wk3iMHeJDo/WQ/ZrV1tWwc=
X-Google-Smtp-Source: ABdhPJw3sUv7SWXCtHAKD2+0aZD/9TU7DS9fJq1J3MW2qhUDFcv1S/rMnj/DfvR5PrG6iihq7vzA3Q==
X-Received: by 2002:a62:30c5:0:b029:31e:fa6d:1738 with SMTP id w188-20020a6230c50000b029031efa6d1738mr6786010pfw.55.1627719207841;
        Sat, 31 Jul 2021 01:13:27 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.29])
        by smtp.gmail.com with ESMTPSA id c7sm5314475pgq.22.2021.07.31.01.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jul 2021 01:13:27 -0700 (PDT)
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
Subject: [PATCH] drm/amdgpu: fix possible null-pointer dereference in amdgpu_ttm_tt_unpopulate()
Date:   Sat, 31 Jul 2021 01:13:06 -0700
Message-Id: <20210731081306.86523-1-islituo@gmail.com>
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
ttm_pool_free() which is called in:
  return ttm_pool_free(&adev->mman.bdev.pool, ttm);

To fix these possible null-pointer dereferences, the function returns
when ttm is NULL.

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Tuo Li <islituo@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 3a55f08e00e1..0216ca085f11 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1146,7 +1146,10 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
 	struct amdgpu_device *adev;
 
-	if (gtt && gtt->userptr) {
+	if (ttm == NULL)
+		return;
+
+	if (gtt->userptr) {
 		amdgpu_ttm_tt_set_user_pages(ttm, NULL);
 		kfree(ttm->sg);
 		ttm->sg = NULL;
-- 
2.25.1

