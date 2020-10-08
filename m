Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37ADD287346
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 13:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729810AbgJHLXx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 07:23:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbgJHLXt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Oct 2020 07:23:49 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDFCDC0613D2;
        Thu,  8 Oct 2020 04:23:48 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id dg9so3080640edb.12;
        Thu, 08 Oct 2020 04:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aQ0/dy64GNY6E3PqMvkOeCw7tku1OiiEuNnrmc12zf0=;
        b=oQGX/WsERCpgW2PogHIJy5UBog3JDnWJXgvx4OWfsN9DG11XTYcsi8LkNCKGUswsVJ
         I/ov2amMxLnqIS7y4T22v9Dpr4t+K5E5otszIUDv8ceaAoz9l1kOIpoAtfRbN0cW9vxW
         XoO6hAvzi/rD1B5/9Tib6A+YWTA/+ziwvMiiPNhRgQbJPSQ4i7ZPrHay6IredJCY7ywU
         oCXJOIQM3zfmTvuY/V4JGrac322do81ACOrYW/hQtAvN3pDSoZ8MvC7G8Yt1SQd6rg++
         FljU/RLi97GP7ZDzZTA8xdONUTEzhdw0OqO//PQqjZc4QERaSl6M+ThTNtf645yCZnqg
         FSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aQ0/dy64GNY6E3PqMvkOeCw7tku1OiiEuNnrmc12zf0=;
        b=JDQGXxHX/VW+u5/MYhVKkFCFayDn+EnOOPMVyZXVuvpnidhIxyDChoUkzELL1tDc42
         AH7j3u8bt/2mDr0BNPnW4CCG6J/jV/g4plJ5BlBNzInji3IsTKiOCv/65g/sTV8vPvAF
         5ZbJuK1QgDNZdeDAQM8Czkze2tS/T1gvR7uLFuu4jpIVkLK+7GhFCDDWVN/78fEM+9ru
         2nnQD6s/5jfne+IQxUvku8/hNoQcsvKb4CUSw8gmkuu8fHmHVV5Kk/EMG0kpqfpJQ5P8
         cQJ//4Fz1aB2X2B6FT9r/emzqySMoM8DrVlG8/nBWnxjS1WJDlfiE/IhWRC7QjjJNSUK
         WhCw==
X-Gm-Message-State: AOAM531j+zMj+B6DHbk//S4qFuX9EjeocYcjCcvu0++IdfqRDSzcYQue
        n+55PohZBJRv/LlkcYvwOyQ=
X-Google-Smtp-Source: ABdhPJyiM0N9wnzLQ1YaVSJXHnbIsEHI6Q6KUCzWN69nNbgBewaYrw2PtECQxiDDM9OMzbILYW8xFw==
X-Received: by 2002:a05:6402:396:: with SMTP id o22mr8312612edv.361.1602156227564;
        Thu, 08 Oct 2020 04:23:47 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4c64:a9a0:5e0:905a])
        by smtp.gmail.com with ESMTPSA id i20sm3529030edv.96.2020.10.08.04.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 04:23:47 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, chris@chris-wilson.co.uk,
        airlied@redhat.com, akpm@linux-foundation.org, daniel@ffwll.ch,
        sumit.semwal@linaro.org
Subject: [PATCH 4/4] drm/amdgpu: stop using pages with drm_prime_sg_to_page_addr_arrays
Date:   Thu,  8 Oct 2020 13:23:42 +0200
Message-Id: <20201008112342.9394-4-christian.koenig@amd.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 399961035ae6..ac463e706b19 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1011,8 +1011,8 @@ static int amdgpu_ttm_tt_pin_userptr(struct ttm_bo_device *bdev,
 		goto release_sg;
 
 	/* convert SG to linear array of pages and dma addresses */
-	drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
-					 gtt->ttm.dma_address, ttm->num_pages);
+	drm_prime_sg_to_page_addr_arrays(ttm->sg, NULL, gtt->ttm.dma_address,
+					 ttm->num_pages);
 
 	return 0;
 
@@ -1345,7 +1345,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_bo_device *bdev,
 			ttm->sg = sgt;
 		}
 
-		drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
+		drm_prime_sg_to_page_addr_arrays(ttm->sg, NULL,
 						 gtt->ttm.dma_address,
 						 ttm->num_pages);
 		ttm_tt_set_populated(ttm);
-- 
2.17.1

