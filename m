Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBC66287345
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 13:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729815AbgJHLXy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 07:23:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729804AbgJHLXt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Oct 2020 07:23:49 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6075C061755;
        Thu,  8 Oct 2020 04:23:47 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id lw21so7563222ejb.6;
        Thu, 08 Oct 2020 04:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MkTgctKmN/+akcDLdg3dMFFDd8/FeV1m0XEzLiveir0=;
        b=N72ShT079eXQazlnE4442KsEjcieKGhUZ1afEO0IPorQavbqRU0ZxaG0ZRbxEyqGem
         Zx47TfD8/NAi6oQnUr7c9xV4sr2Q0DfHH0IQWtuJrGMGMWlcNSrD9Vqi3XLo1gbyiyAW
         DP9j8NEPbHN6ejO8Hh3Ike4eC8QhwNR3CK51RSGGTQNvIr6Cny38/8E7l1YYGbh7xtfj
         VfXDQxkNCUpazWHChb3RD62Au5iMbkOGIAv/dqXajlxntP8EdKjWnrjIth9+YtsGYOzo
         x80XrVVy20COvcFAhhLqdMyinw9dPHAw8BaZ5cq0nj8eZKj7sGLu9I04HzAvT1pG5zPs
         jorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MkTgctKmN/+akcDLdg3dMFFDd8/FeV1m0XEzLiveir0=;
        b=c/15YHTNEogRVBlgjj+B7e3LL/x1cDR6MnoOpYAcltp8CflUPTdUmw/ZdFCDFAup6/
         WS4ymWOXlx4GjLfgZ4DkrIYTIUQbBjuCWrHeZkd57ZRgOi2VJp7EOLVLPXkgLNW5MbxG
         UIcWXbFHFyRDs9sEaPEg2aeCwZrnd8YEic3Le5kMSiI/XkqqrP+bYobZYFq+a6IF7rM8
         J4Tp9zI2W6xyOpGsvGElUaqoPI6xISvx6SlGckvKepEv8PL40tOJcjv3XpjwADtfbkF1
         eli5v8YgL4o81dHgJiQvqToEzhI8l2NduwtmfF/S9H23D9NcfUvSFR2INS3oKXE45blr
         8GvA==
X-Gm-Message-State: AOAM532IALuXorMkdZj+7X91u0mwyBETUtm7762FVYEcki79brICkxXD
        2pESbAbHxZraJ+eW6oYELBM=
X-Google-Smtp-Source: ABdhPJydc6wMYfotM6Ls7zhjsrHFWLvCwnPy4prHIfnBFnQVlWjXOhRunGbHJon/G6KJb7Y66ZUIsg==
X-Received: by 2002:a17:906:7d7:: with SMTP id m23mr8424563ejc.47.1602156226681;
        Thu, 08 Oct 2020 04:23:46 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4c64:a9a0:5e0:905a])
        by smtp.gmail.com with ESMTPSA id i20sm3529030edv.96.2020.10.08.04.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 04:23:46 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, chris@chris-wilson.co.uk,
        airlied@redhat.com, akpm@linux-foundation.org, daniel@ffwll.ch,
        sumit.semwal@linaro.org
Subject: [PATCH 3/4] drm/radeon: stop using pages with drm_prime_sg_to_page_addr_arrays
Date:   Thu,  8 Oct 2020 13:23:41 +0200
Message-Id: <20201008112342.9394-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201008112342.9394-1-christian.koenig@amd.com>
References: <20201008112342.9394-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is deprecated.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/radeon/radeon_ttm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 63e38b05a5bc..4b92cdbcd29b 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -474,8 +474,8 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_bo_device *bdev, struct ttm_tt *
 	if (r)
 		goto release_sg;
 
-	drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
-					 gtt->ttm.dma_address, ttm->num_pages);
+	drm_prime_sg_to_page_addr_arrays(ttm->sg, NULL, gtt->ttm.dma_address,
+					 ttm->num_pages);
 
 	return 0;
 
@@ -642,8 +642,9 @@ static int radeon_ttm_tt_populate(struct ttm_bo_device *bdev,
 	}
 
 	if (slave && ttm->sg) {
-		drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
-						 gtt->ttm.dma_address, ttm->num_pages);
+		drm_prime_sg_to_page_addr_arrays(ttm->sg, NULL,
+						 gtt->ttm.dma_address,
+						 ttm->num_pages);
 		ttm_tt_set_populated(ttm);
 		return 0;
 	}
-- 
2.17.1

