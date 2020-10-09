Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FCEE288C1D
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 17:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389156AbgJIPDx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 11:03:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389135AbgJIPDu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 11:03:50 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B88FCC0613D2;
        Fri,  9 Oct 2020 08:03:49 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id qp15so13548099ejb.3;
        Fri, 09 Oct 2020 08:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aQ0/dy64GNY6E3PqMvkOeCw7tku1OiiEuNnrmc12zf0=;
        b=n2lSWZNpzrKXWTKd1W6mZN+iU+a03pL3chC65/ow10mL+TcHLgzGZy6LaSdOqRudg2
         6ZnCwN00jr16PIJT7A98Fh3R0/ILkQEqWtvrPP/EU7af/GK7xJj7ImO32dzizw+rTHBN
         UmGIHDUFMyX/UowHrHokTHnotADyzWToutWCXju6AkMzkRsX4dAzjjaZ38Jn1LDDk/rU
         kQk4B1CL3KlMA1w76fNMBa6Dag//EKTiATOsGcXZhdPTVPjgo08ilGkEuMmtxaTFsFcj
         LmSJsFK/XxxeDqkKIxFcIh2W6lZz/j27/KRVNINvUTONV0HOh9W4FwjbGGLfQiPc9voJ
         ZhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aQ0/dy64GNY6E3PqMvkOeCw7tku1OiiEuNnrmc12zf0=;
        b=SaOedBEGPzdoQw589qsPp7w/zJz95kmm/8WAFRJycpAaXh2UeDvUQ+a32VMsFjJteQ
         OPXpJxmyoXD/bxQP5SzNFjbNpBgwBdqRqboW9l9I4STWygAV9wE5hrQROc+dHUV1XeXL
         P2aTI1AUZoFnP4w9/+Hryc+mUbiHMZI3ufggGscpLDMJCjTyDOkIJl65h6kfsSV4qry4
         Evd/k27zPWpQuzjxvU2MwksfCh1fT50gmSd2OddN0wjBg1XrSNYzYzGCDHIi1vmsmkGw
         TXTvXa+q2qaCyKGiNDYT0r8/U6Bn+oqmra3J3Ax9QrsedVvcHGsvGw0TGJRpIqNycdfV
         deAg==
X-Gm-Message-State: AOAM530mwbj5890yKRF89Xqruyfyr511cLaaxxc5EgqAmg/Z0fRvDSf8
        CzIi8OeJZAUPfYOZBcJWzLA=
X-Google-Smtp-Source: ABdhPJwwEFyy7ezS1KLDN5XkqzgWY/1qVctpNR81azSANIwKr5bqZ2LqAFPivOFH8zfDpSVfOFDs8Q==
X-Received: by 2002:a17:906:2681:: with SMTP id t1mr15258406ejc.474.1602255828284;
        Fri, 09 Oct 2020 08:03:48 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:65f3:51d4:50d0:15b0])
        by smtp.gmail.com with ESMTPSA id v14sm789364edy.68.2020.10.09.08.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 08:03:47 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, chris@chris-wilson.co.uk,
        airlied@redhat.com, akpm@linux-foundation.org, daniel@ffwll.ch,
        sumit.semwal@linaro.org, willy@infradead.org, jhubbard@nvidia.com,
        jgg@ziepe.ca
Subject: [PATCH 4/6] drm/amdgpu: stop using pages with drm_prime_sg_to_page_addr_arrays
Date:   Fri,  9 Oct 2020 17:03:40 +0200
Message-Id: <20201009150342.1979-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201009150342.1979-1-christian.koenig@amd.com>
References: <20201009150342.1979-1-christian.koenig@amd.com>
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

