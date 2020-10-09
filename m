Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28DC7288C1F
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 17:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389164AbgJIPDy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 11:03:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389146AbgJIPDv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 11:03:51 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C70CCC0613D6;
        Fri,  9 Oct 2020 08:03:50 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id lw21so13539781ejb.6;
        Fri, 09 Oct 2020 08:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FmM++3symsvpVR4siwjDU9+9KxruIk1gOAMHnKd0AiE=;
        b=XrFUM15iMxnW5r+cZykWaD+5lUM1thhhsQebgkflHil7pUpsJux+fxxaFn2fgRiHuV
         brSdA99+/2bMKqfPsJXJn/FuisTltXZglFLs2uC19dzC+26EGNznnkVDdEZckz8ZF+rt
         q1Hwvaxg+1a2kKO/MDHWsn09yXrDZALU9AamwjPCGg93X0G0EgyT/fdezAD9ZWNqqkaO
         BvILBcWk38vWvJGK/2UGNTh0gaNq7ZQJ0np3vWb7pRbdpBWS/pAZjyAxjzAgDYd4AfUr
         my9kTq68lUQL8GpKWHuIeUW5QVBbid6EmrB4IAeqZY3sXqRGtOgob8ueY2ImHtIhcOF9
         f5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FmM++3symsvpVR4siwjDU9+9KxruIk1gOAMHnKd0AiE=;
        b=nsouP9QqoVSCbpRXroiQOiiIirVJWr/b5qoj+0AkwKbWEq1q6v3hxadZosGi6EI1dU
         RB5nFiMEqnSd99CV5G3dTUDaBu3F96X3Z+yJF8+axMfO3njtjDLr5y2e5OmZntp1+9GU
         fE5KXv6ccKkMkpNkEJs/g0q06Fq7eFb2liKpMW/FvSV4aIMbswfhfTWprT4RSLf+RRfU
         6UU3yZkM3TNjzwqOEAfiTPxG0krCZu5AwvSlE221ZA/LRxQNJqJ6h3FVH5bbCOvFo+ZS
         yL+QyE+URVE3nf3HZ3ZF6zdlG13k/2x7RVFm6cxzVobbBRyGncURskJgN6i4HAJvO47T
         Up/g==
X-Gm-Message-State: AOAM532+xjneNwdKsJFlRxS+7cx/RhcgJPPVPoNXE2tbNAjmK4YRPqKY
        QdxDDUwLfb0+SajkNZ1x7B0fuOTJLwg=
X-Google-Smtp-Source: ABdhPJyN5ELfE5Ze/1hZ+8RjxM7E1Du5RNH1vhDQ1NOfDbdJcYgRfdItr1lNkT4hlsX9OlPerKunKw==
X-Received: by 2002:a17:906:7f8d:: with SMTP id f13mr14847374ejr.540.1602255829532;
        Fri, 09 Oct 2020 08:03:49 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:65f3:51d4:50d0:15b0])
        by smtp.gmail.com with ESMTPSA id v14sm789364edy.68.2020.10.09.08.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 08:03:49 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, chris@chris-wilson.co.uk,
        airlied@redhat.com, akpm@linux-foundation.org, daniel@ffwll.ch,
        sumit.semwal@linaro.org, willy@infradead.org, jhubbard@nvidia.com,
        jgg@ziepe.ca
Subject: [PATCH 5/6] drm/nouveau: stop using pages with drm_prime_sg_to_page_addr_arrays
Date:   Fri,  9 Oct 2020 17:03:41 +0200
Message-Id: <20201009150342.1979-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201009150342.1979-1-christian.koenig@amd.com>
References: <20201009150342.1979-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is deprecated, also drop the comment about faults.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 0c0ca44a6802..e378bb491688 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1299,9 +1299,9 @@ nouveau_ttm_tt_populate(struct ttm_bo_device *bdev,
 		return 0;
 
 	if (slave && ttm->sg) {
-		/* make userspace faulting work */
-		drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
-						 ttm_dma->dma_address, ttm->num_pages);
+		drm_prime_sg_to_page_addr_arrays(ttm->sg, NULL,
+						 ttm_dma->dma_address,
+						 ttm->num_pages);
 		ttm_tt_set_populated(ttm);
 		return 0;
 	}
-- 
2.17.1

